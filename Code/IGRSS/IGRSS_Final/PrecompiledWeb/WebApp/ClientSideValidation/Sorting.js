
/************************************* Comments ***************************************/

//Sorting
//FileName      - Sorting.js
//Purpose       - Javascript validation for Sorting page.
//Author        : G.AnilKumar
//Creation Date : 22-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Sorting error message codes for the Mandatory fields.
    var ErrSorting000='\t\t\t\t\t\t\t\tAWBNumber is Mandatory.';
	var ErrSorting001='\t\t\t\t\t\t\t\tQuantity is Mandatory.';
	var ErrSorting002='\t\t\t\t\t\t\t\tSorting Date is Mandatory.';
	var ErrSorting003='\t\t\t\t\t\t\t\tTray Number is Mandatory.';
	var ErrSorting004='\t\t\t\t\t\t\t\tQuantity should be Numeric.';
	var ErrSorting005='\t\t\t\t\t\t\t\tOffer is Mandatory.';
	var ErrSorting006='\t\t\t\t\t\t\t\tAccount is Mandatory.';
	var ErrSorting007='\t\t\t\t\t\t\t\tReceipt Date is Mandatory.';
	//Setting code for Save Failed message.
	var saveErr001;//='Save Failed.';
	var updateErr001='Validation Fail.';
	
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	
	function SortingValidate()
	{
	  if(document.getElementById('txtHiddenSortingNo').value!=0)
	  {
	    saveErr001='Update Fail.';
	  }
	  else
	  {
	   saveErr001='Save Fail.';
	  }
		//Set short message with the Save error code	
		var ShortMessage=saveErr001;
		//set long message as empty
		var LongMessage="";
		//check AWBNumber dropdownlist is empty
		if(false==IsddlSelected('ddlShipmentNumber'))
		{
		  //Check LongMessage is Empty or not.
		  if(""==LongMessage)
		  {
		  //If Empty add to long message.
		  LongMessage=ErrSorting000;
		  }
		  else
		  {
		  //Append to LongMessage.
		    LongMessage=LongMessage + '\n' + ErrSorting000;
		  }
		}
		if(true==IstxtEmpty('txtQuantity'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrSorting001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrSorting001;
			}			
		}
		else
		{
		  //Checking the Quantity field is numeric or not.
		  if(document.getElementById('txtQuantity').value!="")
		  {
		  if(false==Isnumeric(document.getElementById('txtQuantity').value))
		  {
		    //alert();
		    //Check the Long message whether it is empty or not. 
		    if(""==LongMessage)
		    {
		    //If the Long message is empty then assign the message code to LongMessage.
		      LongMessage=ErrSorting004;
		    }
		    else
		    {
		    //Append the message code to LongMessage. 
		      LongMessage=LongMessage+ '\n' + ErrSorting004;
		    }
		   }
		   }
		}
		//Check Account dropdownlist is empty
		if(false==IsddlSelected('ddlAccount'))
		{
		    //Check LongMessage is empty or not.
			if(""==LongMessage)
			{
			 //If Longmessage is nothing add Error code.
			 LongMessage=ErrSorting006;
			}
			else
			{
			 //Else Append Error code to LongMessage.
			 LongMessage=LongMessage + '\n' + ErrSorting006;
			}
		}
		if(true==IstxtEmpty('txtTrayNumber'))
		{
		   //check long message is empty
		   if(""==LongMessage)
		   {
		    //set long message
		    LongMessage=ErrSorting003;
		   }
		   //if long message is empty
		   else
		   {
		     //set longmessage with newline char and long message code
		     LongMessage=LongMessage + '\n' + ErrSorting003;
		   }
		}
		
		if(true==IstxtEmpty('txtSortingDate'))
		{
		   //check long message is empty
		   if(""==LongMessage)
		   {
		     //set Error code to Long message
		     LongMessage=ErrSorting002; 
		   }
		   //if long message is not empty
		   else
		   {
		   //set longmessage with newline char and long message code
		     LongMessage=LongMessage + '\n' + ErrSorting002;
		   }
		}
		
		//If the selected offer is nothing.
		if(false==IsddlSelected('ddlOffer'))
		{
		   //Check the LongMessage for Empty.
		   if(""==LongMessage)
		   {
		     //If the LongMessage is Empty then assign this Error code. 
		     LongMessage=ErrSorting005;
		   }
		   //Append the Error code to the LongMessage.
		   else
		   {
		    LongMessage=LongMessage + '\n' + ErrSorting005;
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
	