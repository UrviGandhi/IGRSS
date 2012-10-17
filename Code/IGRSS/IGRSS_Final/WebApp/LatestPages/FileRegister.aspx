<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="FileRegister.aspx.cs" Inherits="LatestPages_FileRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="MultiView_File" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server" >
<h1>FILE REGISTER</h1>
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
                    <asp:GridView ID="GridView_File" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="SrNo" DataSourceID="ods_fileregister" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="FileName" HeaderText="FileName" 
                                SortExpression="FileName" />
                            <asp:BoundField DataField="FileNo" HeaderText="FileNo" 
                                SortExpression="FileNo" />
                            <asp:BoundField DataField="StartingDate" HeaderText="StartingDate" 
                                SortExpression="StartingDate" />
                            <asp:BoundField DataField="EndingDate" HeaderText="EndingDate" 
                                SortExpression="EndingDate" />
                            <asp:BoundField DataField="ClassOfFile" HeaderText="ClassOfFile" 
                                SortExpression="ClassOfFile" />
                            <asp:BoundField DataField="DisposalDateOfFile" HeaderText="DisposalDateOfFile" 
                                SortExpression="DisposalDateOfFile" />
                            <asp:BoundField DataField="DisposalDateOn" HeaderText="DisposalDateOn" 
                                SortExpression="DisposalDateOn" />
                            <asp:BoundField DataField="SrNo" HeaderText="SrNo" ReadOnly="True" 
                                SortExpression="SrNo" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </td>
    </tr>
   
    
    </table>
<asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="FileRegister" runat="server">
<h1>FILE REGISTER</h1>
     <center>
<asp:FormView Width="50%" ID="FormView_File" runat="server" DataKeyNames="SrNo,Expr1" 
        DataSourceID="ods_fileregister" DefaultMode="Insert" 
        EnableModelValidation="True">
        <EditItemTemplate>
                 <table>
	       <%-- <tr><td>SrNo:</td>
	        <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' 
             Width="160px" /></td></tr>
            				
            <tr><td>ID:</td>
			<td><asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' 
                Width="160px" /></td></tr>--%>         
            				
            <tr><td>File Name:</td>
			<td><asp:TextBox ID="FileNameTextBox" runat="server" Text='<%# Bind("FileName") %>' 
                Width="160px" /></td></tr>          
            				
            <tr><td>File No:</td>
			<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                Width="160px" /></td></tr>          
            				
            <tr><td>Starting Date:</td>
			<td><asp:TextBox ID="StartingDateTextBox" runat="server" 
                Text='<%# Bind("StartingDate") %>' Width="160px" /></td></tr>	
                      
			<tr><td>Ending Date:</td>
			<td><asp:TextBox ID="EndingDateTextBox" runat="server" 
                Text='<%# Bind("EndingDate") %>' Width="160px" /></td></tr>	           
            				
            <tr><td>Class Of File: </td>
			<td><asp:TextBox ID="ClassOfFileTextBox" runat="server" 
                Text='<%# Bind("ClassOfFile") %>' Width="160px" /></td></tr>          
            				
            <tr><td>Disposal Date Of File :</td>
			<td><asp:TextBox ID="DisposalDateOfFileTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOfFile") %>' Width="160px" /></td></tr>          
            				
            <tr><td>Disposal Date On:</td>
			<td><asp:TextBox ID="DisposalDateOnTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOn") %>' Width="160px" /></td></tr>          
            
				
            <tr><td>WorkSheet No:</td>
			<td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" /></td></tr>       
            				
            <tr><td><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>	
            				</table>
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
	        <%--<tr><td>SrNo:</td>
	        <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' 
             Width="160px" /></td></tr>
            				
            <tr><td>ID:</td>
			<td><asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' 
                Width="160px" /></td></tr>         --%>
            				
            <tr><td>File Name:</td>
			<td><asp:TextBox ID="FileNameTextBox" runat="server" Text='<%# Bind("FileName") %>' 
                Width="160px" /></td></tr>          
            				
            <tr><td>File No:</td>
			<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                Width="160px" /></td></tr>          
            				
            <tr><td>Starting Date:</td>
			<td><asp:TextBox ID="StartingDateTextBox" runat="server" 
                Text='<%# Bind("StartingDate") %>' Width="160px" /></td></tr>	
                      
			<tr><td>Ending Date:</td>
			<td><asp:TextBox ID="EndingDateTextBox" runat="server" 
                Text='<%# Bind("EndingDate") %>' Width="160px" /></td></tr>	           
            				
            <tr><td>Class Of File: </td>
			<td><asp:TextBox ID="ClassOfFileTextBox" runat="server" 
                Text='<%# Bind("ClassOfFile") %>' Width="160px" /></td></tr>          
            				
            <tr><td>Disposal Date Of File: </td>
			<td><asp:TextBox ID="DisposalDateOfFileTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOfFile") %>' Width="160px" /></td></tr>          
            				
            <tr><td>Disposal Date On:</td>
			<td><asp:TextBox ID="DisposalDateOnTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOn") %>' Width="160px" /></td></tr>          
            
				
            <tr><td>WorkSheet No:</td>
			<td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" /></td></tr>       
            				
            <tr><td colspan=2 align="center"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>	
            				</table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
            <br />
            FileName:
            <asp:Label ID="FileNameLabel" runat="server" 
                Text='<%# Bind("FileName") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" 
                Text='<%# Bind("FileNo") %>' />
            <br />
            StartingDate:
            <asp:Label ID="StartingDateLabel" runat="server" 
                Text='<%# Bind("StartingDate") %>' />
            <br />
            EndingDate:
            <asp:Label ID="EndingDateLabel" runat="server" 
                Text='<%# Bind("EndingDate") %>' />
            <br />
            ClassOfFile:
            <asp:Label ID="ClassOfFileLabel" runat="server" 
                Text='<%# Bind("ClassOfFile") %>' />
            <br />
            DisposalDateOfFile:
            <asp:Label ID="DisposalDateOfFileLabel" runat="server" 
                Text='<%# Bind("DisposalDateOfFile") %>' />
            <br />
            DisposalDateOn:
            <asp:Label ID="DisposalDateOnLabel" runat="server" 
                Text='<%# Bind("DisposalDateOn") %>' />
            <br />
            Expr1:
            <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
            <br />
            WorkSheet_No:
            <asp:Label ID="WorkSheet_NoLabel" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView></center>

    
    <asp:ObjectDataSource ID="ods_fileregister" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.FileRegisterTableAdapters.FileRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileName" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_StartingDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndingDate" Type="DateTime" />
            <asp:Parameter Name="Original_ClassOfFile" Type="String" />
            <asp:Parameter Name="Original_DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="Original_DisposalDateOn" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="StartingDate" Type="DateTime" />
            <asp:Parameter Name="EndingDate" Type="DateTime" />
            <asp:Parameter Name="ClassOfFile" Type="String" />
            <asp:Parameter Name="DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="DisposalDateOn" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="StartingDate" Type="DateTime" />
            <asp:Parameter Name="EndingDate" Type="DateTime" />
            <asp:Parameter Name="ClassOfFile" Type="String" />
            <asp:Parameter Name="DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="DisposalDateOn" Type="DateTime" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileName" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_StartingDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndingDate" Type="DateTime" />
            <asp:Parameter Name="Original_ClassOfFile" Type="String" />
            <asp:Parameter Name="Original_DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="Original_DisposalDateOn" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>


</asp:View>
</asp:MultiView>
</asp:Content>

