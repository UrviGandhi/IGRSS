<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="test1.aspx.cs" Inherits="LatestPages_test1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:MultiView ID="Multiview_table1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_grid" runat="server">
         <table><tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" 
                            ontextchanged="txtFileNo_TextChanged" ></asp:TextBox></td>
                        <td align="right">
                        <asp:Button ID="btnSearchAppNo" runat="server"  Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" onclick="btnSearchAppNo_Click" />
                    </td>
          </tr>
             <tr>
                 <td align="right" colspan="3">
                     <asp:GridView ID="GridView_table1" runat="server" AutoGenerateColumns="False" 
                         DataKeyNames="id" DataSourceID="ods_table1" EnableModelValidation="True">
                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="id" Visible="False" />
                             <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                             <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                         </Columns>
                     </asp:GridView>
                 </td>
              
             </tr>
               
             <tr>
                 <td align="right" colspan="3" style="text-align: left">
                     <asp:Button ID="Button_clickme" runat="server" Text="clickme" 
                         onclick="Button_clickme_Click" />
                 </td>
             </tr>
               
          </table>
        </asp:View>

        <asp:View ID="formtable1" runat ="server">
        <asp:FormView ID="formt1" runat="server" DataKeyNames="id" 
                DataSourceID="ods_table1" DefaultMode="Insert" 
                EnableModelValidation="True" onpageindexchanging="formt1_PageIndexChanging">
            <EditItemTemplate>
                                <table>
				<tr><td>Name:</td>
				    <td><asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' 
                            Width="160px" /></td>
				</tr>				
                
                <tr><td>date of birth:</td>
				    <td> <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' 
                            Width="160px" /></td>
				</tr>	
                
               
                <tr><td><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
				&nbsp;<asp:Button ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" />	
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>	
					</table>
                
            </EditItemTemplate>
            <InsertItemTemplate>
                              <table>
				<tr><td>Name:</td>
				    <td><asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' 
                            Width="160px" /></td>
				</tr>				
                
                <tr><td>date of birth:</td>
				    <td> <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' 
                            Width="160px" /></td>
				</tr>	
                
               
                <tr><td><asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
				&nbsp;<asp:Button ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" />	
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>	
					</table>
                
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                <br />
                dob:
                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
            <asp:ObjectDataSource ID="ods_table1" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.Datatable1TableAdapters.table1TableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_name" Type="String" />
                    <asp:Parameter Name="Original_dob" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="dob" Type="DateTime" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_name" Type="String" />
                    <asp:Parameter Name="Original_dob" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

