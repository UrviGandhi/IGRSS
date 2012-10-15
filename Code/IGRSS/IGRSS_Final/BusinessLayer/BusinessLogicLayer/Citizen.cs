//Citizen
//ClassName     - Citizen
//Purpose       - This business class contains a business logic for Adding Users Suggestions details. 
//Author        : Pradeep Yadav
//Creation Date : 

//Modified By                          Date                     Description
//-----------                      -------------            ----------------
using System;
using System.Collections.Generic;
using System.Text;
using IGRSS.BusinessObjects;
using CitizenTable=IGRSS.DataAccessLayer.Citizen.CitizenDataTable;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
namespace IGRSS.BusinessLogicLayer
{
	
	public class Citizen
	{
		/// <summary>
		/// This function will add the suggestions of the users. 
		/// </summary>
		/// <returns>void</returns>
		public void InsertSuggestionsDetails(string Type,string Description,string Name,string Address,string PhoneNo)
		{
			try
			{
				IgrssAdapters.CitizenAdapter.AddNewSuggestions(Type, Description, Name, Address, PhoneNo);
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
		}
		/// <summary>
		/// This function will get all the suggestions of the users. 
		/// </summary>
		/// <returns>CitizenTable</returns>
		public CitizenTable GetSuggestionsDetails()
		{
			CitizenTable RetData = new CitizenTable();
			try
			{
				RetData=IgrssAdapters.CitizenAdapter.GetData();
			}
			catch (Exception ex)
			{
				if(ExceptionPolicy.HandleException(ex, "DAL"))
				throw;
			}
			return RetData;
		}

	}
}
