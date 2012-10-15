/************************************* Comments ***************************************/

//SalesRep Object
//FileName      - SalesRep.js
//Purpose       - Javascript validation for SalesRep page.
//Author        : N.Rambabu
//Creation Date : 13-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Retailer error message
	var ErSalesRep001='\t\t\t\t\t\t\t\tName is Mandatory. ';
	var ErSalesRep002='\t\t\t\t\t\t\t\tAddress1 is Mandatory. ';
	var ErSalesRep003='\t\t\t\t\t\t\t\tZipCode is Mandatory. ';
	var ErSalesRep004='\t\t\t\t\t\t\t\tHomePhone is Mandatory. ';
	var ErSalesRepEmail005='\t\t\t\t\t\t\t\tCheck EmailId Syntax. ';
	var ErSalesRepHomePhone006="\t\t\t\t\t\t\t\tPhone Number Should Not be < 11";
	
	//SalesRep header error message
	var ErSalesRepsht001="";//'Save Failed. ';
	var ErSalesRepsht002='Validation Fail. ';
	
  
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateSalesRep()
	{
	    if(document.getElementById('txtHiddenSalesRepNo').value!=0)
	     {
	       ErSalesRepsht001='Update Fail. ';
	     }
	     else
	     {
	       ErSalesRepsht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErSalesRepsht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		
		if(true==IstxtEmpty('txtSalesRepName'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErSalesRep001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErSalesRep001;
			}			
		}
		if(true==IstxtEmpty('txtAddress1'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErSalesRep002;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErSalesRep002;
			}			
		}
		if(true==IstxtEmpty('txtZipCode'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErSalesRep003;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErSalesRep003;
			}			
		}
		
		if(true==IstxtEmpty('txtHomePhone'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErSalesRep004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErSalesRep004;
			}			
		}
	    if(false==IstxtEmpty('txtEmail'))
	    {
		 if(false==IsEmail(document.getElementById('txtEmail').value))
	     {
	            if(""==LongMessage)
			{
				//set long message
				LongMessage=ErSalesRepEmail005;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErSalesRepEmail005;
			}	 
	             //set long message
				//LongMessage=ErSalesRepEmail005;
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
	function ValidEmailId()
	{
	    
		//set long message as empty
		var LongMessage="";
		var ShortMessage=ErSalesRepsht002;
	  
	  if(false==IsEmail(document.getElementById('txtEmail').value))
	  {
	             
	             //set long message
				LongMessage=ErSalesRepEmail005;
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
	function CheckHomePhone()
	{
	  var LongMessage="";
	  var ShortMessage=ErSalesRepsht002;
	  if(document.getElementById('txtHomePhone').value<10)
	  {
	     LongMessage=ErSalesRepHomePhone006;
	     document.getElementById('txtHomePhone').focus();
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
	function CheckWorkPhone()
	{
	  var LongMessage="";
	  var ShortMessage=ErSalesRepsht002;
	 if(document.getElementById('txtWorkPhone').value<10)
	  {
	     LongMessage=ErSalesRepHomePhone006;
	     document.getElementById('txtWorkPhone').focus();
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
	//Function to Check CellPhone
	function CheckCellPhone()
	{
	  var LongMessage="";
	  var ShortMessage=ErSalesRepsht002;
	  if(document.getElementById('txtCellPhone').value<10)
	  {
	     LongMessage=ErSalesRepHomePhone006;
	     document.getElementById('txtCellPhone').focus();
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
		if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 30)))
		document.all("divSalesRep").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 30);
			
		//This is for horizontal scroll
		document.all("divSalesRep").style.width = document.body.clientWidth;
			
		}
