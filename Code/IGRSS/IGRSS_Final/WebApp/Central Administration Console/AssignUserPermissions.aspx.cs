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
using System.Xml.XPath;
using System.Collections.Generic;

public partial class Central_Administration_Console_UserRoleManagement_AssignUserPermissions : IgrssPage
{
    Dictionary<string, Dictionary<string, Dictionary<Guid, string>>> TempRoles = new Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvUsersList.DataSource = Membership.GetAllUsers();
        gvUsersList.DataBind();
        if (!IsPostBack)
        {
            wizPermission.ActiveStepIndex = 0;
        }
    }

    protected void gvUsersList_SelectedIndexChanged(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(Convert.ToString(gvUsersList.SelectedDataKey.Value));
        litUsername.Text = Convert.ToString(user.UserName);
        litIsOnline.Text = Convert.ToString(user.IsOnline);
        litLastLogin.Text = Convert.ToString(user.LastLoginDate);
        litLastActivity.Text = Convert.ToString(user.LastActivityDate);
        litLastLockoutDate.Text = Convert.ToString(user.LastLockoutDate);
        litIsLockedOut.Text = Convert.ToString(user.IsLockedOut);
        litComment.Text = Convert.ToString(user.Comment);
        ViewState["SelectedUser"] = user.UserName;
        ViewState["TempRoles"] = Profile.GetProfile(user.UserName).Permissions.OfficeRoles;
        mvAssignPermissions.SetActiveView(mvAssignPermissions.Views[1]);
        trvOfficePermissions.CollapseAll();
        
    }

    protected void trvModules_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
    {
        ProfileCommon UserProfile = Profile.GetProfile(Convert.ToString(ViewState["SelectedUser"]));
        XmlElement xmlEle = (XmlElement)e.Node.DataItem;
        if (xmlEle.Name == "View")
        {
            string module = e.Node.Parent.Value;
            string mode = e.Node.Value;
            try
            {
                e.Node.Checked = UserProfile.Permissions.OfficeRoles[module].ContainsKey(mode);
            }
            catch (KeyNotFoundException)
            {
                e.Node.Checked = false;
            }
        }
    }

    protected void wizPermission_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        switch (e.CurrentStepIndex)
        {
            case 0:
                XmlDocument xmlDoc;
                XmlNode xmlNode;

                xmlDoc = new XmlDocument();
                xmlNode = xmlDoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
                xmlDoc.AppendChild(xmlNode);

                XmlNode xmlEle;
                xmlEle = xmlDoc.CreateElement("IgrssSite");
                xmlDoc.AppendChild(xmlEle);

                foreach (TreeNode tempNode in trvModules.Nodes[0].ChildNodes)
                {
                    if (tempNode.ChildNodes.Count > 0)
                    {
                        XmlNode newNode = GetNode(tempNode, xmlDoc);
                        if ((newNode != null) && (newNode.ChildNodes.Count > 0))
                        {
                            xmlEle.AppendChild(newNode);
                        }
                    }
                }
                xdsOfficePermissions.Data = xmlDoc.OuterXml;
                xdsOfficePermissions.DataBind();
                trvOfficePermissions.DataBind();
                break;
            default:
                break;
        }
    }

    public XmlNode GetNode(TreeNode treeNode, XmlDocument xmlDoc)
    {
        XmlElement xmlEle = xmlDoc.CreateElement("View");
        if (treeNode.ChildNodes.Count <= 0)
        {
            if (treeNode.Checked)
            {
                XmlAttribute xmlAttrName = xmlDoc.CreateAttribute("Name");
                XmlAttribute xmlAttrUrl = xmlDoc.CreateAttribute("Url");
                XmlAttribute xmlAttrMode = xmlDoc.CreateAttribute("Mode");
                xmlAttrName.Value = treeNode.Text;
                xmlAttrUrl.Value = treeNode.NavigateUrl;
                xmlAttrMode.Value = treeNode.Value;
                xmlEle.Attributes.Append(xmlAttrName);
                xmlEle.Attributes.Append(xmlAttrUrl);
                xmlEle.Attributes.Append(xmlAttrMode);
            }
            else
            {
                xmlEle = null;
            }
        }
        else
        {
            xmlEle = xmlDoc.CreateElement("Module");

            XmlAttribute xmlAttrName = xmlDoc.CreateAttribute("Name");
            xmlAttrName.Value = treeNode.Text;
            xmlEle.Attributes.Append(xmlAttrName);

            XmlAttribute xmlAttrCode = xmlDoc.CreateAttribute("Code");
            xmlAttrCode.Value = treeNode.Value;
            xmlEle.Attributes.Append(xmlAttrCode);
            foreach (TreeNode tempNode in treeNode.ChildNodes)
            {
                XmlNode newNode = GetNode(tempNode, xmlDoc);
                if (null != newNode)
                {
                    xmlEle.AppendChild(newNode);
                }
            }
        }
        return xmlEle;
    }

    protected void wizPermission_Load(object sender, EventArgs e)
    {
        xdsOfficePermissions.Data = "<IgrssSite/>";
    }

    protected void lnkAssignOffices_Click(object sender, EventArgs e)
    {
        if (null != ViewState["TempRoles"])
        {
            TempRoles = (Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>)ViewState["TempRoles"];
        }
        TreeNode SelectedNode = trvOfficePermissions.SelectedNode;
        if (SelectedNode == null)
            return;
        string module = SelectedNode.Parent.Value;
        string mode = SelectedNode.Value;
        Dictionary<Guid, string> Offices = new Dictionary<Guid, string>();

        foreach (ListItem item in cblOffices.Items)
        {
            if (item.Selected)
            {
                Offices.Add(new Guid(item.Value), item.Text);
            }
        }
        if (TempRoles[module].ContainsKey(mode))
        {
            TempRoles[module].Remove(mode);
        }
        TempRoles[module].Add(mode, Offices);
        ViewState["TempRoles"] = TempRoles;

    }

    protected void trvOfficePermissions_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
    {
        XmlElement xmlEle = (XmlElement)e.Node.DataItem;
        //if (null != ViewState["TempRoles"])
        //{
        //    TempRoles = (Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>) ViewState["TempRoles"];
        //}
        if (xmlEle.Name == "Module")
        {
            string moduleCode = xmlEle.Attributes["Code"].Value;
            TempRoles.Add(moduleCode, new Dictionary<string, Dictionary<Guid, string>>());
        }
        else if (xmlEle.Name == "View")
        {
            Dictionary<string, Dictionary<string, Dictionary<Guid, string>>> OldRoles;
            string userName = ((Literal)wizPermission.FindControl("litUsername")).Text;
            OldRoles = Profile.GetProfile(userName).Permissions.OfficeRoles;
            string moduleCode = xmlEle.ParentNode.Attributes["Code"].Value;
            string viewName = xmlEle.Attributes["Mode"].Value;
            TempRoles[moduleCode].Add(viewName, new Dictionary<Guid, string>());
            if ((OldRoles.ContainsKey(moduleCode)) && (OldRoles[moduleCode].ContainsKey(viewName)))
            {
                TempRoles[moduleCode][viewName] = OldRoles[moduleCode][viewName];
            }
        }
        ViewState["TempRoles"] = TempRoles;
    }

    protected void wizPermission_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (null != ViewState["TempRoles"])
        {
            TempRoles = (Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>)ViewState["TempRoles"];
        }
        string username = (string)ViewState["SelectedUser"];
        ProfileCommon UserProfile = Profile.GetProfile(username);
        XmlDocument xmlDoc;
        XmlNode xmlNode;

        xmlDoc = new XmlDocument();
        xmlNode = xmlDoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
        xmlDoc.AppendChild(xmlNode);

        XmlNode xmlEle;
        xmlEle = xmlDoc.CreateElement("IgrssSite");
        xmlDoc.AppendChild(xmlEle);

        foreach (TreeNode tempNode in trvModules.Nodes[0].ChildNodes)
        {
            if (tempNode.ChildNodes.Count > 0)
            {
                XmlNode newNode = GetNode(tempNode, xmlDoc);
                if ((newNode != null) && (newNode.ChildNodes.Count > 0))
                {
                    xmlEle.AppendChild(newNode);
                }
            }
        }
        UserProfile.Permissions.MenuItems = xmlDoc.OuterXml;

        UserProfile.Permissions.OfficeRoles = TempRoles;
        UserProfile.Save();
        Response.Redirect("~/Central%20Administration%20Console/AssignUserPermissions.aspx");
    }

    protected void cblOffices_DataBound(object sender, EventArgs e)
    {
    }

    protected void trvOfficePermissions_SelectedNodeChanged(object sender, EventArgs e)
    {
        cblOffices.ClearSelection();
        cblOffices.Items.Clear();
        if (null != ViewState["TempRoles"])
        {
            TempRoles = (Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>)ViewState["TempRoles"];
        }
        TreeNode SelectedNode = trvOfficePermissions.SelectedNode;
        if (SelectedNode.ChildNodes.Count == 0)
        {
            cblOffices.DataBind();
            string module = SelectedNode.Parent.Value;
            string mode = SelectedNode.Value;

            if (TempRoles[module].ContainsKey(mode))
            {
                Dictionary<Guid, string> Offices = TempRoles[module][mode];
                foreach (Guid OfficeId in Offices.Keys)
                {
                    cblOffices.Items.FindByValue(OfficeId.ToString()).Selected = true;
                }
            }
        }
    }
    protected void gvUsersList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }
    protected void gvUsersList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // Add here your method for DataBinding
        gvUsersList.DataSource = Membership.GetAllUsers();
        gvUsersList.PageIndex = e.NewPageIndex;
        gvUsersList.DataBind();


    }
    protected void gvUsersList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        MembershipUser user = (MembershipUser)e.Row.DataItem;
        if (user != null)
        {
            int tmp = 1;
            LinkButton btn = (LinkButton)e.Row.Cells[5].Controls[tmp];
            if (!user.IsApproved)
            {
                btn.Text = "Enable";
                btn.CommandName = "Enable";
                btn.CommandArgument = user.UserName;
            }
            else
            {
                btn.Text = "Delete";
                btn.CommandName = "Disable";
                btn.CommandArgument = user.UserName;
            }
        }
    }
    protected void gvUsersList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        MembershipUser user = Membership.GetUser((string)e.CommandArgument);
        if (e.CommandName == "Enable")
        {
            user.IsApproved = true;
            Membership.UpdateUser(user);
            gvUsersList.DataSource = Membership.GetAllUsers();
            gvUsersList.DataBind();
        }
        if (e.CommandName == "Disable")
        {
            user.IsApproved = false;
            Membership.UpdateUser(user);
            gvUsersList.DataSource = Membership.GetAllUsers();
            gvUsersList.DataBind();
        }
    }
    protected void trvOfficePermissions_Load(object sender, EventArgs e)
    {

        
    }
}
