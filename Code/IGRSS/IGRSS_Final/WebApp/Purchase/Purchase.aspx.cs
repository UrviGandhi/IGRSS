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
using System.Threading;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using IGRSS.BusinessObjects;
public partial class Purchase_PurchaseRegHeader : IgrssPage
{
    IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
  
    protected void Page_Load(object sender, EventArgs e)
	{
        if (!IsPostBack)
        {
            switch (Request.Params["Mode"])
      
        {
            case "DataEntry":
                MvPurchase.SetActiveView(MvPurchase.Views[0]);
                FvPurchase.ChangeMode(FormViewMode.Insert);
                break;
            case "Verify":
                MvPurchase.SetActiveView(MvPurchase.Views[1]);
                break;
        }
            Session["Mode"] = Request.Params["Mode"];
       }
       if (FvPurchase.CurrentMode == FormViewMode.Insert)
       {

           XmlDataSource1.Data = (string)ConfigAdapter.GetConfigByModule("PUR", "PackType");
           XmlDataSource1.DataBind();
        }
        if (FvPurchase.CurrentMode == FormViewMode.Edit)
       {
           XmlDataSource1.Data = (string)ConfigAdapter.GetConfigByModule("PUR", "PackType");
           XmlDataSource1.DataBind();
       }
	}
	
	protected void btnAddPurchaseDetails_Click(object sender, EventArgs e)
	{

		string Mode = "Ins";
		Guid PurchaseID = Guid.Empty;

		if (null == ViewState["PurchaseRegDetails"])
		{
		    ViewState["PurchaseRegDetails"] = new Purchase().SelectPurchaseRegDetailsByID(Guid.Empty);
			PurchaseID = Guid.Empty;
		}
		if (FvPurchase.CurrentMode == FormViewMode.Edit)
		{
			PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
		    Mode = "Upd";
		}

		GridView GvPurchageDetails = ((GridView) FvPurchase.FindControl("GvPurchageDetails" + Mode));
		DataTable dtPurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];

		DropDownList ddlItemID = ((DropDownList) FvPurchase.FindControl("ddlItemID" + Mode));
        DropDownList ddlPackType = ((DropDownList)FvPurchase.FindControl("ddlPackType" + Mode));
		TextBox txtQuantity = ((TextBox) FvPurchase.FindControl("txtQuantity" + Mode));
		TextBox txtPrice = ((TextBox) FvPurchase.FindControl("txtPrice" + Mode));

		TextBox txtValue = ((TextBox) FvPurchase.FindControl("txtValue" + Mode));
		//object[] keys = new object[GvPurchageDetails.SelectedDataKey.Values.Count];

	    object[] keys = {new Guid (ddlItemID.SelectedValue)};
		//for (int i = 0; i < keys.Length; i++)
		//{
		//    keys[i] = GvPurchageDetails.SelectedDataKey.Values[i];
		//}
		
     	DataRow dr = dtPurchaseRegDetails.Rows.Find(keys);
		
		if (null == dr)
		{
			dr = dtPurchaseRegDetails.NewRow();
			dr["DetailID"] = Guid.NewGuid();
			dr["ItemID"] = new Guid(ddlItemID.SelectedValue);
			dr["ItemName"] = ddlItemID.SelectedItem.Text;
            dr["PackType"] = ddlPackType.SelectedValue;
			dr["Quantity"] = txtQuantity.Text;
			//dr["Price"] = txtValue.Text;
			dr["Price"] = txtPrice.Text;
			dr["Value"] = ((decimal)dr["Price"]) * ((decimal)dr["Quantity"]);
			dr["PurchaseID"] = PurchaseID;
			dr["CreatedBy"] = "";
			dr["CreatedAt"] = DateTime.Now;
			dr["ModifiedBy"] = "";
			dr["ModifiedAt"] = DateTime.Now;

			dtPurchaseRegDetails.Rows.Add(dr);
			ddlItemID.SelectedIndex = -1;
			
			txtQuantity.Text = "";
			txtPrice.Text = "";
			//txtValue.Text = "";

		}

