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
public partial class Central_Administration_Console_UserRoleManagement_UserInOfficeRoles : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
	}
	
	protected void btnSearch_Click(object sender, EventArgs e)
	{
        gvUsersList.DataSource = Membership.FindUsersByName(txtUserName.Text + "%");
		gvUsersList.DataBind();
	}

	protected void gvUsersList_SelectedIndexChanged(object sender, EventArgs e)
	{
        mvUserInOfficeRoles.SetActiveView(mvUserInOfficeRoles.Views[1]);
        lblUsernameDisplay.Text = gvUsersList.SelectedDataKey.Value.ToString();
	}

	protected void FvUserInOfficeRoles_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		e.Values.Add("Username", gvUsersList.SelectedDataKey.Value.ToString());
		Global.SetFormViewParameters(e.Values, ManageUserRoles.GetUserInOfficeRow());
	}

	protected void FvUserInOfficeRoles_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
        GvuserDetailsSearch.DataBind();
	}

	protected void odsUserInOfficeRolesByUserName_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
	    Parameters.Values = (DataRow) e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
	}
    protected void GvuserDetailsSearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void odsUserInOfficeRolesByUserName_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {

        //e.InputParameters.Add("DesignationID", (Guid)GvuserDetailsSearch.SelectedDataKey["DesignationID"]);
     
    }
    protected void GvuserDetailsSearch_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
    }
    protected void gvUsersList_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gvUsersList.Rows)
        {

            if (gr.Cells[3].Text == Convert.ToString(true))


                gr.Cells[3].Text = "Yes";
            else
                gr.Cells[3].Text = "No";
            if (gr.Cells[4].Text == Convert.ToString(true))


                gr.Cells[4].Text = "Yes";
            else
                gr.Cells[4].Text = "No";
        }
    }
    protected void GvuserDetailsSearch_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GvuserDetailsSearch.Rows)
        {

            if (gr.Cells[4].Text == Convert.ToString(true))


                gr.Cells[4].Text = "Yes";
            else
                gr.Cells[4].Text = "No";
           
        }
    }
}
