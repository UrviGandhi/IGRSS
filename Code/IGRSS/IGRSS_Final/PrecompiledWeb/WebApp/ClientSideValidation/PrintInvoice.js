/************************************* Comments ***************************************/

//Common
//FileName      - PrintInvoice.js
//Purpose       - Javascript function which is used to validate the Checkbox in PrintInvoice.js
//Author        : G.Anil Kumar.
//Creation Date : 05-July-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/****************************************************************************************/
var Err001='\t\t\t\t\t\t\t\tPlease Select At Least One Invoice to Generate Report.';
var Err000='Report Generation Fail.';
	function SelectCheckbox()
	{
	     //Variable to store Short Message.
         var Errshortmsg=Err000;
         //Variable to store Long Message.
         var ErrLongmsg="";
         var Checked=false;
         //Regular Expression to check the check box is selected or not.
          re=new RegExp(':chkSelect$')
          //This method is used to Check whether the Check box is Checked in the grid or not.
          for(i = 0; i < document.forms[0].elements.length; i++)
          {
         		ele=document.forms[0].elements[i];
				if (ele.type == 'checkbox') 
				{
						if (re.test(ele.name)) 
						{
							if(true==ele.checked)
							Checked=true;
						}
				}
				
          }
				//If the check box is not checked set the Error code as Err001.
				if(false==Checked)
				{
				  ErrLongmsg=Err001;
				}
				//If the Error message is nothing i.e. atleast one check box selected.
					if(""==ErrLongmsg)
					{
					return true;
					}
					else
					{
						SetErrorMessage(Errshortmsg,ErrLongmsg);
						return false;
					}		
	}
	
	//This function is used to check whether all check boxes are selected.
	function CheckAll(checkAllBox)
	 {
			re=new RegExp(':' + aspCheckBoxID + '$')
			for(i = 0; i < document.forms[0].elements.length; i++) 
			{
				elm = document.forms[0].elements[i];
				if (elm.type == 'checkbox') 
				{
					if (re.test(elm.name)) 
					{
						elm.checked = checkVal
					}
				}
			}
     } 