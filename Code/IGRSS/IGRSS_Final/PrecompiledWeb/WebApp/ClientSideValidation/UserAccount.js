/************************************* Comments ***************************************/
//FileName      - UserAccount.js
//Purpose       - Validation and page setting functions for the UserAccount web page.
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
		document.all("divUsersAccounts").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
		
	//This is for horizontal scroll
	document.all("divUsersAccounts").style.width = document.body.clientWidth;
}
/// <summary>
/// reset the page.
/// </summary>
function resetForm()
{
	document.frmUserAccount.reset();
}