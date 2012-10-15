
 /************************************* Comments ***************************************/

//Retailer
//FileName      - AMSDefaults.js
//Purpose       - Javascript validation for AMSDefaults page.
//Author        : N.Rambabu
//Creation Date : 21-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//Anil Kumar                      8-Aug-2006                Validations  
	
/************************************* Comments ***************************************/

    //Account error message
	var ErAccount001='\t\t\t\t\t\t\t\tAccount Name is Mandatory. ';
	var ErAccount003='\t\t\t\t\t\t\t\tOffers Close Days Should Be Numeric. ';
	var ErAccount004='\t\t\t\t\t\t\t\tVendor Surcharge should be between 0 & 999999.99.';
	var ErAccount005='\t\t\t\t\t\t\t\tRebate Checks Void Days Should Be Numeric. ';
	var ErAccount006='\t\t\t\t\t\t\t\tAward Days Should Be Numeric. ';
	var ErAccount007='\t\t\t\t\t\t\t\tAction Followup Days Should Be Numeric. ';
	var ErAccount008='\t\t\t\t\t\t\t\tVendor Surcharge Should Be Currency. ';
	var ErAccount009='\t\t\t\t\t\t\t\tCredit Hold Days Should Be Numeric. ';
	var ErAccount010='\t\t\t\t\t\t\t\tSlippage Days Should Be Numeric. ';
	var ErAccount011='\t\t\t\t\t\t\t\tClient Address1 is Mandatory. ';
	var ErAccount012='\t\t\t\t\t\t\t\tClient Address City is Mandatory. ';
	var ErAccount013='\t\t\t\t\t\t\t\tClient Billing Address1 is Mandatory. ';
	var ErAccount014='\t\t\t\t\t\t\t\tClient Billing City is Mandatory. ';
	var ErAccountDeac01='\t\t\t\t\t\t\t\tDeactive Days Should be Numeric.';
	
	//Validating Client Contacts grid.
	var ErAccount015='\t\t\t\t\t\t\t\tContact Name is Mandatory.';
	var ErAccount016='\t\t\t\t\t\t\t\tRole is Mandatory.';
	var ErAccount017='\t\t\t\t\t\t\t\tEmail is Mandatory.';
	var ErAccount023='\t\t\t\t\t\t\t\tPhone is Mandatory.';
	
	//Validating Company Contacts grid.
	var ErAccount018='\t\t\t\t\t\t\t\tContact Name is Mandatory.';
	var ErAccount019='\t\t\t\t\t\t\t\tRole is Mandatory.';
	var ErAccount020='\t\t\t\t\t\t\t\tEmail is Mandatory.';
	var ErAccount021='\t\t\t\t\t\t\t\tPlease Enter Valid Email Address.';
	var ErAccount022='\t\t\t\t\t\t\t\tPhone is Mandatory.';
	
	//login header error message
	var ErAccountsht001="";//'Save Failed. ';
   //Pricing error message
	var ErPricingElement001='\t\t\t\t\t\t\t\tPricingElement is Mandatory. ';
	var ErPricingElement002='\t\t\t\t\t\t\t\tFee is Mandatory. ';
	var ErPricingElement003='\t\t\t\t\t\t\t\tEnter Valid Currency. ';
	var ErPricingElement004='\t\t\t\t\t\t\t\tFee should be between 0 & 99999999.99.';
	//Pricing header error message
	var ErPricingSht001="";//'Save Failed. ';
	var ErPricingSht002='Validation Fail.';
	
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateAccount()
	{
	
		 if(document.getElementById('txtAccountNo').value!=0)
	     {
	       ErAccountsht001='Update Fail. ';
	     }
	     else
	     {
	       ErAccountsht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErAccountsht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtAccountName'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount001;
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
				
			}
			
		}
		
		//Checking the Offer Deactive Days is Numeric or Not
		if(document.getElementById('txtDeactiveDays').value!="")
		{ 
		   	if(false==IsNumeric(document.getElementById('txtDeactiveDays').value))
			{  
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErAccountDeac01;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErAccountDeac01;				
				}			
				
			}
			
		}
				
		//Vendor Surcharge
		if(document.getElementById('txtVendorSurcharge').value!="")
		{
		    if(false==IsCurrency(document.getElementById('txtVendorSurcharge').value))
			{
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
			}
			else
			{
				if(!((0 <= parseFloat(document.all('txtVendorSurcharge').value)) && (999999.99 >= parseFloat(document.all('txtVendorSurcharge').value))))
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
				}
			}
	    }
	
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
			//document.getElementById('txtCheckVoidAfter').focus();
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
			//document.getElementById('txtAwardDate').focus();
		}
		}
		//Follow Up Days
		if(document.getElementById('txtActionFollowUpTimeFrame').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtActionFollowUpTimeFrame').value))
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
			//document.getElementById('txtActionFollowUpTimeFrame').focus();
		}
		}
		
		//Credit Hold Days.
		if(document.getElementById('txtCreditHoldDays').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtCreditHoldDays').value))
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
			//document.getElementById('txtCheckVoidAfter').focus();
		}
		}
		//Slippage Days.
		if(document.getElementById('txtSlippageDays').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtSlippageDays').value))
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
			
		}
		}
		//Client Address1
		if(true==IstxtEmpty('txtAddress'))
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
		}
		//Client Address City
		if(true==IstxtEmpty('txtCity'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount012;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount012;
			}			
		}
		//Client Billing Address1
		if(true==IstxtEmpty('txtClientBillAdd1'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount013;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount013;
			}			
		}
		//Client Billing City
		if(true==IstxtEmpty('txtClientBillCity'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErAccount014;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErAccount014;
			}			
		}
		//Showing ErrorMessages.
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
	//Function Click On Check Box Hide the TD
	function ValidateCheckBox()
	{
	  //alert();
	  if(true==(document.getElementById('chkProgramRunAfterDataEntry').checked))
	  {
	     document.getElementById('tdDataEntry').style.display='block';
	    // document.getElementById('tblProgramRunAfterDataEntry').style.display='block'; 
	  }
	  else
	  {
	      document.getElementById('tdDataEntry').style.display='none';
	     document.getElementById('tblProgramRunAfterDataEntry').style.display='none';
	   }
	  if(true==(document.getElementById('chkProgToRunAfterBilling').checked))
	  {
	      document.getElementById('tdBillingHeader').style.display='block';
	     //  document.getElementById('tblProgramRunAfterBilling').style.display='block';
	  }
	  else
	  {
	      document.getElementById('tdBillingHeader').style.display='none';
	     document.getElementById('tblProgramRunAfterBilling').style.display='none';
	     
	  }
	   
	
	}
	function onPageLoad()
	{
		//Set page size
		SetSize()
		loadPreferences();
	}
	function ContractImg(Img,Height,Width)
	{
	LoadImg(Img,Height,Width);
	return false;
	}
	/// <summary>
	/// Set the page size here.
	/// </summary>
	
	function SetSize()
		{
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
					document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
				if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
				document.all("divAccount").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
				 
				//This is for horizontal scroll
				document.all("divAccount").style.width = document.body.clientWidth;
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
	
	//Function for Validating Client Contacts
	function ValidateClientContactControls()
	  {
		var ErClientContact='Client Contacts Add Fail.';
		var ShortMessage=ErClientContact;
		var LongMessage="";
		
		//Validating ClientContactName against empty.
       if(true==IstxtEmpty('txtClientContactName'))
        {
           if(""==LongMessage)
            { 
              LongMessage=ErAccount015;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErAccount015;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlClientContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErAccount016;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErAccount016;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtClientContactsEmail'))
           {
            // alert("ANIL");
             if(""==LongMessage)
              {
                LongMessage=ErAccount017;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErAccount017;
               }
           }
           
           if(true==IstxtEmpty('txtClientContactsPhone'))
           {
              if(""==LongMessage)
              {
               LongMessage=ErAccount023;
              }
              else
              {
				LongMessage=LongMessage + '\n'+ErAccount023;  
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
	  
	  
	  //Function to Validate Company Contact
	  function ValidateCompanyContactControls()
	  {
	    var ErCompanyContact="Company Contacts Add Fail.";
	    var ShortMessage=ErCompanyContact;
	    var LongMessage="";
	    
	    //Validating ClientContactName against empty.
       if(true==IstxtEmpty('txtCompanyContactName'))
        {
           if(""==LongMessage)
            { 
              LongMessage=ErAccount018;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErAccount018;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlClientContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErAccount019;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErAccount019;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtCompanyContactsEmail'))
           {
             if(""==LongMessage)
              {
                 LongMessage=ErAccount020;
              }
              //else if(!IsEmail(document.all('txtCompanyContactsEmail').value))
				//{
				//	if(""==LongMessage)
				//	{
				//	 LongMessage=ErAccount021;
				//	}
					else
					 {
					  LongMessage=LongMessage + '\n' + ErAccount021;
					 }
				//}
              //else
              // {
              // LongMessage=LongMessage + '\n' + ErAccount020;
              // }
           }
           
				if(true==IstxtEmpty('txtCompanyContactsPhone'))
				{
					if(""==LongMessage)
					{
					 LongMessage=ErAccount022;
					}
					else
					{
					 LongMessage=LongMessage + '\n' + ErAccount022;
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
	
	