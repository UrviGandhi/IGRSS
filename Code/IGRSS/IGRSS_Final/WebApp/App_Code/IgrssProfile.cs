using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Profile;
using System.Xml;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Collections.ObjectModel;
using System.Collections;
using System.Runtime.Serialization;
using System.Text;

[Serializable]
public class Permissions
{
	private Dictionary<string, Dictionary<string, Dictionary<Guid, string>>> m_OfficeRoles;
	public Dictionary<string, Dictionary<string, Dictionary<Guid, string>>> OfficeRoles
	{
		get
		{
			if (m_OfficeRoles == null)
			{
				m_OfficeRoles = new Dictionary<string, Dictionary<string, Dictionary<Guid, string>>>();
			}
			return m_OfficeRoles;
		}
		set
		{
			m_OfficeRoles = value;
		}
	}

	private string m_MenuItems;
	public string MenuItems
	{
		get
		{
			if ((m_MenuItems == string.Empty) || (m_MenuItems == null))
			{
				m_MenuItems = "<IgrssSite />";
			}
			return m_MenuItems;
		}
		set
		{
			m_MenuItems = value;
		}
	}

	private string m_MenuFilter;
	public string MenuFilter
	{
		get
		{
			return m_MenuFilter;
		}
		set
		{
			m_MenuFilter = value;
		}
	}

	public Permissions()
	{
	}

    public void FillOffices(ListControl ctrl, string module, string mode)
    {
        if ((null != ctrl) && (null != mode))
        {
            try
            {
                foreach (KeyValuePair<Guid, string> item in OfficeRoles[module][mode])
                {
                    ctrl.Items.Add(new ListItem(item.Value, item.Key.ToString()));
                }
            }
            catch (KeyNotFoundException ex)
            {
                ctrl.Items.Add(new ListItem(Guid.Empty.ToString(), "NONE"));
            }
        }
    }

	public string GetOffices(string module, string mode)
	{
		Converter<Guid, string> stringConverter = new Converter<Guid, string>(delegate(Guid id)
		{
			return id.ToString();
		});
		StringBuilder Offices = new StringBuilder();
		string seperator = ", ";
		foreach (KeyValuePair<Guid, string> item in OfficeRoles[module][mode])
		{
			Offices.Append(stringConverter(item.Key) + seperator);
		}
		Offices.Remove(Offices.Length - seperator.Length, seperator.Length);
		return Offices.ToString();
	}

	//[Serializable]
	//public enum Modes
	//{
	//    DataEntry,
	//    Verifier,
	//    Approver,
	//    ReadOnly
	//}

	//public static Modes GetMode(string Mode)
	//{
	//    Modes returnMode = new Modes();
	//    switch (Mode)
	//    {
	//        case "DataEntry":
	//            returnMode = Modes.DataEntry;
	//            break;
	//        case "Verify":
	//            returnMode = Modes.Verifier;
	//            break;
	//        case "Approve":
	//            returnMode = Modes.Approver;
	//            break;
	//        case "ReadOnly":
	//            returnMode = Modes.ReadOnly;
	//            break;
	//        default:
	//            break;
	//    }
	//    return returnMode;
	//}
}
