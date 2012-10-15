/************************************* Comments ***************************************/
//FileName      - CurrencyManagement.js
//Purpose       - Client side Validation and page setting functions and other client side processing functions for the Currency management web page.
//Author        : Santhosh
//Creation Date : 15-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//

/************************************************************************************/
/// <summary>
/// Function should be called on page load to set the page size. This also check whether currency is selected for update or Not.
/// </summary>
function onPageLoad()
{
	//Set page size
	SetSize()
	//check for update
	checkForUpdate();
}
/// <summary>
/// Set the page size here.
/// </summary>
function SetSize()
{
	if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5)))
		document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5);
	if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 25)))
		document.all("divCurrencyManagement").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
	//This is for horizontal scroll
	document.all("divCurrencyManagement").style.width = document.body.clientWidth;
}
/// <summary>
/// function to cancel update or add and to reset the fields to their defaults.
/// </summary>
function cancelUpdate()
{
	//set default values.
	document.all("txtSymbol").value = "";
	document.all("txtName").value = "";
	document.all("txtCountry").value = "";
	document.all("txtROE").value = "0";
	document.all("txtHiddenSymbol").value = "";
	document.all("btnAdd").value = "Add";
	//enable Symbol field.
	document.all("txtSymbol").disabled = false;
}
/// <summary>
///Function to check for update and set Symbol field disabled.
/// </summary>
function checkForUpdate()
{
	if(document.all("txtHiddenSymbol").value != "")
		//disable Symbol field.
		document.all("txtSymbol").disabled = true;
}
/// <summary>
/// function to validate form before save or update.
/// </summary>
/// <returns>True if validation successful else false</returns>
function validateForm()
{
	var message = "";
	
	if(IstxtEmpty('txtSymbol'))
	{
		message = "Enter Symbol.";
	}
	if(IstxtEmpty('txtName'))
	{
		if("" == message)
			message = "Enter Name.";
		else 
			message += " Enter Name.";
	}
	if(IstxtEmpty('txtCountry'))
	{
		if("" == message)
			message = "Enter Country.";
		else 
			message += " Enter Country.";
	}
	if(IstxtEmpty('txtROE'))
	{
		if("" == message)
			message = "Enter ROE.";
		else 
			message +=  " Enter ROE.";
	}
	else if(!IsCurrency(document.all('txtROE').value))
	{
		if("" == message)
			message = "Enter numeric value for ROE.";
		else 
			message += " Enter numeric value for ROE.";
	}
	else if(!((0 <= parseFloat(document.all('txtROE').value)) && (999.99 >= parseFloat(document.all('txtROE').value))))
	{
		if("" == message)
			message = "ROE should be between 0 & 999.99.";
		else 
			message += " ROE should be between 0 & 999.99.";
	}
	if("" != message)
	{
	     if(document.getElementById('txtHiddenCurrencySymbol').value=="")
	     {
	        SetErrorMessage("Save Fail.",message);
		    return false;
	     }
	     else
	     {
	        SetErrorMessage("Update Fail.",message);
		    return false;
	     }
		
	}
	return true;
}
