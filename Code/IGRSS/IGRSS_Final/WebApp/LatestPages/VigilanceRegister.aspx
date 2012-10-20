<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="VigilanceRegister.aspx.cs" Inherits="LatestPages_VigilanceRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="Multiview_Vigilance" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<hr /><br />
<h1>Vigilance Register</h1>
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
                  <asp:GridView ID="GridView_Vigilance" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Vigilance" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Letterno" HeaderText="Letter No" 
                              SortExpression="Letterno" />
                          <asp:BoundField DataField="deptdate" HeaderText="Department Date" 
                              SortExpression="deptdate" />
                          <asp:BoundField DataField="letterdate" HeaderText="Letter Date" 
                              SortExpression="letterdate" />
                          <asp:BoundField DataField="applname" HeaderText="Applicant's Name" 
                              SortExpression="applname" />
                          <asp:BoundField DataField="empname" HeaderText="Employee Name" 
                              SortExpression="empname" />
                          <asp:BoundField DataField="emp_desig" HeaderText="Employee Designation" 
                              SortExpression="emp_desig" />
                          <asp:BoundField DataField="applsummary" HeaderText="applsummary" 
                              SortExpression="applsummary" Visible="False" />
                          <asp:BoundField DataField="Status" HeaderText="Status" 
                              SortExpression="Status" />
                          <asp:BoundField DataField="remarks" HeaderText="remarks" 
                              SortExpression="remarks" Visible="False" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:Button ID="Button_new" runat="server" Text="New" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>Vigilance Register</h1>
