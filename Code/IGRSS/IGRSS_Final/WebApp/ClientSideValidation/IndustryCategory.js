
/************************************* Comments ***************************************/

//Industry Category
//FileName      - IndustryCategory.js
//Purpose       - Javascript validation for IndustryCategory page.
//Author        : Rambabu.N.
//Creation Date : 1-june-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Industry Category error message
	var ErIndustryCategory001='\t\t\t\t\t\t\t\tIndustry Category is Mandatory. ';
	//Industry Category header error message
	var ErIndustrySht001="";//'Save Failed. ';
  
	/// <summary>
	/// Function to validate mandatory fields against empty
	/// </summary>
	/// <returns>True if success else false</returns>
	function ValidateIndustryCategory()
	{
	    if(document.getElementById('txtHiddenIndustryCategoryNo').value!=0)
	     {
	       ErIndustrySht001='Update Fail. ';
	     }
	     else
	     {
	       ErIndustrySht001='Save Fail. ';
	     }
		//Set short message with the error code	
		var ShortMessage=ErIndustrySht001;
		//set long message as empty
		var LongMessage="";
		//check textbox login name is empty
		if(true==IstxtEmpty('txtIndustryCategory'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErIndustryCategory001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErIndustryCategory001;
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
			document.all("divIndustryCategory").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
			//This is for horizontal scroll
			document.all("divIndustryCategory").style.width = document.body.clientWidth;
		}
