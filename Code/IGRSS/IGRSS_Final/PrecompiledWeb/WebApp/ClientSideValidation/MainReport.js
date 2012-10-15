/************************************* Comments ***************************************/
//FileName      - MainReport.js
//Purpose       - Page setting functions for reports main web page i.e,"/Report/wfMainPage.aspx".
//Author        : Santhosh
//Creation Date : 24-Apr-2006


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
	//If it has no buttons, then remove button height from here and also remove button row from the design.
	if(0 < (document.all("tblContent").height - (25)))
		document.all("divReports").style.height = document.all("tblContent").height - (25);
		
	//This is for horizontal scroll
	document.all("divReports").style.width = document.body.clientWidth;
}
