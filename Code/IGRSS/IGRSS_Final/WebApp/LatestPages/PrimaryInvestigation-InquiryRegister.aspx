<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="PrimaryInvestigation-InquiryRegister.aspx.cs" Inherits="LatestPages_PrimaryInvestigation_InquiryRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="Multiview_Inquiry" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<hr /><br />
<h1>Primary Investigation/Inquiry Register</h1>
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
                  <asp:GridView ID="GridView_Inquiry" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Inquiry" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="Name_Of_Employee" HeaderText="Name Of Employee" 
                              SortExpression="Name_Of_Employee" />
                          <asp:BoundField DataField="Designation_Of_Employee" HeaderText="Designation Of Employee" 
                              SortExpression="Designation_Of_Employee" />
                          <asp:BoundField DataField="Date_Of_Complaint" HeaderText="Date Of Complaint" 
                              SortExpression="Date_Of_Complaint" />
                          <asp:BoundField DataField="Details_To_Vigilance_Commissioner" HeaderText="Details To Vigilance Commissioner" 
                              SortExpression="Details_To_Vigilance_Commissioner" Visible="False" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>Primary Investigation/Inquiry Register</h1>
<asp:FormView ID="FormView_Inquiry" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Inquiry" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%">
        <EditItemTemplate>
                            <table>
		    <tr><td>File No:</td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>        			
                    
            <tr><td>Name Of Employee:</td>
			    <td><asp:TextBox ID="Name_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Name_Of_Employee") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Designation Of Employee:</td>
			    <td><asp:TextBox ID="Designation_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Designation_Of_Employee") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Date Of Complaint:</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Details To Vigilance Commissioner:</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" /></td>
			</tr>	                 
                    
            <tr><td colspan=2 align="center"><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
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
		    <tr><td>File No:</td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>        			
                    
            <tr><td>Name Of Employee:</td>
			    <td><asp:TextBox ID="Name_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Name_Of_Employee") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Designation Of Employee:</td>
			    <td><asp:TextBox ID="Designation_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Designation_Of_Employee") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Date Of Complaint:</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Details To Vigilance Commissioner:</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" /></td>
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
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" 
                Text='<%# Bind("FileNo") %>' />
            <br />
            Name_Of_Employee:
            <asp:Label ID="Name_Of_EmployeeLabel" runat="server" 
                Text='<%# Bind("Name_Of_Employee") %>' />
            <br />
            Designation_Of_Employee:
            <asp:Label ID="Designation_Of_EmployeeLabel" runat="server" 
                Text='<%# Bind("Designation_Of_Employee") %>' />
            <br />
            Date_Of_Complaint:
            <asp:Label ID="Date_Of_ComplaintLabel" runat="server" 
                Text='<%# Bind("Date_Of_Complaint") %>' />
            <br />
            Details_To_Vigilance_Commissioner:
            <asp:Label ID="Details_To_Vigilance_CommissionerLabel" runat="server" 
                Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Inquiry" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.InquiryRegisterTableAdapters.InquiryRegisterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Complaint" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Date_Of_Complaint" Type="DateTime" />
            <asp:Parameter Name="Details_To_Vigilance_Commissioner" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Date_Of_Complaint" Type="DateTime" />
            <asp:Parameter Name="Details_To_Vigilance_Commissioner" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Complaint" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

