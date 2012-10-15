using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using IGRSS.Properties;
using System.Xml;
using System.Xml.Serialization;
using System.IO;

namespace IGRSS.BusinessObjects
{
	public static class IgrssCommon
	{
		public static object[] GetColumnValues(DataTable dt, string colName)
		{
			ArrayList TempList = new ArrayList();
			try
			{
				for (int i = 0; i < dt.Rows.Count; i++)
				{
					TempList.Add((object) dt.Rows[i][colName]);
				}
			}
			catch (Exception)
			{
				throw;
			}

			return TempList.ToArray();
		}

		public static Guid GetGuid(object objToConvert)
		{
			return (Guid) objToConvert;
		}

		public static void SetConnectionString(string conKey, string conString)
		{
			Settings.Default[conKey] = conString;
		}
	}
}
