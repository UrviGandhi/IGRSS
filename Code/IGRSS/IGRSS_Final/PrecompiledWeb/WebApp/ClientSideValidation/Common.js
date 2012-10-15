/************************************* Comments ***************************************/

//Common
//FileName      - Common.js
//Purpose       - Javascript function which is common to all page (IsEmpty,IsDate,IsNumber)  .
//				  Error Message collection for all page
//Author        : E.Senthil Kumar
//Creation Date : 09-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/****************************************************************************************/

	//debugger;
	
/************************************* Error Codes **************************************/
	//Space needs for alignment	
	var ErTab='\t\t\t\t\t\t\t\t'
	//Popup window which is going to show first image
	var PopUpImageWindowInClient;
	//Popup window which is going to show second image
	var PopUpImageWindowInClient1;
	
	/************** Login Screen ****************/
	
	//login user name error message
	var ErLgnUsr001=ErTab + 'User Name is empty. '
	//login user password error message
	var ErLgnPwd001=ErTab + 'Password is empty. ';
	//login header error message
	var ErLgnSht001='Login Fail. ';
	
	/*********************************************/
	
	/************** System Defaults ****************/

	var ErGblLng001=ErTab + 'Close Offers After should be numeric value. ';
	
	var ErGblLng002=ErTab + 'Credit Hold should be numeric value. ';

	var ErGblSht001='Validation Fail. ';
	
	/*********************************************/
	
	/************** Check List ****************/

	var ErChkLstLng001=ErTab + 'Please give check number. ';
	
	var ErChkLstLng002=ErTab + 'Please give valid check number. ';

	var ErChkLstLng003=ErTab + 'Please give [from] check number. ';
	
	var ErChkLstLng004=ErTab + 'Please give valid [from] check number. ';

	var ErChkLstLng005=ErTab + 'Please give [to] check number. ';
	
	var ErChkLstLng006=ErTab + 'Please give valid [to] check number. ';
	
	var ErChkLstLng007=ErTab + 'Please select an account. ';
	
	var ErChkLstLng008=ErTab + 'Please select an offer. ';
	
	var ErChkLstSht001='Generate Checks Fail. ';
	
	var ErChkLstSht002='Print Checks Fail. ';
	
	/*********************************************/
	
	/************** System Defaults ****************/

	var ErRbtVwLng001=ErTab + ErChkLstLng007;
	
	var ErRbtVwLng002=ErTab + ErChkLstLng008;

	var ErRbtVwLng003=ErTab + 'Please select atleast one rebate to delete. ';

	var ErRbtVwSht001='Delete Fail. ';
	
	/*********************************************/

	/************** Rebate Form ****************/
	
	var ErrRbtVal001=ErTab + 'Please give StoreNumber';
	
	var ErrRbtVal002=ErTab + 'Please give ReceiptNumber';
	
	var ErrRbtVal003=ErTab + 'Please give PurchaseDate';
	
	var ErrRbtVal004=ErTab + 'Please give FirstName';
	
	var ErrRbtVal005=ErTab + 'Please give LastName';
	
	var ErrRbtVal006=ErTab + 'Please give ApartmentNumber';
	
	var ErrRbtVal007=ErTab + 'Please give Address1';
	
	var ErrRbtVal008=ErTab + 'Please give City';
	
	var ErrRbtVal009=ErTab + 'Please give ZipCode';
	
	var ErrRbtVal010=ErTab + 'Please give PhoneNumber';
	
	var ErrRbtVal011=ErTab + 'Please select RebateStatus';
	
	var ErrRbtVal012=ErTab + 'Please give InventoryDate';
	
	var ErrRbtVal013=ErTab + 'Please select SubmissionType';		
	
	
	var ErrRbtVal014=ErTab + 'Please check Store Number';
	
	var ErrRbtVal015=ErTab + 'Please check Receipt Number';
	
	var ErrRbtVal016=ErTab + 'Please check Serial Number';
	
	var ErrRbtVal017=ErTab + 'Please check Slippage Amount Returned';
	
	var ErrRbtVal018=ErTab + 'Please check Amount paid by Consumer';	

	var ErrRbtVal019=ErTab + 'Please Enter valid email Address';
	
	var ErRbtSht001='Save Fail. ';
	
	/*********************************************/
	/****************Variables*********************/
	var hiddenTextBox='RPSTopPage_txtPreferences';	
	var arrayOfUserPreferences;
	/**********************************************/
	
