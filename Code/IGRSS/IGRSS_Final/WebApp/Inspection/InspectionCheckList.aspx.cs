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
using System.Xml;
using System.Collections.Specialized;
using IGRSS.BusinessObjects;

public partial class InspectionCheckList : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void FormView1_DataBinding(object sender, EventArgs e)
    {
    }
    protected void FormView1_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            FormView fv = (FormView)sender;

            if (fv.Controls.Count < 2)
            {
                Table tbl = new Table();
                DataRowView drv = (DataRowView)fv.DataItem;

                string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";

                XmlDocument doc = new XmlDocument();
                doc.Load(filename);

                foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
                {
                    TableRow tr = new TableRow();
                    string filter = "/";
                    for (int i = 0; i <= Node.SelectNodes(filter).Count; i++)
                    {
                        TableCell td = new TableCell();

                        Label lbl = new Label();
                        lbl.ID = "lbl" + Node.ChildNodes[i].Name;
                        lbl.Text = Node.ChildNodes[i].Name;
                        lbl.Visible = true;
                        //td.Controls.Add(lbl);
                        //tr.Cells.Add(td);
                        fv.Controls.Add(lbl);
                    }
                    TextBox txt = new TextBox();
                    CheckBox chk = new CheckBox();

                    TableCell t1 = new TableCell();
                    TableCell t2 = new TableCell();

                    chk.ID = "chk" + Node.Attributes["ItemId"].Value;
                    txt.ID = "txt" + Node.Attributes["ItemId"].Value;
                    txt.Visible = true;
                    //tr.Cells.Add(t1);
                    //tbl.Rows.Add(tr);
                    fv.Controls.Add(txt);
                    fv.Controls.Add(chk);


                }
                tbl.BorderWidth = 2;

                fv.Controls.Add(tbl);
                //DataRow row = dtxml.NewRow();
                //for (int i = 0; i < dtxml.Columns.Count; i++)
                //{
                //    if (dtxml.Columns[i].DataType == typeof(bool))
                //    {
                //        row[i] = true;
                //    }
                //    if (dtxml.Columns[i].DataType == typeof(string))
                //    {
                //        row[i] = Guid.NewGuid().ToString();
                //    }
                //}
                //dtxml.Rows.Add(row);
            }
            Button btn = new Button();

            btn.ID = "btnInsert";
            btn.Text = "Insert";
            btn.CommandName = "Insert";
            //btn.OnClientClick = FormView1_ItemInserting(object sender, FormViewInsertEventArgs e);
            fv.Controls.Add(btn);
        }
    }
    protected void FormView1_ItemCreated(object sender, EventArgs e)
    {

    }
    protected void FormView1_PreRender(object sender, EventArgs e)
    {

    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        FormView fv = (FormView)sender;


    }
    protected void TextBox1_DataBinding(object sender, EventArgs e)
    {
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {

    }
    protected void ItemInserting(object sender, FormViewInsertEventArgs e)
    {

    }
    protected void FormView1_ItemInserting1(object sender, FormViewInsertEventArgs e)
    {
        FormView fv = (FormView)sender;
        string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";
        OrderedDictionary coll = new OrderedDictionary();

        XmlDocument doc = new XmlDocument();
        doc.Load(filename);

        foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
        {
            TextBox txt = (TextBox)fv.FindControl("txt" + Node.Attributes["ItemId"].InnerText);



            CheckBox chk = (CheckBox)fv.FindControl("chk" + Node.Attributes["ItemId"].Value);

            coll.Add(txt.ID, txt.Text);
            coll.Add(chk.ID, chk.Checked);


        }
        e.Values.Add("Values", coll);


    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }
    protected void odsInspectionCheckList_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");


    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        FormView fv = (FormView)sender;
        string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";
        OrderedDictionary coll = new OrderedDictionary();

        XmlDocument doc = new XmlDocument();
        doc.Load(filename);

        foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
        {
            TextBox txt = (TextBox)fv.FindControl("txt" + Node.Attributes["ItemId"].Value);

            CheckBox chk = (CheckBox)fv.FindControl("chk" + Node.Attributes["ItemId"].Value);
            coll.Add(txt.ID, txt.Text);
            coll.Add(chk.ID, chk.Checked);
        }

        e.NewValues.Add("Values", coll);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";
        OrderedDictionary coll = new OrderedDictionary();
        XmlDocument doc = new XmlDocument();
        doc.Load(filename);

        foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
        {
            string txt = (string)("txt" + Node.Attributes["ItemId"].Value);

            ////CheckBox chk = (CheckBox)("chk" + Node.Attributes["ItemId"].Value);
            //coll.Add(txt.ID, txt.Text);
            //coll.Add(chk.ID, chk.Checked);
        }
    }
    protected void gvAllInspections_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (gvAllInspections.SelectedIndex != -1)
        {
            mvInspectionDetails.SetActiveView(mvInspectionDetails.Views[1]);
        }
    }
}