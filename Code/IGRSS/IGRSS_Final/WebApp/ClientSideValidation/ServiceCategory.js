/************************************* Comments ***************************************/

//Service Category
//FileName      - ServiceCategory.js
//Purpose       - Javascript validation for ServiceCategory page.
//Author        : N.Rambabu
//Creation Date : 15-May-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Service Category error message
	var ErService001='\t\t\t\t\t\t\t\tService Category is Mandatory. ';
	//Service Category header error message
	var ErServiceSht001="";//'Save Failed. ';
  
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateServiceCategory()
	{
	    if(document.getElementById('txtHiddenServiceCategoryNo').value!=0)
	     {
	       ErServiceSht001='Update Fail. ';
	     }
	     else
	     {
	       ErServiceSht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErServiceSht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtServiceCategory'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErService001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErService001;
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
			document.all("divServiceCategory").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
			//This is for horizontal scroll
			document.all("divServiceCategory").style.width = document.body.clientWidth;
		}
