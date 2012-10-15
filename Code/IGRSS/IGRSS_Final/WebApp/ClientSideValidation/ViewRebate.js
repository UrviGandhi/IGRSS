
/************************************* Comments ***************************************/

//Default
//FileName      -ViewRebate.js
//Purpose       - Javascript validation for ViewRebate page.
//Author        -Anil Kumar.G
//Creation Date :22/09/2006.
//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/

//On click set the size since b'coz for Error messages it moves the page contents down.
	document.onclick = SetSize;
	/// <summary>
	/// Subroutine to set page size. so that scroll bar for div aligned
	/// </summary>	
	function SetSize()
	{
		try
		{
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight)))
			document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight);
		    if(0 < (document.all("tblContent").height - (25)))
			document.all("divViewRebate").style.height = document.all("tblContent").height - (25);
		}
		catch(e)
		{
			//alert(e);
		}
	}
	/// <summary>
	/// Function to check ddl account, offer is selected or not
	/// </summary>
	function CheckDDL(LongMessage)
	{
		//If account ddl is not selected
		if(-1==document.getElementById('ddlAccount').selectedIndex)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRbtVwLng001;
				//set focus on offer drop down list
				//document.getElementById('ddlAccount').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRbtVwLng001;				
			}	
		}
	
		//If offer ddl is not selected
		if(-1==document.getElementById('ddlOffer').selectedIndex)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRbtVwLng002;
				//set focus on offer drop down list
				//document.getElementById('ddlOffer').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRbtVwLng002;				
			}	
		}
		return LongMessage;
	}
			