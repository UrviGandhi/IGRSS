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

public partial class UserControls_RadioButtonControl : System.Web.UI.UserControl
{
    private bool m_Value;
    /// <summary>
    /// This function will get value form the control.
    /// </summary>
    public bool Value
    {
        get 
        {
            if (fldValue.Value == "")
            {
                fldValue.Value = "False";
            }
            return Convert.ToBoolean(fldValue.Value);
            
        }
        set 
        {
            
            fldValue.Value=value.ToString(); 
        }
    }
	 
	
    protected void Page_Load(object sender, EventArgs e)
    {
        if (rdbYes.Checked == true)
        {
            fldValue.Value = "true";
        }
        if (rdbNo.Checked == true)
        {
            fldValue.Value = "false";
            rdbNo.Checked = true;
        }
        if (Value == true)
        {
            rdbYes.Checked = true;
        }
        if (Value == false)
        {
            rdbNo.Checked = true;
        }
       
    }
    protected void rdbYes_CheckedChanged(object sender, EventArgs e)
    {
        fldValue.Value = "true";
    }
    protected void rdbNo_CheckedChanged(object sender, EventArgs e)
    {
        fldValue.Value = "false";
    }
}