<asp:FormView ID="FormView_Vigilance" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Vigilance" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%">
        <EditItemTemplate>
                                        <table>
			    <tr><td>Vigilance Department Letter Number:</td>
				    <td><asp:TextBox ID="LetternoTextBox" runat="server" 
                                Text='<%# Bind("Letterno") %>' Width="160px" /></td>
				</tr>      					
                          
                <tr><td>Vigilance Department Date:</td>
				    <td><asp:TextBox ID="deptdateTextBox" runat="server" 
                                Text='<%# Bind("deptdate") %>' Width="160px" /></td>
				</tr>	                          
                            
                <tr><td>Date Of Letter Received:</td>
				    <td><asp:TextBox ID="letterdateTextBox" runat="server" 
                                Text='<%# Bind("letterdate") %>' Width="160px" /></td>
				</tr>	                         
                          
                <tr><td>Applicant’s Name:</td>
				    <td><asp:TextBox ID="applnameTextBox" runat="server" 
                                Text='<%# Bind("applname") %>' Width="160px" /></td>
				</tr>	                         
                            
                <tr><td>Against Whom The Complaint Has Been Done::</td>
				    <td><asp:TextBox ID="empnameTextBox" runat="server" Text='<%# Bind("empname") %>' 
                            Width="160px" /></td>
				</tr>	                       
                            
                <tr><td>Employee Designation:</td>
				    <td><asp:TextBox ID="emp_desigTextBox" runat="server" 
                                Text='<%# Bind("emp_desig") %>' Width="160px" /></td>
				</tr>	                        
                        
                <tr><td>Summary Of Application:</td>
				    <td><asp:TextBox ID="applsummaryTextBox" runat="server" 
                                Text='<%# Bind("applsummary") %>' Height="60px" TextMode="MultiLine" 
                            Width="160px" /></td>
				</tr>	
                            
                            
                                            <caption>
                                                \
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Date Of Sending Report To Vigilance:</td>
                                                    <td>
                                                        <asp:TextBox ID="reportdateTextBox" runat="server" 
                                                            Text='<%# Bind("reportdate") %>' Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Latest Status:</td>
                                                    <td>
                                                        <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' 
                                                            Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        File Closing Date:</td>
                                                    <td>
                                                        <asp:TextBox ID="closedateTextBox" runat="server" 
                                                            Text='<%# Bind("closedate") %>' Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Remarks:</td>
                                                    <td>
                                                        <asp:TextBox ID="remarksTextBox" runat="server" Height="60px" 
                                                            Text='<%# Bind("remarks") %>' TextMode="MultiLine" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="Insert" />
                                                        &nbsp;<asp:Button ID="ResetButton" runat="server" CausesValidation="False" 
                                                            CommandName="Reset" Text="Reset" />
                                                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="Cancel" />
                                                    </td>
                                                </tr>
                                            </caption>
            </table>                

                            
        </EditItemTemplate>
        <InsertItemTemplate>
                                        <table>
			    <tr><td>Vigilance Department Letter Number:</td>
				    <td><asp:TextBox ID="LetternoTextBox" runat="server" 
                                Text='<%# Bind("Letterno") %>' Width="160px" /></td>
				</tr>      					
                          
                <tr><td>Vigilance Department Date:</td>
				    <td><asp:TextBox ID="deptdateTextBox" runat="server" 
                                Text='<%# Bind("deptdate") %>' Width="160px" /></td>
				</tr>	                          
                            
                <tr><td>Date Of Letter Received:</td>
				    <td><asp:TextBox ID="letterdateTextBox" runat="server" 
                                Text='<%# Bind("letterdate") %>' Width="160px" /></td>
				</tr>	                         
                          
                <tr><td>Applicant’s Name:</td>
				    <td><asp:TextBox ID="applnameTextBox" runat="server" 
                                Text='<%# Bind("applname") %>' Width="160px" /></td>
				</tr>	                         
                            
                <tr><td>Against Whom The Complaint Has Been Done::</td>
				    <td><asp:TextBox ID="empnameTextBox" runat="server" Text='<%# Bind("empname") %>' 
                            Width="160px" /></td>
				</tr>	                       
                            
                <tr><td>Employee Designation:</td>
				    <td><asp:TextBox ID="emp_desigTextBox" runat="server" 
                                Text='<%# Bind("emp_desig") %>' Width="160px" /></td>
				</tr>	                        
                        
                <tr><td>Summary Of Application:</td>
				    <td><asp:TextBox ID="applsummaryTextBox" runat="server" 
                                Text='<%# Bind("applsummary") %>' Height="60px" 
                            ontextchanged="applsummaryTextBox_TextChanged" TextMode="MultiLine" 
                            Width="160px" /></td>
				</tr>	
                            
                            
                                            <caption>
                                                \
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Date Of Sending Report To Vigilance:</td>
                                                    <td>
                                                        <asp:TextBox ID="reportdateTextBox" runat="server" 
                                                            Text='<%# Bind("reportdate") %>' Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Latest Status:</td>
                                                    <td>
                                                        <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' 
                                                            Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        File Closing Date:</td>
                                                    <td>
                                                        <asp:TextBox ID="closedateTextBox" runat="server" 
                                                            Text='<%# Bind("closedate") %>' Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Remarks:</td>
                                                    <td>
                                                        <asp:TextBox ID="remarksTextBox" runat="server" Height="60px" 
                                                            Text='<%# Bind("remarks") %>' TextMode="MultiLine" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="Insert" />
                                                        &nbsp;<asp:Button ID="ResetButton" runat="server" CausesValidation="False" 
                                                            CommandName="Reset" Text="Reset" />
                                                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="Cancel" />
                                                    </td>
                                                </tr>
                                            </caption>
            </table>                
                
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Letterno:
            <asp:Label ID="LetternoLabel" runat="server" 
                Text='<%# Bind("Letterno") %>' />
            <br />
            deptdate:
            <asp:Label ID="deptdateLabel" runat="server" 
                Text='<%# Bind("deptdate") %>' />
            <br />
            letterdate:
            <asp:Label ID="letterdateLabel" runat="server" 
                Text='<%# Bind("letterdate") %>' />
            <br />
            applname:
            <asp:Label ID="applnameLabel" runat="server" 
                Text='<%# Bind("applname") %>' />
            <br />
            empname:
            <asp:Label ID="empnameLabel" runat="server" 
                Text='<%# Bind("empname") %>' />
            <br />
            emp_desig:
            <asp:Label ID="emp_desigLabel" runat="server" Text='<%# Bind("emp_desig") %>' />
            <br />
            applsummary:
            <asp:Label ID="applsummaryLabel" runat="server" 
                Text='<%# Bind("applsummary") %>' />
            <br />
            reportdate:
            <asp:Label ID="reportdateLabel" runat="server" 
                Text='<%# Bind("reportdate") %>' />
            <br />
            Status:
            <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            closedate:
            <asp:Label ID="closedateLabel" runat="server" Text='<%# Bind("closedate") %>' />
            <br />
            remarks:
            <asp:Label ID="remarksLabel" runat="server" Text='<%# Bind("remarks") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Vigilance" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.vigilanceTableAdapters.VigilanceTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Letterno" Type="Int32" />
            <asp:Parameter Name="Original_deptdate" Type="DateTime" />
            <asp:Parameter Name="Original_letterdate" Type="DateTime" />
            <asp:Parameter Name="Original_applname" Type="String" />
            <asp:Parameter Name="Original_empname" Type="String" />
            <asp:Parameter Name="Original_emp_desig" Type="String" />
            <asp:Parameter Name="Original_reportdate" Type="DateTime" />
            <asp:Parameter Name="Original_Status" Type="String" />
            <asp:Parameter Name="Original_closedate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Letterno" Type="Int32" />
            <asp:Parameter Name="deptdate" Type="DateTime" />
            <asp:Parameter Name="letterdate" Type="DateTime" />
            <asp:Parameter Name="applname" Type="String" />
            <asp:Parameter Name="empname" Type="String" />
            <asp:Parameter Name="emp_desig" Type="String" />
            <asp:Parameter Name="applsummary" Type="String" />
            <asp:Parameter Name="reportdate" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="closedate" Type="DateTime" />
            <asp:Parameter Name="remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Letterno" Type="Int32" />
            <asp:Parameter Name="deptdate" Type="DateTime" />
            <asp:Parameter Name="letterdate" Type="DateTime" />
            <asp:Parameter Name="applname" Type="String" />
            <asp:Parameter Name="empname" Type="String" />
            <asp:Parameter Name="emp_desig" Type="String" />
            <asp:Parameter Name="applsummary" Type="String" />
            <asp:Parameter Name="reportdate" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="closedate" Type="DateTime" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Letterno" Type="Int32" />
            <asp:Parameter Name="Original_deptdate" Type="DateTime" />
            <asp:Parameter Name="Original_letterdate" Type="DateTime" />
            <asp:Parameter Name="Original_applname" Type="String" />
            <asp:Parameter Name="Original_empname" Type="String" />
            <asp:Parameter Name="Original_emp_desig" Type="String" />
            <asp:Parameter Name="Original_reportdate" Type="DateTime" />
            <asp:Parameter Name="Original_Status" Type="String" />
            <asp:Parameter Name="Original_closedate" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

