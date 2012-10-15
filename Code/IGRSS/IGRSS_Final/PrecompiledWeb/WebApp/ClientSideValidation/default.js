/************************************* Comments ***************************************/

//Default
//FileName      - Default.js
//Purpose       - Javascript validation for home page.
//Author        : E.Senthil Kumar
//Creation Date : 09-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
	  
	//On click set the size since b'coz for Error messages it moves the page contents down.
	document.onclick = SetSize;
	
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateLogin()
	{
		//Set short message with the error code	
		var ShortMessage=ErLgnSht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtUser'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErLgnUsr001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErLgnUsr001;				
			}			
			//set focus on userid
			document.getElementById('txtUser').focus();
		}
		//check textbox login password is empty
		if(true==IstxtEmpty('txtUserPassword'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErLgnPwd001;
				//if password alone empty then set focus on password
				document.getElementById('txtUserPassword').focus();
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErLgnPwd001;
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
	/// Subroutine to set page size. so that scroll bar for div aligned
	/// </summary>	
	function SetSize()
	{
		try
		{
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight)))
				document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight);
			if(0 < (document.all("tblContent").height - 25))
				document.all("divHome").style.height = document.all("tblContent").height - 25;
				
			//This is for horizontal scroll
			document.all("divHome").style.width = document.body.clientWidth;
		}
		catch(e)
		{
			//alert(e);
		}
	}
