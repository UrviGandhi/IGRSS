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
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;

public partial class UserControls_Search : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        mvSearch.SetActiveView(mvSearch.Views[0]);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        FileManagement fm = new FileManagement();
        odsSearch.Select();
        gvSearch.DataBind();
        mvSearch.SetActiveView(mvSearch.Views[1]);
        
    }
    protected void odsSearch_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
    }
   
    protected void gvSearch_RowEditing(object sender, GridViewEditEventArgs e)
    {
        e.Cancel = true;
        switch (((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblDepartment")).Text)
        {
            case "LIC":
                Response.Redirect("~/License/LicenseApplication.aspx?RedirID=" + ((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblfileId")).Text);
                break;
            case "APL":
                Response.Redirect("~/Appeal/AppealApplication.aspx?RedirID=" + ((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblfileId")).Text);
                break;
            case "COM":
                Response.Redirect("~/Complain/Complaint.aspx?RedirID=" + ((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblfileId")).Text);
                break;
            case "REF":
                Response.Redirect("~/Refund/RefundApplication.aspx?RedirID=" + ((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblfileId")).Text);
                break;
            case "ADJ":
                Response.Redirect("~/Adjudication/AdjApplication.aspx?RedirID=" + ((Label)gvSearch.Rows[e.NewEditIndex].FindControl("lblfileId")).Text);
                break;
        }
    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        mvSearch.SetActiveView(mvSearch.Views[0]);
    }
    protected void gvSearch_PageIndexChanged(object sender, EventArgs e)
    {
        mvSearch.SetActiveView(mvSearch.Views[1]);
    }
}
