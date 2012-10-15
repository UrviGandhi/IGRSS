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
using IGRSS.BusinessObjects;
using System.Collections.Specialized;
using IGRSS.BusinessLogicLayer;
using System.Collections.Generic;

using CheckListInspectionTable = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionDataTable;
using CheckListInspectionRow = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionRow;
public partial class Inspection_TestCheckList : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
		string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";

		XmlDocument doc = new XmlDocument();
		doc.Load(filename);

		Control ctrl = Master.FindControl("Main");

		Table tbl = new Table();
		tbl.ID = "tblMain";
		tbl.BorderWidth = 2;
		foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
		{
			//ContentPlaceHolder ctplace = new ContentPlaceHolder();

			TableRow tr = new TableRow();
			tr.ID = Node.Attributes["ItemId"].Value;
			TableCell tdSlNo = new TableCell();
			TableCell tdDesc = new TableCell();
			TableCell tdItem = new TableCell();

			Label lblSlNo = new Label();
			Label lblDesc = new Label();

			tdItem.ID = "itm" + Node.Attributes["SlNo"].Value;

			//lblDesc.ID = "lbl" + Node.Attributes["Description"].Value;
			lblSlNo.Text = Node.Attributes["SlNo"].Value;
			lblDesc.Text = Node.InnerText;

			tdSlNo.Controls.Add(lblSlNo);
			tdDesc.Controls.Add(lblDesc);

			TextBox txtRem = new TextBox();
			CheckBox chkRem = new CheckBox();

			txtRem.ID = "txt" + Node.Attributes["ItemId"].Value;
			chkRem.ID = "chk" + Node.Attributes["ItemId"].Value;

			switch (Node.Attributes["Type"].Value)
			{
				case "1":
					tdItem.Controls.Add(txtRem);
					break;
				case "2":
					tdItem.Controls.Add(chkRem);
					break;
				case "3":
					tdItem.Controls.Add(txtRem);
					tdItem.Controls.Add(chkRem);
					break;
				default:
					break;
			}

			#region Comment
			//foreach (XmlNode SubNode in Node)
			//{
			//    TableCell td = new TableCell();

			//    Label lbl = new Label();
			//    lbl.ID = "lbl" + SubNode.Name;
			//    lbl.Text = SubNode.InnerText + " ";
			//    lbl.Visible = true;
			//    //td.Controls.Add(lbl);
			//    //tr.Cells.Add(td);
			//    ctrl.Controls.Add(lbl);
			//}
			//TextBox txt = new TextBox();
			//CheckBox chk = new CheckBox();

			//TableCell t1 = new TableCell();
			//TableCell t2 = new TableCell();

			//chk.ID = "chk" + Node.Attributes["ItemId"].Value;
			//txt.ID = "txt" + Node.Attributes["ItemId"].Value;
			//txt.Visible = true;

			#endregion			tr.Cells.Add(t1);

			tr.Cells.Add(tdSlNo);
			tr.Cells.Add(tdDesc);
			tr.Cells.Add(tdItem);

			tbl.Rows.Add(tr);

			ctrl.Controls.Add(tbl);
		}

	}
	protected void btnSetControls_Click(object sender, EventArgs e)
	{
		Control ctrl = Master.FindControl("Main");
		List<CheckListInspectionRow> objdict = new List<CheckListInspectionRow>();
		DetailsList bll = new DetailsList();
		

		string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";

		XmlDocument doc = new XmlDocument();
		doc.Load(filename);

		foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
		{
			//CheckListInspectionRow row = InspectionCheckList.GetCheckListRow();
			CheckListInspectionRow row = DetailsList.GetCheckListRow();


			string Remarks = string.Empty;
			bool Checked = false;

			TextBox txt = (TextBox) ctrl.FindControl("txt" + Node.Attributes["ItemId"].Value);
			CheckBox chk = (CheckBox) ctrl.FindControl("chk" + Node.Attributes["ItemId"].Value);

			if (null != txt)
				Remarks = txt.Text;

			if (null != chk)
				Checked = chk.Checked;

			row.InspectionCheckListId = new Guid(Node.Attributes["ItemId"].Value);
			row.Remarks = Remarks;
			row.Checked = Checked;

			objdict.Add(row);
		}

		bll.Insert(objdict);
	}

	protected void odsInspectionCheckList_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");


	}


	protected void Button1_Click(object sender, EventArgs e)
	{

	}
	protected void btnSave_Click(object sender, EventArgs e)
	{
		Inspection ins = new Inspection();



	}
}
