
/************************************* Comments ***************************************/

//Pricing
//FileName      - Pricing.js
//Purpose       - Javascript validation for Pricing page.
//Author        : N.Rambabu
//Creation Date : 12-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Pricing error message
	var ErPricingElement001='\t\t\t\t\t\t\t\tPricing Element is Mandatory. ';
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
	function ValidatePricing()
	{
	    if(document.getElementById('txtHiddenPricingElementNo').value!=0)
	     {
	       ErPricingSht001='Update Fail. ';
	     }
	     else
	     {
	       ErPricingSht001='Save Fail. ';
	     }
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
		/*if(true==IstxtEmpty('txtFee'))
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
		else if(!((0 <= parseFloat(document.all('txtFee').value)) && (99999999.99 >= parseFloat(document.all('txtFee').value))))
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
	
	/*function ValidateFee()
	{
	    
		//set long message as empty
		var LongMessage="";
		var ShortMessage=ErPricingSht002;
	  
	  if(false==IsCurrency(document.getElementById('txtFee').value))
	  {
	             
	             //set long message
				LongMessage=ErPricingElement003;
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
			document.getElementById('txtFee').value="";			
			//validation failure
			return false;
		}
	}*/
	function onPageLoad()
	{
		//Set page size
		SetSize()
	}
	/// <summary>
	/// Set the page size here.
	/// </summary>
	
	function SetSize()
		{
		    
		if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight)))
			document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight);
		if(0 < (document.all("tblContent").height - (25)))
			document.all("divPricing").style.height = document.all("tblContent").height - (25);
			
		//This is for horizontal scroll
		document.all("divPricing").style.width = document.body.clientWidth;
			
		//if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
		//	document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
		//if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
		//	document.all("divPricing").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
			
		//This is for horizontal scroll
		//document.all("divPricing").style.width = document.body.clientWidth;
            
		}