﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_SOFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_SOFile.SetActiveView(Multiview_SOFile.Views[1]);
        FormView_SOFile.ChangeMode(FormViewMode.Insert);
    }
    
}