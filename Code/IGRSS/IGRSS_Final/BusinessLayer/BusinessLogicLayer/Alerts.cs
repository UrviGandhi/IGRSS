using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using AlertsDataTable = IGRSS.DataAccessLayer.WorkflowSupprot.AlertsDataTable;
using AlertsRow=IGRSS.DataAccessLayer.WorkflowSupprot.AlertsRow;
using System.Xml.Serialization;
using System.IO;
using System.Xml;
using IGRSS.Workflows.Common;

namespace IGRSS.BusinessLogicLayer
{
	public class Alerts
	{
		public List<IgrssAlert> GetAlertsByUserId(string username)
		{
			List<IgrssAlert> RetAlerts = new List<IgrssAlert>();
			foreach (AlertsRow row in IgrssAdapters.Alerts.GetAletsForUser(username))
			{
				RetAlerts.Add(DecodeAlert(row));
			}
			return RetAlerts;
		}

		IgrssAlert DecodeAlert(AlertsRow row)
		{
			IgrssAlert alert = new IgrssAlert();
			alert.AlertId = row.AlertId;
			alert.Message = row.Message;
			alert.IsActive = row.IsActive;
			alert.SentAt = row.SentAt;
			alert.SentBy = row.SentBy;
			alert.SentTo = row.SentTo;
			alert.Link = row.Link;
			XmlDocument doc = new XmlDocument();
			doc.LoadXml(row.Info);
			alert.SessionData = WorkflowSupport.DeSerilizeDictionary(doc);

			return alert;
		}

		public IgrssAlert GetAlertById(Guid AlertId)
		{
			IgrssAlert RetAlert = null;
			AlertsDataTable dt = IgrssAdapters.Alerts.GetAlertsById(AlertId);
			if (dt.Rows.Count > 0)
			{
				RetAlert = DecodeAlert((AlertsRow) dt.Rows[0]);
			}
			//TODO: Get the alert from database
			return RetAlert;
		}

		public Dictionary<string, object> GetSessionData(XmlNode node)
		{
			Dictionary<string, object> RetData = new Dictionary<string, object>();
			XmlSerializer serLicenseId = new XmlSerializer(typeof(Guid), new XmlRootAttribute("LicenseId"));
			XmlSerializer serLicenseFileNo = new XmlSerializer(typeof(string), new XmlRootAttribute("LicenseFileNo"));
			string str = SerAlert();
			
			foreach (XmlNode item in node.ChildNodes)
			{
				MemoryStream ms = new MemoryStream();
				StreamWriter writer = new StreamWriter(ms);
				writer.WriteLine(item.OuterXml);
				ms.Position = 0;
				RetData.Add(item.Name, serLicenseId.Deserialize(ms));
			}
			return new Dictionary<string, object>();
		}

		public string SerAlert()
		{
			XmlSerializer serLicenseId = new XmlSerializer(typeof(Guid), new XmlRootAttribute("LicenseId"));
			XmlSerializer serLicenseFileNo = new XmlSerializer(typeof(string), new XmlRootAttribute("LicenseFileNo"));

			MemoryStream msLicenseId = new MemoryStream();
			MemoryStream msLicenseFileNo = new MemoryStream();

			//StreamWriter swLicenseId = new StreamWriter(msLicenseId);
			//StreamWriter swLicenseFileNo = new StreamWriter(msLicenseFileNo);

			//swLicenseId.WriteLine(Guid.NewGuid());
			//swLicenseFileNo.WriteLine("This is a test FileNo");

			//msLicenseId.Position = 0;
			//msLicenseFileNo.Position = 0;

			serLicenseId.Serialize(msLicenseId, Guid.NewGuid());
			serLicenseFileNo.Serialize(msLicenseFileNo, "This is a test FileNo");

			String ret = "";
			msLicenseId.Position = 0;
			msLicenseFileNo.Position = 0;

			StreamReader srLicenseId = new StreamReader(msLicenseId);
			StreamReader srLicenseFileNo = new StreamReader(msLicenseFileNo);
			
			srLicenseId.ReadLine();
			srLicenseFileNo.ReadLine();

			ret += srLicenseId.ReadToEnd();
			ret += srLicenseFileNo.ReadToEnd();
			
			return ret;
		}
	}
}
