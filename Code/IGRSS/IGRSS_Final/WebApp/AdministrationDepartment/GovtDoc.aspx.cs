using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GovtDoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //ObjectDataSource_govtdoc.InsertParameters.Add("@SrNo",((TextBox)FvGovtDoc.Row.FindControl("TextBox_SrNo")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@InwardNo",((TextBox)FvGovtDoc.Row.FindControl("TextBox_InwardNo")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@Details", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_details")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@LetterNo", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_letterno")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@LetterDate", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_letterdate")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@NameOfDepartment", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_deptname")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@FileNo", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_fileno")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@DetailsOfOutput", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_outputdetails")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@DetailsOfPreservingfiles", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_preservingfilesdetails")).Text);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@TypesofRecord", ((DropDownList)FvGovtDoc.Row.FindControl("DropDownList_record")).SelectedValue);
        //ObjectDataSource_govtdoc.InsertParameters.Add("@Remarks", ((TextBox)FvGovtDoc.Row.FindControl("TextBox_remarks")).Text);
        
  
    

        ObjectDataSource_govtdoc.Insert();       
               
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvgovtdoc.SetActiveView(mvgovtdoc.Views[1]);
        FvGovtDoc.ChangeMode(FormViewMode.ReadOnly);
    }

    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }

    protected void ObjectDataSource_govtdoc_inserted(object sender, EventArgs e)
    {
        //if (e.Exception == null)
        //{
        //    if (Equals(e.ReturnValue, true))
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        //    else
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        //}
        //else
        //{
        //    ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        //}

        GridView2.DataBind();

        mvgovtdoc.SetActiveView(mvgovtdoc.Views[0]);
        FvGovtDoc.ChangeMode(FormViewMode.ReadOnly);
    }
}