/****************************************************************************************/
	
/************************************* Functions **************************************/	
	
	/// <summary>
	/// Function to validate textbox value against empty
	/// </summary>
	/// <param name="CntrlID">textbox client id</param>
	/// <returns>true if empty else false</returns>
	function IstxtEmpty(CntrlID)
	{
		//check textbox value against empty
		if (""==document.getElementById(CntrlID).value)
		{
			//control is empty
			return true;
		}
		//control is not empty
		return false;
	}
	
	/// <summary>
	/// Function to validate Label value against empty
	/// </summary>
	/// <param name="CntrlID">Label client id</param>
	/// <returns>true if empty else false</returns>
	function IslblEmpty(CntrlID)
	{
		//check textbox value against empty
		if (""==document.getElementById(CntrlID).innerText)
		{
			//control is empty
			return true;
		}
		//control is not empty
		return false;
	}
	
	/// <summary>
	/// Function to validate dropdownlist value against selected
	/// </summary>
	/// <param name="CntrlID">Drop downlist client id</param>
	/// <returns>true if selected value is greated than 0 else false</returns>
	function IsddlSelected(CntrlID)
	{		
		try
		{
			//Check dropdown list selected value against empty
			if (document.getElementById(CntrlID).options[document.getElementById(CntrlID).selectedIndex].value>0)
			{
				//Control is empty(selected index not greater than 0)
				return true;
			}
			//control is not empty
			return false;
		}
		catch(e)
		{
			//alert(e);
			return false;
		}
	}
	
	/// <summary>
	/// Function to validate dropdownlist value against selected
	/// </summary>
	/// <param name="CntrlID">Drop downlist client id</param>
	/// <param name="itemValue">The value should not be selected</param>
	/// <returns>true if selected value is greated than 0 else false</returns>
	function Isddlselected(CntrlID,itemValue)
	{		
		//Check dropdown list selected value against empty
		if (itemValue==document.getElementById(CntrlID).options[document.getElementById(CntrlID).selectedIndex].value)
		{
			//Control is empty(selected index is not equal to itemValue)
			return true;
		}
		//control is not empty
		return false;
	}
	
	/// <summary>
	/// Function to check string value against (signed) integer.
	/// </summary>
	/// <param name="strNumberValue">string value needs to be validated</param>
	/// <returns>True if integer else false</returns>
	function IsNumeric(strNumberValue)
	{
		//possible integer numbers
		var ValidChars = "0123456789";
		//By default consider the argument is number
		var IsNumber=true;
		//test string argument char by char
		var Char; 
		//loop till the string length and its char is number
		for (i = 0; i < strNumberValue.length && IsNumber == true; i++) 
		{ 
			//get char value of string at index i
			Char = strNumberValue.charAt(i); 
			//check first character for minus sign
			if ((i == 0) && (Char == "-")) 
				continue;
			//if any char other than validchars present
			if (ValidChars.indexOf(Char) == -1) 
			{
				//set the argument is not number
				IsNumber = false;
			}
		}
		//return the boolean
		return IsNumber;	
	}
	
	/// <summary>
	/// Function to check string value against (double) currency.
	/// </summary>
	/// <param name="strCurrencyValue">string value needs to be validated</param>
	/// <returns>True if currency(double) else false</returns>
	function IsCurrency(strCurrencyValue)
	{
		//possible integer numbers
		var ValidChars = "0123456789.";
		//By default consider the argument is number
		var IsNumber=true;
		//test string argument char by char
		var Char;
		//loop till the string length and its char is number
		var Dot=false; 
		for (i = 0; i < strCurrencyValue.length && IsNumber == true; i++) 
		{ 
			//get char value of string at index i
			Char = strCurrencyValue.charAt(i); 
			//check first character for minus sign
			if ((i == 0) && (Char == "-")) 
				continue;			
			//check for dot availablity more than once
			if(("."==Char) && (true==Dot))
				IsNumber = false;
			//check dot availablity
			if("."==Char)
				Dot=true;
			//if any char other than validchars present
			if (ValidChars.indexOf(Char) == -1) 
			{
				//set the argument is not number
				IsNumber = false;
			}
		}
		//return the boolean
		return IsNumber;	
	}	
	 
	/// <summary>
	/// Function to validate date input
	/// </summary>
	/// <param name="day">Integer representing day of month</param>
	/// <param name="month">Integer representing month of year</param>
	/// <param name="year">Integer representing year</param>
	/// <returns>true if the date is valid, false otherwise</returns>
	function IsDate(day,month,year)
	{
		//set up a Date object based on the day, month and year arguments
		var dteDate;		
		//javascript months start at 0 (0-11 instead of 1-12)
		month=month-1;
		dteDate=new Date(year,month,day);
		//logic will return true if the passed date is valid
		return (day==dteDate.getDate()) && (month==dteDate.getMonth()) && (year==dteDate.getFullYear());
	} 
 
	/// <summary>
	/// Function to check the email syntax
	/// </summary>
	/// <param name="strEmail">string Email needs to be validated</param>
	/// <returns>true if the syntax is correct else false</returns>
	function IsEmail(strEmail)
	{
		//Filter the .,@ from string source
		var emailFilter=/^.+@.+\..{2,3}$/;
		//Test against the filter
		if (!(emailFilter.test(strEmail))) 
		{ 
			//Validation fails
			return false;
		}    
		/*
		var illegalChars= /[\(\)\<\>\,\;\:\\\/\#\[\]]/    
		if (strEmail.match(illegalChars)) 
		{
			  return false
		}
		*/
		//validation succeed
		return true;
	}

	/**************************** Implementing impose maxlength and truncatebriefdesc function *******************/
	/**********VB************
	Private Sub imposeMaxLengthAttribute(ByRef txtFields As TextBox, ByVal MaxLength As Integer)
        txtFields.Attributes.Add("onkeypress", "return imposeMaxLength(this," + MaxLength.ToString + ");")
        txtFields.Attributes.Add("onbeforepaste", "return imposeMaxLength(this," + MaxLength.ToString + ");")
        txtFields.Attributes.Add("onpaste", "return imposeMaxLength(this," + MaxLength.ToString + ");")
        txtFields.Attributes.Add("onblur", "truncateBriefDesc(this," + MaxLength.ToString + ");")
    End Sub
    */
    /**********C#************
    private void imposeMaxLengthAttribute(ref TextBox txtFields,int MaxLength)
	{
		txtFields.Attributes.Add("onkeypress", "return imposeMaxLength(this," + MaxLength.ToString() + ");");
		txtFields.Attributes.Add("onbeforepaste", "return imposeMaxLength(this," + MaxLength.ToString() + ");");
		txtFields.Attributes.Add("onpaste", "return imposeMaxLength(this," + MaxLength.ToString() + ");");
		txtFields.Attributes.Add("onblur", "truncateBriefDesc(this," + MaxLength.ToString() + ");");
	}  
    */
    /**************************************************************************************************************/
 
	/// <summary>
	/// Function to allow user to paste maxlength character in textbox
	/// </summary>
	/// <param name="oTxtBox">object of textbox</param>
	/// <param name="MaxLen">Maximum allowed length in that textbox</param>
	/// <returns>False if length greater than maxlen else true</returns>
	function imposeMaxLength(oTxtBox, MaxLen)
	{
		return (oTxtBox.value.length <= MaxLen);
	}

	/// <summary>
	/// Function to allow user to enter till max length
	/// </summary>
	/// <param name="oTxtBox">object of textbox</param>
	/// <param name="MaxLen">Maximum allowed length in that textbox</param>
	function truncateBriefDesc(oTxtBox,MaxLen)
	{
		//if textbox text length is greater than max len
		if (oTxtBox.value.length > MaxLen)
		{
			//set current value into a temp container
			desc = oTxtBox.value;
			//trucate the value till the maxlen and reset the value in textbox
			oTxtBox.value = desc.substring(0,MaxLen);
		}
	}
	
	/// <summary>
	/// Subroutine to expand collapse long error message
	/// Replace the '+' image with '-' image and vice versa on successive clicks
	/// </summary>
	/// <param name="what">image control needs to be show (plus and minus)</param>	
	function explode(what)
	{ 
		//set image id to whichimg variable
		whichimg = what.id;		
		//change the image id into table row id
		whichimg = whichimg.replace('img','tr');
		//if current image name is minus then show minus else hide minus
		what.name == 'minus'?document.all(whichimg).style.display='none':document.all(whichimg).style.display='block';
		//if current image name is minus then image source is plus else minus		
		what.name == 'minus'?what.src = '../Image/plus.gif':what.src = '../Image/minus.gif';
		//if image name is minus then rename it into plus else viceversa
		what.name == 'minus'?what.name = 'plus':what.name='minus';
		setUserPreferences(whichimg);
	}

	/// <summary>
	/// Subroutine to expand collapse long error message
	/// Replace the '+' image with '-' image and vice versa on successive clicks
	/// </summary>
	/// <param name="what">image control needs to be show (plus and minus)</param>	
	function explodeTbl(what)
	{  
		//set image id to whichimg variable
		whichimg = what.id;		
		//change the image id into table row id
		whichimg = whichimg.substring(3,whichimg.length);
		whichimg='tbl' + whichimg;
		//if current image name is minus then show minus else hide minus
		what.name == 'minus'?document.all(whichimg).style.display='none':document.all(whichimg).style.display='block';
		//if current image name is minus then image source is plus else minus		
		what.name == 'minus'?what.src = '../Image/plus.gif':what.src = '../Image/minus.gif';
		//if image name is minus then rename it into plus else viceversa
		what.name == 'minus'?what.name = 'plus':what.name='minus';
		setUserPreferences(whichimg);
	}	
	
	/// <summary>
	/// needs to replace with previous function
	/// </summary>
	function explodeSection(what)
	{ 
		explodeTbl(what);		
	}
	
	/// <summary>
	/// Set user preferences. persist viewed div and closed div
	/// <Param Name="tableName">Table which contains div contents</Param>
	/// </summary>
	function setUserPreferences(tableName)
	{
		if(null!=arrayOfUserPreferences)
		{
			//Reset string user preferences
			strUserPreferences="";
			//Set found expanded table as 0
			var bfound = 0;
			//Loop till expanded table number
			for (var i=0; i < arrayOfUserPreferences.length; i++)
			{
				//If expanded table is the current table
				if(arrayOfUserPreferences[i] != tableName)
				{
					//If string user preferences length is not equal to zero
					if (strUserPreferences.length != 0) 
						strUserPreferences = strUserPreferences + "|" + arrayOfUserPreferences[i];
						//If string user preferences length is equal to zero
					else
						strUserPreferences =  arrayOfUserPreferences[i] ;
				}
					//If expanded table is not the current table
				else
					bfound = 1;
			}
			//If expanded table count is zero
			if (bfound == 0)
			{ 
				//If string user preferences length is not equal to zero
				if (strUserPreferences.length != 0 )
					strUserPreferences = strUserPreferences + "|" + tableName;
					//If string user preferences length is equal to zero
				else
					strUserPreferences = tableName;
			}
			//If expanded table count is equal to 1 and current table is visible
			if ((bfound == 1) && (document.all(tableName).style.display == 'block') )
			{ 
			//alert();
				//If string user prefernces length is not equal to zero
				if (strUserPreferences.length != 0 )
					strUserPreferences = strUserPreferences + "|" + tableName;
					//If string user prefernces length is equal to zero
				else
					strUserPreferences = tableName;
			}		
			arrayOfUserPreferences = strUserPreferences.split("|");
			//Set user preferences in textbox
			document.all(hiddenTextBox).value = strUserPreferences;
		}
	}

	/// <summary>
	/// Load User Preferences. Maintain viewed div	
	/// </summary>	
	function loadPreferences()
	{
		//Get user prefernces from hidden box
		strUserPreferences = document.all(hiddenTextBox).value;
		//Split and get array of preferences
		arrayOfUserPreferences = strUserPreferences.split("|");
		//Loop till array length
		for (var i=0; i < arrayOfUserPreferences.length; i++)
		{//alert(arrayOfUserPreferences[i]);
			whichimg = arrayOfUserPreferences[i];
			//If user preference is not empty
			if(whichimg != "")
			{
				//Set visibility of the div content true
				document.all(whichimg).style.display='block';
				//to hold the corresponding image.
				var whichimgA;
				//if content id starts with "tbl"
				if('tbl'==whichimg.substring(0,3))
				{
					whichimgA = whichimg.substring(3,whichimg.length);
					//if content id starts with "tr"
				}
				else
				{
					//for change of image i.e,. plus to minus and vice-versa
					whichimgA = whichimg.substring(2,whichimg.length);
				}
				//Get 'which' img
				whichimgA = document.all("img" + whichimgA);
				//if image is not null
				if(null!=whichimgA)
				{
					//Set whichimg name as minus
					whichimgA.name = 'minus';
					//Set whichimg source
					whichimgA.src = '../Image/minus.gif';
				}
				//else set the table visibility to false
				else
				{
					//Set visibility of the div content false
					document.all(whichimg).style.display='none';
				}
			}
		}
	}
	
	/// <summary>
	/// Function to check all, uncheck all checkboxes in datagrid
	/// call function at html header checkbox onclick="CheckAllDataGridCheckBoxes('chkSelect',this.checked)
	/// chkSelect is the item template webcontrol checkbox id.
	/// <param name="htmlHeaderCheckBoxID">Html input (type checkbox) id in header</param>
	/// <param name="CheckedValue">if true all the checkboxes will be checked else unchecked</param>
	/// </summary>	
	function CheckAllDataGridCheckBoxes(htmlHeaderCheckBoxID, CheckedValue) 
	{
		//generated control	name starts with a colon
		re = new RegExp(':' + htmlHeaderCheckBoxID + '$') 
		//Loop till document element length
		for(i = 0; i < document.forms[0].elements.length; i++) 
		{
			//Select element
			elm = document.forms[0].elements[i]
			//If element type is checkbox
			if (elm.type == 'checkbox') 
			{
				//If element name belongs to datagrid
				if (re.test(elm.name)) 
				{
					//Set element with checked value
					elm.checked = CheckedValue;
				}
			}
		}
	}
	
	/// <summary>
	/// Subroutine to set focus on the control
	///	<param name="ControlID">Control id in which focus needs to be made</param>
	/// </summary>
	function setFocustoControl(ControlID)
	{
		try
		{
			//Set focus on the control
			document.getElementById(ControlID).focus();
		}
		catch(e)
		{
			//alert(e);
			//While exception do nothing
		}	
	}
	
	/// <summary>
	/// Subroutine to popup rebate image while clicking thumnail image
	/// </summary>	
	/// <param name="img">Image path</param>
	/// <param name="Height">Height of the page</param>
	/// <param name="Width">Width of the page</param>
	function LoadImg(Img,Height,Width)
	{
		//If popup window is still opened
		if(null!=PopUpImageWindowInClient)
		{
			//Close popup window
			PopUpImageWindowInClient.close();
		}		
		PopUpImageWindowInClient=window.open(Img,'_blank','height=' + Height + ',width=' + Width + ',top=5,left=5,channelmode=0,fullscreen=0,directories=0,status=no,location=0,resizable=1,titlebar=0,menubar=no,toolbar=no',false); 
	}
	
	/// <summary>
	/// Subroutine to popup rebate image while clicking thumnail image
	/// </summary>	
	/// <param name="img">Image path</param>
	/// <param name="Height">Height of the page</param>
	/// <param name="Width">Width of the page</param>
	function LoadImg1(Img,Height,Width)
	{
		//If popup window is still opened
		if(null!=PopUpImageWindowInClient1)
		{
			//Close popup window
			PopUpImageWindowInClient1.close();
		}		
		PopUpImageWindowInClient1=window.open(Img,'_blank','height=' + Height + ',width=' + Width + ',top=5,left=5,channelmode=0,fullscreen=0,directories=0,status=no,location=0,resizable=1,titlebar=0,menubar=no,toolbar=no',false); 
	}	
	
	/// <summary>
	/// Subroutine to close opened popup rebate image
	/// </summary>
	function onPageClose()
	{
		//If popup window is still opened
		if(null!=PopUpImageWindowInClient)
		{
			//Close popup window
			PopUpImageWindowInClient.close();
		}
	}
	
/****************************************************************************************/