/************************************* Comments ***************************************/
//FileName      - Collection.js
//Purpose       - Validation and page setting functions for the Collection and CollectionView web page.
//Author        : Santhosh
//Creation Date : 04-Apr-2006


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
		document.all("divCollections").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
		
	//This is for horizontal scroll
	document.all("divCollections").style.width = document.body.clientWidth;
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
	
	if(IstxtEmpty('txtCheckNumber'))
	{
		message = "Enter check number.";
	}
	else if(!IsNumeric(document.all('txtCheckNumber').value))
	{
		if("" == message)
			message = "Enter numeric value for check number.";
		else 
			message += " Enter numeric value for check number.";
	}
	else if(!(0 <= parseInt(document.all('txtCheckNumber').value)))
	{
		if("" == message)
			message = "Check number should be greater than 0.";
		else 
			message += " Check number should be greater than 0.";
	}
	if(IstxtEmpty('txtCheckAmount'))
	{
		if("" == message)
			message = "Enter Check Amount.";
		else 
			message += " Enter Check Amount.";
	}
	else if(!IsCurrency(document.all('txtCheckAmount').value))
	{
		if("" == message)
			message = "Enter numeric value for Check Amount.";
		else 
			message += " Enter numeric value for Check Amount.";
	}
	else if(!((0 <= parseFloat(document.all('txtCheckAmount').value)) && (9999999999999.99 >= parseFloat(document.all('txtCheckAmount').value))))
	{
		if("" == message)
			message = "Check Amount should be between 0 & 9999999999999.99.";
		else 
			message += " Check Amount should be between 0 & 9999999999999.99.";
	}
	if(IstxtEmpty('txtCheckDate'))
	{
		if("" == message)
			message = "Enter Check Date.";
		else 
			message += " Enter Check Date.";
	}
	if("" != message)
	{
		SetErrorMessage("Save Fail.",message);
		return false;
	}
	return true;
}
