/************************************* Comments ***************************************/
//FileName      - UsersChangePassword.js
//Purpose       - Validation and page setting functions for the Change Password web page of users other than admin.
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
	SetSize();
}
/// <summary>
/// Set the page size here.
/// </summary>
function SetSize()
{
	if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5)))
		document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 5);
	if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 25)))
		document.all("divPasswordManagement").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
	//This is for horizontal scroll
	document.all("divPasswordManagement").style.width = document.body.clientWidth;
}
/// <summary>
/// function to validate form before save.
/// </summary>
/// <returns>True if validation successful else false</returns>
function validateResetForm()
{
 
	var message = "";
	
	if(IstxtEmpty('txtOldPassword'))
	{
		message = "Enter old password.";
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
		SetErrorMessage("Save Fail.,message);
		return false;
	}
	
	return true;
}
