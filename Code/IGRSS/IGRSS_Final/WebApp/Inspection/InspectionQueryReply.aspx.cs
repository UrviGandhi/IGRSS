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

public partial class Inspection_InspectionQueryReply : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddDocs_Click(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        FileManagement flMgmt = new FileManagement();
        Guid FileId = new Guid(ddlOffice.SelectedValue);
        decimal FileNo = Convert.ToDecimal(txtFileSlNo.Text);
        decimal FileYear = Convert.ToDecimal(txtFileYear.Text);
        string FilePreFix = txtFilePrefix.Text;
        string curfileid = (flMgmt.GetFileIDByFileNoAndOffice(FileId, FileNo, FilePreFix, FileYear)).ToString();
        Session["fileId"] = curfileid;
        if (Session["fileId"].ToString() == (Guid.Empty).ToString())
        {

        }
        else
        {
            //mvUpload.SetActiveView(mvUpload.Views[1]);
        }

    }
}
