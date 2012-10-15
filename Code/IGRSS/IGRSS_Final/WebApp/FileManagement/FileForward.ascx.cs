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
using System.Threading;
using System.Collections.Generic;


public partial class FileManagement_FileForward : System.Web.UI.UserControl
{

    public Guid OriginalAlertId
    {
        get
        {
            string reqParam = Request.Params["AlertId"];
            if (String.IsNullOrEmpty(reqParam))
            {
                return Guid.Empty;
            }
            else
            {
                return new Guid(reqParam);
            }
        }
    }
	
    
    /// <summary>
    /// Contains FileID
    /// </summary>
    public Guid FileId
    {
        get
        {
            if (fldFileId.Value == "")
            {
                return  Guid.Empty; 
            }
            else
            {
                return new Guid(fldFileId.Value);
            }

        }
        set { fldFileId.Value= value.ToString(); }
    }
	
    private string m_Module;
    /// <summary>
    /// Current Module code
    /// </summary>
    public string Module
    {
        get { return m_Module; }
        set { m_Module = value; }
    }

    private string m_Mode;
    /// <summary>
    /// Current View mode
    /// </summary>
    public string Mode
    {
        get { return m_Mode; }
        set { m_Mode = value; }
    }

    private bool m_CanAddRemark;
    /// <summary>
    /// Indicates if to allow adding remark or not
    /// </summary>
    public bool CanAddRemark
    {
        get { return m_CanAddRemark; }
        set { m_CanAddRemark = value; }
    }

    private bool m_CanReadRemark;
    /// <summary>
    /// Indicates if user can view the remarks or not
    /// </summary>
    public bool CanReadRemark
    {
        get { return m_CanReadRemark; }
        set { m_CanReadRemark = value; }
    }

    private bool m_CanForwardFile;
    /// <summary>
    /// Indicates if to allow file forwarding or not
    /// </summary>
    public bool CanForwardFile
    {
        get { return m_CanForwardFile; }
        set { m_CanForwardFile = value; }
    }

    public void SetPermissions(bool AddRamarks,bool ReadRemarks,bool ForwardFile )
    {
        this.CanAddRemark = AddRamarks;
        this.CanForwardFile = ForwardFile;
        this.CanReadRemark = ReadRemarks;
    }
	
    protected void Page_Load(object sender, EventArgs e)
	{
        switch (Request.Params["Mode"])
        {
            case "DataEntry":
                ddlDataentry.Visible = true;
                ddlAction.Visible = false;
                ddlReadonly.Visible = false;
                break;
            case "Verify":
                ddlDataentry.Visible = false;
                ddlAction.Visible = true;
                ddlReadonly.Visible = false;
                break;
            default:
                ddlDataentry.Visible = false;
                ddlAction.Visible = true;
                ddlReadonly.Visible = false;
                break;

        }
            Profile.Permissions.FillOffices(ddlOfficeName, Module, Mode);
           // fldFileId.Value = FileId.ToString();
        
	}

	protected void btnSendalert_Click(object sender, EventArgs e)
	{
        if (fldFileId.Value != "" && Guid.Empty != new Guid(fldFileId.Value))
        {
            FileManager.ForwardFile(FileId, new Guid(ddlDesigination.SelectedValue), new Guid(ddlOfficeName.SelectedValue), OriginalAlertId);
        }
        else
        {
            //((IGRSS_Default)this.Master).ShowStatusMessage("File Forwarding failed", "File Cannot be forwarded at this Stage!", MessageType.Error);
            //Response.Write("File Forwarding failed");
        }
        //mvFileManagement.SetActiveView(ViewRemark);
	}
    
    protected void btnChForward_Click(object sender, EventArgs e)
    {
        mvFileManagement.SetActiveView(ViewFileForward);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        mvFileManagement.SetActiveView(ViewRemark);
    }
    
    protected void btnFileForward_Click(object sender, EventArgs e)
    {
        mvFileManagement.SetActiveView(ViewFileForward);
        if (CanForwardFile)
        {
            mvFileManagement.SetActiveView(ViewFileForward);
        }
    }

    protected void ddlAction_SelectedIndexChanged(object sender, EventArgs e)
     {
         if (Request.Params["AlertId"] != null)
         {
             IgrssAlert alert = WorkflowSupport.GetAlertById(new Guid(Request.Params["AlertId"]));
             this.FileId = new Guid(alert.SessionData["FileId"].ToString());
         }


         if (ddlAction.SelectedIndex == 0)
        {
            mvFileManagement.Visible = false;
            if (this.CanAddRemark == true)
            {
                mvFileManagement.Visible = false;
            }
            else
            {

            }
        }
        if (ddlAction.SelectedIndex == 1)
        {
            if (CanForwardFile == true || CanForwardFile == false)
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewFileForward);
            }
            else
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewError);
 
            }
        }
        if (ddlAction.SelectedIndex == 2)
        {
            if (CanAddRemark == true || CanAddRemark == false)
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewInsertRemark);
                fvFileManagement.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewError);
            }
        }
        if (ddlAction.SelectedIndex == 3)
        {
            if (CanAddRemark == true || CanAddRemark == false)
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewRemark);
                fvFileManagement.ChangeMode(FormViewMode.Edit);
            }
            else
            {
                mvFileManagement.Visible = true;
                mvFileManagement.SetActiveView(ViewError);
            }
        }
    }
    protected void fvFileManagement_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        
    }
    protected void OdsFileManagementUserCotrol_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["FileId"] = FileId;
        
    }
    protected void btnRemark_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnRemark_Click1(object sender, EventArgs e)
    {
        FileManager.ReturnFile(new Guid(fldFileId.Value));
    }
    protected void ddlDataentry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAction.SelectedIndex == 0)
        {
            mvFileManagement.Visible = false;
        }
        if (ddlDataentry.SelectedIndex == 1)
        {
            mvFileManagement.Visible = true;
            mvFileManagement.SetActiveView(ViewInsertRemark);
            fvFileManagement.ChangeMode(FormViewMode.Insert);
        }
    }
    protected void ddlReadonly_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAction.SelectedIndex == 0)
        {
            mvFileManagement.Visible = false;
        }
        if (ddlDataentry.SelectedIndex == 1)
        {
            mvFileManagement.Visible = true;
            mvFileManagement.SetActiveView(ViewRemark);
            fvFileManagement.ChangeMode(FormViewMode.Edit);
        }
    }
}
