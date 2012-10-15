using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using System.Data;


//using AdjudicationTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestDataTable;
//using FeesTable = IGRSS.DataAccessLayer.Adjudication.FeeMasterDataTable;
//using DocumentTable = IGRSS.DataAccessLayer.Adjudication.DocumentMasterDataTable;
//using AdjudicationDocTable = IGRSS.DataAccessLayer.Adjudication.DocumentChecklistTableDataTable;
//using AdjudicationFeeTable = IGRSS.DataAccessLayer.Adjudication.AdjudicationFeeDetailsDataTable;
//using ValuationSheetTable = IGRSS.DataAccessLayer.Adjudication.ValuationSheetDataTable;
//using ValuationSheetRow = IGRSS.DataAccessLayer.Adjudication.ValuationSheetRow;
//using AdjudicationRequestRow = IGRSS.DataAccessLayer.Adjudication.AdjudicationRequestRow;
using ValuationFormTable = IGRSS.DataAccessLayer.Adjudication.ValuationFormDataTable;
using ValuationFormRow = IGRSS.DataAccessLayer.Adjudication.ValuationFormRow;
using System.Threading;

namespace IGRSS.BusinessLogicLayer
{
    [DataObject]
    public class ValuationApplication
    {
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddValuationRequest(FormViewParameter ValFormParameter, DataTable DocDetails)
        {
            try
            {
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                ValuationFormRow ValFormrow = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow)ValFormParameter.Values;
                Guid ValuationFormId = ValFormrow.OfficeId;

                IgrssAdapters.ValuationAdapter.AddValuationDetail(ValuationFormId, ValFormrow.OfficeId, ValFormrow.DistrictCode, ValFormrow.TalukaCode, ValFormrow.VillageCode,
            null,ValFormrow.Village_CityName, ValFormrow.TPSchemeNo, ValFormrow.TPSchemeName, ValFormrow.FinalPlotNo, ValFormrow.CitySurveyNo, ValFormrow.RevenueSurveyNo,
                ValFormrow.Ward_SubWardNo, ValFormrow.NameOfOwner, ValFormrow.AddressOfOwner, ValFormrow.NameOfClaimingParty, ValFormrow.AddressOfClaimingParty,
                ValFormrow.AreaOfPlot, ValFormrow.AreaOfConstruction, ValFormrow.YearOfConstruction, ValFormrow.NoOfFloors, ValFormrow.TypeOfProperty,
                ValFormrow.DescOfProperty, ValFormrow.ShopsOnGroundFloor, ValFormrow.IsPropertyInCommercial, ValFormrow.TypeOfElectricfication,
                ValFormrow.CompoundWallType, ValFormrow.IsLightsOnCompoundWall, ValFormrow.WaterStorageFacility, ValFormrow.DrainageSystem, ValFormrow.NoOfLifts,
                ValFormrow.AreaOfEachLift, ValFormrow.InternalRoad, ValFormrow.ValuatedBefore, ValFormrow.HeightOfCeiling, ValFormrow.TypeOfTiles,
                ValFormrow.WallFurnishing, ValFormrow.NoOfBathrooms, ValFormrow.BathroomTilesHeight, ValFormrow.NoOfToilets, ValFormrow.ToiletTilesHeight, ValFormrow.Parking, curUser, DateTime.Now);


                foreach (DataRow DocDetail in DocDetails.Rows)
                {
                    IgrssAdapters.AdjudicationDocumentAdapter.AddAdjudicationDocument(ValuationFormId, (Guid)DocDetail["DocumentTypeId"], Convert.ToBoolean(DocDetail["Submitted"]), Convert.ToString(DocDetail["DocumentNumber"]), Convert.ToString(DocDetail["Remarks"]));
                }

                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public ValuationFormTable GetValuationFormById(Guid ValuationFormId)
        {
            return IgrssAdapters.ValuationAdapter.GetValuationFormByValFormId(ValuationFormId);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]
        public bool UpdateValuationForm(FormViewParameter ValFormParameter, DataTable DocDetails)
        {
            try
            {
                string curUser = Thread.CurrentPrincipal.Identity.Name;
                ValuationFormRow ValFormrow = (IGRSS.DataAccessLayer.Adjudication.ValuationFormRow)ValFormParameter.Values;
                Guid ValuationFormId = ValFormrow.OfficeId;

                IgrssAdapters.ValuationAdapter.UpdateValuationFormByValFormId(
                            ValFormrow.Village_CityName, ValFormrow.TPSchemeNo, ValFormrow.TPSchemeName, ValFormrow.FinalPlotNo, ValFormrow.CitySurveyNo,
                            ValFormrow.RevenueSurveyNo, ValFormrow.Ward_SubWardNo, ValFormrow.NameOfOwner, ValFormrow.AddressOfOwner,
                            ValFormrow.NameOfClaimingParty, ValFormrow.AddressOfClaimingParty, ValFormrow.AreaOfPlot, ValFormrow.AreaOfConstruction,
                            ValFormrow.YearOfConstruction, ValFormrow.NoOfFloors, ValFormrow.TypeOfProperty, ValFormrow.HeightOfCeiling,
                            ValFormrow.TypeOfTiles, ValFormrow.WallFurnishing, ValFormrow.NoOfBathrooms, ValFormrow.BathroomTilesHeight,
                            ValFormrow.NoOfToilets, ValFormrow.ToiletTilesHeight, ValFormrow.Parking, ValFormrow.DescOfProperty,
                            ValFormrow.ShopsOnGroundFloor, ValFormrow.IsPropertyInCommercial, ValFormrow.TypeOfElectricfication, ValFormrow.CompoundWallType,
                            ValFormrow.IsLightsOnCompoundWall, ValFormrow.WaterStorageFacility, ValFormrow.DrainageSystem, ValFormrow.NoOfLifts,
                            ValFormrow.AreaOfEachLift, ValFormrow.InternalRoad, ValFormrow.ValuatedBefore, ValFormrow.ValuationFormId, curUser, DateTime.Now);

                // Delete and Insert all the documents that are attached to this ValuationForm
                IgrssAdapters.AdjudicationDocumentAdapter.DeleteDocumentDetailByValuationFormId(ValuationFormId);
                foreach (DataRow DocDetail in DocDetails.Rows)
                {
                    IgrssAdapters.AdjudicationDocumentAdapter.AddAdjudicationDocument(ValuationFormId, (Guid)DocDetail["DocumentTypeId"], Convert.ToBoolean(DocDetail["Submitted"]), Convert.ToString(DocDetail["DocumentNumber"]), Convert.ToString(DocDetail["Remarks"]));
                }

                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]
        public bool DeleteValuationForm(Guid ValuationFormId)
        {
            return true;
        }
    }
}
