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
public partial class Central_Administration_Console_DocUpload : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DocumentUpload dop = new DocumentUpload();
       
        if (flup.HasFile)
        {
            flup.SaveAs(@"E:\Projects\Igrss\Final\Upload\" + flup.FileName);
            Label1.Text = "File Uploaded: " + flup.FileName;
        }
        else
        {
            Label1.Text = "No File Uploaded.";
        }
        dop.UploadDocument(txtName.Text, txtDescription.Text, @"E:\Projects\Igrss\Final\Upload\" + flup.FileName);

    }
}
