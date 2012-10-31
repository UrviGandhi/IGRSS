using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_PrimaryInvestigation_InquiryRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Inquiry.SetActiveView(Multiview_Inquiry.Views[1]);
        FormView_Inquiry.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Inquiry_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownEmployeeName = FormView_Inquiry.FindControl("Name_Of_EmployeeDropDown") as DropDownList;
        e.Values["Name_Of_Employee"] = DropDownEmployeeName.SelectedValue;

        DropDownList DropDownDesignation = FormView_Inquiry.FindControl("Drop_employeedesignation") as DropDownList;
        e.Values["Designation_Of_Employee"] = DropDownDesignation.SelectedValue;
    }
    protected void ods_Inquiry_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Inquiry.SelectMethod = "GetDataBy";
        //ods_MLA.SelectMethod = "GetDataBy";
    }
    protected void FormView_Inquiry_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Inquiry.SetActiveView(ViewGrid);
                GridView_Inquiry.DataBind();
               break;
        }
    }
}