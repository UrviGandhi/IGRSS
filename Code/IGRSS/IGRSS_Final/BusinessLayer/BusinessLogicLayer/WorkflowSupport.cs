using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Xml;
using IGRSS.BusinessObjects;
using System.Data;
using System.Xml.Serialization;
using System.IO;
using UsersInOfficeRolesTable = IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesDataTable;
using UsersInOfficeRolesRow = IGRSS.DataAccessLayer.WorkflowSupprot.UsersInOfficeRolesRow;
using AlertsRow = IGRSS.DataAccessLayer.WorkflowSupprot.AlertsRow;
using AlertsDataTable = IGRSS.DataAccessLayer.WorkflowSupprot.AlertsDataTable;
using IGRSS.BusinessLogicLayer.Administration;

namespace IGRSS.BusinessLogicLayer
{
	public class WorkflowSupport
	{
		public static List<IgrssAlert> GetAlertsForUser(string username)
		{
			List<IgrssAlert> RetAlerts = new List<IgrssAlert>();
			foreach (AlertsRow row in IgrssAdapters.Alerts.GetAletsForUser(username))
			{
				RetAlerts.Add(DecodeAlert(row));
			}
			return RetAlerts;
		}

		protected static IgrssAlert DecodeAlert(AlertsRow row)
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

		public static IgrssAlert GetAlertById(Guid AlertId)
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

		public static Dictionary<string, object> GetSessionData(XmlNode node)
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

		public static string SerAlert()
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

		public static Guid SendAlert(string From, string To, string link, string Message, Dictionary<string, object> InfoList,Guid GroupId)
		{
			XmlDocument Info = new XmlDocument();
			if (InfoList != null)
				Info = SerilizeDictionary(InfoList);
            
            return SendAlert(From, To, link, Message, Info,GroupId);
		}

        public static Guid SendAlert(string From, string To, string link, string Message, XmlDocument Info, Guid GroupId)
		{
			Guid AlertId = Guid.NewGuid();
			IgrssAdapters.Alerts.AddNewAlert(AlertId, Message, DateTime.Now,
                                            To, From, link, true, Info.OuterXml, GroupId);
			return AlertId;
		}

        public static void DeleteAlert(Guid AlertId)
        {
            IgrssAdapters.Alerts.DeleteAlert(AlertId);
        }

        public static void DeleteAlerts(Guid[] AlertIds)
        {
            foreach (Guid AlertId in AlertIds)
            {
                DeleteAlert(AlertId);
            }
        }

        public static void DisableAlert(Guid AlertId)
        {
            IgrssAdapters.Alerts.DisableAlertGroupByAlertId(AlertId);
        }

        public static void DisableAlerts(Guid[] AlertIds)
        {
            foreach (Guid AlertId in AlertIds)
            {
                DisableAlert(AlertId);
            }
        }

        public static void EnableAlert(Guid AlertId)
        {
            IgrssAdapters.Alerts.EnableAlertsByAlertId(AlertId);
        }

		public static string[] GetUserAtOfficeRole(Guid OfficeId, Guid Designation)
		{
			UsersInOfficeRolesTable dt = IgrssAdapters.UsersInOfficeRole.GetUsersInOfficeRoles(OfficeId, Designation);
			
			List<string> RetUsers=new List<string>();
			foreach (UsersInOfficeRolesRow row in dt)
			{
				RetUsers.Add(row.Username);
			}
			return RetUsers.ToArray();
		}

		public static XmlDocument GetProcessForModule(string moduleCode, Guid OfficeId)
		{
			ManageOfficeProcess OfficeProcess = new ManageOfficeProcess();
			return OfficeProcess.GetProcessForModule(moduleCode, OfficeId);
		}

		public static XmlDocument SerilizeDictionary(Dictionary<string, object> info)
		{
			XmlSerializer ser = new XmlSerializer(typeof(object));
			MemoryStream ms = new MemoryStream();
			StreamReader reader = new StreamReader(ms);
			StringBuilder sb = new StringBuilder();
			sb.AppendLine("<AlertInfo>");
			foreach (KeyValuePair<string, object> item in info)
			{
				ms.SetLength(0);
				sb.AppendLine("<" + item.Key + ">");
				ser.Serialize(ms, item.Value);
				ms.Position = 22;
				sb.AppendLine(reader.ReadToEnd());
				sb.AppendLine("</" + item.Key + ">");
			}
			sb.AppendLine("</AlertInfo>");
			string xmlStr = sb.ToString();
			XmlDocument doc = new XmlDocument();
			doc.LoadXml(xmlStr);
			return doc;
		}

		public static Dictionary<string, object> DeSerilizeDictionary(XmlDocument AlertXml)
		{
			XmlSerializer ser = new XmlSerializer(typeof(object));
			Dictionary<string, object> RetDic = new Dictionary<string, object>();
			MemoryStream ms = new MemoryStream();
			StreamWriter sw = new StreamWriter(ms);
			foreach (XmlNode node in AlertXml.ChildNodes[0])
			{
				ms.SetLength(0);
				sw.Write(node.InnerXml);
				sw.Flush();
				ms.Position = 0;
				object obj = ser.Deserialize(ms);
				RetDic.Add(node.Name, obj);
			}
			return RetDic;
		}
	}
}
