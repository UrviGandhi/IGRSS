/************************************* Comments ***************************************/

//Check View
//FileName      - CheckView.js
//Purpose       - Javascript validation for Check view.
//Author        : E.Senthil Kumar
//Creation Date : 03-Apr-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
	  
	//On click set the size since b'coz for Error messages it moves the page contents down.
	document.onclick = SetSize;

	/// <summary>
	/// Set the page size here.
	/// </summary>
	function SetSize()
	{
		if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight)))
			document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight);
		if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 25)))
			document.all("divCheckView").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 25);
			
		//This is for horizontal scroll
		document.all("divCheckView").style.width = document.body.clientWidth;
	}

