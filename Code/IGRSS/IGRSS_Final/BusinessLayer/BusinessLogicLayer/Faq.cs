using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using IGRSS.BusinessObjects;
using FaqTable=IGRSS.DataAccessLayer.Faq.FAQDataTable;
using System.Threading;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	public class Faq
	{
        public void AddNewFaq(string Question,string Answer)
        {
            string curUser = Thread.CurrentPrincipal.Identity.Name;
            try
            {
                IgrssAdapters.FaqAdapter.AddNewFaq(Guid.NewGuid(),Question, Answer,curUser,DateTime.Now);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
        }
        public FaqTable GetAllFaq()
        {
            FaqTable dt = new FaqTable();
           dt=IgrssAdapters.FaqAdapter.GetFaqDetails();
            return dt;
        }
	}
}
