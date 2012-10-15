/************************************* Comments ***************************************/
//FileName      - ChangePassword.js
//Purpose       - Validation and page setting functions for the Admin Change Password web page.
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
    if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight)))
			document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight);
		if(0 < (document.all("tblContent").height - (25)))
			document.all("divPasswordManagement").style.height = document.all("tblContent").height - (25);
			
		//This is for horizontal scroll
		document.all("divPasswordManagement").style.width = document.body.clientWidth;
	
}
/// <summary>
///function to set User ID field with the selected user.
/// </summary>
/// <param name="who">User ID who is selected reset password.</param>
function setUserForReset(who)
{
	document.all("txtUserID").value = who;
}
/// <summary>
/// function to validate form before save or update.
/// </summary>
/// <returns>True if validation successful else false</returns>
function validateResetForm()
{
	var message = "";
	
	if(IstxtEmpty('txtUserId'))
	{
		message = "Enter User ID.";
	}
	if(IstxtEmpty('txtNewPassword'))
	{
		if("" == message)
			message = "Enter new password.";
		else
			message += "\n" + "Enter new password.";
	}
	if(IstxtEmpty('txtConfirmPassword'))
	{
		if("" == message)
			message = "Enter confirm password.";
		else
			message += "\n" + "Enter confirm password.";
	}
	if("" != message)
	{
		SetErrorMessage("Save fail.",message);
		return false;
	}
	return true;
}
/// <summary>
/// function to validate search fields before going to server to check atleast one field is entered or Not
/// </summary>
/// <returns>True if validation successful i.e,atleast one field is entered else false</returns>
function validateSearchForm()
{
	var message = "";
	
	if(IstxtEmpty('txtSearchUserID') && IstxtEmpty('txtSearchFirstName') && IstxtEmpty('txtSearchLastName') && IstxtEmpty('txtSearchEmail'))
	{
		message = "Enter atleast one field.";
	}
	if("" != message)
	{
		SetErrorMessage("Search fail.",message);
		return false;
	}
	return true;
}
