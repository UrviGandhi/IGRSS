
/************************************* Comments ***************************************/

//Default
//FileName      - Rebate.js
//Purpose       - Javascript validation for rebate page.
//Author        : E.Senthil Kumar
//Creation Date : 27-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/

	//On click set the size since b'coz for Error messages it moves the page contents down.
	document.onclick = SetSize;	
	
	/// <summary>
	/// Subroutine to set page size and persist page settings
	/// </summary>
	function onPageLoad()
	{
		//Set page size
		SetSize();
		//Persist page settings
		loadPreferences();
	}	
	
	/// <summary>
	/// Subroutine to set page size. so that scroll bar for div aligned
	/// </summary>	
	function SetSize()
	{
		try
		{
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight+5)))
				document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight+5);
			if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 32)))
				document.all("divRebateFrm").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 32);
				
			//This is for horizontal scroll
			document.all("divRebateFrm").style.width = document.body.clientWidth;
		}
		catch(e)
		{
			//alert(e);
		}
	}			
	
	function RebateAmtCalculation()
	{
		return false;
	}
	
	///<summary>
	///Subroutine to validate the RebateResubmissionTrackcode and Offer Name.
	///</summary>
	function ResubmissionSearch()
	{
		try
		 {
			var ShortMessage="Search Fail.";
			var Errorcode01="Resubmission Trackcode is Mandatory.";
			var Errorcode02="Offer Name is Mandatory.";
			//If the Resubmission Trackcode is Empty.
			if(true==IstxtEmpty('txtResubmissionTrackcode'))
			{
				var LongMessage="";
				if(""==LongMessage)
				{
					LongMessage=Errorcode01;
					setFocustoControl('txtResubmissionTrackcode');
			     }
				else
				{
					LongMessage=LongMessage + '\n' + Errorcode01;
				}
			}
			 
			//If LongMessage is nothing,all the Mandatories are filled return true.
			if(""==LongMessage)
			{
			return true;
			}
			//Display the Error Message both Short and Long Messages.
			else
			{
			SetErrorMessage(ShortMessage,LongMessage);
			return false;
			}
		}
		catch(e)
		 {
		   return true;
		 }
	}
	/// <summary>
	/// Function to validate controls in rebate form against empty and integer,double
	/// </summary>	
	function ValidateRebate()
	{ 
		try
		{
			//Set short message with the error code	
			var ShortMessage=ErRbtSht001;
			//set long message as empty
			var LongMessage="";
			//check textbox store number is empty
			if(true==IstxtEmpty('txtStoreNumber'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal001;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal001;				
				}		
				//set focus on store number
				setFocustoControl('txtStoreNumber');						
			}
			//If store number is not empty
			else
			{
				//check textbox store number is number
				if(false==IsNumeric(document.getElementById('txtStoreNumber').value))
				{
					//check long message is empty
					if(""==LongMessage)
					{
						//set long message
						LongMessage=ErrRbtVal014;
						//set focus on store number
						setFocustoControl('txtStoreNumber');
					}
					//if long message is not empty
					else
					{
						//set longmessage with newline char and long message code
						LongMessage=LongMessage + '\n' + ErrRbtVal014;				
					}			
				}
			}
			
				//check textbox receipt number is number
				if(document.getElementById('txtReceiptNo').value!="")
				{
				if(false==IsNumeric(document.getElementById('txtReceiptNo').value))
				{
					//check long message is empty
					if(""==LongMessage)
					{
						//set long message
						LongMessage=ErrRbtVal015;
						//if receipt number alone is not number then set focus on receipt number
						setFocustoControl('txtReceiptNo');
					}
					//if long message is not empty
					else
					{
						//set longmessage with newline char and long message code
						LongMessage=LongMessage + '\n' + ErrRbtVal015;
					} 
				 }
				 
			    }
			//check textbox purchase date is empty
			//if(true==IstxtEmpty('txtPurchaseDt'))
			//{
			//	//check long message is empty
			//	if(""==LongMessage)
			//	{
			//		//set long message
			//		LongMessage=ErrRbtVal003;
			//		//if purchase date alone empty then set focus on purchase date
			//		setFocustoControl('txtPurchaseDt');
			//	}
			//	//if long message is not empty
			//	else
			//	{
			//		//set longmessage with newline char and long message code
			//		LongMessage=LongMessage + '\n' + ErrRbtVal003;
			//	} 
			//}
			//check textbox first name is empty
			//if(true==IstxtEmpty('txtFirstName'))
			//{
			//	//check long message is empty
			//	if(""==LongMessage)
			//	{
			//		//set long message
			//		LongMessage=ErrRbtVal004;
			//		//if firstname alone empty then set focus on firstname
			//		setFocustoControl('txtFirstName');
			//	}
			//	//if long message is not empty
			//	else
			//	{
			//		//set longmessage with newline char and long message code
			//		LongMessage=LongMessage + '\n' + ErrRbtVal004;
			//	} 
			//}
			//check textbox lastname is empty
			//if(true==IstxtEmpty('txtLastName'))
			//{
			//	//check long message is empty
			//	if(""==LongMessage)
			//	{
			//		//set long message
			//		LongMessage=ErrRbtVal005;
			//		//if lastname alone empty then set focus on lastname
			//		setFocustoControl('txtLastName');
			//	}
			//	//if long message is not empty
			//	else
			//	{
			//		//set longmessage with newline char and long message code
			//		LongMessage=LongMessage + '\n' + ErrRbtVal005;
			//	} 
			//}
			//check textbox appartment number is empty
			if(true==IstxtEmpty('txtAppartmentNo'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal006;
					//if apartment number alone empty then set focus on apartment number
					setFocustoControl('txtAppartmentNo');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal006;
				} 
			}
			//check textbox address1 is empty
			if(true==IstxtEmpty('txtAddress1'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal007;
					//if address1 alone empty then set focus on address1
					setFocustoControl('txtAddress1');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal007;
				} 
			}     
			//check textbox city is empty
			if(true==IstxtEmpty('txtCity'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal008;
					//if city alone empty then set focus on city
					setFocustoControl('txtCity');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal008;
				} 
			}
			//check textbox zip code is empty
			//if(true==IstxtEmpty('txtZipCode'))
			//{
			//	//check long message is empty
			//	if(""==LongMessage)
			//	{
			//		//set long message
			//		LongMessage=ErrRbtVal009;
			//		//if zip code alone empty then set focus on zip code
			//		setFocustoControl('txtZipCode');
			//	}
			//	//if long message is not empty
			//	else
			//	{
			//		//set longmessage with newline char and long message code
			//		LongMessage=LongMessage + '\n' + ErrRbtVal009;
			//	} 
			//}
			//check textbox phone is empty
			if(true==IstxtEmpty('txtPhone'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal010;
					//if phone alone empty then set focus on phone
					setFocustoControl('txtPhone');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal010;
				} 
			}		
			//check textbox email is empty
			if(false==IstxtEmpty('txtEmail'))
			{
				//If email is not valid email(syntatically)
				if(false==IsEmail(document.getElementById('txtEmail').value))
				{
					//check long message is empty
					if(""==LongMessage)
					{
						//set long message
						LongMessage=ErrRbtVal019;
						//if Email alone is not valid then set focus on email
						setFocustoControl('txtEmail');
					}
					//if long message is not empty
					else
					{
						//set longmessage with newline char and long message code
						LongMessage=LongMessage + '\n' + ErrRbtVal019;
					} 
				}
			}		
			//check textbox serial number is empty
			if((false==IstxtEmpty('txtSerialNo')) && (false==IsNumeric(document.getElementById('txtSerialNo').value)))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal016;
					//if serial number alone is not number then set focus on serial number
					setFocustoControl('txtSerialNo');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal016;
				} 
			}
			//check textbox inventory date is empty
			if(true==IstxtEmpty('txtInventoryDt'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
				   alert('anil');
					//set long message
					LongMessage=ErrRbtVal012;
					//if inventory date alone empty then set focus on inventory date
					setFocustoControl('txtInventoryDt');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal012;
				} 
			}
			//check textbox rebate status is empty
			if(false==IsddlSelected('ddlRebateStatus'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal011;
					//if rebate status alone empty then set focus on rebate status
					setFocustoControl('ddlRebateStatus');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal011;
				} 
			}
			//check textbox submission type is empty
			if(false==IsddlSelected('ddlSubmissionType'))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal013;
					//if submission type alone empty then set focus on submission type
					setFocustoControl('ddlSubmissionType');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal013;
				} 
			}
			//check textbox slippage returned amount is not empty and is currency
			if((false==IstxtEmpty('txtSlippageAmtRet')) && (false==IsCurrency(document.getElementById('txtSlippageAmtRet').value)))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal017;
					//if slippage returned amount alone is not currency then set focus on slippage returned amount
					setFocustoControl('txtSlippageAmtRet');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal017;
				} 
			}
			//check textbox amount paid by is not empty and is currency
			if((false==IstxtEmpty('txtAmtPaidBy')) && (false==IsCurrency(document.getElementById('txtAmtPaidBy').value)))
			{
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrRbtVal018;
					//if amount paid by alone not currency then set focus on amount paid by
					setFocustoControl('txtAmtPaidBy');
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrRbtVal018;
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
		catch(e)
		{
			//alert(e);
			return true;
		}
	}
	  
	