﻿// The following code was generated by Microsoft Visual Studio 2005.
// The test owner should check each test for validity.
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Text;
using System.Collections.Generic;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using System.Data;
using IGRSS.DataAccessLayer;
namespace IgrssTest
{
    /// <summary>
    ///This is a test class for IGRSS.BusinessLogicLayer.Employee and is intended
    ///to contain all IGRSS.BusinessLogicLayer.Employee Unit Tests
    ///</summary>
    [TestClass()]
    public class EmployeeTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for AddNewEmployeeMaster (FormViewParameter, DataTable)
        ///</summary>
        [TestMethod()]
        public void AddNewEmployeeMasterTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            FormViewParameter Parameter = new FormViewParameter();
            IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable dt = new  IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable();
            DataRow dr = dt.NewRow();
            dr["EmployeeId"] = new Guid();
            dr["EmployeeNo"] = "234";
            dr["FirstName"] = "PRADEEP";
            dr["MiddleName"] ="sahu";
            dr["LastName"] = "NITHYANAND";
            dr["PostalAddress"] = "SSSSSSSSSSS";
            dr["PermanentAddress"] = "FFFFFFFFF";
            dr["DateOfBirth"] = DateTime.Now;
            dr["FatherName"] = "BANGALORE";
            dr["Height"] = 12;
            dr["VisibleMarks"] = 5;
            dr["OfficeID"] = new Guid("916fd082-061a-45fb-91a4-33967243b4cf");
            dr["DepartmentID"] = new Guid("8971ce62-34a8-4175-9e1f-8d4bcc1721a1");
            dr["DesignationID"] = new Guid("7c83e591-a861-4b4f-bd1d-12f99cc32123");
            dr["Salary"] = 200;
            dr["Allowances"] = 200;
            dr["StartDate"] = DateTime.Now;
            dr["CreatedBy"] = "RAJA";
            dt.Rows.Add(dr);
            Parameter.Values = dt.Rows[0];
            DataTable dtQualification = new DataTable();
            dtQualification.Columns.Add("QualificationID", typeof(Guid));
            dtQualification.Columns.Add("Details", typeof(string));
            DataRow drQualification;
            drQualification = dtQualification.NewRow();
            drQualification["QualificationID"] = new Guid("5e48e449-fb3f-4352-9e11-080c91329566");
            drQualification["Details"] = "gsgssgsgs";
            dtQualification.Rows.Add(drQualification);
            Assert.AreEqual(true, target.AddNewEmployeeMaster(Parameter, dtQualification), "IGRSS.BusinessLogicLayer.Employee.AddNewEmployeeMaster did not return the expecte" +
                    "d value.");
        }

        /// <summary>
        ///A test for DeleteEmployeeQualification (Guid)
        ///</summary>
        [TestMethod()]
        public void DeleteEmployeeQualificationTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Guid EmployeeQualiID = new Guid("306f4565-db8e-4351-ac7d-0599b8f245f1"); // TODO: Initialize to an appropriate value
            Assert.AreEqual(true,target.DeleteEmployeeQualification(EmployeeQualiID), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                    "expected value.");
             
        }

        /// <summary>
        ///A test for GetDepartmentMasterDetails ()
        ///</summary>
        [TestMethod()]
        public void GetDepartmentMasterDetailsTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Assert.IsInstanceOfType(target.GetDepartmentMasterDetails(), typeof(IGRSS.DataAccessLayer.Employee.DepartmentMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                    "expected value.");
        }

        /// <summary>
        ///A test for GetDepartmentMasterDetailsByDepartmentId (Guid)
        ///</summary>
        [TestMethod()]
        public void GetDepartmentMasterDetailsByDepartmentIdTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Guid DepartmentId = new Guid("1ce959b5-27e2-489b-9d9e-3ef09110b66c");
            Assert.IsInstanceOfType(target.GetDepartmentMasterDetails(), typeof(IGRSS.DataAccessLayer.Employee.DepartmentMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                    "expected value.");
        }
        /// <summary>
        ///A test for GetDesignationMasterDetails ()
        ///</summary>
        [TestMethod()]
        public void GetDesignationMasterDetailsTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Assert.IsInstanceOfType(target.GetDesignationMasterDetails(), typeof(IGRSS.DataAccessLayer.Employee.DesignationMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
      
            
        }

        /// <summary>
        ///A test for GetDesignationMasterDetailsById (Guid)
        ///</summary>
        [TestMethod()]
        public void GetDesignationMasterDetailsByIdTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Guid DesignationID = new Guid("3c1c2323-c442-46ec-830c-90229d02ab1c"); // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetDesignationMasterDetails(), typeof(IGRSS.DataAccessLayer.Employee.DesignationMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
           
        }
        /// <summary>
        ///A test for GetEmployeeDetails ()
        ///</summary>
        [TestMethod()]
        public void GetEmployeeDetailsTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Assert.IsInstanceOfType(target.GetEmployeeDetails(), typeof(IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
        }

        /// <summary>
        ///A test for GetEmployeeDetailsByEmpNo (string)
        ///</summary>
        [TestMethod()]
        public void GetEmployeeDetailsByEmpNoTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            string EmployeeNo ="321322"; // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetEmployeeDetailsByEmpNo(EmployeeNo), typeof(IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
           
         }

        /// <summary>
        ///A test for GetEmployeeDetailsById (Guid)
        ///</summary>
        [TestMethod()]
        public void GetEmployeeDetailsByIdTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Guid EmployeeID = new Guid("1947a43e-631b-40d1-9bb4-108659380653"); // TODO: Initialize to an appropriate value
            Assert.IsInstanceOfType(target.GetEmployeeDetailsById(EmployeeID), typeof(IGRSS.DataAccessLayer.Employee.EmployeeMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");

          
        }

        /// <summary>
        ///A test for GetEmployeeQualificationDetails ()
        ///</summary>
        [TestMethod()]
        public void GetEmployeeQualificationDetailsTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Assert.IsInstanceOfType(target.GetEmployeeQualificationDetails(), typeof(IGRSS.DataAccessLayer.Employee.EmployeeQualificationsDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
        }

        /// <summary>
        ///A test for GetQualificationMasterDetails ()
        ///</summary>
        [TestMethod()]
        public void GetQualificationMasterDetailsTest()
        {
            IGRSS.BusinessLogicLayer.Employee target = new IGRSS.BusinessLogicLayer.Employee();
            Assert.IsInstanceOfType(target.GetQualificationMasterDetails(), typeof(IGRSS.DataAccessLayer.Employee.QualificationMasterDataTable), "IGRSS.BusinessLogicLayer.Employee.DeleteEmployeeQualification did not return the " +
                   "expected value.");
        }
        ///// <summary>
        /////A test for UpdateEmployeeMaster (Guid, FormViewParameter, DataTable)
        /////</summary>
        //[TestMethod()]
        //public void UpdateEmployeeMasterTest()
        //{
        //    Employee target = new Employee();

        //    Guid EmployeeID = new Guid(); // TODO: Initialize to an appropriate value

        //    FormViewParameter Parameters = null; // TODO: Initialize to an appropriate value

        //    DataTable QualificationDetails = null; // TODO: Initialize to an appropriate value

        //    bool expected = false;
        //    bool actual;

        //    actual = target.UpdateEmployeeMaster(EmployeeID, Parameters, QualificationDetails);

        //    Assert.AreEqual(expected, actual, "IGRSS.BusinessLogicLayer.Employee.UpdateEmployeeMaster did not return the expecte" +
        //            "d value.");
        //    Assert.Inconclusive("Verify the correctness of this test method.");
        //}

       
        
    }


}
