<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RTIAppealRegister.aspx.cs" Inherits="LatestPages_RTIAppealRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="Multiview_RTI" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<hr /><br />
<h1>RTI Appeal Register</h1>
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
                  <asp:GridView ID="GridView_RTI" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="Sr_No" DataSourceID="ods_RTI" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="Sr_No" HeaderText="Sr_No" 
                              ReadOnly="True" SortExpression="Sr_No" Visible="False" />
                          <asp:BoundField DataField="Appl_name" HeaderText="Name Of Applicant" 
                              SortExpression="Appl_name" />
                          <asp:BoundField DataField="Appl_surname" HeaderText="Surname Of Applicant" 
                              SortExpression="Appl_surname" />
                          <asp:BoundField DataField="Appl_Date" HeaderText="Date Of Application" 
                              SortExpression="Appl_Date" />
                          <asp:BoundField DataField="PIO_desig" HeaderText="PIO's Designation" 
                              SortExpression="PIO_desig" />
                          <asp:BoundField DataField="PIO_date" HeaderText="PIO Date" 
                              SortExpression="PIO_date" />
                          <asp:BoundField DataField="Last_Date" HeaderText="Last Date According To 30 Days" 
                              SortExpression="Last_Date" />
                          <asp:BoundField DataField="Decision_Taken" HeaderText="Decision Taken By" 
                              SortExpression="Decision_Taken" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>RTI Appeal Register</h1>
