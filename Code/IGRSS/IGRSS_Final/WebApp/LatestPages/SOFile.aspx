<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="SOFile.aspx.cs" Inherits="LatestPages_SOFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="Multiview_SOFile" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<hr /><br />
<h1>SO File</h1>
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
                  <asp:GridView ID="GridView_SOFile" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_SOFile" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Circulars" HeaderText="Circulars" 
                              SortExpression="Circulars" />
                          <asp:BoundField DataField="DateOfCirculars" HeaderText="Date Of Circulars" 
                              SortExpression="DateOfCirculars" />
                          <asp:BoundField DataField="Department" HeaderText="From Which Department" 
                              SortExpression="Department" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="PageNo" HeaderText="Page No" 
                              SortExpression="PageNo" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>SO File</h1>
<asp:FormView ID="FormView_SOFile" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_SOFile" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%">
        <EditItemTemplate>
                                                                        <table>
                                 <%--   <tr><td>SrNo:</td>
									    <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' /></td>
									</tr>															--%>
                                        
                                    <tr><td>Circulars:</td>
									    <td><asp:TextBox ID="CircularsTextBox" runat="server" 
                                            Text='<%# Bind("Circulars") %>' Width="160px" /></td>
									</tr>	                                     
                                        
                                     <tr><td>Date Of Circulars:</td>
									     <td><asp:TextBox ID="DateOfCircularsTextBox" runat="server" 
                                            Text='<%# Bind("DateOfCirculars") %>' Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>From Which Department:</td>
									    <td><asp:TextBox ID="DepartmentTextBox" runat="server" 
                                            Text='<%# Bind("Department") %>' Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>Subject:</td>
									    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                                                Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>Page No:</td>
									    <td><asp:TextBox ID="PageNoTextBox" runat="server" Text='<%# Bind("PageNo") %>' 
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
                                  <%--  <tr><td>SrNo:</td>
									    <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' /></td>
									</tr>															--%>
                                        
                                    <tr><td>Circulars:</td>
									    <td><asp:TextBox ID="CircularsTextBox" runat="server" 
                                            Text='<%# Bind("Circulars") %>' 
                                                Width="160px" /></td>
									</tr>	                                     
                                        
                                     <tr><td>Date Of Circulars:</td>
									     <td><asp:TextBox ID="DateOfCircularsTextBox" runat="server" 
                                            Text='<%# Bind("DateOfCirculars") %>' Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>From Which Department:</td>
									    <td><asp:TextBox ID="DepartmentTextBox" runat="server" 
                                            Text='<%# Bind("Department") %>' Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>Subject:</td>
									    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                                                Width="160px" /></td>
									</tr>	                                     
                                        
                                    <tr><td>Page No:</td>
									    <td><asp:TextBox ID="PageNoTextBox" runat="server" Text='<%# Bind("PageNo") %>' 
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
            Circulars:
            <asp:Label ID="CircularsLabel" runat="server" 
                Text='<%# Bind("Circulars") %>' />
            <br />
            DateOfCirculars:
            <asp:Label ID="DateOfCircularsLabel" runat="server" 
                Text='<%# Bind("DateOfCirculars") %>' />
            <br />
            Department:
            <asp:Label ID="DepartmentLabel" runat="server" 
                Text='<%# Bind("Department") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" 
                Text='<%# Bind("Subject") %>' />
            <br />
            PageNo:
            <asp:Label ID="PageNoLabel" runat="server" 
                Text='<%# Bind("PageNo") %>' />
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
    
    <asp:ObjectDataSource ID="ods_SOFile" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.SOFileTableAdapters.SOFileTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Circulars" Type="Int32" />
            <asp:Parameter Name="Original_DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Original_Department" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_PageNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
            <asp:Parameter Name="Circulars" Type="Int32" />
            <asp:Parameter Name="DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="PageNo" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
            <asp:Parameter Name="Circulars" Type="Int32" />
            <asp:Parameter Name="DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="PageNo" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Circulars" Type="Int32" />
            <asp:Parameter Name="Original_DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Original_Department" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_PageNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

