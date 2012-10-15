/************************************* Comments ***************************************/

//Check Print
//FileName      - CheckPrint.js
//Purpose       - Javascript validation for Check list.
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
		if(0 < (document.all("tblContent").height - (25)))
			document.all("divCheckPrint").style.height = document.all("tblContent").height - (25);
			
		//This is for horizontal scroll
		document.all("divCheckPrint").style.width = document.body.clientWidth;
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
				LongMessage=ErChkLstLng007;
				//set focus on offer drop down list
				//document.getElementById('ddlAccount').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErChkLstLng007;				
			}	
		}
	
		//If offer ddl is not selected
		if(-1==document.getElementById('ddlOffer').selectedIndex)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErChkLstLng008;
				//set focus on offer drop down list
				//document.getElementById('ddlOffer').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErChkLstLng008;				
			}	
		}
		return LongMessage;
	}
	
	/// <summary>
	/// Function to validate generate check button click
	/// </summary>
	function ValidateGenerateCheck()
	{	
		//Set short message with the error code	
		var ShortMessage=ErChkLstSht001;
		//set long message as empty
		var LongMessage="";
		
		LongMessage=CheckDDL(LongMessage);
		//check textbox check number is empty
		if(true==IstxtEmpty('txtCheckNo'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErChkLstLng001;
				//set focus on check number
				document.getElementById('txtCheckNo').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErChkLstLng001;				
			}			
		}
		
		//check long message is empty
		if(""==LongMessage)
		{
			//check textbox check number is number
			if(false==IsNumeric(document.getElementById('txtCheckNo').value))
			{
				//set long message
				LongMessage=ErChkLstLng002;
				//set focus on check number
				document.getElementById('txtCheckNo').focus();
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
	
	/// <summary>
	/// Function to validate view check
	/// </summary>
	function ValidateViewCheck()
	{
		//Set short message with the error code	
		var ShortMessage=ErChkLstSht002;
		//set long message as empty
		var LongMessage="";
		LongMessage=CheckDDL(LongMessage);
		//check textbox [from] check number is empty
		if(true==IstxtEmpty('txtFrom'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErChkLstLng003;
				//set focus on [from] check number
				document.getElementById('txtFrom').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErChkLstLng003;				
			}			
		}
		
		//If [from] check number is empty
		if(false==IstxtEmpty('txtFrom'))
		{
			//check textbox [from] check number is number
			if(false==IsNumeric(document.getElementById('txtFrom').value))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErChkLstLng004;
					//set focus on [from] check number
					document.getElementById('txtFrom').focus();
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErChkLstLng004;
				} 
			}
		}
		
		//check textbox [to] check number is empty
		if(true==IstxtEmpty('txtTo'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErChkLstLng005;
				//set focus on [to] check number
				document.getElementById('txtTo').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErChkLstLng005;				
			}			
		}
		
		//If [to] check number is not empty then check
		if(false==IstxtEmpty('txtTo'))
		{
			//check textbox [to] check number is number
			if(false==IsNumeric(document.getElementById('txtTo').value))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErChkLstLng006;
					//set focus on [to] check number
					document.getElementById('txtTo').focus();
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErChkLstLng006;
				} 
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