

function SetSize()
{
	if(0 < (document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10)))
		document.all("tblContent").height = document.body.clientHeight -  (document.all("RPSTopPage_tblOuter").clientHeight + document.all("RPSBottomPage_lblFooter").clientHeight + 10);
	if(0 < (document.all("tblContent").height - (document.all("tblButtons").height + 27)))
	document.all("divAccountFilter").style.height = document.all("tblContent").height - (document.all("tblButtons").height + 27);
		
	//This is for horizontal scroll
	document.all("divAccountFilter").style.width = document.body.clientWidth;
}
