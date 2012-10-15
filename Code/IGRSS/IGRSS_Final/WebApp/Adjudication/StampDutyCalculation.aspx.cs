using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IGRSS.BusinessLogicLayer;
using IGRSS.SdcService;
using IGRSS.BusinessObjects;

public partial class Adjudication_StampDutyCalculation : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        if (Request.Params["RedirID"] != null)
        {
            fldAdjudicationId.Value = Request.Params["RedirID"].ToString();
            mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[2]);
        }

       //string s = ((Label)Page.Master.FindControl("lblValue")).Text;
	}

	//protected void btnCalculate_Click(object sender, EventArgs e)
	//{ 
	//    TextBox txtInternalElectrification = (TextBox) fvStampDutyCalculation.FindControl("txtInternalElectrification");
	//    TextBox txtDevelopmentFeeRate = (TextBox) fvStampDutyCalculation.FindControl("txtDevelopmentFeeRate");
	//    TextBox txtOtherFeeRate = (TextBox) fvStampDutyCalculation.FindControl("txtOtherFeeRate");
	//    TextBox txtSpecialDeduction = (TextBox) fvStampDutyCalculation.FindControl("txtSpecialDeduction");
	//    string InternalElectrificationVal=txtInternalElectrification.Text;
	//    string txtDevelopmentFeeRateVal = txtDevelopmentFeeRate.Text;
	//    string txtOtherFeeRateVal=txtOtherFeeRate.Text;
	//    string txtSpecialDeductionVal=txtSpecialDeduction.Text;
	//    Session.Add(InternalElectrificationVal, InternalElectrificationVal);
	//    Session.Add(txtDevelopmentFeeRateVal, txtDevelopmentFeeRateVal);
	//    Session.Add(txtOtherFeeRateVal, txtOtherFeeRateVal);
	//    Session.Add(txtSpecialDeductionVal, txtSpecialDeductionVal);	
	//}

	protected void fvValuationResult_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{

	}
	protected void btnGet_Click(object sender, EventArgs e)
	{
		//StampDutyCalculator objsdcalculator = new StampDutyCalculator();
		//ValuationRequest valRequest = new ValuationRequest();
		// ValuationResult Result=objsdcalculator.GetStampDutyCalculation(valRequest);
		//    ValuationResult Result= new ValuationResult();
		//    Result = (ValuationResult)ViewState["Result"];
		//   TextBox txtReceiveDate=(TextBox)fvValuationResult.FindControl("txtReceivedDate");
		//   TextBox txtValuationDate = (TextBox) fvValuationResult.FindControl("txtValuationDate");
		//   TextBox txtAreaOfPlot = (TextBox) fvValuationResult.FindControl("txtAreaOfPlot");
		//   TextBox txtAreaOfConstruction = (TextBox) fvValuationResult.FindControl("txtAreaOfConstruction");
		//   TextBox txtRateOfConstruction = (TextBox) fvValuationResult.FindControl("txtRateOfConstruction");
		//   TextBox txtEstimatedValue = (TextBox) fvValuationResult.FindControl("txtEstimatedValue");
		//   TextBox txtInternalElectrification = (TextBox) fvValuationResult.FindControl("txtInternalElectrification");
		//   TextBox txtDevelopmentalExpense = (TextBox) fvValuationResult.FindControl("txtDevelopmentalExpense");
		//   TextBox txtSupervisionExpense = (TextBox) fvValuationResult.FindControl("txtSupervisionExpense");
		//   TextBox txtLiftExpenses = (TextBox) fvValuationResult.FindControl("txtLiftExpenses");
		//   TextBox txtTotalConstructionExpense = (TextBox) fvValuationResult.FindControl("txtTotalConstructionExpense");
		//   TextBox txtLifeSpanOfStructure = (TextBox) fvValuationResult.FindControl("txtLifeSpanOfStructure");
		//   TextBox txtYearOfConstruction = (TextBox) fvValuationResult.FindControl("txtYearOfConstruction");
		//   TextBox txtDepreciationValue = (TextBox) fvValuationResult.FindControl("txtDepreciationValue");
		//   TextBox txtNettValue = (TextBox) fvValuationResult.FindControl("txtNettValue");
		//   TextBox txtDeductions = (TextBox) fvValuationResult.FindControl("txtDeductions");

		//   TextBox txtLandValue = (TextBox) fvValuationResult.FindControl("txtLandValue");
		//   TextBox txtStampDuty = (TextBox) fvValuationResult.FindControl("txtStampDuty");
		//   TextBox txtRemarks = (TextBox) fvValuationResult.FindControl("txtRemarks");

		//    txtAreaOfPlot.Text =Convert.ToDecimal(Result.AreaOfLand).ToString();
		//    txtAreaOfConstruction.Text = Convert.ToDecimal(Result.PlinthAreaOfConstruction).ToString();
		//    txtRateOfConstruction.Text = Convert.ToDecimal(Result.ConstructionExpense).ToString();
		//    txtEstimatedValue.Text = Convert.ToDecimal(Result.EstimatedPrice).ToString();
		//    txtInternalElectrification.Text = Convert.ToDecimal(Result.InternalElectrificationExpense).ToString();
		//    txtDevelopmentalExpense.Text = Convert.ToDecimal(Result.DevelopmentExpense).ToString();
		//  //  txtSupervisionExpense.Text=Result.
		//    txtLiftExpenses.Text = Convert.ToDecimal(Result.LiftExpense).ToString();
		//    txtTotalConstructionExpense.Text = Convert.ToDecimal(Result.EstimatedPriceOfConstruction).ToString();
		//    txtLifeSpanOfStructure.Text = Convert.ToDecimal(Result.LifeOfConstruction).ToString();
		//    txtYearOfConstruction.Text = Convert.ToInt32(Result.YearOfConstruction).ToString();
		//    txtDepreciationValue.Text = Convert.ToDecimal(Result.Depreciation).ToString();

		//    txtDeductions.Text = Convert.ToDecimal(Result.SpecialDeduction).ToString();
		//    txtNettValue.Text = Convert.ToDecimal(Result.ValuationOfProperty).ToString();
		//    txtLandValue.Text = Convert.ToDecimal(Result.NetPrice).ToString();
		////	txtStampDuty.Text = Convert.ToDecimal(Result.SToString();


		//    txtRemarks.Text = Result.Remarks;



	}
	protected void ShowResults_Click(object sender, EventArgs e)
	{

		//mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[1]);

		//fvValuationResult.ChangeMode(FormViewMode.Insert);

		//ValuationResult Result = new ValuationResult();
		//Result = (ValuationResult) ViewState["Result"];
		//TextBox txtReceiveDate = (TextBox) fvValuationResult.FindControl("txtReceivedDate");
		//TextBox txtValuationDate = (TextBox) fvValuationResult.FindControl("txtValuationDate");
		//TextBox txtAreaOfPlot = (TextBox) fvValuationResult.FindControl("txtAreaOfPlot");
		//TextBox txtAreaOfConstruction = (TextBox) fvValuationResult.FindControl("txtAreaOfConstruction");
		//TextBox txtRateOfConstruction = (TextBox) fvValuationResult.FindControl("txtRateOfConstruction");
		//TextBox txtEstimatedValue = (TextBox) fvValuationResult.FindControl("txtEstimatedValue");
		//TextBox txtInternalElectrification = (TextBox) fvValuationResult.FindControl("txtInternalElectrification");
		//TextBox txtDevelopmentalExpense = (TextBox) fvValuationResult.FindControl("txtDevelopmentalExpense");
		//TextBox txtSupervisionExpense = (TextBox) fvValuationResult.FindControl("txtSupervisionExpense");
		//TextBox txtLiftExpenses = (TextBox) fvValuationResult.FindControl("txtLiftExpenses");
		//TextBox txtTotalConstructionExpense = (TextBox) fvValuationResult.FindControl("txtTotalConstructionExpense");
		//TextBox txtLifeSpanOfStructure = (TextBox) fvValuationResult.FindControl("txtLifeSpanOfStructure");
		//TextBox txtYearOfConstruction = (TextBox) fvValuationResult.FindControl("txtYearOfConstruction");
		//TextBox txtDepreciationValue = (TextBox) fvValuationResult.FindControl("txtDepreciationValue");
		//TextBox txtNettValue = (TextBox) fvValuationResult.FindControl("txtNettValue");
		//TextBox txtDeductions = (TextBox) fvValuationResult.FindControl("txtDeductions");

		//TextBox txtLandValue = (TextBox) fvValuationResult.FindControl("txtLandValue");
		//TextBox txtStampDuty = (TextBox) fvValuationResult.FindControl("txtStampDuty");
		//TextBox txtRemarks = (TextBox) fvValuationResult.FindControl("txtRemarks");

		//txtAreaOfPlot.Text = Convert.ToDecimal(Result.AreaOfLand).ToString();
		//txtAreaOfConstruction.Text = Convert.ToDecimal(Result.PlinthAreaOfConstruction).ToString();
		//txtRateOfConstruction.Text = Convert.ToDecimal(Result.ConstructionExpense).ToString();
		//txtEstimatedValue.Text = Convert.ToDecimal(Result.EstimatedPrice).ToString();
		//txtInternalElectrification.Text = Convert.ToDecimal(Result.InternalElectrificationExpense).ToString();
		//txtDevelopmentalExpense.Text = Convert.ToDecimal(Result.DevelopmentExpense).ToString();
		////  txtSupervisionExpense.Text=Result.
		//txtLiftExpenses.Text = Convert.ToDecimal(Result.LiftExpense).ToString();
		//txtTotalConstructionExpense.Text = Convert.ToDecimal(Result.EstimatedPriceOfConstruction).ToString();
		//txtLifeSpanOfStructure.Text = Convert.ToDecimal(Result.LifeOfConstruction).ToString();
		//txtYearOfConstruction.Text = Convert.ToInt32(Result.YearOfConstruction).ToString();
		//txtDepreciationValue.Text = Convert.ToDecimal(Result.Depreciation).ToString();

		//txtDeductions.Text = Convert.ToDecimal(Result.SpecialDeduction).ToString();
		//txtNettValue.Text = Convert.ToDecimal(Result.ValuationOfProperty).ToString();
		//txtLandValue.Text = Convert.ToDecimal(Result.NetPrice).ToString();
		////	txtStampDuty.Text = Convert.ToDecimal(Result.SToString();


		//txtRemarks.Text = Result.Remarks;

		//New 

		mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[2]);

		//	fvValuationResult.ChangeMode(FormViewMode.Insert);

		//ValuationResult Result = new ValuationResult();
		//Result = (ValuationResult) ViewState["Result"];
		//TextBox txtReceiveDate = (TextBox) fvIssuecertificate.FindControl("txtReceivedDate");
		//TextBox txtValuationDate = (TextBox) fvIssuecertificate.FindControl("txtValuationDate");
		//TextBox txtAreaOfPlot = (TextBox) fvIssuecertificate.FindControl("txtAreaOfPlot");
		//TextBox txtAreaOfConstruction = (TextBox) fvIssuecertificate.FindControl("txtAreaOfConstruction");
		//TextBox txtRateOfConstruction = (TextBox) fvIssuecertificate.FindControl("txtRateOfConstruction");
		//TextBox txtEstimatedValue = (TextBox) fvIssuecertificate.FindControl("txtEstimatedValue");
		//TextBox txtInternalElectrification = (TextBox) fvIssuecertificate.FindControl("txtInternalElectrification");
		//TextBox txtDevelopmentalExpense = (TextBox) fvIssuecertificate.FindControl("txtDevelopmentalExpense");
		//TextBox txtSupervisionExpense = (TextBox) fvIssuecertificate.FindControl("txtSupervisionExpense");
		//TextBox txtLiftExpenses = (TextBox) fvIssuecertificate.FindControl("txtLiftExpenses");
		//TextBox txtTotalConstructionExpense = (TextBox) fvIssuecertificate.FindControl("txtTotalConstructionExpense");
		//TextBox txtLifeSpanOfStructure = (TextBox) fvIssuecertificate.FindControl("txtLifeSpanOfStructure");
		//TextBox txtYearOfConstruction = (TextBox) fvIssuecertificate.FindControl("txtYearOfConstruction");
		//TextBox txtDepreciationValue = (TextBox) fvIssuecertificate.FindControl("txtDepreciationValue");
		//TextBox txtNettValue = (TextBox) fvIssuecertificate.FindControl("txtNettValue");
		//TextBox txtDeductions = (TextBox) fvIssuecertificate.FindControl("txtDeductions");

		//TextBox txtLandValue = (TextBox) fvIssuecertificate.FindControl("txtLandValue");
		//TextBox txtStampDuty = (TextBox) fvIssuecertificate.FindControl("txtStampDuty");
		//TextBox txtRemarks = (TextBox) fvIssuecertificate.FindControl("txtRemarks");

		//txtAreaOfPlot.Text = Convert.ToDecimal(Result.AreaOfLand).ToString();
		//txtAreaOfConstruction.Text = Convert.ToDecimal(Result.PlinthAreaOfConstruction).ToString();
		//txtRateOfConstruction.Text = Convert.ToDecimal(Result.ConstructionExpense).ToString();
		//txtEstimatedValue.Text = Convert.ToDecimal(Result.EstimatedPrice).ToString();
		//txtInternalElectrification.Text = Convert.ToDecimal(Result.InternalElectrificationExpense).ToString();
		//txtDevelopmentalExpense.Text = Convert.ToDecimal(Result.DevelopmentExpense).ToString();
		////  txtSupervisionExpense.Text=Result.
		//txtLiftExpenses.Text = Convert.ToDecimal(Result.LiftExpense).ToString();
		//txtTotalConstructionExpense.Text = Convert.ToDecimal(Result.EstimatedPriceOfConstruction).ToString();
		//txtLifeSpanOfStructure.Text = Convert.ToDecimal(Result.LifeOfConstruction).ToString();
		//txtYearOfConstruction.Text = Convert.ToInt32(Result.YearOfConstruction).ToString();
		//txtDepreciationValue.Text = Convert.ToDecimal(Result.Depreciation).ToString();

		//txtDeductions.Text = Convert.ToDecimal(Result.SpecialDeduction).ToString();
		//txtNettValue.Text = Convert.ToDecimal(Result.ValuationOfProperty).ToString();
		//txtLandValue.Text = Convert.ToDecimal(Result.NetPrice).ToString();
		////	txtStampDuty.Text = Convert.ToDecimal(Result.SToString();


		//txtRemarks.Text = Result.Remarks;




	}
	protected void btnIssueCertificate_Click(object sender, EventArgs e)
	{
		TextBox txtCertificateNumber = (TextBox) fvIssuecertificate.FindControl("txtCertificateNumber");
		TextBox txtValuationDate = (TextBox) fvIssuecertificate.FindControl("txtCertificateIssuedOn");
		TextBox txtCertificateDescription = (TextBox) fvIssuecertificate.FindControl("txtCertificateDescription");
		TextBox txtCertificateRemarks = (TextBox) fvIssuecertificate.FindControl("txtCertificateRemarks");
		AdjudicationRequest objAdjRequest = new AdjudicationRequest();

		Guid AdjudicationId = new Guid("6221631a-fbc0-4d1f-ae68-016b8798e8c0");
		objAdjRequest.IssueCertificate(AdjudicationId, txtCertificateNumber.Text, Convert.ToDateTime(txtValuationDate), txtCertificateDescription.Text);
		//objAdjRequest.AddNewValuationSheetDetails(
		//mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[1]);

		//fvValuationResult.ChangeMode(FormViewMode.Insert);

		//ValuationResult Result = new ValuationResult();
		//Result = (ValuationResult) ViewState["Result"];
		//TextBox txtReceiveDate = (TextBox) fvValuationResult.FindControl("txtReceivedDate");
		//TextBox txtValuationDate = (TextBox) fvValuationResult.FindControl("txtValuationDate");
		//TextBox txtAreaOfPlot = (TextBox) fvValuationResult.FindControl("txtAreaOfPlot");
		//TextBox txtAreaOfConstruction = (TextBox) fvValuationResult.FindControl("txtAreaOfConstruction");
		//TextBox txtRateOfConstruction = (TextBox) fvValuationResult.FindControl("txtRateOfConstruction");
		//TextBox txtEstimatedValue = (TextBox) fvValuationResult.FindControl("txtEstimatedValue");
		//TextBox txtInternalElectrification = (TextBox) fvValuationResult.FindControl("txtInternalElectrification");
		//TextBox txtDevelopmentalExpense = (TextBox) fvValuationResult.FindControl("txtDevelopmentalExpense");
		//TextBox txtSupervisionExpense = (TextBox) fvValuationResult.FindControl("txtSupervisionExpense");
		//TextBox txtLiftExpenses = (TextBox) fvValuationResult.FindControl("txtLiftExpenses");
		//TextBox txtTotalConstructionExpense = (TextBox) fvValuationResult.FindControl("txtTotalConstructionExpense");
		//TextBox txtLifeSpanOfStructure = (TextBox) fvValuationResult.FindControl("txtLifeSpanOfStructure");
		//TextBox txtYearOfConstruction = (TextBox) fvValuationResult.FindControl("txtYearOfConstruction");
		//TextBox txtDepreciationValue = (TextBox) fvValuationResult.FindControl("txtDepreciationValue");
		//TextBox txtNettValue = (TextBox) fvValuationResult.FindControl("txtNettValue");
		//TextBox txtDeductions = (TextBox) fvValuationResult.FindControl("txtDeductions");

		//TextBox txtLandValue = (TextBox) fvValuationResult.FindControl("txtLandValue");
		//TextBox txtStampDuty = (TextBox) fvValuationResult.FindControl("txtStampDuty");
		//TextBox txtRemarks = (TextBox) fvValuationResult.FindControl("txtRemarks");

		//txtAreaOfPlot.Text = Convert.ToDecimal(Result.AreaOfLand).ToString();
		//txtAreaOfConstruction.Text = Convert.ToDecimal(Result.PlinthAreaOfConstruction).ToString();
		//txtRateOfConstruction.Text = Convert.ToDecimal(Result.ConstructionExpense).ToString();
		//txtEstimatedValue.Text = Convert.ToDecimal(Result.EstimatedPrice).ToString();
		//txtInternalElectrification.Text = Convert.ToDecimal(Result.InternalElectrificationExpense).ToString();
		//txtDevelopmentalExpense.Text = Convert.ToDecimal(Result.DevelopmentExpense).ToString();
		////  txtSupervisionExpense.Text=Result.
		//txtLiftExpenses.Text = Convert.ToDecimal(Result.LiftExpense).ToString();
		//txtTotalConstructionExpense.Text = Convert.ToDecimal(Result.EstimatedPriceOfConstruction).ToString();
		//txtLifeSpanOfStructure.Text = Convert.ToDecimal(Result.LifeOfConstruction).ToString();
		//txtYearOfConstruction.Text = Convert.ToInt32(Result.YearOfConstruction).ToString();
		//txtDepreciationValue.Text = Convert.ToDecimal(Result.Depreciation).ToString();

		//txtDeductions.Text = Convert.ToDecimal(Result.SpecialDeduction).ToString();
		//txtNettValue.Text = Convert.ToDecimal(Result.ValuationOfProperty).ToString();
		//txtLandValue.Text = Convert.ToDecimal(Result.NetPrice).ToString();
		////	txtStampDuty.Text = Convert.ToDecimal(Result.SToString();


		//txtRemarks.Text = Result.Remarks;

	}

	protected void GvAdjudicationRequest_SelectedIndexChanged(object sender, EventArgs e)
	{

		Parameter param = new Parameter("AdjudicationId");
		param.DefaultValue = GvAdjudicationRequest.SelectedDataKey.Value.ToString();
		param.Type = TypeCode.String;
		odsStampDutyValuation.SelectParameters[0] = param;
		odsStampDutyValuation.DataBind();
		mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[1]);
		fvStampDutyCalculation.ChangeMode(FormViewMode.Edit);
		
}


	protected void fvIssuecertificate_ItemUpdated(object sender, FormViewInsertEventArgs e)
	{

		((FormView) sender).ChangeMode(FormViewMode.ReadOnly);

		ArrayList objArraylist = new ArrayList();
		objArraylist.Add(((FormView) sender).DataItem);
		fvIssuecertificate.DataBind();

	}
	protected void fvIssuecertificate_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		((FormView) sender).ChangeMode(FormViewMode.Insert);
		ArrayList objArraylist = new ArrayList();
		objArraylist.Add(((FormView) sender).DataItem);
		fvIssuecertificate.DataBind();

	}

	protected void fvIssuecertificate_ModeChanged(object sender, EventArgs e)
	{
		if (fvIssuecertificate.CurrentMode == FormViewMode.Insert)
		{

			((FormView) sender).ChangeMode(FormViewMode.Insert);
			ArrayList objArraylist = new ArrayList();
			objArraylist.Add(((FormView) sender).DataItem);
			fvIssuecertificate.DataBind();
		}

	}

	protected void fvStampDutyCalculation_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
	{
		CheckBox ChkPhysicalVerification = (CheckBox) fvStampDutyCalculation.FindControl("chkPhysicalVerification");
		bool PvRequired = ChkPhysicalVerification.Checked;
		if (!PvRequired)
		{
			mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[2]);
            fldAdjudicationId.Value = fvStampDutyCalculation.SelectedValue.ToString();
			fvIssuecertificate.DataBind();

			//FormView1.DataBind();
		}
		else
		{
		    GridView GvAdjudicationRequest = ((GridView) mvStampDutyCalculation.FindControl("GvAdjudicationRequest"));
		    Guid AdjudicationId = (Guid) GvAdjudicationRequest.SelectedDataKey.Value;
			mvStampDutyCalculation.SetActiveView(mvStampDutyCalculation.Views[0]);
			AdjudicationRequest objAdjudicationRequest = new AdjudicationRequest();
			objAdjudicationRequest.UpdatePhysicalVerification(AdjudicationId);
		}
	}
	protected void btnIssueCertificate_Click1(object sender, EventArgs e)
	{   
		GridView GvAdjudicationRequest = ((GridView) mvStampDutyCalculation.FindControl("GvAdjudicationRequest"));
		Guid AdjudicationId = (Guid) GvAdjudicationRequest.SelectedDataKey.Value;
	
		TextBox txtCertificateNumber = (TextBox) fvIssuecertificate.FindControl("txtCertificateNumber");

		TextBox txtCertificateIssuedOn = (TextBox) fvIssuecertificate.FindControl("txtCertificateIssuedOn");

		TextBox txtCertificateRemarks = (TextBox) fvIssuecertificate.FindControl("txtCertificateRemarks");
		AdjudicationRequest objAdjudicationRequest = new AdjudicationRequest();
		objAdjudicationRequest.IssueCertificate(AdjudicationId,txtCertificateNumber.Text, Convert.ToDateTime(txtCertificateIssuedOn.Text), txtCertificateRemarks.Text);


	}
	protected void ddlValuationType_SelectedIndexChanged(object sender, EventArgs e)
	{

	}

	protected void btnCalculatelandValuation_Click(object sender, EventArgs e)
	{
		
	}
	protected void ddlValuateProperty_SelectedIndexChanged(object sender, EventArgs e)
	{
		
		MultiView mv = (MultiView) fvStampDutyCalculation.FindControl("mvValuateConstruction");
		mv.ActiveViewIndex = ((DropDownList) fvStampDutyCalculation.FindControl("ddlValuateProperty")).SelectedIndex-1;
	}
	protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
	{
		Response.Redirect("www.google.com");
	}
	protected void fvStampDutyCalculation_DataBinding(object sender, EventArgs e)
	{

	}
	protected void ddlValuateProperty_DataBinding(object sender, EventArgs e)
	{

	}
	protected void odsIssueCertificate_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{

	}
	protected void btnStampDutyUpdate_Click(object sender, EventArgs e)
	{

	}
    protected void btnCalculate_Click(object sender, EventArgs e)
    {

    }
    protected void fvIssuecertificate_ItemUpdated1(object sender, FormViewUpdatedEventArgs e)
    {
        
    }
    protected void btnCalculate_Click1(object sender, EventArgs e)
    {

    }
    protected void fvStampDutyCalculation_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void chkPhysicalVerification_CheckedChanged(object sender, EventArgs e)
    {
        FileManagement_FileForward ffcPVRequest = (FileManagement_FileForward)fvStampDutyCalculation.FindControl("ffcPVRequest");
        if (ffcPVRequest!=null)
        {
            Guid AdjudicationId = (Guid)GvAdjudicationRequest.SelectedDataKey.Value;
            ffcPVRequest.FileId = AdjudicationId;
            ffcPVRequest.Visible = true;
        }
    }
}
