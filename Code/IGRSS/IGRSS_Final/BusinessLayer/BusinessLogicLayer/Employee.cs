 //Employee
//ClassName     - Employee
//Purpose       - This business class contains functions for Saving new employee information,updating employee information and so on. 
//Author        : Pradeep Sahoo
//Creation Date : 
//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using IGRSS.BusinessObjects;
using System.Web;
using System.Web.SessionState;
using IGRSS.DataAccessLayer;
using System.Data;
using DesignationMasterTable= IGRSS.DataAccessLayer.Employee.DesignationMasterDataTable;
using DepartmentMasterTable = IGRSS.DataAccessLayer.Employee.DepartmentMasterDataTable;
using QualificationMasterTable = IGRSS.DataAccessLayer.Employee.QualificationMasterDataTable;
using EmployeeQualificationsTable = IGRSS.DataAccessLayer.Employee.EmployeeQualificationsDataTable;
using EmployeeMasterTable = IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable;
using EmployeeMasterRow = IGRSS.DataAccessLayer.Employee.EmployeeMasterRow;
using EmployeeQualificationsRow = IGRSS.DataAccessLayer.Employee.EmployeeQualificationsRow;
using QualificationRow=IGRSS.DataAccessLayer.Employee.QualificationMasterRow;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;


namespace IGRSS.BusinessLogicLayer
{
	[DataObject]
	public class Employee
	{
		
        /// <summary>
		/// This Will return EmployeeMaster row of the EmployeeMaster Table.
		/// </summary>
		/// <returns>EmployeeMasterRow(Contains all the columns of the Employee Master table.</returns>
		public static EmployeeMasterRow GetRow()
		{
			return new EmployeeMasterTable().NewEmployeeMasterRow();
		}
		/// <summary>
		/// This Will return Employee Qualification row of the Qualification Table.
		/// </summary>
		/// <returns>QualificationsRow(Contains all the columns of the Qualifications table.</returns>
        public static QualificationRow GetQualificationRow()
        {

            return new QualificationMasterTable().NewQualificationMasterRow();
        }

		public static IGRSS.DataAccessLayer.Employee.DepartmentMasterRow GetDepartmentMasterRow()
		{
			return new DepartmentMasterTable().NewDepartmentMasterRow();
		}


		public static IGRSS.DataAccessLayer.Employee.DesignationMasterRow GetDesignationRow()
		{
			return new DesignationMasterTable().NewDesignationMasterRow();
		}



		/// <summary>
		/// This function will return all the records of the DesignationMaster table.
		/// </summary>
		/// <returns>DesignationMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public DesignationMasterTable GetDesignationMasterDetails()
		{
			DesignationMasterTable Destable = new DesignationMasterTable();
			try
			{
                Destable = IgrssAdapters.DesignationMaster.GetDesignationMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Destable;

		}
		/// <summary>
		/// Getting the Designation Master details by Designationid
		/// </summary>
		/// <param name="DesignationID">DesignationID</param>
		/// <returns>DesignationMaster Table</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public DesignationMasterTable GetDesignationMasterDetailsById(Guid DesignationID)
		{
			DesignationMasterTable Destable = new DesignationMasterTable();
			try
			{
				Destable = IgrssAdapters.DesignationMaster.GetDesignationMasterById(DesignationID);

			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Destable;

		}
		

		/// <summary>
		/// This function will add new Designation into the DesignationMaster table.
		/// </summary>
		/// <param name="DesignationId">new Guid</param>
		/// <param name="Name">Name of the designation(i.e...Developer,Tester)</param>
		/// <param name="Description">Description</param>
		/// <param name="CreatedBy">User Name</param>
		/// <param name="CreatedAt">Current Time</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert)]
		public bool InsertDesignationMaster(Guid DesignationId, string Name, string Description, string CreatedBy, DateTime CreatedAt)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int i=IgrssAdapters.DesignationMaster.InsertQuery(Guid.NewGuid(), Name, Description, userName, DateTime.Now);
                if (i == 1)
                    return true;
                else
                    return false;
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;
			}
			
		}
		/// <summary>
		/// This function will update the record.
		/// </summary>
		/// <param name="DesignationID">DesignationID, a new Guid</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update)]
		public bool UpdateDesignationMaster(FormViewParameter Parameter, Guid DesignationID)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Employee.DesignationMasterRow row = (IGRSS.DataAccessLayer.Employee.DesignationMasterRow) Parameter.Values;
            try
            {
                int i=IgrssAdapters.DesignationMaster.UpdateDesignationMaster(DesignationID, row.Name, row.Description, UserName, DateTime.Now);
                if (i == 1)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete)]
		public bool DeleteDesignationMaster(Guid DesignationID)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;
			IgrssAdapters.DesignationMaster.DeleteDesignationMaster(UserName, DateTime.Now,DesignationID);
			
