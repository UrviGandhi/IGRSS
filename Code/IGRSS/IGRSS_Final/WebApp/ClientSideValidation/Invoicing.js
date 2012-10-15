/************************************* Comments ***************************************/
//FileName      - Invoicing.js
//Purpose       - Validation and page setting functions for the invoice web page.
//Author        : Santhosh
//Creation Date : 12-Apr-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//

/************************************************************************************/
/// <summary>
/// Function should be called on page load to set the page size.
/// </summary>
function onPageLoad()
{
	//Set page size
	SetSize()
}
/// <summary>
/// Set the page size here.
/// </summary>
function SetSize()
{
	if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5)))
		document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5);
	if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 25)))
		document.all("divInvoicing").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
		
	//This is for horizontal scroll
	document.all("divInvoicing").style.width = document.body.clientWidth;
}
/// <summary>
/// Redirect the page to the url provided in the parameter.
/// </summary>
/// <param name="where">contains URL of the destination page.</param>
/// <returns>Redirects to destination page if found else error on page.</returns>
function goToPage(where)
{
	 window.location.href = where;
}
/// <summary>
/// function to validate form before save or update.
/// </summary>
/// <returns>True if validation successful else false</returns>
function validateForm()
{
	var message = "";
	
	//if(IstxtEmpty('txtProgram'))
	//{
	//	message = "Enter program number.";
	//}
	// if(false==IsNumeric(document.getElementById('txtProgram').value))
	 // {
	   
		//	if("" == message)
		//	{
		//		message = "Enter numeric value for program number.";
		//	}
		//	else
		//	    { 
		//		message += " Enter numeric value for program number.";
		//		}
	  // }
	 //else if(!(0 <= parseInt(document.all('txtProgram').value)))
	 // {
	   
		//if("" == message)
		//	message = "program number should be greater than 0.";
		//else 
		//	message += " program number should be greater than 0.";
	 // }
	  
	if(IstxtEmpty('txtDate'))
	{
		if("" == message)
			message = "Enter Date.";
		else 
			message += " Enter Date.";
	}
	if("" != message)
	{
		SetErrorMessage("Invoice Generation Fail.",message);
		return false;
	}
	return true;
}

