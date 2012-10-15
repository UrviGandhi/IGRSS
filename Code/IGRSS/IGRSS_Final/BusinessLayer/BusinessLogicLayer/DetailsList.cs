using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Xml;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using System.Collections.Specialized;
using System.Web;
using System.Threading;
using System.Collections;
using CheckListInspectionTable = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionDataTable;
using CheckListInspectionDataTable = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionDataTable;
using CheckListInspectionRow = IGRSS.DataAccessLayer.InspectionDetails.CheckListInspectionRow;

namespace IGRSS.BusinessLogicLayer
{
	public class DetailsList
	{
		public static CheckListInspectionRow GetCheckListRow()
		{
			return new CheckListInspectionTable().NewCheckListInspectionRow();
		}


		public DataTable GetXmlData()
		{

			DataTable dtxml = new DataTable();
			string filename = @"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml";
			XmlDocument doc = new XmlDocument();
			doc.Load(filename);

			foreach (XmlNode Node in doc.SelectNodes("DocumentElement/Items"))
			{
				string colName = Node.Attributes["ItemId"].Value;
				dtxml.Columns.Add(colName + "Checked", typeof(bool));
				dtxml.Columns.Add(colName + "Remarks", typeof(string));

			}

			//while (tr.Read())
			//{
			//    if (tr.NodeType == XmlNodeType.Text)
			//    {
			//        dtxml = new DataTable();
			//        dtxml.Columns.Add("ItemId");
			//        dtxml.Columns.Add("SlNo");
			//        dtxml.Columns.Add("Description");
			//        dtxml.Columns.Add("Type");

			//        dtxml["ItemId"] = tr.Value[1];
			//        //dtxml.Columns.Add(tr.Value[2]);
			//        //dtxml.Columns.Add(tr.Value[3]);
			//    }
			//}
			//DataSet dsXml = new DataSet();
			//dsXml.ReadXml(@"E:\Projects\IGRSS\FINAL\WebApp\Inspection\InspectionCheckList.xml");
			//DataTable dt = new DataTable();
			//dt = dsXml.Tables[0];
			////dsXml.Tables[0] = dt;
			DataRow row = dtxml.NewRow();
			for (int i = 0; i < dtxml.Columns.Count; i++)
			{
				if (dtxml.Columns[i].DataType == typeof(bool))
				{
					row[i] = true;
				}
				if (dtxml.Columns[i].DataType == typeof(string))
				{
					row[i] = Guid.NewGuid().ToString();
				}
			}
			dtxml.Rows.Add(row);
			return dtxml;

		}

		public bool Insert(List<CheckListInspectionRow> objdict)
		{
			string curUser = Thread.CurrentPrincipal.Identity.Name;
			//Guid Id = Guid.NewGuid();
			Guid Id = new Guid("a5de868c-45f4-4804-83d1-ba54b556a740");
			//Guid Id = Guid.Empty;
			foreach (CheckListInspectionRow row in objdict)
			{
				IgrssAdapters.InspChecklist.AddInspectionCheckList(Id, row.InspectionCheckListId, row.Checked, row.Remarks, curUser, DateTime.Now);
			}
			return true;
		}

	}
}

