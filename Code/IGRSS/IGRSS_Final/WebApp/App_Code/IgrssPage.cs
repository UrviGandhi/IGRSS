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

/// <summary>
/// Summary description for IgrssPage
/// </summary>
public class IgrssPage: System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        string selectedLanguage = Convert.ToString(Session["UICulture"]);
        UICulture = selectedLanguage;
        Culture = selectedLanguage;

        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(selectedLanguage);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(selectedLanguage);
        base.InitializeCulture();
    }
}
