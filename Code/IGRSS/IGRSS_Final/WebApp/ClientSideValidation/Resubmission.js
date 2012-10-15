/************************************* Comments ***************************************/

//PrintSlippage Rebates.
//FileName      - Slippage.js.
//Purpose       - Javascript validation for Resubmission.aspx
//Author        : G.Anil Kumar.
//Creation Date : 09-August-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
var Errcode001='Search Fail.';
var Errcode002='\t\t\t\t\t\t\t\tOffer Tracking Number is Mandatory.';
var Errcode003='\t\t\t\t\t\t\t\tApartment Number is Mandatory.';
var Errcode004='\t\t\t\t\t\t\t\tAddress1 is Mandatory.';
var Errcode005='\t\t\t\t\t\t\t\tPhone is Mandatory.';
var Errcode006='\t\t\t\t\t\t\t\tCity is Mandatory.';
var Errcode007='\t\t\t\t\t\t\t\tAccount Name is Mandatory.';
var Errcode009='\t\t\t\t\t\t\t\tPlease Check Unidentified Checkbox.';
var Errcode008='Save Fail.';
//Function to Validate Offer Tracking number and Account Name before Search. 

function ValidateOfferandTrackingNumber()
{
  var ShortMessage=Errcode001;
  var Longmessage="";
    
	//If Account Name is not Selected from the Account Drop downlist.
	if (document.getElementById('ddlAccountName').options[document.getElementById('ddlAccountName').selectedIndex].value < 0)
	{
			if(""==Longmessage)
			{
				Longmessage=Errcode007;	
			}
			else
			{
				Longmessage=Longmessage + '\n' + Errcode007;
			}
	}
	
	//If Offer Tracking Number filed is Empty.
	if(true==IstxtEmpty('txtOfferTrackingNumber'))
	{
		if(""==Longmessage)
		{
		  Longmessage=Errcode002;
		}
		else
		{
		 Longmessage= Longmessage + '\n' + Errcode002;
		}
	}
		//If the Longmessage doesnot contain any value return true.
		if(""==Longmessage)
		{
			return true;
		}
		else
		{
			SetErrorMessage(ShortMessage,Longmessage);
			return false;
		}
}
//Function to Validate the Mandatory fields before Saving the Record.
function ValidateControls()
{
  //alert("Anil");
  var ShortMessage=Errcode008;
  var LongMessage="";
            //Apartment Number field is Empty.
	 	    if(true==IstxtEmpty('txtAppartmentNo'))
			{
			    if(""==LongMessage)
				{
				LongMessage=Errcode003;
				}
				else
				{
				LongMessage=LongMessage + '\n' + Errcode003;
				}
			}
			//Address1 field is Empty.
			if(true==IstxtEmpty('txtAddress1'))
			{
				if(""==LongMessage)
				{
				LongMessage=Errcode004;
				}
				else
				{
				LongMessage=LongMessage + '\n'+Errcode004;
				}
			}
			//Phone field is Mandatory.
			if(true==IstxtEmpty('txtPhone'))
			{
				if(""==LongMessage)
				{
				LongMessage=Errcode005;
				}
				else
				{
				LongMessage=LongMessage + '\n'+ Errcode005;
				}
			}
			//City Field is Mandatory.
			if(true==IstxtEmpty('txtCity'))
			{
				if(""==LongMessage)
				{
				LongMessage=Errcode006;
				}
				else
				{
				LongMessage=LongMessage + '\n' + Errcode006;
				}
			}
	      	      
		    //If the Long Message doesnot contain any Value then return true. 
			if(""==LongMessage)
			{
			 return true;
			}
			//Else Display both Long and short message.
			else
			{
			 SetErrorMessage(ShortMessage,LongMessage);
			 return false;
			}
  
}