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

public partial class UserControls_DocumentUpload : System.Web.UI.UserControl
{


    private Guid m_Fileid;
    /// <summary>
    /// This is the file ID
    /// </summary>
    public Guid Fileid
    {
        get { return m_Fileid; }
        set { m_Fileid = value; }
    }
	 

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    byte[] imageByte = new byte[0];
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string DocumentName = ((TextBox)fvDocuments.FindControl("DocNameTextBox")).Text;
        long DocumentLength = ((FileUpload)fvDocuments.FindControl("fulDocuments")).PostedFile.InputStream.Length + 1;
         imageByte = new byte[DocumentLength];
        ((FileUpload)fvDocuments.FindControl("fulDocuments")).PostedFile.InputStream.Read(imageByte, 0, imageByte.Length);
        DataTable dtAttachments = (DataTable)ViewState["gvAttachments"];
        if (dtAttachments == null)
        {
            dtAttachments = new DataTable();
            dtAttachments.Columns.Add("DocName", typeof(string));
            dtAttachments.Columns.Add("Name", typeof(string));
            dtAttachments.Columns.Add("Img", typeof(Byte[]));
        }
        string Fees = ((TextBox)fvDocuments.FindControl("FileIDTextBox")).Text;

        DataRow drAttachments = dtAttachments.NewRow();
        drAttachments["DocName"] = imageByte;
        drAttachments["Name"] = DocumentName;
       // DrAddFee["Img"] = imageByte;
        fldContent.Value = imageByte.ToString();
        dtAttachments.Rows.Add(drAttachments);
        ////for (int i = 0; i < dtAddAmount.Rows.Count; i++)
        ////{
        ////    if (FeesName == (string)dtAddAmount.Rows[i]["Name"])
        ////    {
        ////        dtAddAmount.Rows[i].Delete();
        ////    }
        ViewState["gvAttachments"] = dtAttachments;
        ////}
        ((GridView)fvDocuments.FindControl("gvAttachments")).DataSource = ViewState["gvAttachments"];
        ((GridView)fvDocuments.FindControl("gvAttachments")).DataBind();
        //Session["Attach"] = imageByte;
        //ViewState["gvFeesIns"] = dtAddAmount;
        //Gv.DataSource = ViewState["gvFeesIns"];
        //IGRSS.BusinessObjects.FileManager.AttachDocumentToFile(Guid.Empty, imageByte);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      // IGRSS.BusinessObjects.FileManager.AttachDocumentToFile(Guid.Empty, imageByte);
    }
}
