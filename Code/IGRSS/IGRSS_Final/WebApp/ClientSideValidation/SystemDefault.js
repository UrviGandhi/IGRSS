


//On click set the size since b'coz for Error messages it moves the page contents down.
	document.onclick = SetSize;
		
	//var ErGblLng007 = ErTab +"Late charge should be numeric value."
	var ErAccount003='\t\t\t\t\t\t\t\tOffer Close Days should be numeric. ';
	var ErAccount004='\t\t\t\t\t\t\t\tVendor Surcharge should be numeric. ';
	var ErAccount005='\t\t\t\t\t\t\t\tRebate Checks Void Days  should be numeric. ';
	var ErAccount006='\t\t\t\t\t\t\t\tAward Days should be numeric. ';
	var ErAccount007='\t\t\t\t\t\t\t\tFollow Up Days should be numeric. ';
	var ErAccount008='\t\t\t\t\t\t\t\tThreshold Days should be numeric. ';
	var ErAccount010='\t\t\t\t\t\t\t\tLate Charge Should be Currency. ';
	var ErAccount011='\t\t\t\t\t\t\t\tCreadit Hold Days should be numeric. ';
	
	//login header error message
	var ErAccountsht001='Update Fail. ';	
	/// <summary>
	/// Function should be called on page load to set the page size.
	/// </summary>
	function onPageLoad()
	{
		//Set page size
		SetSize();
		loadPreferences();
	}
	/// <summary>
	/// Subroutine to set page size. so that scroll bar for div aligned
	/// </summary>	
	function SetSize()
	{
		if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight +30 )))
			document.all("tblContainer").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 40 );
		if(0 < (document.all("tblContainer").height - (document.all("tblButtons").height +35 )))
			document.all("divglobal").style.height = document.all("tblContainer").height - (document.all("tblButtons").height+10);			
		//This is for horizontal scroll
		document.all("divglobal").style.width = document.body.clientWidth;
	}
	
	
	//Function Click On Check Box Hide the TD
	function ValidateBillingProgram()
	{
	  if(true==(document.getElementById('chkProgtoRunAfterBilling').checked))
	  {
			document.getElementById('tblBillingProgram').style.display='block'	   
	  }
	  else
	  {
			document.getElementById('tblBillingProgram').style.display='none'
	  /*document.getElementById('trProgramAfterBilling').style.display='none'*/
	  }	
	
	   //alert();
	}
	// validating the Data entry program
	function ValidateDataEntryProgram()
	{
	  // control is checked or not		
	  if(true==(document.getElementById('chkProgtoRunAfterDataEntry').checked))
	  {
			// block the tblDataentryProgram
			document.getElementById('tblDataentryProgram').style.display='block'
	  }
	  else
	  {	
		// hide the tblDataentryProgram
	     document.getElementById('tblDataentryProgram').style.display='none'
	  }
	}
	
	function Validate()
	{
		var ShortMessage=ErAccountsht001;
		//set long message as empty
		var LongMessage="";
	   
	   	//Checking the Credit hold is Numeric or Not
		if(document.getElementById('txtCreditHold').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtCreditHold').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				
				//set long message
				LongMessage=ErAccount011;
				
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount011;				
			}			
			//set focus on offer after name
			
			document.getElementById('txtCreditHold').focus();
		// alert("poi");
			
		}
		}		
	  
		//Checking the CloseOfferAfter is Numeric or Not
		if(document.getElementById('txtCloseOffersAfter').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtCloseOffersAfter').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				
				//set long message
				LongMessage=ErAccount003;
				
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount003;				
			}			
			//set focus on offer after name
			
			document.getElementById('txtCloseOffersAfter').focus();
		// alert("poi");
			
		}
		}		
			
		//Vendor Surcharge
		if(document.getElementById('txtvendorsurcharge').value!="")
		{
		if(false==IsCurrency(document.getElementById('txtvendorsurcharge').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount004;				
			}			
			//set focus on offer after name
			document.getElementById('txtvendorsurcharge').focus();
		}
		}
		
		//alert(document.getElementById('txtCheckVoidAfter'));
		//Check Void After
		if(document.getElementById('txtCheckVoidAfter').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtCheckVoidAfter').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount005;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount005;				
			}			
			//set focus on offer after name
			document.getElementById('txtCheckVoidAfter').focus();
		}
		}
		
			//Award Date
		if(document.getElementById('txtAwardDate').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtAwardDate').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount006;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount006;				
			}			
			//set focus on offer after name
			document.getElementById('txtAwardDate').focus();
		}
		}
		
		//Follow Up Days
		if(document.getElementById('txtActionFollowup').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtActionFollowup').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount007;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount007;				
			}			
			//set focus on offer after name
			document.getElementById('txtActionFollowup').focus();
		}
		}
		
		
		if(document.getElementById('txtThresholdDays').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtThresholdDays').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount008;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount008;				
			}			
			//set focus on offer after name
			document.getElementById('txtThresholdDays').focus();
		}
		}
		/*
		if(document.getElementById('txtTypeofLateCharge').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtTypeofLateCharge').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount009;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount009;				
			}			
			//set focus on offer after name
			document.getElementById('txtTypeofLateCharge').focus();
		}
		}*/
		
		if(document.getElementById('txtTypeofLateCharge').value!="")
		{
		if(false==IsCurrency(document.getElementById('txtTypeofLateCharge').value))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount010;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount010;				
			}			
			//set focus on offer after name
			document.getElementById('txtTypeofLateCharge').focus();
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
	

	/*
	function ValidateSystemDefault()
	{
		//Set short message with the error code	
		var ShortMessage=ErGblSht001;
		//set long message as empty
		var LongMessage="";
		
		//check textbox credit hold is numeric
		if(true==IstxtEmpty('txtCreditHold'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng002;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng002;
			} 
			document.getElementById('txtCreditHold').focus();
		}
		
		//check textbox close offer after name is numeric
		if(false==IsNumeric(document.getElementById('txtCloseOffersAfter').value)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng001;				
			}			
			//set focus on offer after name
			document.getElementById('txtCloseOffersAfter').focus();
		}
		
			// vendorsurcharge name is Decima
		if(false==IsCurrency(document.getElementById('txtvendorsurcharge').value)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng003;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng003;				
			}			
			//set focus on vendorsurcharge
			document.getElementById('txtvendorsurcharge').focus();
		}
		
			//ThresholdDays name is numeric
		if(false==IsNumeric( document.getElementById('txtThresholdDays').value)
				{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng004;				
			}			
			//set focus on ThresholdDays
			document.getElementById('txtThresholdDays').focus();
		}	
	
		//CheckVoidAfter name is Decima
		if(false==IsNumeric( document.getElementById('txtCheckVoidAfter').value)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng005;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng005;				
			}			
			//set focus on txtCheckVoidAfter
			document.getElementById('txtCheckVoidAfter').focus();
		}	
		
		//TypeofLateCharge name is Decima
		if(false==IsCurrency(document.getElementById('txtTypeofLateCharge').value)
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErGblLng006;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErGblLng006;				
			}			
			//set focus on txtCheckVoidAfter
			document.getElementById('txtTypeofLateCharge').focus();
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
	}*/
		