			return true;
            

		}

		/// <summary>
		/// This function will return all the record of the DepartmentMaster table.
		/// </summary>
		/// <returns>DepartmentMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public DepartmentMasterTable GetDepartmentMasterDetails()
		{

			return IgrssAdapters.DepartmentMaster.GetDepartmentMaster();

		}

		/// <summary>
		/// Get DepartmentMaster Records by Passing Department Id
		/// </summary>
		/// <param name="DepartmentId"></param>
		/// <returns>Department Master Data Table</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public DepartmentMasterTable GetDepartmentMasterDetailsByDepartmentId(Guid DepartmentId)
		{

			return IgrssAdapters.DepartmentMaster.GetDepartmentMasterByDepartmentId(DepartmentId);

		}



		/// <summary>
		/// This will add new department into the DepartmentMaster table.
		/// </summary>
		/// <param name="DepartmentId">new Guid</param>
		/// <param name="Name">Name of the Department(i.e,Valuation,Adjudication..etc)</param>
		/// <param name="Description">Description</param>
		/// <param name="CreatedBy">Current User Name</param>
		/// <param name="CreatedAt">Current Time</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert)]

		public bool InsertDepartmentMaster(Guid DepartmentId, string Name, string Description, string CreatedBy, DateTime CreatedAt)
		{
            string userName = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                int i=IgrssAdapters.DepartmentMaster.InsertDepartmentMaster(Guid.NewGuid(), Name, Description, userName, DateTime.Now);
                if (i == 1)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
		}
		/// <summary>
		/// This function wil update the Department details.
		/// </summary>
		/// <param name="DepartmentId">DepartmentId</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update)]
		public bool UpdateDepartmentMaster(FormViewParameter Parameter, Guid DepartmentId)
		{
			string UserName = Thread.CurrentPrincipal.Identity.Name;
			IGRSS.DataAccessLayer.Employee.DepartmentMasterRow row = (IGRSS.DataAccessLayer.Employee.DepartmentMasterRow) Parameter.Values;
            try
            {
                int i=IgrssAdapters.DepartmentMaster.UpdateDepartmentMaster(DepartmentId, row.Name, row.Description, UserName, DateTime.Now);
                if (i == 1)
                    return true;
                else
                    return false;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }
		}

        [DataObjectMethodAttribute(DataObjectMethodType.Delete)]
        public bool DeleteDepartmentMaster(Guid DepartmentId)
        {
            string UserName = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.DepartmentMaster.DeleteDepartMentMaster(UserName, DateTime.Now, DepartmentId);
		    return true;
        }

		#region Qualification Master
		/// <summary>
		/// Returns all the records of the QualificationMaster table. 
		/// </summary>
		/// <returns>QualificationMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

		public QualificationMasterTable GetQualificationMasterDetails()
		{
			QualificationMasterTable QuaTable = new QualificationMasterTable();
			try
			{
				QuaTable=IgrssAdapters.QualificationMaster.GetQualificationMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return QuaTable;
		}
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, true)]

        public bool DeleteQualificationMaster(Guid QualificationID)
        {
            string userName = Thread.CurrentPrincipal.Identity.Name;
            IgrssAdapters.QualificationMaster.DeleteQualificationMaster(userName, DateTime.Now, QualificationID);
            return true;

           
        }


		/// <summary>
		/// This Function Gets all the records from QualificationMaster Table based upon the QualificationId
		/// </summary>
		/// <param name="QualificationID">Primary key of QualificationMaster Table</param>
		/// <returns>QualificationMasterTable</returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public QualificationMasterTable GetQualificationMasterDetailsById(Guid QualificationID)
		{
			QualificationMasterTable QuaTable = new QualificationMasterTable();
			try
			{
				QuaTable = IgrssAdapters.QualificationMaster.GetQualificationDetailsById(QualificationID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return QuaTable;
		}




		/// <summary>
		/// This function wiii insert new Qualification into QualificationMaster table.
		/// </summary>
		/// <param name="QualificationID">new Guid</param>
		/// <param name="Name">Name of the Qualification(i.e..Mca,BE)</param>
		/// <param name="Description">Description</param>
		/// <param name="CreatedBy">Current User</param>
		/// <param name="CreatedAt">Current Time</param>
		/// <returns>true</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
		public bool InsertQualificationMaster(FormViewParameter Parameter)
		{


			IGRSS.DataAccessLayer.Employee.QualificationMasterRow row = (IGRSS.DataAccessLayer.Employee.QualificationMasterRow) Parameter.Values;

             
			string userName = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int i=IgrssAdapters.QualificationMaster.InsertQualificationMaster(Guid.NewGuid(), row.Name, row.Description, userName, DateTime.Now);

                if (i == 1)
                    return true;
                else
                    return false;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

		}
		/// <summary>
		/// This function will update the Qualification Table. 
		/// </summary>
		/// <param name="QualificationID">QualificationID</param>
		/// <param name="Name">Name</param>
		/// <param name="Description">Description</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>true</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

		public bool UpdateQualificationMaster(FormViewParameter Parameter, Guid QualificationID)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;

			IGRSS.DataAccessLayer.Employee.QualificationMasterRow  row = (IGRSS.DataAccessLayer.Employee.QualificationMasterRow) Parameter.Values;
            try
            {
			int i=IgrssAdapters.QualificationMaster.UpdateQualificationMaster(QualificationID, row.Name, row.Description, userName, DateTime.Now);
            if (i == 1)
                return true;
            else
                return false;

        }
        catch (Exception ex)
        {
            if (ExceptionPolicy.HandleException(ex, "DAL"))
                throw;
            return false;
        }
			
		}
		#endregion
		
		/// <summary>
		/// This function will return all the qualification of the Employee.
		/// </summary>
		/// <returns>EmployeeQualificationsTable</returns>
		public EmployeeQualificationsTable GetEmployeeQualificationDetails()
		{
			EmployeeQualificationsTable Dt = new EmployeeQualificationsTable();
			try
			{
				Dt=IgrssAdapters.EmployeeQualifications.GetEmployeeQualification();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return Dt;
		}

	
		/// <summary>
		/// This function will insert the qualification details of the Employee.
		/// </summary>
		/// <param name="EmployeeQualiID">The primary key</param>
		/// <param name="EmployeeID">EmployeeID</param>
		/// <param name="QualificationID">QualificationID</param>
		/// <param name="Details">Details</param>
		/// <param name="CreatedBy">CreatedBy, current user </param>
		/// <param name="CreatedAt">CreatedAt,time</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert)]
		public bool InsertEmployeeQualification(Guid EmployeeQualiID, Guid EmployeeID, Guid QualificationID, string Details, string CreatedBy, DateTime CreatedAt)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				int i=IgrssAdapters.EmployeeQualifications.InsertEmployeeQualification(EmployeeQualiID, EmployeeID, QualificationID, Details, userName, DateTime.Now);

                if (i == 1)
                    return true;
                else
                    return false;

            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
                return false;
            }

		}
		/// <summary>
		/// This function will update the qualification details of the employee.
		/// </summary>
		/// <param name="EmployeeQualiID">EmployeeQualiID</param>
		/// <param name="EmployeeID">EmployeeID</param>
		/// <param name="QualificationID">QualificationID</param>
		/// <param name="Details">Details</param>
		/// <param name="ModifiedBy">ModifiedBy</param>
		/// <param name="ModifiedAt">ModifiedAt</param>
		/// <returns>true</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update)]
		public bool UpdateEmployeeQualification(Guid EmployeeQualiID, Guid EmployeeID, Guid QualificationID, string Details, string ModifiedBy, DateTime ModifiedAt)
		{
			string userName = Thread.CurrentPrincipal.Identity.Name;
			try
			{
				IgrssAdapters.EmployeeQualifications.UpdateEmployeeQualification(EmployeeQualiID, EmployeeID, QualificationID, Details, ModifiedBy, ModifiedAt);
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return true;
		}
		/// <summary>
		/// This function will delete the qualification details of the employee.
		/// </summary>
		/// <param name="EmployeeQualiID">EmployeeQualiID</param>
		/// <returns>true</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Delete)]
		public bool DeleteEmployeeQualification(Guid EmployeeQualiID)
		{
			try
			{
				IgrssAdapters.EmployeeQualifications.DeleteEmployeeQualification(EmployeeQualiID);
                return true;
				
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
                return false;
			}
		
		}

		/// <summary>
		/// Get the Employee Qualification by passing Employee Id
		/// </summary>
		/// <param name="EmployeeID"></param>
		/// <returns>EmployeeQualificationsTable</returns>

		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public EmployeeQualificationsTable SelectEmpQualificationById(Guid EmployeeID)
		{
			EmployeeQualificationsTable EmpQual = new EmployeeQualificationsTable();
			try
			{
				EmpQual=IgrssAdapters.EmployeeQualifications.SelectEmpQualificationByID(EmployeeID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return EmpQual;

		}

		/// <summary>
		/// Getting the EmployeeMasterTable details by passing employeeId
		/// </summary>
		/// <param name="EmployeeID">EmployeeID</param>
		/// <returns>EmployeeMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public EmployeeMasterTable GetEmployeeDetailsById(Guid EmployeeID)
		{
			EmployeeMasterTable EmpMasterDt = new EmployeeMasterTable();
			try
			{
				EmpMasterDt=IgrssAdapters.EmployeeMaster.SelectEmployeeDetailsByID(EmployeeID);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return EmpMasterDt;
		}

		/// <summary>
		/// This function will returns the Employee information.
		/// </summary>
		/// <param name="EmployeeNo">EmployeeNo of the Employee to be details needed</param>
		/// <returns>EmployeeMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public EmployeeMasterTable GetEmployeeDetailsByEmpNo(string EmployeeNo)
		{
			EmployeeMasterTable EmpMaster = new EmployeeMasterTable();
			try
			{
				EmpMaster=IgrssAdapters.EmployeeMaster.SelectEmployeeDetailsByEmpNo(EmployeeNo);
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return EmpMaster;
		}
		/// <summary>
		/// This function will return all Employee Details.
		/// </summary>
		/// <returns>EmployeeMasterTable</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Select)]
		public EmployeeMasterTable GetEmployeeDetails()
		{
			EmployeeMasterTable EmpMaster = new EmployeeMasterTable();
			try
			{
				EmpMaster=IgrssAdapters.EmployeeMaster.GetEmployeeMaster();
			}
			catch (Exception ex)
			{
				if (ExceptionPolicy.HandleException(ex, "DAL"))
					throw;
			}
			return EmpMaster;

		}
		/// <summary>
		/// This will insetrt new Employee details.
		/// </summary>
		/// <param name="Parameter">formview Parameter</param>
		/// <param name="dtQualification">Contains all the columns value for the Qualification Table</param>
		/// <returns>bool</returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Insert)]

		public bool AddNewEmployeeMaster(FormViewParameter Parameter, DataTable dtQualification)
		{
			IGRSS.DataAccessLayer.Employee.EmployeeMasterRow row = (IGRSS.DataAccessLayer.Employee.EmployeeMasterRow) Parameter.Values;
			DataTable dt = IgrssAdapters.EmployeeMaster.SelectEmployeeDetailsByEmpNo(row.EmployeeNo);
			if (dt.Rows.Count==0)
			{
				Guid EmployeeId = Guid.NewGuid();
				string curUser = Thread.CurrentPrincipal.Identity.Name;
				try
				{
                    IgrssAdapters.EmployeeMaster.InsertEmployeeMaster(EmployeeId,
								row.EmployeeNo,
								row.FirstName,
								row.MiddleName,
								
								row.PostalAddress,
								row.PermanentAddress,
								row.DateOfBirth,
								row.FatherName,
								row.Height,
								row.VisibleMarks,
								row.OfficeID,
								row.DepartmentID,
								row.DesignationID,
								row.Salary,
								row.Allowances,
								row.StartDate,

								curUser,
								DateTime.Now);



					foreach (DataRow drQualifications in dtQualification.Rows)
					{

						IgrssAdapters.EmployeeQualifications.InsertEmployeeQualification(Guid.NewGuid(), EmployeeId, (Guid) drQualifications["QualificationID"], (string) drQualifications["Details"], curUser, DateTime.Now);
					}

				}

				catch (Exception ex)
				{
					if (ExceptionPolicy.HandleException(ex, "DAL"))
						throw;
				}
				return true;
			}
			else
				return false;
        }
		/// <summary>
		/// This function will update the Employee Information.
		/// </summary>
		/// <param name="EmployeeID">Identifying a Employee</param>
		/// <param name="Parameters">formview parameter</param>
		/// <param name="QualificationDetails">Datatable object , in which all the qualification  details will be added</param>
		/// <returns>true, whether a record is updated or not </returns>
		[DataObjectMethodAttribute(DataObjectMethodType.Update)]
	    public bool UpdateEmployeeMaster(Guid EmployeeID, FormViewParameter Parameters, DataTable QualificationDetails)
	    {
	        string curUser = Thread.CurrentPrincipal.Identity.Name;
	        try
	        {
	            IGRSS.DataAccessLayer.Employee.EmployeeMasterRow row = (IGRSS.DataAccessLayer.Employee.EmployeeMasterRow) Parameters.Values;
	            IgrssAdapters.EmployeeMaster.UpdateEmployeeMaster(EmployeeID,

	                    row.EmployeeNo,
	                    row.FirstName,
	                    row.MiddleName,
	                  
	                    row.PostalAddress,
	                    row.PermanentAddress,
	                    row.DateOfBirth,
	                    row.FatherName,
	                    row.Height,
	                    row.VisibleMarks,
	                    row.OfficeID,
	                    row.DepartmentID,
	                    row.DesignationID,
	                    row.Salary,
	                    row.Allowances,
	                    row.StartDate,
	                    row.EndDate,
	                    curUser,
	                    DateTime.Now);

	            IgrssAdapters.EmployeeQualifications.DeleteEmployeeQualification(EmployeeID);
	            foreach (DataRow drQualifications in QualificationDetails.Rows)
	            {
	                IgrssAdapters.EmployeeQualifications.InsertEmployeeQualification((Guid) drQualifications["EmployeeQualiID"], EmployeeID, (Guid) drQualifications["QualificationID"], "", curUser, DateTime.Now);
	            }
	          
	        }
	        catch (Exception ex)
	        {
	            if (ExceptionPolicy.HandleException(ex, "DAL"))
	                throw;
	        }
			return true;
	    }


	}


}