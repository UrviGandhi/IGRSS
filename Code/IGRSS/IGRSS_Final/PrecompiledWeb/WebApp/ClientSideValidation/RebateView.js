
/************************************* Comments ***************************************/

//Default
//FileName      - RebateView.js
//Purpose       - Javascript validation for rebate view page.
//Author        : E.Senthil Kumar
//Creation Date : 27-Mar-2006


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
			if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 38)))
				document.all("divRebateVw").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 38);
				
			//This is for horizontal scroll
			document.all("divRebateVw").style.width = document.body.clientWidth;
		}
		catch(e)
		{
			//alert(e);
		}
	}		
	
	/// <summary>
	/// Function to validate delete rebate
	/// </summary>
	function ValidateDelRebate()
	{
		//Set short message with the error code	
		var ShortMessage=ErRbtVwSht001;
		//set long message as empty
		var LongMessage="";
		LongMessage=CheckDDL(LongMessage);
		//If long message is empty
		if(""==LongMessage)
		{
			try
			{
				var Checked=false;
				re = new RegExp(':chkDelRebate$')  
				for(i = 0; i < document.forms[0].elements.length; i++) 
				{
					elm = document.forms[0].elements[i];
					if (elm.type == 'checkbox') 
					{
						if (re.test(elm.name)) 
						{
							if(true==elm.checked)
							Checked=true;
						}
					}
				}
				if(false==Checked)
				{
					LongMessage=ErRbtVwLng003;
				}
			}
			catch(e)
			{
				LongMessage=ErRbtVwLng003;
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

	function CheckAll( checkAllBox )
	{
		re = new RegExp(':' + aspCheckBoxID + '$')  
        for(i = 0; i < document.forms[0].elements.length; i++) 
        {
            elm = document.forms[0].elements[i];
            if (elm.type == 'checkbox') 
            {
                if (re.test(elm.name)) 
                {
                    elm.checked = checkVal
                }
            }
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