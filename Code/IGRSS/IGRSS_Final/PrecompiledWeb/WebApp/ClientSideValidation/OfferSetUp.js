//FileName      - OfferSetUp.js
//Purpose       - Javascript validation for Offer UI page.
//Author        : Joise John
//Creation Date : April - 03-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
	 //Account error message
	var ErAccount001='\t\t\t\t\t\t\t\tShort Description is Mandatory. ';
	var ErAccount002='\t\t\t\t\t\t\t\tStart Date is Mandatory. ';
	var ErAccount003='\t\t\t\t\t\t\t\tOffer Close Days Should Be Numeric. ';
	var ErAccount004='\t\t\t\t\t\t\t\tVendor Surcharge Should Be Between 0 & 999999.99. ';
	var ErAccount005='\t\t\t\t\t\t\t\tRebate Checks Void Days Should Be Numeric. ';
	var ErAccount006='\t\t\t\t\t\t\t\tAward Days Should Be Numeric. ';
	var ErAccount007='\t\t\t\t\t\t\t\tAction FollowUp Days Should Be Numeric. ';
	var ErAccount008='\t\t\t\t\t\t\t\tTrade Up Feature Should Be Numeric. ';
	var ErAccount009='\t\t\t\t\t\t\t\tCommission Should Not Be Empty. ';
	var ErAccount010='\t\t\t\t\t\t\t\tCommission Should be Currency. ';
	var ErAccount011='\t\t\t\t\t\t\t\tBonus Should Not be Empty. ';
	var ErAccount012='\t\t\t\t\t\t\t\tBonus Should be Currency. ';
	var ErAccount013='\t\t\t\t\t\t\t\tPricing Fee Should Not Be Empty. ';
	var ErAccount014='\t\t\t\t\t\t\t\tPricing Should be Currency. ';
	var ErAccount015='\t\t\t\t\t\t\t\tEnd Date is Mandatory. ';
	var ErAccount016='\t\t\t\t\t\t\t\tRebate Amount is Mandatory. ';
	var ErAccount017='\t\t\t\t\t\t\t\tNo of Awards per Person Should Be Numeric. ';
	var ErAccount018='\t\t\t\t\t\t\t\tNo of Program Should Be Numeric. ';
	var ErAccount019='\t\t\t\t\t\t\t\tRebate Amount should be between 0 & 99999.99.';
	var ErAccount020='\t\t\t\t\t\t\t\tEnd Date Should be greater than Start Date. ';
	var ErAccount022='\t\t\t\t\t\t\t\tPostmark Date Should be >= Enddate.';
	var ErAccount024='\t\t\t\t\t\t\t\tNo of UPC Allowed Should Be Numeric.';
	var ErAccount023='\t\t\t\t\t\t\t\tPostmark Grace Period Should Be Numeric.';
	var ErOffer025='\t\t\t\t\t\t\t\tAddress1 is Mandatory.';
	var ErOffer026='\t\t\t\t\t\t\t\tCity is Mandatory.';
	
	//Validating the Client Contacts.
	var ErOffer027='\t\t\t\t\t\t\t\tContact Name is Mandatory.';
	var ErOffer028='\t\t\t\t\t\t\t\tRole is Mandatory.';
	var ErOffer029='\t\t\t\t\t\t\t\tEmail is Mandatory.';
	var ErOffer038='\t\t\t\t\t\t\t\tPhone is Mandatory.';
	
	//Validating the Company Contacts.
	var ErOffer030='\t\t\t\t\t\t\t\tContact Name is Mandatory.';
	var ErOffer031='\t\t\t\t\t\t\t\tRole is Mandatory.';
	var ErOffer032='\t\t\t\t\t\t\t\tEmail is Mandatory.';
	var ErOffer033='\t\t\t\t\t\t\t\tPlease Enter Valid Email.';
	var ErOffer039='\t\t\t\t\t\t\t\tPhone is Mandatory.';
	
	//Validating the UPCs
	var ErOffer034='\t\t\t\t\t\t\t\tProduct Name is Mandatory.';
	var ErOffer035='\t\t\t\t\t\t\t\tUPC Code is Mandatory.';
	var ErOffer036='\t\t\t\t\t\t\t\t$Amount To Award for UPC is Mandatory.';
	var ErOffer037='\t\t\t\t\t\t\t\t$Amount Should be between 0 & 99999.99.';
	//login header error message
	var ErAccountsht001="";//'Save Failed. ';
	//var ErAccountsht002='Update Failed. ';	
  	/// For validating the offer mandatory fields and numeric fields
  	function ValidateOffer()
	{
		//Set short message with the error code	
		if(document.getElementById('htxtOfferno').value!=0)
	     {
	       ErAccountsht001='Update Fail. ';
	     }
	     else
	     {
	       ErAccountsht001='Save Fail. ';
	     }
		var ShortMessage=ErAccountsht001;
		//set long message as empty
		var LongMessage="";
		
		//Short Description		
		if(true==IstxtEmpty('txtShortDescription'))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount001;
			}
			
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount001;
			}			
		}
		// Start Date
		if(true==IstxtEmpty('txtOfferStartDate'))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount002;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount002;
			}			
		}
		// Offer EndDate.
		if(true==IstxtEmpty('txtOfferEndDate'))
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
		/*//PostMark Date
		//if((false==IstxtEmpty('txtPostMark').value)&& (false==IstxtEmpty('txtOfferEndDate').value))
		if(document.getElementById('txtOfferEndDate').value!="" && document.getElementById('txtPostMark').value!="")
		{
		 if((document.getElementById('txtPostMark').value)< (document.getElementById('txtOfferEndDate').value))
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
		}*/
		
		//Rebate Amount.
		if(true==IstxtEmpty('txtRebateAmount'))
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
		else if(!((0 <= parseFloat(document.all('txtRebateAmount').value)) && (99999.99 >= parseFloat(document.all('txtRebateAmount').value))))
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
				
		//No of Awards per Person.
		if(document.getElementById('txtAwardsAllowedPerPerson').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtAwardsAllowedPerPerson').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount017;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount017;				
			}			
			document.getElementById('txtAwardsAllowedPerPerson').focus();
		}
		}
		//No of Program.
		if(document.getElementById('txtProgramMax').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtProgramMax').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount018;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount018;				
			}			
				document.getElementById('txtProgramMax').focus();
		}
		}
		//Award Days.
		if(document.getElementById('txtAwardDate').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtAwardDate').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount006;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount006;				
			}			
			document.getElementById('txtAwardDate').focus();
		}
		}
		//Action FollowUp Days.
		if(document.getElementById('txtactionFollowUPdays').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtactionFollowUPdays').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount007;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount007;				
			}			
				document.getElementById('txtactionFollowUPdays').focus();
		}
		}
		// Postmark Grace Period.
		if(document.getElementById('txtOfferPostMarkGracePeriod').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtOfferPostMarkGracePeriod').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount023;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount023;				
			}			
				document.getElementById('txtOfferPostMarkGracePeriod').focus();
		}
		}
		//Offer Close Days
		if(document.getElementById('txtCloseOffersAfter').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtCloseOffersAfter').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount003;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount003;				
			}			
			document.getElementById('txtCloseOffersAfter').focus();
		}
		}	
		//Vendor Surcharge
		if(document.getElementById('txtvendorsurcharge').value!="")
		{
		if(!((0 <= parseFloat(document.all('txtvendorsurcharge').value)) && (999999.99 >= parseFloat(document.all('txtvendorsurcharge').value))))
	    {
	        if(""==LongMessage)
			{
				LongMessage=ErAccount004;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount004;
			}	
	    }
		}	
		//Rebate Checks Void Days
		if(document.getElementById('txtRebateChecksVoidAfter').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtRebateChecksVoidAfter').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount005;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount005;				
			}			
			document.getElementById('txtRebateChecksVoidAfter').focus();
		}
		}
		//No of UPC Allowed
		if(document.getElementById('txtnoofUpcallowed').value!="")
		{
		if(false==IsNumeric(document.getElementById('txtnoofUpcallowed').value))
		{
			if(""==LongMessage)
			{
				LongMessage=ErAccount024;
			}
			else
			{
				LongMessage=LongMessage + '\n' + ErAccount023;				
			}			
			document.getElementById('txtnoofUpcallowed').focus();
		}
		}
			
		//Address1	
		if(true==IstxtEmpty('txtAddress1'))
		{
			if(""==LongMessage)
			{
				LongMessage=ErOffer025;
			}
			
			else
			{
				LongMessage=LongMessage + '\n' + ErOffer025;
			}			
		}
		//City
		if(true==IstxtEmpty('txtCity'))
		{
			if(""==LongMessage)
			{
				LongMessage=ErOffer026;
			}
			
			else
			{
				LongMessage=LongMessage + '\n' + ErOffer026;
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
	
		//Function Click On Check Box Hide the TD
	function ValidateCheckBox()
	{
	  //alert();
	  if(true==(document.getElementById('chkProgramAfterDataentry').checked))
	  {
	     document.getElementById('tblDataEntryProgram').style.display='block';	     
	  }
	  else
	  {
	      document.getElementById('tblDataEntryProgram').style.display='none';
	     
	   }
	  if(true==(document.getElementById('chkProgramAfterBilling').checked))
	  {
	      document.getElementById('tblprogram').style.display='block';	       
	  }
	  else
	  {
	      document.getElementById('tblprogram').style.display='none';     
	     
	  }	
	}
	function ContractImg(Img,Height,Width)
	{
	LoadImg(Img,Height,Width);
	return false;
	}
	
	//Function to Validate ClientContact Mandatory Fields.
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
              LongMessage=ErOffer027;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErOffer027;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlClientContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErOffer028;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErOffer028;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtClientContactsEmail'))
           {
             if(""==LongMessage)
              {
                LongMessage=ErOffer029;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErOffer029;
               }
           }
           
           if(true==IstxtEmpty('txtClientContactsPhone'))
           {
				if(""==LongMessage)
				{
				 LongMessage=ErOffer038;
				}
				else
				{
				 LongMessage=LongMessage + '\n' +ErOffer038;
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
	
	//Function to Validate Company Contact Controls.
	function ValidateCompanyContactControls()
	 {
		var ErClientContact='Company Contacts Add Fail.';
		var ShortMessage=ErClientContact;
		var LongMessage="";
		
		//Validating ClientContactName against empty.
       if(true==IstxtEmpty('txtCompanyContactName'))
        {
           if(""==LongMessage)
            { 
              LongMessage=ErOffer030;
            }
            else
             {
               LongMessage=LongMessage + '\n' + ErOffer030;
             }
         }
         
         //Validating Role against empty.
         if(false==IsddlSelected('ddlCompanyContactsRole'))
           {
             if(""==LongMessage)
              {
               LongMessage=ErOffer031;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErOffer031;
               }
           }
           
           //Validating ClientContacts Email against Empty.
           if(true==IstxtEmpty('txtCompanyContactsEmail'))
           {
           
             if(""==LongMessage)
              {
                LongMessage=ErOffer032;
              }
              else
               {
                LongMessage=LongMessage + '\n' + ErOffer032;
               }
                  
            }
            
            if(true==IstxtEmpty('txtCompanyContactsPhone'))
            {
              if(""==LongMessage)
              {
                LongMessage=ErOffer039;
              }
              else
              {
                LongMessage=LongMessage + '\n' + ErOffer039;
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
	 //Function to Validate the UPC Section Values.
	function ValidateUPCSection()
	{
	 var ShortMessage='UPC Add Fail.';
	 var LongMessage="";
	 //Checking  against Empty.
	  if(true==IstxtEmpty('txtProductName'))
	  {
	     if(""==LongMessage)
	     {
	       LongMessage=ErOffer034;
	     }
	     else
	     {
	       LongMessage=LongMessage + '\n' + ErOffer034;
	     }
	  }
	  //Checking against Empty.
	  if(true==IstxtEmpty('txtUPCCode'))
	  {
	    if(""==LongMessage)
	    {
	      LongMessage=ErOffer035;
	    }
	    else
	     {
	      LongMessage=LongMessage + '\n' + ErOffer035; 
	     }
	  }
	  //Checking against Empty.
	  if(true==IstxtEmpty('txtUPCAmount'))
	  {
	    if(""==LongMessage)
	    {
	     LongMessage=ErOffer036;
	    }
			else if(document.getElementById('txtUPCAmount').value!="")
			{
			    //Checking the Range.
				if(!((0 <= parseFloat(document.all('txtUPCAmount').value)) && (999999.99 >= parseFloat(document.all('txtUPCAmount').value))))
				{
					if(""==LongMessage)
					{
					LongMessage=ErOffer037;
					}
					else
					{
					LongMessage=LongMessage + '\n' + ErOffer037;
					}	
				}
			}	
	    else
	    {
	    LongMessage=LongMessage + '\n' + ErOffer036;
	    }
	  }
	  //If all Validations Pass.
	  if(""==LongMessage)
	  {
	  //Return true.
	   return true;
	  }
	  else
	  {
	   //Set Error Message.
	   SetErrorMessage(ShortMessage,LongMessage);
	   return false;
	  }
	}
	