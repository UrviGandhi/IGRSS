<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IGRSS_Default.master" CodeFile="WorkSheetRegister.aspx.cs" Inherits="LatestPages_WorkSheetRegister" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
<asp:MultiView ID="MultiView_worksheet" runat="server" ActiveViewIndex="0">
<asp:View ID="viewGrid" runat="server">
<h1>WORKSHEET REGISTER</h1>
<table>
<tr>
                <td align="right" style="width: 641px">
                    <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                        meta:resourcekey="lblllsResource1"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" 
                        meta:resourcekey="txtFileNoResource1" Width="160px" 
                        ontextchanged="txtFileNo_TextChanged"></asp:TextBox> 
                </td>
                <td>
                    <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search" meta:resourcekey="btnSearchAppNoResource1" />           
                </td>
            </tr>
    <tr>
        <td align="right" colspan="3">
            <asp:GridView ID="GridView_worksheet" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="ods_worksheet" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                        SortExpression="ID" Visible="False" InsertVisible="False" />
                    <asp:BoundField DataField="WorkSheet_No" HeaderText="WorkSheet No" 
                        SortExpression="WorkSheet_No" />
                    <asp:BoundField DataField="Inward_No" HeaderText="Inward No" 
                        SortExpression="Inward_No" />
                    <asp:BoundField DataField="Name_Of_Person" HeaderText="Name Of Person" 
                        SortExpression="Name_Of_Person" />
                    <asp:BoundField DataField="Letter_Details" HeaderText="Letter Details" 
                        SortExpression="Letter_Details" />
                    <asp:BoundField DataField="Work_Disposal_Date" HeaderText="Work Disposal Date" 
                        SortExpression="Work_Disposal_Date" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="3" style="text-align: left;">
            <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
        </td>
    </tr>
</table>
</asp:View>

<asp:View ID="Worksheetregister" runat="server">
<h1>WORKSHEET REGISTER</h1>

    <asp:ObjectDataSource ID="ods_worksheet" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.WorksheetregisterTableAdapters.WorkSheetRegisterTableAdapter">
    </asp:ObjectDataSource>
    <center>
        <asp:FormView ID="FormView_worksheet" Width="50%" runat="server" DataKeyNames="ID" 
        DataSourceID="ods_worksheet" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserted="FormView_worksheet_ItemInserted" 
        onitemupdated="FormView_worksheet_ItemUpdated">
        <EditItemTemplate>
                <table>
        <tr><td>WorkSheet No:</td>
		    <td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" />
			</td>
		</tr>		
           
		<tr><td>Inward No:</td>
		    <td><asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" />
			</td>
		</tr>        
            				
        <tr><td>Name Of Person:</td>
		    <td><asp:TextBox ID="Name_Of_PersonTextBox" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' Width="160px" />
			</td>
		</tr>          
            			
        <tr><td>Letter Details:</td>
		    <td><asp:TextBox ID="Letter_DetailsTextBox" runat="server" Height="60px" 
                Text='<%# Bind("Letter_Details") %>' TextMode="MultiLine" Width="160px" />
			</td>
		</tr>           
            				
        <tr><td>Work Disposal Date:</td>
		    <td><asp:TextBox ID="Work_Disposal_DateTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' Width="160px" />
			</td>
		</tr>           
            			
        <tr><td colspan=2 align="center"><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</td>
		</tr>	
	</table>			
            
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr><td>WorkSheet No:</td>
		    <td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" />
			</td>
		</tr>		
           
		<tr><td>Inward No:</td>
		    <td><asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" />
			</td>
		</tr>        
            				
        <tr><td>Name Of Person:</td>
		    <td><asp:TextBox ID="Name_Of_PersonTextBox" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' Width="160px" />
			</td>
		</tr>          
            			
        <tr><td>Letter Details:</td>
		    <td><asp:TextBox ID="Letter_DetailsTextBox" runat="server" Height="60px" 
                Text='<%# Bind("Letter_Details") %>' TextMode="MultiLine" Width="160px" />
			</td>
		</tr>           
            				
        <tr><td>Work Disposal Date:</td>
		    <td><asp:TextBox ID="Work_Disposal_DateTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' Width="160px" />
			</td>
		</tr>           
            			
        <tr><td colspan=2 align="center"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</td>
		</tr>	
	</table>			
            
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            WorkSheet_No:
            <asp:Label ID="WorkSheet_NoLabel" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' />
            <br />
            Inward_No:
            <asp:Label ID="Inward_NoLabel" runat="server" 
                Text='<%# Bind("Inward_No") %>' />
            <br />
            Name_Of_Person:
            <asp:Label ID="Name_Of_PersonLabel" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' />
            <br />
            Letter_Details:
            <asp:Label ID="Letter_DetailsLabel" runat="server" 
                Text='<%# Bind("Letter_Details") %>' />
            <br />
            Work_Disposal_Date:
            <asp:Label ID="Work_Disposal_DateLabel" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView></center>
    

</asp:View> 
</asp:MultiView> 
</asp:Content>