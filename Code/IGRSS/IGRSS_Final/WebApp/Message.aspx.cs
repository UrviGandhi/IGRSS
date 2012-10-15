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

public partial class Message : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Exception ex = Server.GetLastError();
            string message = "";
            if (ex.InnerException != null)
            {
                message = ex.InnerException.Message;
            }
            else
            {
                message = ex.Message;
            }
            message += "\n \n \n" + ex.StackTrace;
            lblError.Text = message;
            lblError.Visible = false;
        }
    }

    protected void lnkError_Click(object sender, EventArgs e)
    {
        lblError.Visible = !lblError.Visible;
    }
}
