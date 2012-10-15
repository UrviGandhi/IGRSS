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

public partial class UserControls_DocumentDownload : System.Web.UI.UserControl
{
   
    /// <summary>
    /// This is the Doc file id.
    /// </summary>
    public Guid DocId
    {
        get 
        {
            if (flddocId.Value == "")
            {
                return  Guid.Empty; 
            }
            else
            {
                return new Guid(flddocId.Value);
            }
  
        }
        set
        { flddocId.Value = value.ToString(); }
    }
    //get
    //    {
    //        if (fldFileId.Value == "")
    //        {
    //            return  Guid.Empty; 
    //        }
    //        else
    //        {
    //            return new Guid(fldFileId.Value);
    //        }

    //    }
    //    set { fldFileId.Value= value.ToString(); }
	 
	
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