<asp:FormView ID="FormView_RTI" runat="server" DataKeyNames="Sr_No" 
        DataSourceID="ods_RTI" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%">
        <EditItemTemplate>
            <table>
		<%--<tr><td>Sr_No:</td>
		    <td><asp:TextBox ID="Sr_NoTextBox" runat="server" Text='<%# Bind("Sr_No") %>' /></td>
		</tr>    	--%>
            
        <tr><td>Name Of Applicant:</td>
		    <td><asp:TextBox ID="Appl_nameTextBox" runat="server" 
                Text='<%# Bind("Appl_name") %>' Width="160px" /></td>
		</tr>	         
            
        <tr><td>SurName Of Applicant:</td>
		    <td><asp:TextBox ID="Appl_surnameTextBox" runat="server" 
                Text='<%# Bind("Appl_surname") %>' Width="160px" /></td>
		</tr>          
            
        <tr><td>Date Of Application:</td>
		    <td><asp:TextBox ID="Appl_DateTextBox" runat="server" 
                Text='<%# Bind("Appl_Date") %>' Width="160px" /></td>
		</tr>	          
            
        <tr><td>PIO's Designation:</td>
		    <td><asp:TextBox ID="PIO_desigTextBox" runat="server" 
                Text='<%# Bind("PIO_desig") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td>PIO Date:</td>
		    <td><asp:TextBox ID="PIO_dateTextBox" runat="server" 
                Text='<%# Bind("PIO_date") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td>Last Date According To 30 Days:</td>
		    <td><asp:TextBox ID="Last_DateTextBox" runat="server" 
                Text='<%# Bind("Last_Date") %>' Width="160px" /></td>
		</tr>	
            
            
        <tr><td>Decision Taken By:</td>
		    <td>
                <asp:RadioButtonList ID="Radio_decisiontaken" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem>Appellate</asp:ListItem>
                    <asp:ListItem>Committee</asp:ListItem>
                </asp:RadioButtonList>
            </td>
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
		<%--<tr><td>Sr_No:</td>
		    <td><asp:TextBox ID="Sr_NoTextBox" runat="server" Text='<%# Bind("Sr_No") %>' /></td>
		</tr>    	--%>
            
        <tr><td>Name Of Applicant:</td>
		    <td><asp:TextBox ID="Appl_nameTextBox" runat="server" 
                Text='<%# Bind("Appl_name") %>' Width="160px" /></td>
		</tr>	         
            
        <tr><td>SurName Of Applicant:</td>
		    <td><asp:TextBox ID="Appl_surnameTextBox" runat="server" 
                Text='<%# Bind("Appl_surname") %>' Width="160px" /></td>
		</tr>          
            
        <tr><td>Date Of Application:</td>
		    <td><asp:TextBox ID="Appl_DateTextBox" runat="server" 
                Text='<%# Bind("Appl_Date") %>' Width="160px" /></td>
		</tr>	          
            
        <tr><td>PIO's Designation:</td>
		    <td><asp:TextBox ID="PIO_desigTextBox" runat="server" 
                Text='<%# Bind("PIO_desig") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td>PIO Date:</td>
		    <td><asp:TextBox ID="PIO_dateTextBox" runat="server" 
                Text='<%# Bind("PIO_date") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td>Last Date According To 30 Days:</td>
		    <td><asp:TextBox ID="Last_DateTextBox" runat="server" 
                Text='<%# Bind("Last_Date") %>' Width="160px" /></td>
		</tr>	
            
            
        <tr><td>Decision Taken By</td>
		    <td>
                <asp:RadioButtonList ID="Radio_decisiontaken" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem>Appellate</asp:ListItem>
                    <asp:ListItem>Committee</asp:ListItem>
                </asp:RadioButtonList>
            </td>
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
            Sr_No:
            <asp:Label ID="Sr_NoLabel" runat="server" Text='<%# Eval("Sr_No") %>' />
            <br />
            Appl_name:
            <asp:Label ID="Appl_nameLabel" runat="server" 
                Text='<%# Bind("Appl_name") %>' />
            <br />
            Appl_surname:
            <asp:Label ID="Appl_surnameLabel" runat="server" 
                Text='<%# Bind("Appl_surname") %>' />
            <br />
            Appl_Date:
            <asp:Label ID="Appl_DateLabel" runat="server" 
                Text='<%# Bind("Appl_Date") %>' />
            <br />
            PIO_desig:
            <asp:Label ID="PIO_desigLabel" runat="server" 
                Text='<%# Bind("PIO_desig") %>' />
            <br />
            PIO_date:
            <asp:Label ID="PIO_dateLabel" runat="server" 
                Text='<%# Bind("PIO_date") %>' />
            <br />
            Last_Date:
            <asp:Label ID="Last_DateLabel" runat="server" Text='<%# Bind("Last_Date") %>' />
            <br />
            Decision_Taken:
            <asp:Label ID="Decision_TakenLabel" runat="server" 
                Text='<%# Bind("Decision_Taken") %>' />
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
    
    <asp:ObjectDataSource ID="ods_RTI" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.RTITableAdapters.RTITableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Sr_No" Type="Int32" />
            <asp:Parameter Name="Original_Appl_name" Type="String" />
            <asp:Parameter Name="Original_Appl_surname" Type="String" />
            <asp:Parameter Name="Original_Appl_Date" Type="DateTime" />
            <asp:Parameter Name="Original_PIO_desig" Type="String" />
            <asp:Parameter Name="Original_PIO_date" Type="DateTime" />
            <asp:Parameter Name="Original_Last_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Decision_Taken" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Sr_No" Type="Int32" />
            <asp:Parameter Name="Appl_name" Type="String" />
            <asp:Parameter Name="Appl_surname" Type="String" />
            <asp:Parameter Name="Appl_Date" Type="DateTime" />
            <asp:Parameter Name="PIO_desig" Type="String" />
            <asp:Parameter Name="PIO_date" Type="DateTime" />
            <asp:Parameter Name="Last_Date" Type="DateTime" />
            <asp:Parameter Name="Decision_Taken" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Sr_No" Type="Int32" />
            <asp:Parameter Name="Appl_name" Type="String" />
            <asp:Parameter Name="Appl_surname" Type="String" />
            <asp:Parameter Name="Appl_Date" Type="DateTime" />
            <asp:Parameter Name="PIO_desig" Type="String" />
            <asp:Parameter Name="PIO_date" Type="DateTime" />
            <asp:Parameter Name="Last_Date" Type="DateTime" />
            <asp:Parameter Name="Decision_Taken" Type="String" />
            <asp:Parameter Name="Original_Sr_No" Type="Int32" />
            <asp:Parameter Name="Original_Appl_name" Type="String" />
            <asp:Parameter Name="Original_Appl_surname" Type="String" />
            <asp:Parameter Name="Original_Appl_Date" Type="DateTime" />
            <asp:Parameter Name="Original_PIO_desig" Type="String" />
            <asp:Parameter Name="Original_PIO_date" Type="DateTime" />
            <asp:Parameter Name="Original_Last_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Decision_Taken" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

