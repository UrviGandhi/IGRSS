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
using IGRSS.BusinessObjects;
using Resources;

public partial class License_StatementOfSale : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void fvSaleRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        Guid LicnceId = new Guid(ddlVendorId.SelectedValue);
        string Date = txtDate.Text;
        Date = Date + " " + ((DropDownList)fvSaleRegister.FindControl("ddlHours")).SelectedValue +":"+ ((DropDownList)fvSaleRegister.FindControl("ddlMinutes")).SelectedValue;
        DateTime DateNow = Convert.ToDateTime(Date);
        e.Values.Add("licenseId", LicnceId);
        e.Values.Add("Date",Date);
        Global.SetFormViewParameters(e.Values, LicenseApplication.GetSaleRow());
    }
    protected void odsSaleRegister_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameters"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    Guid LicenseId = Guid.Empty;
    //    if (null == ViewState["SalesDetails"])
    //    {
    //        ViewState["SalesDetails"] = new LicenseApplication().getSalseDataByLicenseId(Guid.Empty);
    //        LicenseId = Guid.Empty;
    //    }
    //    if (fvSaleRegister.CurrentMode == FormViewMode.Edit)
    //    {
    //        LicenseId = (Guid)fvSaleRegister.DataKey["LicenseId"];
    //        //Mode = "Upd";
    //    }

    //    GridView gvSalesDetails = ((GridView)fvSaleRegister.FindControl("gvSales"));
    //    DataTable dtSalesDetails = (DataTable)ViewState["SalesDetails"];
    //    DropDownList ddlVendor = ((DropDownList)fvSaleRegister.FindControl("ddlVendor"));
    //    DropDownList ddlDenomination = ((DropDownList)fvSaleRegister.FindControl("ddlDenomination"));
    //    TextBox SoldTo = ((TextBox)fvSaleRegister.FindControl("SoldToTextBox"));
    //    TextBox Quantity = ((TextBox)fvSaleRegister.FindControl("QuantityTextBox"));
    //    TextBox StartSerialNo = ((TextBox)fvSaleRegister.FindControl("StartSerialNoTextBox"));
    //    TextBox EndSerialNo = ((TextBox)fvSaleRegister.FindControl("EndSerialNoTextBox"));
    //    TextBox DateTextBox = ((TextBox)fvSaleRegister.FindControl("DateTextBox"));
    //    object[] keys = {LicenseId,new Guid(ddlVendor.SelectedValue)};

    //    DataRow dr = dtSalesDetails.Rows.Find(keys);

    //    if (null == dr)
    //    {
    //        dr = dtSalesDetails.NewRow();
    //        //dr["RevenueStampId"] = new Guid(ddlRevenueStamp.SelectedValue);
    //        dr["SoldTo"] = SoldTo.Text;
    //        dr["Denomination"] = ddlDenomination.SelectedItem.Text;
    //        dr["Quantity"] = Quantity.Text;
    //        dr["LicenseId"] = LicenseId;
    //        dr["StartSerialNo"] = StartSerialNo.Text;
    //        dr["EndSerialNo"] = EndSerialNo.Text;
    //        dr["Date"] = DateTextBox.Text;
    //        dtSalesDetails.Rows.Add(dr);
    //        //ddlRevenueStamp.SelectedIndex = -1;
    //        Quantity.Text = "";
    //        StartSerialNo.Text = "";
    //    }

    //    //((Button)fvRefundApplication.FindControl("btnAddStamp" )).Visible = true;
    //    //((Button)fvRefundApplication.FindControl("btnUpdateStamp")).Visible = false;

    //    ViewState["SalesDetails"] = dtSalesDetails;
    //    gvSalesDetails.DataSource = (DataTable)ViewState["SalesDetails"];
    //    gvSalesDetails.DataBind();
    //}

    protected void ddlVendorId_SelectedIndexChanged(object sender, EventArgs e)
    {
        fldLicenseId.Value = ddlVendorId.SelectedValue;
    }
    protected void fvSaleRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
         
        }

        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
}

