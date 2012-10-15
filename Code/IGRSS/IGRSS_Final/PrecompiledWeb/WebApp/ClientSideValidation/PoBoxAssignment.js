/************************************* Comments ***************************************/

//Service Category
//FileName      - POBoxAssignment.js
//Purpose       - Javascript validation for PoboxAssignment page.
//Author        : G.Anil Kumar.
//Creation Date : 31-May-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //PoBox error message
	var ErPoBox001='\t\t\t\t\t\t\t\tPOBox is Mandatory. ';
	//PoBox header error message
	var ErPoBoxSht001="";//'Save Failed. ';
  
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidatePOBox()
	{
	    if(document.getElementById('txtHiddenPoboxNo').value!=0)
	     {
	       ErPoBoxSht001='Update Fail. ';
	     }
	     else
	     {
	       ErPoBoxSht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErPoBoxSht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtpobox'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErPoBox001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErPoBox001;
			}			
		}
		//if long message is empty
		if(""==LongMessage)
		{
			//Validation success
			return true;
		}
		//if long message is not empty
		else
		{
			//set error message on toppage
			SetErrorMessage(ShortMessage,LongMessage);
			//validation failure
			return false;
		}
	}
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
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
				document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
			if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
			document.all("divPOBoxAssignment").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
			//This is for horizontal scroll
			document.all("divPOBoxAssignment").style.width = document.body.clientWidth;
		}
