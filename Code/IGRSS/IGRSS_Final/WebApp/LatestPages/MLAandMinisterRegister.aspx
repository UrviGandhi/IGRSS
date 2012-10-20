<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MLAandMinisterRegister.aspx.cs" Inherits="LatestPages_MLAandMinisterRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="MultiviewMLA" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<hr /><br />
<h1>MLA and Minister&#39;s Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right">
                        <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_MLA" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_MLA" EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="InwardNo" HeaderText="Inward No" 
                              SortExpression="InwardNo" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="MLAname" HeaderText="MLA Name" 
                              SortExpression="MLAname" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="LetterNo" HeaderText="Letter No" 
                              SortExpression="LetterNo" />
                          <asp:BoundField DataField="LetterDate" HeaderText="Letter Date" 
                              SortExpression="LetterDate" />
                          <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" 
                              SortExpression="DepartmentName" />
                          <asp:BoundField DataField="FileNumber" HeaderText="File Number" 
                              SortExpression="FileNumber" />
                          <asp:BoundField DataField="DetailsofOutput" HeaderText="Details of Output" 
                              SortExpression="DetailsofOutput" Visible="False" />
                          <asp:BoundField DataField="DetailsofFilePreservation" 
                              HeaderText="Details of File Preservation" 
                              SortExpression="DetailsofFilePreservation" Visible="False" />
                          <asp:BoundField DataField="DetailsOfRecord" HeaderText="Details Of Record" 
                              SortExpression="DetailsOfRecord" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>MLA and Minister's Register</h1>
<asp:FormView ID="FormView_MLA" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_MLA" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%">
        <EditItemTemplate>
                <table>
        <tr><td>Inward No:</td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" /></td>
		</tr>					
            
        <tr><td>File No:</td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
		</tr>	          
         
        <tr><td>MLA/MP/Minister's Name:</td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" Text='<%# Bind("MLAname") %>' 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter No:</td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" 
                Text='<%# Bind("LetterNo") %>' Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter Date:</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Department Name:</td>
			<td><asp:TextBox ID="DepartmentNameTextBox" runat="server" 
                Text='<%# Bind("DepartmentName") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" 
                Text='<%# Bind("FileNumber") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Details Of Output:</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Details Of File Preservation:</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr><td>Details Of Record:</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=2 align="center"><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Updat" Text="Updat" />
			&nbsp;<asp:Button ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />	
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</td>
		</tr>
    </table>		
            
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr><td>Inward No:</td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" /></td>
		</tr>					
            
        <tr><td>File No:</td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
		</tr>	          
         
        <tr><td>MLA/MP/Minister's Name:</td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" Text='<%# Bind("MLAname") %>' 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter No:</td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" 
                Text='<%# Bind("LetterNo") %>' Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter Date:</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Department Name:</td>
			<td><asp:TextBox ID="DepartmentNameTextBox" runat="server" 
                Text='<%# Bind("DepartmentName") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" 
                Text='<%# Bind("FileNumber") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Details Of Output:</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Details Of File Preservation:</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr><td>Details Of Record:</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=2 align="center"><asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
			&nbsp;<asp:Button ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" />	
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
			</td>
		</tr>
    </table>		
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            InwardNo:
            <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
            <br />
            MLAname:
            <asp:Label ID="MLAnameLabel" runat="server" Text='<%# Bind("MLAname") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            LetterNo:
            <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
            <br />
            LetterDate:
            <asp:Label ID="LetterDateLabel" runat="server" 
                Text='<%# Bind("LetterDate") %>' />
            <br />
            DepartmentName:
            <asp:Label ID="DepartmentNameLabel" runat="server" 
                Text='<%# Bind("DepartmentName") %>' />
            <br />
            FileNumber:
            <asp:Label ID="FileNumberLabel" runat="server" 
                Text='<%# Bind("FileNumber") %>' />
            <br />
            DetailsofOutput:
            <asp:Label ID="DetailsofOutputLabel" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' />
            <br />
            DetailsofFilePreservation:
            <asp:Label ID="DetailsofFilePreservationLabel" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' />
            <br />
            DetailsOfRecord:
            <asp:Label ID="DetailsOfRecordLabel" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_MLA" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.MLATableAdapters.MLATableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView> 
</asp:Content>

