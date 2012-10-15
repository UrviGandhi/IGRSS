/************************************* Comments ***************************************/
//FileName      - ManageUser.js
//Purpose       - Validation and page setting functions for the manage user web page.
//Author        : Santhosh
//Creation Date : 15-Mar-2006


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
		document.all("divUsers").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
		
	//This is for horizontal scroll
	document.all("divUsers").style.width = document.body.clientWidth;
}
/// <summary>
/// Redirect the page to the url provided in the parameter.
/// </summary>
/// <param name="where">contains URL of the destination page.</param>
/// <returns>Redirects to destination page if found else error on page.</returns>
function linkpage(where)
{
	window.location.href=where;
}
/// <summary>
/// function to validate form before save or update.
/// </summary>
/// <returns>True if validation successful else false</returns>
function validateForm()
{
	var message = "";
	
	if(IstxtEmpty('txtUserId'))
	{
		message = "Enter User ID.";
	}
	if(IstxtEmpty('txtFirstName'))
	{
		if("" == message)
			message = "Enter First Name.";
		else
			message += "\n" + "Enter First Name.";
	}
	if(IstxtEmpty('txtLastName'))
	{
		if("" == message)
			message = "Enter Last Name.";
		else
			message += "\n" + "Enter Last Name.";
	}
	if(IstxtEmpty('txtEmailId'))
	{
		if("" == message)
			message = "Enter Email address.";
		else
			message += "\n" + "Enter Email address.";
	}
	else if(!IsEmail(document.all('txtEmailId').value))
	{
		if("" == message)
			message = "Enter valid Email address.";
		else
			message += "\n" + "Enter valid Email address.";
	}
	if("" != message)
	{
	    if(document.getElementById('txtHiddenUserId').value=="")
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
