using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.ComponentModel;
using IGRSS.BusinessObjects;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer
{
    class TestTable
    {

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddTest(FormViewParameter Parameter)
        {
            //, Row.DeliveryBranch, Row.DocumentSender, Row.ReceiversName
            try
            {

                IGRSS.DataAccessLayer.TestTable.TestRow Row = (IGRSS.DataAccessLayer.TestTable.TestRow)Parameter.Values;
                int i = IgrssAdapters.TestTableAdapter.InsertQuery(1,"Urvi" );
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
    }
}
