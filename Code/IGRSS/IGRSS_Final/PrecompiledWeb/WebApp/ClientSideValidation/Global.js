//On click set the size b'coz for Error messages it moves the page contents down.
document.onclick=SetSize;

var ErrGlobal1='\t\t\t\t\t\t\t\tCredit Hold Days should be Numeric.';
var ErrGlobal2='\t\t\t\t\t\t\t\tAction Follow-up Days should be Numeric.';
var ErrGlobal3='\t\t\t\t\t\t\t\tOffer Close Days should be Numeric.';
var ErrGlobal4='\t\t\t\t\t\t\t\tRebate Checks Void Days Should be Numeric.';
var ErrGlobal5='\t\t\t\t\t\t\t\tAward Days should be Numeric.';
var ErrGlobal6='\t\t\t\t\t\t\t\tThreshold Days should be Numeric.';
var ErrGlobal7='\t\t\t\t\t\t\t\tPayment Terms Should be Numeric.';
var ErrGlobal8='\t\t\t\t\t\t\t\tLate Charge Should be Currency.';
var ErrGlobal9='\t\t\t\t\t\t\t\tVendor Surcharge Should be Currency.';
var ErrGlobal10='\t\t\t\t\t\t\t\tSlippage Days should be Numeric.';
var ErrGlobalDeac11='\t\t\t\t\t\t\t\tDeactive Days should be Numeric.';

//Added by Anil for validating the Contact Name.
var ErrGlobal11='\t\t\t\t\t\t\t\tContact Name is Mandatory.';

//Added by Anil for validating the Role.
var ErrGlobal12='\t\t\t\t\t\t\t\tRole is Mandatory.';

//Added by Anil for validating the Email.
var ErrGlobal13='\t\t\t\t\t\t\t\tEmail is Mandatory.';

//Added by Anil for validating the Contact Name.
var ErrGlobal14='\t\t\t\t\t\t\t\tContact Name is Mandatory.';

//Added by Anil for validating the Role.
var ErrGlobal15='\t\t\t\t\t\t\t\tRole is Mandatory.';

//Added by Anil for validating the Email.
var ErrGlobal16='\t\t\t\t\t\t\t\tEmail is Mandatory.';

//Added by Anil for Validating the Phone number.
var ErrGlobal17='\t\t\t\t\t\t\t\tPhone Number is Mandatory.';

