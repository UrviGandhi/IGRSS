/************************************* Comments ***************************************/

//PrintSlippage Rebates.
//FileName      - Slippage.js.
//Purpose       - Javascript validation for SLippage.aspx
//Author        : G.Anil Kumar.
//Creation Date : 08-August-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
var Errcode001='\t\t\t\t\t\t\t\tPlease Select Atleast One Record To Print.';
var SaveError="Report Generation Fail.";
var Errcode002='\t\t\t\t\t\t\t\tSelect Atleast One Record To Print.';

//Java Script Function to check Account name is selected from the Account Dropdown list. 
//function CheckAccountDDL()
//{
 
	//To store the Long message.
//	var LongMessage="";
	//To store the short message.
//	var ShortMessage=SaveError;
	//If nothing is selected in Account drop down list.
//	if(false==IsddlSelected('ddlAccount'))
//	{
	     //If Long message is nothing set the Error code Errcode001.
	   
//		 if(""==LongMessage)
//			{
//			   	LongMessage=Errcode001;
//			}
//		else
//			{
			    //If Long Message has something then append the Error code.
//				LongMessage=LongMessage + '\n' + Errcode001; 
//			} 
			    //Set the focus to Account name drop down list.
//				setFocustoControl('ddlAccount');
//	}
	
	       //If the Long message is nothing i.e. drop down list values are selected.
//			if(""==LongMessage)
//			{
 //				return true;
//			}
			//If the values are not selected.
//			else
//			{	
//				SetErrorMessage(ShortMessage,LongMessage);
//				return false;
//			}
			
//}

//Function to check whether a record is selected from the Data grid or not.
function SelectCheckBox()
{
   //Variable to store Short Message.
         var Errshortmsg=SaveError;
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
				  ErrLongmsg=Errcode002;
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