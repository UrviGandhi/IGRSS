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
using System.Xml;
using System.Text;
using IGRSS.BusinessLogicLayer.Administration;

public partial class Central_Administration_Console_ManageOfficeProcess : IgrssPage
{
    DataTable dtVerificationList = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        dtVerificationList.Columns.Add("Role", typeof(string));
    }
    protected void btnAddVerification_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        if (ViewState["VerificationList"] == null)
        {
            ViewState["VerificationList"] = "<VerificationList/>";
        }
        doc.LoadXml((string)ViewState["VerificationList"]);
        XmlNode item = doc.CreateElement("Item");

        XmlAttribute atrForwardingOffice = doc.CreateAttribute("ForwardingOffice");
        XmlAttribute atrRole = doc.CreateAttribute("Role");
        XmlAttribute atrRoleName = doc.CreateAttribute("RoleName");

        atrForwardingOffice.Value = ddlVerificationOffice.SelectedValue;
        atrRole.Value = ddlVerificationRole.SelectedValue;
        atrRoleName.Value = ddlVerificationRole.SelectedItem.Text;

        item.Attributes.Append(atrForwardingOffice);
        item.Attributes.Append(atrRole);
        item.Attributes.Append(atrRoleName);

        doc.ChildNodes[0].AppendChild(item);
        xdsVerificationList.Data = doc.OuterXml;
        gvVerificationList.DataBind();
        
     
        ViewState["VerificationList"] = doc.OuterXml;
    }
    protected void xdsVerificationList_DataBinding(object sender, EventArgs e)
    {

    }
    protected void gvVerificationList_DataBinding(object sender, EventArgs e)
    {

    }
    protected void gvVerificationList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        if (ViewState["VerificationList"] == null)
        {
            ViewState["VerificationList"] = "<VerificationList/>";
        }
        doc.LoadXml((string)ViewState["VerificationList"]);
        string filter = "/VerificationList/Item[@ForwardingOffice='" + e.Values["ForwardingOffice"] +
                        "' and @Role='" + e.Values["Role"] + "']";
        XmlNode item = doc.SelectSingleNode(filter);
        if (item != null)
        {
            doc.ChildNodes[0].RemoveChild(item);
        }
        xdsVerificationList.Data = doc.OuterXml;
        gvVerificationList.DataBind();
        ViewState["VerificationList"] = doc.OuterXml;
        e.Cancel = true;
    }
    protected void gvVerificationList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.PageIndex = e.NewPageIndex;
        gv.DataBind();
    }
    protected void btnAddApproval_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        if (ViewState["ApprovalList"] == null)
        {
            ViewState["ApprovalList"] = "<ApprovalList/>";
        }
        doc.LoadXml((string)ViewState["ApprovalList"]);
        XmlNode item = doc.CreateElement("Item");
        XmlAttribute atrForwardingOffice = doc.CreateAttribute("ForwardingOffice");
        XmlAttribute atrRole = doc.CreateAttribute("Role");
        XmlAttribute atrRoleName = doc.CreateAttribute("RoleName");

        atrForwardingOffice.Value = ddlApprovalOffice.SelectedValue;
        atrRole.Value = ddlApprovalRole.SelectedValue;
        atrRoleName.Value = ddlApprovalRole.SelectedItem.Text;

        item.Attributes.Append(atrForwardingOffice);
        item.Attributes.Append(atrRole);
        item.Attributes.Append(atrRoleName);

        doc.ChildNodes[0].AppendChild(item);
        xdsApprovalList.Data = doc.OuterXml;
        
        gvApprovalList.DataBind();
        ViewState["ApprovalList"] = doc.OuterXml;
    }
    protected void gvApprovalList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        if (ViewState["ApprovalList"] == null)
        {
            ViewState["ApprovalList"] = "<ApprovalList/>";
        }
        doc.LoadXml((string)ViewState["ApprovalList"]);
        string filter = "/ApprovalList/Item[@ForwardingOffice='" + e.Values["ForwardingOffice"] +
                        "' and @Role='" + e.Values["Role"] + "']";
        XmlNode item = doc.SelectSingleNode(filter);
        if (item != null)
        {
            doc.ChildNodes[0].RemoveChild(item);
        }
        xdsApprovalList.Data = doc.OuterXml;
        gvApprovalList.DataBind();
        ViewState["ApprovalList"] = doc.OuterXml;
        e.Cancel = true;

    }
    protected void btnSaveProcess_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();

        if (ViewState["VerificationList"] == null)
        {
            ViewState["VerificationList"] = "<VerificationList/>";
        }
        if (ViewState["ApprovalList"] == null)
        {
            ViewState["ApprovalList"] = "<ApprovalList/>";
        }

        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<Process>");
        sb.AppendLine((string)ViewState["VerificationList"]);
        sb.AppendLine((string)ViewState["ApprovalList"]);
        sb.AppendLine("</Process>");

        doc.LoadXml(sb.ToString());

        ManageOfficeProcess OfficeProcess = new ManageOfficeProcess();
        OfficeProcess.SetOfficeProcess(new Guid(ddlOfficeName.SelectedValue), ddlProcess.SelectedValue, doc);

    }
    protected void ddlOfficeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOfficeProcess();

    }

    protected void ddlProcess_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOfficeProcess();
    }

    private void LoadOfficeProcess()
    {
        XmlDocument doc = new XmlDocument();

        ManageOfficeProcess OfficeProcess = new ManageOfficeProcess();
        doc = OfficeProcess.GetProcessForModule(ddlProcess.SelectedValue, new Guid(ddlOfficeName.SelectedValue));

        string filterVerification = "/Process/VerificationList";
        string filterApproval = "/Process/ApprovalList";
        XmlNode VerificationItems = doc.SelectSingleNode(filterVerification);
        XmlNode ApprovalItems = doc.SelectSingleNode(filterApproval);

        if (VerificationItems == null)
        {
            ViewState["VerificationList"] = "<VerificationList/>";
            xdsVerificationList.Data = (string)ViewState["VerificationList"];
            gvVerificationList.DataBind();
        }
        else
        {
            ViewState["VerificationList"] = VerificationItems.OuterXml;
            xdsVerificationList.Data = VerificationItems.OuterXml;
            gvVerificationList.DataBind();
        }
        if (ApprovalItems == null)
        {
            ViewState["ApprovalList"] = "<ApprovalList/>";
            xdsApprovalList.Data = (string)ViewState["ApprovalList"];
            gvApprovalList.DataBind();
        }
        else
        {
            ViewState["ApprovalList"] = ApprovalItems.OuterXml;
            xdsApprovalList.Data = ApprovalItems.OuterXml;
            gvApprovalList.DataBind();
        }
    }
    protected void gvVerificationList_DataBound(object sender, EventArgs e)
    {
        
    
    }
    protected void gvVerificationList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}