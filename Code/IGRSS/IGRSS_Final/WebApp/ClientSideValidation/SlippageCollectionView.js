/************************************* Comments ***************************************/

//SlippageCollection View.
//FileName      - SlippageCollectionView.js.
//Purpose       - Javascript validation for SlippageCollectionView.aspx
//Author        : G.Anil Kumar.
//Creation Date : 09-August-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
var Errcode001='\t\t\t\t\t\t\t\tPlease Select Account Name.';
var SaveError="Account Name is Mandatory.";
var Errcode002='\t\t\t\t\t\t\t\tSelect Atleast One Record To Delete.';
//Java Script Function to check Account name is selected from the Account Dropdown list. 
function CheckAccountDDL()
{
 
	//To store the Long message.
	var LongMessage="";
	//To store the short message.
	var ShortMessage=SaveError;
	//If nothing is selected in Account drop down list.
	if(false==IsddlSelected('ddlAccountNumber'))
	{
	     //If Long message is nothing set the Error code Errcode001.
	   
		 if(""==LongMessage)
			{
			   	LongMessage=Errcode001;
			}
		else
			{
			    //If Long Message has something then append the Error code.
				LongMessage=LongMessage + '\n' + Errcode001; 
			} 
			    //Set the focus to Account name drop down list.
				setFocustoControl('ddlAccountNumber');
	}
	
	       //If the Long message is nothing i.e. drop down list values are selected.
			if(""==LongMessage)
			{
 				return true;
			}
			//If the values are not selected.
			else
			{	
				SetErrorMessage(ShortMessage,LongMessage);
				return false;
			}
			
}

//Function to check grid checkboxes.
function CheckGridCheckBoxes()
  {
   //Variable to store Short Message.
		 var Errshtmsg="Delete Fail."; 
         var Errshortmsg=Errshtmsg;
         //Variable to store Long Message.
         var ErrLongmsg="";
         var Checked=false;
         //Regular Expression to check the check box is selected or not.
          re=new RegExp(':chkDelete$')
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