        ((Button)FvPurchase.FindControl("btnAddPurchaseDetails" + Mode)).Visible = true;
       ((Button) FvPurchase.FindControl("btnUpdatePurchaseDetails" + Mode)).Visible = false;

		ViewState["PurchaseRegDetails"] = dtPurchaseRegDetails;
		GvPurchageDetails.DataSource = (DataTable) ViewState["PurchaseRegDetails"];
		GvPurchageDetails.DataBind();

	}
	
	protected void GvPurchageDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid PurchaseID = Guid.Empty;
		
		if (null == ViewState["PurchaseRegDetails"])
		{
			ViewState["PurchaseRegDetails"] = new Purchase().SelectPurchaseRegDetailsByID(Guid.Empty);
			PurchaseID = Guid.Empty;
		}
		if (FvPurchase.CurrentMode == FormViewMode.Edit)
		{
			PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
			Mode = "Upd";
		}
		
		GridView GvPurchageDetails = ((GridView)FvPurchase.FindControl("GvPurchageDetails" + Mode));
        DataTable dtPurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];
		DropDownList ddlItemID = ((DropDownList) FvPurchase.FindControl("ddlItemID" + Mode));
        DropDownList ddlPackType = ((DropDownList)FvPurchase.FindControl("ddlPackType" + Mode));
	    TextBox txtQuantity = ((TextBox) FvPurchase.FindControl("txtQuantity" + Mode));
	    TextBox txtPrice = ((TextBox) FvPurchase.FindControl("txtPrice" + Mode));

		//TextBox txtValue = ((TextBox) FvPurchase.FindControl("txtValue" + Mode));

		object[] keys = { GvPurchageDetails.SelectedDataKey.Value };
		//for (int i = 0; i < keys.Length; i++)
		//{
		//    keys[i] = GvPurchageDetails.SelectedDataKey.Values["DetailID"];

		//}
		DataRow dr = dtPurchaseRegDetails.Rows.Find(keys);

		if (null != dr)
		{
			ddlItemID.SelectedValue = Convert.ToString(dr["ItemID"]);

            ddlPackType.SelectedValue = Convert.ToString(dr["PackType"]);

			txtQuantity.Text = Convert.ToString(dr["Quantity"]);
			txtPrice.Text = Convert.ToString(dr["Price"]);
            string s = txtPrice.Text;
            int i = s.IndexOf('.');
            if(i>0)
            txtPrice.Text = s.Remove(i+3);
        }

        ((Button)FvPurchase.FindControl("btnAddPurchaseDetails" + Mode)).Visible = false;
        ((Button)FvPurchase.FindControl("btnUpdatePurchaseDetails" + Mode)).Visible = true;


	}

	protected void GvPurchageDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		Guid PurchaseID = Guid.Empty;
		if (null == ViewState["PurchaseRegDetails"])
		{
			ViewState["PurchaseRegDetails"] = new Purchase().SelectPurchaseRegDetailsByID(Guid.Empty);
			PurchaseID = Guid.Empty;
		}
		if (FvPurchase.CurrentMode == FormViewMode.Edit)
		{
			PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
		}
		//GridView GvPurchageDetails = ((GridView) FvPurchase.FindControl("GvPurchageDetails" + Mode));
		GridView GvPurchageDetails = (GridView) sender;
		DataTable dtPurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];
		int i = e.RowIndex;
		dtPurchaseRegDetails.Rows[i].Delete();
		dtPurchaseRegDetails.AcceptChanges();

		ViewState["PurchaseRegDetails"] = dtPurchaseRegDetails;
		GvPurchageDetails.DataSource = ViewState["PurchaseRegDetails"];
		GvPurchageDetails.DataBind();

	}
	protected void btnUpdatePurchaseDetails_Click(object sender, EventArgs e)
	{
		string Mode = "Ins";
		Guid PurchaseID = Guid.Empty;
		if (null == ViewState["PurchaseRegDetails"])
		{

			ViewState["PurchaseRegDetails"] = new Purchase().SelectPurchaseRegDetailsByID(Guid.Empty);

			PurchaseID = Guid.Empty;
		}
		if (FvPurchase.CurrentMode == FormViewMode.Edit)
		{
			PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
			Mode = "Upd";
		}

		GridView GvPurchageDetails = ((GridView) FvPurchase.FindControl("GvPurchageDetails" + Mode));
		DataTable dtPurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];

		DropDownList ddlItemID = ((DropDownList) FvPurchase.FindControl("ddlItemID" + Mode));
        DropDownList ddlPackType = ((DropDownList)FvPurchase.FindControl("ddlPackType" + Mode));
        TextBox txtQuantity = ((TextBox)FvPurchase.FindControl("txtQuantity" + Mode));
		TextBox txtPrice = ((TextBox) FvPurchase.FindControl("txtPrice" + Mode));

		//TextBox txtValue = ((TextBox) FvPurchase.FindControl("txtValue" + Mode));

		 object[] keys = { GvPurchageDetails.SelectedDataKey.Value };
		//object[] keys = new object[GvPurchageDetails.SelectedDataKey.Values.Count];
		//for (int i = 0; i < keys.Length; i++)
		//{
		//    keys[i] = GvPurchageDetails.SelectedDataKey.Values[i];
		//}
		DataRow dr = dtPurchaseRegDetails.Rows.Find(keys);
		if (null != dr)
		{
		    dr["ItemID"]=	ddlItemID.SelectedValue ;
            dr["PackType"] = ddlPackType.SelectedValue;
			dr["Quantity"] = txtQuantity.Text;
			dr["Price"] = txtPrice.Text;
			dr["Value"] = ((decimal) dr["Price"]) * ((decimal) dr["Quantity"]);

            ddlItemID.SelectedIndex = -1;
            ddlPackType.SelectedIndex = -1;
            txtQuantity.Text = "";
            txtPrice.Text = "";	
		}
        ((Button) FvPurchase.FindControl("btnAddPurchaseDetails" + Mode)).Visible = true;
		((Button) FvPurchase.FindControl("btnUpdatePurchaseDetails" + Mode)).Visible = false;
    	GvPurchageDetails.DataSource = (DataTable) ViewState["PurchaseRegDetails"];
		GvPurchageDetails.DataBind();
		GvPurchageDetails.SelectedIndex = -1;

	}


	protected void GvPurchase_SelectedIndexChanged(object sender, EventArgs e)
	{
        MvPurchase.SetActiveView(MvPurchase.Views[0]);
        FvPurchase.ChangeMode(FormViewMode.Edit);
	}

	protected void FvPurchase_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, Purchase.GetPurchaseRegHeaderRow());
		DataTable PurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];
		e.NewValues.Add("PurchaseRegDetails", PurchaseRegDetails);

	}
	
	protected void FvPurchase_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		Global.SetFormViewParameters(e.Values, Purchase.GetPurchaseRegHeaderRow());
		DataTable PurchaseRegDetails = (DataTable) ViewState["PurchaseRegDetails"];
		e.Values.Add("PurchaseRegDetails", PurchaseRegDetails);
	}
	
	protected void OdsPurchase_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	

	
	protected void FvPurchase_DataBound(object sender, EventArgs e)
	{
		if (FvPurchase.CurrentMode == FormViewMode.Edit)
		{
			Purchase objpurchase = new Purchase();
            //Guid PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
            Guid PurchaseID = (Guid)GvPurchase.SelectedDataKey.Value;
            ViewState["PurchaseRegDetails"] = objpurchase.SelectPurchaseRegDetailsByID(PurchaseID);
			GridView grd = (GridView) FvPurchase.FindControl("GvPurchageDetailsUpd");
			grd.DataSource = (DataTable) ViewState["PurchaseRegDetails"];
			grd.SelectedIndex = -1;
			grd.DataBind();
		}
		if (FvPurchase.CurrentMode == FormViewMode.ReadOnly)
		{
			Purchase objpurchase = new Purchase();
			Guid PurchaseID = (Guid) FvPurchase.DataKey["PurchaseID"];
			ViewState["PurchaseRegDetails"] = objpurchase.SelectPurchaseRegDetailsByID(PurchaseID);
			GridView grd = (GridView) FvPurchase.FindControl("GvPurchageDetailsItm");
			grd.DataSource = (DataTable) ViewState["PurchaseRegDetails"];
			grd.SelectedIndex = -1;
			grd.DataBind();
		}
	}

	protected void btnApproveItm_Click(object sender, EventArgs e)
	{
		string userName = Thread.CurrentPrincipal.Identity.Name;

		DateTime PurchaseDate = Convert.ToDateTime(((TextBox) FvPurchase.FindControl("txtPurchaseDateItm")).Text);
		Purchase objPurchase = new Purchase();
		
		Guid PurchaseID = (Guid) GvPurchase.SelectedValue;
		objPurchase.ApprovePurchaseOrder(PurchaseID, PurchaseDate, userName, DateTime.Now);	
	}

	protected void BtnCancelItm_Click(object sender, EventArgs e)
	{
		MvPurchase.SetActiveView(MvPurchase.Views[1]);
		FvPurchase.ChangeMode(FormViewMode.ReadOnly);

	}

	protected void OdsPurchaseByID_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}

	
	protected void OdsPurchaseByID_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
	
	protected void btnCancel_Click(object sender, EventArgs e)
	{
		MvPurchase.SetActiveView(MvPurchase.Views[1]);

		FvPurchase.ChangeMode(FormViewMode.ReadOnly);

	}



	protected void LinkRequest_Click(object sender, EventArgs e)
	{
		MvPurchase.SetActiveView(MvPurchase.Views[0]);

		FvPurchase.ChangeMode(FormViewMode.Insert);
	}
	protected void LinkverifyPurchaseRequest_Click(object sender, EventArgs e)
	{
		Session["Click"] = true;
		MvPurchase.SetActiveView(MvPurchase.Views[1]);

		FvPurchase.ChangeMode(FormViewMode.Edit);
	}
	protected void LinkApprovePurchase_Click(object sender, EventArgs e)
	{
		Session["Click"] = false;
		MvPurchase.SetActiveView(MvPurchase.Views[0]);

		FvPurchase.ChangeMode(FormViewMode.ReadOnly);
	}
	protected void fvPurchaseReadOnly_DataBound(object sender, EventArgs e)
	{
        //if (fvPurchaseReadOnly.CurrentMode == FormViewMode.ReadOnly)
        //{
        //    Purchase objpurchase = new Purchase();
        //    Guid PurchaseID = (Guid) fvPurchaseReadOnly.DataKey["PurchaseID"];
        //    ViewState["PurchaseRegDetails"] = objpurchase.SelectPurchaseRegDetailsByID(PurchaseID);
        //    GridView grd = (GridView) fvPurchaseReadOnly.FindControl("GvPurchageDetailsReadOnly");
        //    grd.DataSource = (DataTable) ViewState["PurchaseRegDetails"];
        //    grd.SelectedIndex = -1;
        //    grd.DataBind();
        //}

	}


	protected void fvPurchaseReadOnly_PageIndexChanging(object sender, FormViewPageEventArgs e)
	{
		MvPurchase.SetActiveView(MvPurchase.Views[2]);
		//fvPurchaseReadOnly.ChangeMode(FormViewMode.ReadOnly);
	}
    protected void BtnBackToGrid_Click(object sender, EventArgs e)
    {

    }
    protected void txtPriceIns_DataBinding(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)FvPurchase.FindControl("txtPriceIns");
        if (txt.Text != "")
        {
            string s = txt.Text;
            int i = s.IndexOf('.');
            s.Remove(i + 2);

        }
    }
}
