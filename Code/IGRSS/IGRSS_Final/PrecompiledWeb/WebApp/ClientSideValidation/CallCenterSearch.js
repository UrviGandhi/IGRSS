function onPageLoad()
	{
		//Set page size
		SetSize()
		loadPreferences();
	}
	/// <summary>
	/// Set the page size here.
	/// </summary>
	 var ErCallCentersht001="Update Fail.";
	 var ErCallCentersht002="Search Fail.";
	 var ErCallCenter001="\t\t\t\t\t\t\t\tCall Center Comments  is Mandatory. ";
	 var ErCallCenter002="\t\t\t\t\t\t\t\tAddress1  is Mandatory. ";
	 var ErCallCenter004="\t\t\t\t\t\t\t\tPlease give at least one criteria. ";
	 var ErCallCenter003="\t\t\t\t\t\t\t\tCity  is Mandatory. ";
	 var ErCallCenter005="\t\t\t\t\t\t\t\tAppartment No. is Mandatory. ";
	 var ErCallCenter006="\t\t\t\t\t\t\t\tPhone No. is Mandatory. ";
	 var ErCallCenter007="\t\t\t\t\t\t\t\tPhone No. Shoulb be >=10. ";
	function SetSize()
		{
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
				document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
			if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
			document.all("divRebateSearch").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
				
			//This is for horizontal scroll
			document.all("divRebateSearch").style.width = document.body.clientWidth;
		}
   function ValidateCallCenter()
   {
  
        var ShortMessage=ErCallCentersht001;
		//set long message as empty
		var LongMessage="";
    
		/*if(true==(document.getElementById('chkChangeAddress').checked))
	    {
	        //AppartmentNo
	        if(true==IstxtEmpty('txtAppartmentNo'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErCallCenter005;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErCallCenter005;
				}			
			}
			if(true==IstxtEmpty('txtAddress'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErCallCenter002;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErCallCenter002;
				}			
			}
			//City
			if(true==IstxtEmpty('txtCity'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErCallCenter003;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErCallCenter003;
				}			
			}
			//Phone Number
			if(true==IstxtEmpty('txtPhone'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErCallCenter006;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErCallCenter006;
				}			
			}
			else if(document.getElementById('txtPhone').length < 10)
			{
			    //check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErCallCenter007;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErCallCenter007;
				}	
			}
			
		  }*/
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
        
   function ValidateCallCenterinShort()
   {
    var ShortMessage=ErCallCentersht002;
		//set long message as empty
		var LongMessage="";
       if((true==IstxtEmpty('txtFirstName'))&&(true==IstxtEmpty('txtLastName'))&&(true==IstxtEmpty('txtHouseNumber'))&&(true==IstxtEmpty('txtZipCode'))&&(true==IstxtEmpty('txtWebId'))&&(false==IsddlSelected('ddlAccountNames'))&&(true==IstxtEmpty('txtTrackCode')))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErCallCenter004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErCallCenter004;
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
  