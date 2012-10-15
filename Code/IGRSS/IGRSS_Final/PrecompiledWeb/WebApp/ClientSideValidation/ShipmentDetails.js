
/************************************* Comments ***************************************/

//Sorting
//FileName      - Shipment.js
//Purpose       - Javascript validation for Shipment page.
//Author        : G.AnilKumar
//Creation Date : 22-Mar-2006


//Modified By                      Date                     Description
//-----------                   -------------            ----------------
//
	
/************************************* Comments ***************************************/
    //Sorting error message codes for the Mandatory fields.
	var ErrShipment001='\t\t\t\t\t\t\t\tAWBNumber is Mandatory.';
	var ErrShipment002='\t\t\t\t\t\t\t\tShipmentDate is Mandatory.';
	var ErrShipment003='\t\t\t\t\t\t\t\tNumber of Cartons/Parcels is Mandatory.';
	var ErrShipment004='\t\t\t\t\t\t\t\tWeight is Mandatory.';
	var ErrShipment005='\t\t\t\t\t\t\t\tCartons should be Numeric.';
	var ErrShipment006='\t\t\t\t\t\t\t\tWeight should be Numeric.';
	var ErrShipment006='\t\t\t\t\t\t\t\tShipment Status is Mandatory.';
	var ErrShipment007='\t\t\t\t\t\t\t\tWeight should be between 0 & 9999.99.';
	var ErrShipment008='\t\t\t\t\t\t\t\tParcels/Cartons should be Numeric.';
	var ErrShipment009='\t\t\t\t\t\t\t\tParcels/Cartons should be between 0 & 999999.';
	var saveErr001="";
	
	//Function For Validating Shipment Details.
	function ValidateShipment()
	{
	    var LongMessage="";
		if(document.getElementById('txtHiddenshipmentno').value!=0)
		{
		  saveErr001="Update Fail";
		}
		else
		{
		  saveErr001="Save Fail";
		}
		var ShortMessage=saveErr001;
		//AWB Number
		if(true==IstxtEmpty('txtAirBillNumber'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrShipment001;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrShipment001;
			}			
		}
		
		//Shipment Date
		if(true==IstxtEmpty('txtShipmentDate'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrShipment002;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrShipment002;
			}			
		}
		
		//Cartons / Parcels
		if(true==IstxtEmpty('txtCartons'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrShipment003;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrShipment003;
			}			
		}
		else
		{
		    if(false==IsNumeric(document.getElementById('txtCartons').value))
		    {
				//check long message is empty
				if(""==LongMessage)
				{
					//set long message
					LongMessage=ErrShipment008;
				}
				//if long message is not empty
				else
				{
					//set longmessage with newline char and long message code
					LongMessage=LongMessage + '\n' + ErrShipment008;
				}	
			}
			else if(!((0<=parseFloat(document.all('txtCartons').value)) && (999999 >= parseFloat(document.all('txtCartons').value))))
			{
			  //alert('anil');
			   if(""==LongMessage)
			   {
			   //set long message.
			    LongMessage=ErrShipment009;
			   }
			   else
			   {
			   //set Longmessage with newline and Long Message code.
			    LongMessage=LongMessage + '\n' + ErrShipment009;
			   }
			}
		}
		
		//Weight
		if(true==IstxtEmpty('txtWeight'))
		{
			//check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrShipment004;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrShipment004;
			}			
		}
		else if(!((0 <= parseFloat(document.all('txtWeight').value)) && (9999.99 >= parseFloat(document.all('txtWeight').value))))
	    {
	        //check long message is empty
			if(""==LongMessage)
			{
				//set long message
				LongMessage=ErrShipment007;
			}
			//if long message is not empty
			else
			{
				//set longmessage with newline char and long message code
				LongMessage=LongMessage + '\n' + ErrShipment007;
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
	
