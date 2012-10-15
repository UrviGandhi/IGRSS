using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Drawing;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;
using System.Collections.Generic;
using IGRSS.Workflows.Common.Feedback;
using System.Threading;
using IGRSS.Properties;
using IGRSS.BusinessLogicLayer;
using IGRSS.Workflows.Adjudication.EventArgs;
using AdjudicationRequestRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using System.Transactions;
using IGRSS.BusinessObjects;
using System.Xml;
using IGRSS.DataAccessLayer.WorkflowSupprotTableAdapters;
using System.Data;
using IGRSS.DataAccessLayer.OfficesMasterTableAdapters;
using ValuationFormRow = IGRSS.DataAccessLayer.Adjudication.ValuationFormRow;

namespace IGRSS.Workflows.Adjudication
{
    public partial class AdjudicationProcess : StateMachineWorkflowActivity
    {
        #region Workflow Properties

        private List<FeedbackData> m_VerificationList;
        public List<FeedbackData> VerificationList
        {
            get
            {
                return m_VerificationList;
            }
            set
            {
                m_VerificationList = value;
            }
        }

        public static DependencyProperty InitiatingOfficeProperty = DependencyProperty.Register("InitiatingOffice", typeof(Guid), typeof(AdjudicationProcess));

        [Description("Office from where the instance is started")]
        [Category("Properties")]
        [Browsable(true)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        public Guid InitiatingOffice
        {
            get
            {
                return ((Guid)(base.GetValue(AdjudicationProcess.InitiatingOfficeProperty)));
            }
            set
            {
                base.SetValue(AdjudicationProcess.InitiatingOfficeProperty, value);
            }
        }

        public static DependencyProperty AdjudicationIdProperty = DependencyProperty.Register("AdjudicationId", typeof(Guid), typeof(AdjudicationProcess));

        [Description("Id of the Adjudication Application")]
        [Category("Adjudication")]
        [Browsable(true)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        public Guid AdjudicationId
        {
            get
            {
                return ((Guid)(base.GetValue(AdjudicationProcess.AdjudicationIdProperty)));
            }
            set
            {
                base.SetValue(AdjudicationProcess.AdjudicationIdProperty, value);
            }
        }

        public static DependencyProperty ValuationFormIdProperty = System.Workflow.ComponentModel.DependencyProperty.Register("ValuationFormId", typeof(Guid), typeof(AdjudicationProcess));

        [Description("This property will store Valuation Form Id ")]
        [Category("Properties")]
        [Browsable(true)]
        [DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
        public Guid ValuationFormId
        {
            get
            {
                return ((Guid)(base.GetValue(AdjudicationProcess.ValuationFormIdProperty)));
            }
            set
            {
                base.SetValue(AdjudicationProcess.ValuationFormIdProperty, value);
            }
        }

        private int verificationIndex = 0;

        #endregion

        private void InitilizeFlow_ExecuteCode(object sender, System.EventArgs e)
        {
            // Update the Workflow details in AdjudicationApplication Table
            XmlDocument WfInfo = new XmlDocument();
            IgrssAdapters.ValuationAdapter.UpdateAdjudicationWfDetails(this.WorkflowInstanceId, WfInfo.OuterXml, this.ValuationFormId);

            VerificationList = new List<FeedbackData>();

            // Get the Process Flow for the current office
            OfficeProcess_LKPTableAdapter adapter = new OfficeProcess_LKPTableAdapter();
            XmlDocument process = new XmlDocument();
            DataRow dr = adapter.GetProcessDetails(InitiatingOffice, "ADJ").Rows[0];
            process.LoadXml((string)dr["Data"]);

            // Read and Assign the verification process data to lists
            XmlNodeList VerificationItems = process.SelectNodes("Process/VerificationList/Item");
            foreach (XmlElement item in VerificationItems)
            {
                OfficesCommunication_LKPTableAdapter comAdapter = new OfficesCommunication_LKPTableAdapter();
                DataTable dt = comAdapter.GetCommunicationOfficeByKey(InitiatingOffice, item.Attributes["ForwardingOffice"].Value);
                if (dt.Rows.Count > 0)
                {
                    VerificationList.Add(new FeedbackData(InitiatingOffice, (Guid)dt.Rows[0]["CommunicatingOffice"], new Guid(item.Attributes["Role"].Value)));
                }
            }
        }

        private void IsVerificationComplete(object sender, ConditionalEventArgs e)
        {
            if (verificationIndex < VerificationList.Count)
                e.Result = false;
            else
                e.Result = true;
        }

        private void VerificationAlert_ExecuteCode(object sender, System.EventArgs e)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            FeedbackData CurFeedback = VerificationList[verificationIndex];
            Guid OfficeId = CurFeedback.ForwardingOffice;
            Guid RoleId = CurFeedback.Role; // new Guid("9c83ade7-74ce-448e-b57c-3f6c5a4a5569");
            string link = WorkflowLinks.Default.AdjudicationVerification;
            Dictionary<string, object> InfoList = new Dictionary<string, object>();
            InfoList.Add("FileId", AdjudicationId);
            InfoList.Add("ValuationFormId", ValuationFormId);
            FileManagement flmgmt = new FileManagement();
            string FileNumber = flmgmt.GetFileNumberByFileId(AdjudicationId);
            Guid GroupId = Guid.NewGuid();
            foreach (string AlertUser in WorkflowSupport.GetUserAtOfficeRole(OfficeId, RoleId))
            {
                CurFeedback.Alerts.Add(WorkflowSupport.SendAlert(curUser, AlertUser, link, "Adjudication Verification Pending for: " + FileNumber, InfoList, GroupId));
            }
        }

        private void OnVerificationValid_Invoked(object sender, ExternalDataEventArgs e)
        {
            FeedbackEventArgs args = (FeedbackEventArgs)e;
            FeedbackData CurFeedback = VerificationList[verificationIndex];
            if (!CurFeedback.Alerts.Contains(args.AlertId))
            {
                throw new Exception("Alert " + args.AlertId + " is not expected at this state of Workflow");
            }
            WorkflowSupport.DeleteAlerts(CurFeedback.Alerts.ToArray());
            this.verificationIndex++;
        }

        private void OnApplicationUpdated_Invoked(object sender, ExternalDataEventArgs e)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;

            // Type cast the event args to the required type
            AdjudicationApplicationUpdatedEventArgs args = (AdjudicationApplicationUpdatedEventArgs)e;
            // Retrive the row to be updated (always the frist row i.e. Rows[0])
            AdjudicationRequestRow AdjReqRow = (AdjudicationRequestRow)args.UpdatedAdjudicationRows[0];
            // Get the ValuationFormRow from the event arguments
            ValuationFormRow ValFormRow = (ValuationFormRow)args.UpdatedValuationFormRows.Rows[0];
            // Getr the Fee Details changed during update operation
            DataTable FeeDetails = args.FeeDetails;
            // Getr the Document Details changed during update operation
            DataTable DocDetails = args.DocumentDetails;

            // Update the ValuationFormRow
            IgrssAdapters.ValuationAdapter.UpdateValuationFormByValFormId(ValFormRow.Village_CityName, ValFormRow.TPSchemeNo, ValFormRow.TPSchemeName, ValFormRow.FinalPlotNo,
             ValFormRow.CitySurveyNo, ValFormRow.RevenueSurveyNo, ValFormRow.Ward_SubWardNo, ValFormRow.NameOfOwner,
             ValFormRow.AddressOfOwner, ValFormRow.NameOfClaimingParty, ValFormRow.AddressOfClaimingParty,
             ValFormRow.AreaOfPlot, ValFormRow.AreaOfConstruction, ValFormRow.YearOfConstruction, ValFormRow.NoOfFloors,
             ValFormRow.TypeOfProperty, ValFormRow.HeightOfCeiling, ValFormRow.TypeOfTiles, ValFormRow.WallFurnishing,
             ValFormRow.NoOfBathrooms, ValFormRow.BathroomTilesHeight, ValFormRow.NoOfToilets, ValFormRow.ToiletTilesHeight,
             ValFormRow.Parking, ValFormRow.DescOfProperty, ValFormRow.ShopsOnGroundFloor, ValFormRow.IsPropertyInCommercial,
             ValFormRow.TypeOfElectricfication, ValFormRow.CompoundWallType, ValFormRow.IsLightsOnCompoundWall,
             ValFormRow.WaterStorageFacility, ValFormRow.DrainageSystem, ValFormRow.NoOfLifts, ValFormRow.AreaOfEachLift,
             ValFormRow.InternalRoad, ValFormRow.ValuatedBefore, ValuationFormId, curUser, DateTime.Now);

            IgrssAdapters.AdjudicationAdapter.UpdateAdjudicationRequest(AdjudicationId, ValuationFormId, null, AdjReqRow.OfficeId, AdjReqRow.ApplicationDate, AdjReqRow.ReceiptNumber, AdjReqRow.AdjudicationTotalFees);

            // Delete and Insert all the fees for this Adjudication Form
            IgrssAdapters.AdjudicationFeeAdapter.DeleteFeesByAdjudicationId(AdjudicationId);
            foreach (DataRow FeeDetail in FeeDetails.Rows)
            {
                IgrssAdapters.AdjudicationFeeAdapter.AddAdjudicationFees(AdjudicationId, (Guid)FeeDetail["FeeId"], Convert.ToDecimal(FeeDetail["Amount"]));
            }

            // Delete and Insert all the document details for this Adjudication Form
            IgrssAdapters.AdjudicationDocumentAdapter.DeleteDocumentDetailByValuationFormId(ValuationFormId);
            foreach (DataRow DocDetail in DocDetails.Rows)
            {
                IgrssAdapters.AdjudicationDocumentAdapter.AddAdjudicationDocument(ValuationFormId, (Guid)DocDetail["DocumentTypeId"], Convert.ToBoolean(DocDetail["Submitted"]), Convert.ToString(DocDetail["DocumentNumber"]), Convert.ToString(DocDetail["Remarks"]));
            }

            // The Application has been modified and will require verification  from all again
            this.verificationIndex = 0;
        }

        private void OnVerificationInvalid_Invoked(object sender, ExternalDataEventArgs e)
        {

        }

        private void SendValuationRequest_ExecuteCode(object sender, System.EventArgs e)
        {
            // TODO: Insert into ValuationRequest Table
        }

        private void OnApplicationSaved_Invoked(object sender, ExternalDataEventArgs e)
        {

        }

    }
}
