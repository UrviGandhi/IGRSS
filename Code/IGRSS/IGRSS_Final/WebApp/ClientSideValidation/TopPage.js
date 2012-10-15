/************************************* Comments ***************************************/

//TopPage
//FileName      - TopPage.js
//Purpose       - Javascript validation for Top page (Header user control).
//				  Hide and show the error contents.
//Author        : E.Senthil Kumar
//Creation Date : 09-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/****************************************************************************************/

	/// <summary>
	/// Subroutine to hide error containers
	/// </summary>
	/// <param name="TableID">Table id which contains error message label,error icon</param>
	/// <param name="txtShowErrorID">hidden input id which contain boolean to hide</param>
	function HideErrorContent(TableID,txtShowErrorID)
	{ 
		//check hidden control. if false then hide
		if("False"==document.getElementById(txtShowErrorID).value)
		{
			//hide the table which contains error containers
			document.getElementById(TableID).style.display='none';
		}
	} 
	
	
	/// <summary>
	/// Subroutine to set error message on toppage
	/// </summary>
	/// <param name="ShortMessage">short error message (message header)</param>
	/// <param name="LongMessage">Long error message. detailed description of error</param>
	function SetErrorMessage(ShortMessage,LongMessage)
	{
		//By default toppage id is 'RPSTopPage'. call overloaded function with default toppageid
		SetErrormessage(ShortMessage,LongMessage,'RPSTopPage');	
	}
	
	/// <summary>
	/// Subroutine to set error message on toppage
	/// </summary>
	/// <param name="ShortMessage">short error message (message header)</param>
	/// <param name="LongMessage">Long error message. detailed description of error</param>
	/// <param name="TopPageID">Toppageid in the form</param>
	function SetErrormessage(ShortMessage,LongMessage,TopPageID)
	{
		//set showerror hidden input box with boolean true			
		document.getElementById(TopPageID + '_' + 'txtShowError').value='True';
		//set table error container visibility true
		document.getElementById(TopPageID + '_' + 'tblError').style.display='block';
		//set error icon visibility true
		document.getElementById(TopPageID + '_' + 'imgErrorIcon').style.display='block';
		//if long message is empty
		if(""==LongMessage)
		{
			//set '+' image visibility false
			document.getElementById(TopPageID + '_' + 'imgErrorMessage').style.display='none';
		}
		//if long message is not empty
		else
		{
			//set '+' image visibility true
			document.getElementById(TopPageID + '_' + 'imgErrorMessage').style.display='block';
		}
		//set short message on shortmessage container
		document.getElementById(TopPageID + '_' + 'txtShortErrorMessage').value=ShortMessage;
		//set long message on longmessage container
		document.getElementById(TopPageID + '_' + 'lblErrorMessage').innerText=LongMessage;			
	}
	
	
	
	
	
	
	
	
	
	
	