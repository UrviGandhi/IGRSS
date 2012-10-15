/************************************* Comments ***************************************/

//PrintInvoiced Rebates.
//FileName      - PrintInvoicedRebates.js.
//Purpose       - Javascript validation for PrintInvoicedRebates.
//Author        : G.Anil Kumar.
//Creation Date : 05-July-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
var Errcode001='\t\t\t\t\t\t\t\tPlease Select Account Name.';
var Errcode002='\t\t\t\t\t\t\t\tPlease Select Invoice Number.';
var SaveError="Report Generation Fail.";

function CheckAccountDDL()
{
 
	//To store the Long message.
	var LongMessage="";
	//To store the short message.
	var ShortMessage=SaveError;
	//If nothing is selected in Account drop down list.
	if(false==IsddlSelected('ddlAccount'))
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
				setFocustoControl('ddlAccount');
	}
		if(false==IsddlSelected('ddlinvoice'))
		{
		
			if(""==LongMessage)
			{
				LongMessage=Errcode002;
			}
			else
			{
				LongMessage=LongMessage + '\n' + Errcode002;
			}
			setFocustoControl('ddlinvoice');
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


