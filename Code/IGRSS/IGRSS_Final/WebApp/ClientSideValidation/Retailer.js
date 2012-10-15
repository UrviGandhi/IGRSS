
/************************************* Comments ***************************************/

//Retailer
//FileName      - Retailer.js
//Purpose       - Javascript validation for Retailer page.
//Author        : N.Rambabu
//Creation Date : 12-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Retailer error message
	var ErRetailer001='\t\t\t\t\t\t\t\tName is Mandatory. ';
	var ErRetailer002='\t\t\t\t\t\t\t\tAddress1 is Mandatory. ';
	var ErRetailer003='\t\t\t\t\t\t\t\tZipCode is Mandatory. ';
	//login header error message
	 var ErRetailersht001="";//'Save Failed. ';
    /// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateRetailer()
	{
	    //alert(document.getElementById('txtHiddenRetailerNo').value);
		if(document.getElementById('txtHiddenRetailerNo').value!=0)
	     {
	       ErRetailersht001='Update Fail. ';
	     }
	     else
	     {
	       ErRetailersht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErRetailersht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		
	  
		if(true==IstxtEmpty('txtRetailerName'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRetailer001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRetailer001;
			}			
		}
		if(true==IstxtEmpty('txtAddress1'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRetailer002;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRetailer002;
			}			
		}
		if(true==IstxtEmpty('txtZipCode'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErRetailer003;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErRetailer003;
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
			if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
					document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
				if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
				document.all("divRetailer").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
				 
				//This is for horizontal scroll
				document.all("divRetailer").style.width = document.body.clientWidth;
		}