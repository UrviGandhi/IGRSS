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
using System.Globalization;


public partial class IgrssLogin :IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        Button loginButton = (Button)Login.FindControl("LoginButton");
        if (loginButton != null)
        {
           Form.DefaultButton = loginButton.UniqueID;
        }
        
        TextBox userNameTextbox = (TextBox)Login.FindControl("UserName");
        if (userNameTextbox != null)
        {
            Form.DefaultFocus = userNameTextbox.UniqueID;
        }
        userNameTextbox.Focus();
	}

    protected void ddlLang_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["UICulture"] = ((DropDownList)sender).SelectedValue;
    }
}
