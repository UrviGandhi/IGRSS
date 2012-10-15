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
public partial class Employee_EmployeeMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        //if (!IsPostBack)
        //{
        //    switch (Request.Params["Mode"])
        //    {
        //        case "DataEntry":
        //            MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
        //            FvemployeeMaster.ChangeMode(FormViewMode.Insert);
        //            break;
        //        case "Verify":
        //            MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[1]);
        //            break;
        //        case "ReadOnly":
        //            MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[1]);
        //            break;
        //    }
        //}
        //Session["Mode"] = Request.Params["Mode"];
	}

	DataTable dtQualification = new DataTable();
	public void InitQualification()
	{
		dtQualification = (DataTable) ViewState["dtQualification"];
		if (dtQualification == null)
		{
			//dtQualification = new Employee().SelectEmpQualificationById(Guid.Empty);
			dtQualification = new DataTable();
			dtQualification.Columns.Add("QualificationID", typeof(Guid));

			dtQualification.Columns.Add("Details", typeof(string));
			//dtQualification.Columns.Add("QualificationID", typeof(Guid));
		}
	}


	protected void FvemployeeMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		dtQualification = (DataTable) ViewState["dtQualification"];
		Global.SetFormViewParameters(e.Values, Employee.GetRow());
		InitQualification();
    	foreach (ListItem li in ((ListBox) FvemployeeMaster.FindControl("lboxQualificationIns")).Items)
		{
			dtQualification.Rows.Add(li.Value, li.Selected);
		}
		e.Values.Add("dtQualification", dtQualification);  	
	}

	protected void OdsEmployeeMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void GvEmployeeDetails_SelectedIndexChanged1(object sender, EventArgs e)
	{
		//OdsEmployeeMaster.SelectParameters["EmployeeID"].DefaultValue = GvEmployeeDetails.SelectedDataKey.Value.ToString();
	
		MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
		FvemployeeMaster.ChangeMode(FormViewMode.Edit);
	//	FvemployeeMaster.ChangeMode(FormViewMode.ReadOnly);
		
	}
	protected void FvemployeeMaster_DataBound(object sender, EventArgs e)
	{
		if (FvemployeeMaster.CurrentMode == FormViewMode.Edit)
		{
			Employee emp = new Employee();
			Guid EmployeeId = (Guid) FvemployeeMaster.DataKey["EmployeeID"];
			ViewState["dtQualification"] = emp.SelectEmpQualificationById(EmployeeId);
			dtQualification = (DataTable) ViewState["dtQualification"];
			ListBox lstbox = (ListBox) FvemployeeMaster.FindControl("lboxQualificationUpd");
			foreach (DataRow dr in dtQualification.Rows)
			{
				ListItem li = lstbox.Items.FindByValue(dr["QualificationID"].ToString());
				if (null != li)
				{
					li.Selected = true;
				}
			}
		}

		if (FvemployeeMaster.CurrentMode == FormViewMode.ReadOnly)
		{
			Employee emp = new Employee();
			Guid EmployeeId = (Guid) FvemployeeMaster.DataKey["EmployeeID"];
			ViewState["dtQualification"] = emp.SelectEmpQualificationById(EmployeeId);
			dtQualification = (DataTable) ViewState["dtQualification"];
			ListBox lstbox = (ListBox) FvemployeeMaster.FindControl("lboxQualificationItm");
			foreach (DataRow dr in dtQualification.Rows)
			{
				ListItem li = lstbox.Items.FindByValue(dr["QualificationID"].ToString());
				if (null != li)
				{
					li.Selected = true;
				}
			}
		}


		
      	
       
	}
	protected void FvemployeeMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{FormView fv= (FormView)sender;
        Global.SetFormViewParameters(e.NewValues, Employee.GetRow());
		InitQualification();
		foreach (ListItem li in ((ListBox) FvemployeeMaster.FindControl("lboxQualificationUpd")).Items)
		{
			if (li.Selected)
			{
				dtQualification.Rows.Clear();
				DataRow dr = dtQualification.NewRow();
				dr["EmployeeQualiID"] = fv.DataKey["EmployeeID"];
				dr["EmployeeID"] = fv.DataKey["EmployeeID"];
				dr["QualificationID"] = new Guid(li.Value);
				dtQualification.Rows.Add(dr);
				dtQualification.AcceptChanges();
			}
		}
		e.NewValues.Add("QualificationDetails", dtQualification);
	}
	
	protected void OdsSelectEmployeeByID_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
	}
	protected void OdsSelectEmployeeByID_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];

		Parameters.Values.BeginEdit();
		e.InputParameters["Parameters"] = Parameters;
		e.InputParameters.Remove("Values");
	
	}
	protected void BtnBack_Click(object sender, EventArgs e)
	{

		MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[1]);
		FvemployeeMaster.ChangeMode(FormViewMode.ReadOnly);

	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		GvEmployeeDetails.DataBind();
	}
	protected void GvEmployeeDetails_SelectedIndexChanged(object sender, EventArgs e)
	{
        //switch ((string) Session["Mode"])
        //{
        //    case "Verify":
                //MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
                //FvemployeeMaster.ChangeMode(FormViewMode.Edit);
            //    break;
            //case "ReadOnly":
        MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[2]);
        //fv  .ChangeMode(FormViewMode.ReadOnly);mmmmfdfdd11
        //        break;
        //}
		
	}
	protected void LinkInsert_Click(object sender, EventArgs e)
	{
		MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
		FvemployeeMaster.ChangeMode(FormViewMode.Insert);
	}

	protected void LinkEdit_Click(object sender, EventArgs e)
	{
		MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[1]);
		FvemployeeMaster.ChangeMode(FormViewMode.Edit);
	}
	protected void CancelFvemployeeUpd_Click(object sender, EventArgs e)
	{
		MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[1]);
		FvemployeeMaster.ChangeMode(FormViewMode.Edit);

	}
	protected void txtDateOfBirthUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvemployeeMaster.FindControl("txtDateOfBirthUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		
	}
	protected void txtStartDateUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvemployeeMaster.FindControl("txtStartDateUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtEnddateUpd_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvemployeeMaster.FindControl("txtEnddateUpd");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtDateOfBirthReadOnly_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvEmployeeMasterReadOnly.FindControl("txtDateOfBirthReadOnly");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		
	}
	protected void txtStartDateReadOnly_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvEmployeeMasterReadOnly.FindControl("txtStartDateReadOnly");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
		

	}
	protected void txtEnddateReadOnly_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtCreatedAtReadOnly_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtModifiedAtReadOnly_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtDeletedAtReadOnly_TextChanged(object sender, EventArgs e)
	{
		
	}
	protected void txtDateOfBirthUpd_TextChanged(object sender, EventArgs e)
	{

	}
	protected void txtEnddateReadOnly_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvEmployeeMasterReadOnly.FindControl("txtEnddateReadOnly");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtCreatedAtReadOnly_DataBinding(object sender, EventArgs e)
	{
		TextBox txt = (TextBox) FvEmployeeMasterReadOnly.FindControl("txtCreatedAtReadOnly");
		if (txt.Text != "")
		{
			DateTime s = Convert.ToDateTime(txt.Text);
			txt.Text = s.ToString("dd/MM/yyyy");

		}
	}
	protected void txtModifiedAtReadOnly_DataBinding(object sender, EventArgs e)
	{
		//TextBox txt = (TextBox) FvEmployeeMasterReadOnly.FindControl("txtModifiedAtReadOnly");
		//if (txt.Text != "")
		//{
		//    DateTime s = Convert.ToDateTime(txt.Text);
		//    txt.Text = s.ToString("dd/MM/yyyy");

		//}
	}
	protected void FvemployeeMaster_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		
	}
	protected void SaveFvemployeeIns_Click(object sender, EventArgs e)
	{
		
	}
    protected void BtnAddNew_Click(object sender, EventArgs e)
    {
        MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
        FvemployeeMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void OdsSelectEmployeeByID_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void CancelFvemployeeIns_Click(object sender, EventArgs e)
    {
        MvEmployeeMaster.SetActiveView(MvEmployeeMaster.Views[0]);
    }
}
