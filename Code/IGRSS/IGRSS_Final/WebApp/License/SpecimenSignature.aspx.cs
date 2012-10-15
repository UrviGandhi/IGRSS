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
using IGRSS.BusinessObjects;
public partial class License_SpecimenSignature : System.Web.UI.Page
{
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void gvRenewVendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvSpicemenSig.SetActiveView(mvSpicemenSig.Views[1]);
        fvfranklinDetail.ChangeMode(FormViewMode.ReadOnly);
    }
   
    protected void gvSignatureDetails_DataBound(object sender, EventArgs e)
    {
       
    }
    protected void btnTelephoneInsertIns_Click(object sender, EventArgs e)
    {
            GridView gvSignatureDetails = ((GridView)viewviewSignature.FindControl("gvSignatureDetails"));
            DataTable dtSpicemenDetails = (DataTable)ViewState["SpicemenDetails"];
            Guid LicenseApplicationId = (Guid)fvfranklinDetail.DataKey["LicenseApplicationId"];
            TextBox txtFullname = ((TextBox)viewviewSignature.FindControl("txtLeaveToIns"));
            TextBox txtDesignation = ((TextBox)viewviewSignature.FindControl("txtDesignation"));
            DataRow dr = dtSpicemenDetails.NewRow();
            dr["SignatureId"] = Guid.NewGuid();
            dr["LicenseApplicationId"] = LicenseApplicationId;
            dr["FullName"] = txtFullname.Text;
            dr["Designation"] = txtDesignation.Text;
            dtSpicemenDetails.Rows.Add(dr);
            txtFullname.Text = "";
            txtDesignation.Text = "";
            ViewState["SpicemenDetails"] = dtSpicemenDetails;
            gvSignatureDetails.DataSource = (DataTable)ViewState["SpicemenDetails"];
            gvSignatureDetails.DataBind();
     }
    protected void viewviewSignature_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
       
        
    }
    protected void odsSpicemendetails_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters.Remove("FullName");
        DataTable dt = new DataTable();
        dt = (DataTable)ViewState["Name"];
        e.InputParameters.Add("FullName",dt);
    }
   
    protected void viewviewSignature_DataBound(object sender, EventArgs e)
    {
        if (mvSpicemenSig.ActiveViewIndex == 1)
        {
            if (viewviewSignature.CurrentMode == FormViewMode.Insert)
            {

                LicenseApplication app = new LicenseApplication();

                //Guid LicenseApplicationId = (Guid)fvfranklinDetail.DataKey["LicenseApplicationId"];

                Guid LicenseApplicationId = (Guid)gvRenewVendor.SelectedDataKey.Value;

                if (ViewState["SpicemenDetails"] == null)


                    ViewState["SpicemenDetails"] = app.GetSpicemendetailsByLicenseId(LicenseApplicationId);

                GridView grd = ((GridView)viewviewSignature.FindControl("gvSignatureDetails"));
                grd.DataSource = (DataTable)ViewState["SpicemenDetails"];
                GridView grdCurent = ((GridView)viewviewSignature.FindControl("gvCurrentAuthoritySignatry"));
                grdCurent.DataSource = (DataTable)ViewState["SpicemenDetails"];
                grd.DataBind();
                grdCurent.DataBind();
            }
        }
    }
    protected void viewviewSignature_Load(object sender, EventArgs e)
    {

        
    }
    protected void gvSignatureDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
    }

    protected void gvSignatureDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mvSpicemenSig.ActiveViewIndex == 1)
        {
            DataTable dtSpicemenDetails = (DataTable)ViewState["SpicemenDetails"];
            TextBox txtFullname = ((TextBox)viewviewSignature.FindControl("txtLeaveToIns"));
            TextBox txtDesignation = ((TextBox)viewviewSignature.FindControl("txtDesignation"));
            GridView gvSignatureDetails = ((GridView)viewviewSignature.FindControl("gvSignatureDetails"));
            //GridView gvSignatureDetails = (GridView)sender;


            //object[] keys = new object[gvSignatureDetails.SelectedDataKey.Values.Count];
            //for (int i = 0; i < keys.Length; i++)
            //{
            //    keys[i] = gvSignatureDetails.SelectedDataKey.Values[i];
            //}
            DataRow dr = dtSpicemenDetails.Rows.Find(gvSignatureDetails.SelectedDataKey.Values);
            if (null != dr)
            {

                txtFullname.Text = Convert.ToString(dr["FullName"]);
                txtDesignation.Text = Convert.ToString(dr["Designation"]);
            }

        }
    }
}