//login header error message
	var ErrGlobalshtmsg001='Update Fail.';	
	
	 //Pricing error message
	var ErPricingElement001='\t\t\t\t\t\t\t\tPricing Element is Mandatory. ';
	var ErPricingElement002='\t\t\t\t\t\t\t\tFee is Mandatory. ';
	var ErPricingElement003='\t\t\t\t\t\t\t\tEnter Valid Currency. ';
	var ErPricingElement004='\t\t\t\t\t\t\t\tFee should be between 0 & 99999999.99.';
	//Pricing header error message
	var ErPricingSht001="";//'Save Failed. ';
	var ErPricingSht002='Validation Fail.';
	
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
	if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
				document.all("tblContainer").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
			if(0 < (document.all("tblContainer").height - (document.all("tblButtons").height + 27)))
			document.all("divglobal").style.height = document.all("tblContainer").height - (document.all("tblButtons").height + 27);
			//This is for horizontal scroll
			document.all("divglobal").style.width = document.body.clientWidth;
		
	}
	 
	 ///Function to Validate the BillingProgram.
	 function ValidateBillingProgram()
	 {
	   if(true==(document.getElementById('chkProgtoRunAfterBilling').checked))
	   {
	    document.getElementById('tblBillingProgram').style.display='block'
	   }
	   else
	   {
	    document.getElementById('tblBillingProgram').style.display='none'
	   }
	 }
   
   //Function to Validate the DataEntryProgram.
   function ValidateDataEntryProgram()
   {
     if(true==(document.getElementById('chkProgtoRunAfterDataEntry').checked))
     {
      document.getElementById('tblDataentryProgram').style.display='block'
     }
     else
     {
      document.getElementById('tblDataentryProgram').style.display='none'
     }
   }
   
   //Function to Validate ClientContacts Mandatory Fields.
   function ValidateClientContactsMandatoryControls()
    {
      //Setting up Short Message.
      var ErrGlobalShtMsg='Client Contacts Add Fail.';
      var ShortMessage=ErrGlobalShtMsg;
      
      //Setting up Long Message.
      var LongMessage="";
      
       //Validating ClientContactName against empty.
       if(true==IstxtEmpty('txtClientContactName'))
        {
           if(""==LongMessage)
            { 
              LongMessage=ErrGlobal11;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErrGlobal11;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlClientContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErrGlobal12;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErrGlobal12;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtClientContactsEmail'))
           {
             if(""==LongMessage)
              {
                LongMessage=ErrGlobal13;
              }
              //else if(!IsEmail(document.all('txtClientContactsEmail').value))
               //{
				//	if(""==LongMessage)
				//	 {
				//	   LongMessage="Please Enter Valid Email.";
				//	 }
				//	 else
				//	 {
				//	  LongMessage=LongMessage + '\n' + "Please Enter Valid Email Address.";
				//	 }
					 
              // }
              else
               {
                LongMessage=LongMessage + '\n' + ErrGlobal13;
               }
           }
           
               if(""==LongMessage)
               {
                return true;
               }
               else
		       {
		         //set error message on toppage
			     SetErrorMessage(ShortMessage,LongMessage);			
			     //validation failure
			     return false;
		       }
      
    }
    
    //Function used to Validate Company Contacts Mandatory Controls.
    function ValidateCompanyContactsMandatoryControls()
    {
      var ErrGlobalShtMsg='Company Contacts Add Fail.'; 
	  //Setting up Short Message.
      var ShortMessage=ErrGlobalShtMsg;
      
      //Setting up Long Message.
      var LongMessage="";
      
       //Validating ClientContactName against empty.
       if(true==IstxtEmpty('txtCompanyContactName'))
        {
           if(""==LongMessage)
            { 
              LongMessage=ErrGlobal14;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErrGlobal14;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlCompanyContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErrGlobal15;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErrGlobal15;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtCompanyContactsEmail'))
           {
             if(""==LongMessage)
              {
                LongMessage=ErrGlobal16;
              }
            //  else if(!IsEmail(document.all('txtCompanyContactsEmail').value))
             // {
				//if(""==LongMessage)
				//  {
				//   LongMessage="Please Enter Valid Email.";
				//  }
				//  else
				 //  {
				//    LongMessage=LongMessage + '\n' + LongMessage;
				//   }
             // }
              else
               {
                LongMessage=LongMessage + '\n' + ErrGlobal16;
               }
           }
           if(true==IstxtEmpty('txtCompanyContactsPhone'))
           {
				if(""==LongMessage)
				{
				LongMessage=ErrGlobal17;
				}
				else
				{
				LongMessage=LongMessage + '\n' + ErrGlobal17;
				}
           }
           
              //If all the Mandatories are filled then return true.
               if(""==LongMessage)
               {
                return true;
               }
               //Else set the Error Message.
               else
		       {
		         //set error message on toppage
			     SetErrorMessage(ShortMessage,LongMessage);			
			     //validation failure
			     return false;
		       }		
    }
   
   //Function to Validate the Textbox controls.
   function ValidateTextboxControls()
   {
     //Setting up short message.
     var ErrShortMsg=ErrGlobalshtmsg001;
     //Setting up Long message.
     var ErrLongMsg="";
     
     //Credit Hold Days
     if(document.getElementById('txtCreditHold').value!="")
		{
		    if(false==IsNumeric(document.getElementById('txtCreditHold').value))
		    {
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrGlobal1;
				
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrGlobal1;				
			}			
			//set focus on offer after name
			document.getElementById('txtCreditHold').focus();
			}
		}	
			
     //Action Follow-up Days
     if(document.getElementById('txtActionFollowup').value!="")
     {
       if(false==IsNumeric(document.getElementById('txtActionFollowup').value))
       {
       if(""==ErrLongMsg)
       {
         ErrLongMsg=ErrGlobal2;
       }
       else
       {
         ErrLongMsg=ErrLongMsg + '\n' + ErrGlobal2;
       }
        document.getElementById('txtActionFollowup').focus();
       }
     }
     //Offer Close Days
     if(document.getElementById('txtCloseOffersAfter').value!="")
		{
		    if(false==IsNumeric(document.getElementById('txtCloseOffersAfter').value))
		    {
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrGlobal3;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrGlobal3;				
			}			
			//set focus on offer after name
			document.getElementById('txtCloseOffersAfter').focus();
			}
		}
		
		//Offer Deactive Days
        if(document.getElementById('txtDeactiveDays').value!="")
		{
		   
		    if(false==IsNumeric(document.getElementById('txtDeactiveDays').value))
		    {
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrGlobalDeac11;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrGlobalDeac11;				
			}			
			//set focus on offer after name
			document.getElementById('txtDeactiveDays').focus();
			}
		}
		
     //Rebate Checks Void Days
      if(document.getElementById('txtCheckVoidAfter').value!="")
      {
        if(false==IsNumeric(document.getElementById('txtCheckVoidAfter').value))
        {
        if(""==ErrLongMsg)
        {
          ErrLongMsg=ErrGlobal4;
        }
        else
        {
          ErrLongMsg=ErrLongMsg + '\n' + ErrGlobal4;
        }
        document.getElementById('txtCheckVoidAfter').focus();
        }
      }
     //Award Days
     if(document.getElementById('txtAwardDate').value!="")
     {
		    if(false==IsNumeric(document.getElementById('txtAwardDate').value))
		    {
			if(""==ErrLongMsg)
			{
			ErrLongMsg=ErrGlobal5;
			}
			else
			{
			ErrLongMsg=ErrLongMsg + '\n' + ErrGlobal5;
			}
		    document.getElementById('txtAwardDate').focus();
		    }
     }
     //Threshold Days
     if(document.getElementById('txtThresholdDays').value!="")
		{
		    if(false==IsNumeric(document.getElementById('txtThresholdDays').value))
		    {
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrGlobal6;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrGlobal6;				
			}			
			//set focus on offer after name
			document.getElementById('txtThresholdDays').focus();
		    }
		}
     //Payment Terms
     if(document.getElementById('txtPaymentTerms').value!="")
	 {
		if(false==IsNumeric(document.getElementById('txtPaymentTerms').value))
		{
		if(""==LongMessage)
		{
		LongMessage=ErrGlobal7;
		}
		else
		{
		LongMessage=LongMessage + '\n' + ErrGlobal7;
	    }
	    }
	 }
     //Late Charge
     if(document.getElementById('txtTypeofLateCharge').value!="")
		{
		    if(false==IsCurrency(document.getElementById('txtTypeofLateCharge').value))
		    {
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrGlobal8;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrGlobal8;				
			}			
			//set focus on offer after name
			document.getElementById('txtTypeofLateCharge').focus();
		    }
		 }
     //Vendor Surcharge
     if(document.getElementById('txtvendorsurcharge').value!="")
     {
        if(false==IsNumeric((document.getElementById('txtvendorsurcharge').value)))
        {
        if(""==ErrLongMsg)
        {
          ErrLongMsg=ErrGlobal9;
        }
        else
        {
          ErrLongMsg=ErrLongMsg + '\n' + ErrGlobal9;
        }
        document.getElementById('txtvendorsurcharge').focus();
        }
     }
      //Slippage Days
    if(document.getElementById('txtSlippageDays').value!="")
	{
		if(false==IsNumeric(document.getElementById('txtSlippageDays').value))
		{
		//check long message is empty
		if(""==LongMessage)
		{
			//set long message
			LongMessage=ErrGlobal10;
		}
		//if long message is not empty
		else
		{
			//set longmessage with newline char and long message code
			LongMessage=LongMessage + '\n' + ErrGlobal10;				
		}			
		//set focus on offer after name
		document.getElementById('txtSlippageDays').focus();
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
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidatePricing()
	{
	    
	       ErPricingSht001='Add Failed. ';
		//Set short message with the error code	
		var ShortMessage=ErPricingSht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtPricingElement'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErPricingElement001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErPricingElement001;
			}			
		}
		if(true==IstxtEmpty('txtPricingFee'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErPricingElement002;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErPricingElement002;
			}			
		}
		else if(!((0 <= parseFloat(document.all('txtPricingFee').value)) && (99999999.99 >= parseFloat(document.all('txtPricingFee').value))))
	    {
	        //check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErPricingElement004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErPricingElement004;
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
	