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

public partial class FileManagement : System.Web.UI.UserControl
{

	#region Properties

	private Guid m_OfficeId;
	/// <summary>
	/// Stores the OfficeId where teh file exists
	/// </summary>
	public Guid OfficeId
	{
		get
		{
			return m_OfficeId;
		}
		set
		{
			m_OfficeId = value;
		}
	}

	private decimal m_FileSlNo;
	/// <summary>
	/// Stores the File Serial Number where the file exists
	/// </summary>
	public decimal FileSlNo
	{
		get
		{
			return m_FileSlNo;
		}
		set
		{
			m_FileSlNo = value;
		}
	}

	private string m_Department;
	/// <summary>
	/// Stores the Department Name literals where the file exists
	/// </summary>
	public string Department
	{
		get
		{
			return m_Department;
		}
		set
		{
			m_Department = value;
		}
	}

	private decimal m_Year;
	/// <summary>
	/// Stores the Year where the file exists
	/// </summary>
	public decimal Year
	{
		get
		{
			return m_Year;
		}
		set
		{
			m_Year = value;
		}
	}


	private Guid m_FileId;
	/// <summary>
	/// Retrives the File Id of the file to which the remark has to be added
	/// </summary>
    /// IGRSS.BusinessLogicLayer.FileManagement Fm = new IGRSS.BusinessLogicLayer.FileManagement();
	///	return Fm.getFileIdByFileNo(FileSlNo, OfficeId, Department, Year); Commented By Akhil.
	public Guid FileId
	{
		get
		{
            return m_FileId;
		}
		set
		{
			m_FileId = value;
		}
	}

	// TODO: Add properties for FIleSlNo, Dept, Year

	#endregion

	protected void Page_Load(object sender, EventArgs e)
	{

	}


	protected void btnRemark_Click(object sender, EventArgs e)
	{
	}
	protected void fvFileManagement_ItemInserting(object sender, FormViewInsertEventArgs e)
	{
		e.Values.Add("FileId", FileId);
	}
}
