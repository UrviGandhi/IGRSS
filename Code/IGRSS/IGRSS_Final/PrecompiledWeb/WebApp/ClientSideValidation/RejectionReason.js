/************************************* Comments ***************************************/

//Rejection Reason
//FileName      - RejectionReason.js
//Purpose       - Javascript validation for RejectionReason page.
//Author        : N.Rambabu
//Creation Date : 12-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //RejectionReason error message
	var ErRejReason001='\t\t\t\t\t\t\t\tRejectionReason is Mandatory. ';
	//RejectionReason header error message
	var ErRejSht001="";//'Save Failed. ';
  
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateRejectionReason()
	{
	    if(document.getElementById('txtHiddenRejectionReasonId').value!=0)
	     {
	       ErRejSht001='Update Fail. ';
	     }
	     else
	     {
	       ErRejSht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErRejSht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtRejectionReason'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRejReason001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRejReason001;
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
			document.all("divRejectionReason").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
				
			//This is for horizontal scroll
			document.all("divRejectionReason").style.width = document.body.clientWidth;
		}
	
