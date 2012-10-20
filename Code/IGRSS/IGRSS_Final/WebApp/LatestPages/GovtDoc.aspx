
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IGRSS_Default.master" Theme="IGRSS_Skin" CodeFile="GovtDoc.aspx.cs" Inherits="GovtDoc" %>

    <asp:Content ID="content1" ContentPlaceHolderID="Main" runat="server">
    <asp:MultiView ID="mvgovtdoc" runat="server" ActiveViewIndex="0">
                      <asp:View ID="viewGrid" runat="server">
                       <table width="100%">
             <tr>
                    <td align="left" class="labelColumn">
                        <asp:Label ID="Label1" runat="server" Text="Enter File Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" class="textColumn">
                        <asp:TextBox ID="TextBox11" runat="server" MaxLength="15" OnTextChanged="txtFileNo_TextChanged"
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
                </tr>
                 <tr>
                    <td colspan="6" style="height: 198px">
                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="ObjectDataSource_govtdoc" Width="100%" DataKeyNames="SrNo" 
                            AllowPaging="True" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" SortExpression="SrNo"  
                                    ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" />
                                <asp:BoundField DataField="Details" HeaderText="Details" 
                                    SortExpression="Details" />
                                <asp:BoundField DataField="LetterNo" HeaderText="LetterNo" 
                                    SortExpression="LetterNo" />
                                <asp:BoundField DataField="LetterDate" HeaderText="LetterDate" 
                                    SortExpression="LetterDate" />
                                <asp:BoundField DataField="NameOfDepartment" HeaderText="NameOfDepartment" 
                                    SortExpression="NameOfDepartment" />
                                <asp:BoundField DataField="FileNo" HeaderText="FileNo" 
                                    SortExpression="FileNo" />
                                <asp:BoundField DataField="DetailsOfOutput" HeaderText="DetailsOfOutput" 
                                    SortExpression="DetailsOfOutput" />
                                <asp:BoundField DataField="DetailsOfPreservingFiles" 
                                    HeaderText="DetailsOfPreservingFiles" 
                                    SortExpression="DetailsOfPreservingFiles" />
                                <asp:BoundField DataField="TypesOfRecord" HeaderText="TypesOfRecord" 
                                    SortExpression="TypesOfRecord" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                    SortExpression="Remarks" />
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="Button_new" runat="server" onclick="Button_new_Click" 
                            Text="New" />
                        </td>
                        </tr>
                        </table>
                      </asp:View>
                   
               <asp:View ID="viewFv" runat="server">
               
                   
                   <asp:ObjectDataSource ID="ObjectDataSource_govtdoc" runat="server" 
                       DeleteMethod="Delete" InsertMethod="Insert" 
                       OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                       TypeName="IGRSS.DataAccessLayer.GovtDocTableAdapters.GovtDocsTableAdapter" 
                       UpdateMethod="Update"  OnInserted=" ObjectDataSource_govtdoc_inserted" 
                        >
                       <DeleteParameters>
                           <asp:Parameter Name="Original_SrNo" Type="Int32" />
                           <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                           <asp:Parameter Name="Original_LetterNo" Type="Int32" />
                           <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
                           <asp:Parameter Name="Original_NameOfDepartment" Type="String" />
                           <asp:Parameter Name="Original_FileNo" Type="Int32" />
                           <asp:Parameter Name="Original_TypesOfRecord" Type="String" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="SrNo" Type="Int32" />
                           <asp:Parameter Name="InwardNo" Type="Int32" />
                           <asp:Parameter Name="Details" Type="String" />
                           <asp:Parameter Name="LetterNo" Type="Int32" />
                           <asp:Parameter Name="LetterDate" Type="DateTime" />
                           <asp:Parameter Name="NameOfDepartment" Type="String" />
                           <asp:Parameter Name="FileNo" Type="Int32" />
                           <asp:Parameter Name="DetailsOfOutput" Type="String" />
                           <asp:Parameter Name="DetailsOfPreservingFiles" Type="String" />
                           <asp:Parameter Name="TypesOfRecord" Type="String" />
                           <asp:Parameter Name="Remarks" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="InwardNo" Type="Int32" />
                           <asp:Parameter Name="Details" Type="String" />
                           <asp:Parameter Name="LetterNo" Type="Int32" />
                           <asp:Parameter Name="LetterDate" Type="DateTime" />
                           <asp:Parameter Name="NameOfDepartment" Type="String" />
                           <asp:Parameter Name="FileNo" Type="Int32" />
                           <asp:Parameter Name="DetailsOfOutput" Type="String" />
                           <asp:Parameter Name="DetailsOfPreservingFiles" Type="String" />
                           <asp:Parameter Name="TypesOfRecord" Type="String" />
                           <asp:Parameter Name="Remarks" Type="String" />
                           <asp:Parameter Name="Original_SrNo" Type="Int32" />
                           <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                           <asp:Parameter Name="Original_LetterNo" Type="Int32" />
                           <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
                           <asp:Parameter Name="Original_NameOfDepartment" Type="String" />
                           <asp:Parameter Name="Original_FileNo" Type="Int32" />
                           <asp:Parameter Name="Original_TypesOfRecord" Type="String" />
                       </UpdateParameters>
                   </asp:ObjectDataSource>
                   <center><asp:FormView ID="FvGovtDoc" runat="server" DataKeyNames="SrNo" 
                       DataSourceID="ObjectDataSource_govtdoc" EnableModelValidation="True" 
                       DefaultMode="Insert" Width="50%">
                       <EditItemTemplate>
                           <table>
 <tr>
 <td>
 SrNo:
 </td><td>
                           <asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' 
                               Width="160px" />
</td></tr><tr><td>
                           InwardNo:
</td><td>                           <asp:TextBox ID="InwardNoTextBox" runat="server" 
                               Text='<%# Bind("InwardNo") %>' Width="160px" />
</td></tr><tr><td>
                           Details:
</td><td>                           <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' 
                               TextMode="MultiLine" Width="160px" />
</td></tr><tr><td>
                           LetterNo:
</td><td>                           <asp:TextBox ID="LetterNoTextBox" runat="server" 
                               Text='<%# Bind("LetterNo") %>' Width="160px" />
</td></tr><tr><td>
                           LetterDate:
</td><td>                           <asp:TextBox ID="LetterDateTextBox" runat="server" 
                               Text='<%# Bind("LetterDate") %>' Width="160px" />
</td></tr><tr><td>
                           NameOfDepartment:
</td><td>                           <asp:TextBox ID="NameOfDepartmentTextBox" runat="server" 
                               Text='<%# Bind("NameOfDepartment") %>' Width="160px" />
</td></tr><tr><td>
                           FileNo:
</td><td>                           <asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                               Width="160px" />
</td></tr><tr><td>
                           DetailsOfOutput:
</td><td>                           <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" 
                              Text='<%# Bind("DetailsOfOutput") %>' TextMode="MultiLine" Width="160px" />
</td></tr><tr><td>
                           DetailsOfPreservingFiles:
</td><td>                           <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" 
                               Text='<%# Bind("DetailsOfPreservingFiles") %>' TextMode="MultiLine" 
                               Width="160px" />
</td></tr><tr><td>
                           TypesOfRecord:
</td><td>                               <asp:DropDownList ID="TypesOfRecord" runat="server" 
                               DataSourceID="ObjectDataSource_govtdoc" DataTextField="TypesOfRecord" 
                               DataValueField="TypesOfRecord" Width="160px">
                               </asp:DropDownList>
</td></tr><tr><td>
                           Remarks:
</td><td>                           <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
</td></tr><tr><td colspan=2 align="center">
                           <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                               CommandName="Insert" Text="Insert" />
                           &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                               CausesValidation="False" CommandName="Cancel" Text="Cancel" />
</td></tr></table>                      
 </EditItemTemplate>
                       <InsertItemTemplate>
                            <table>
 <tr>
 <td>
 SrNo:
 </td><td>
                           <asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' 
                               Width="160px" />
</td></tr><tr><td>
                           InwardNo:
</td><td>                           <asp:TextBox ID="InwardNoTextBox" runat="server" 
                               Text='<%# Bind("InwardNo") %>' Width="160px" />
</td></tr><tr><td>
                           Details:
</td><td>                           <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' 
                               TextMode="MultiLine" Width="160px" />
</td></tr><tr><td>
                           LetterNo:
</td><td>                           <asp:TextBox ID="LetterNoTextBox" runat="server" 
                               Text='<%# Bind("LetterNo") %>' Width="160px" />
</td></tr><tr><td>
                           LetterDate:
</td><td>                           <asp:TextBox ID="LetterDateTextBox" runat="server" 
                               Text='<%# Bind("LetterDate") %>' Width="160px" />
</td></tr><tr><td>
                           NameOfDepartment:
</td><td>                           <asp:TextBox ID="NameOfDepartmentTextBox" runat="server" 
                               Text='<%# Bind("NameOfDepartment") %>' Width="160px" />
</td></tr><tr><td>
                           FileNo:
</td><td>                           <asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                               Width="160px" />
</td></tr><tr><td>
                           DetailsOfOutput:
</td><td>                           <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" 
                              Text='<%# Bind("DetailsOfOutput") %>' TextMode="MultiLine" Width="160px" />
</td></tr><tr><td>
                           DetailsOfPreservingFiles:
</td><td>                           <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" 
                               Text='<%# Bind("DetailsOfPreservingFiles") %>' TextMode="MultiLine" 
                               Width="160px" />
</td></tr><tr><td>
                           TypesOfRecord:
</td><td>                               <asp:DropDownList ID="TypesOfRecord" runat="server" 
                               DataSourceID="ObjectDataSource_govtdoc" DataTextField="TypesOfRecord" 
                               DataValueField="TypesOfRecord" Width="160px">
                               </asp:DropDownList>
</td></tr><tr><td>
                           Remarks:
</td><td>                           <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
</td></tr><tr><td colspan=2 align="center">
                           <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                               CommandName="Insert" Text="Insert" />
                           &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                               CausesValidation="False" CommandName="Cancel" Text="Cancel" />
</td></tr></table>
                       </InsertItemTemplate>
                       <ItemTemplate>
                           SrNo:
                           <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                           <br />
                           InwardNo:
                           <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
                           <br />
                           Details:
                           <asp:Label ID="DetailsLabel" runat="server" Text='<%# Bind("Details") %>' />
                           <br />
                           LetterNo:
                           <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
                           <br />
                           LetterDate:
                           <asp:Label ID="LetterDateLabel" runat="server" 
                               Text='<%# Bind("LetterDate") %>' />
                           <br />
                           NameOfDepartment:
                           <asp:Label ID="NameOfDepartmentLabel" runat="server" 
                               Text='<%# Bind("NameOfDepartment") %>' />
                           <br />
                           FileNo:
                           <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
                           <br />
                           DetailsOfOutput:
                           <asp:Label ID="DetailsOfOutputLabel" runat="server" 
                               Text='<%# Bind("DetailsOfOutput") %>' />
                           <br />
                           DetailsOfPreservingFiles:
                           <asp:Label ID="DetailsOfPreservingFilesLabel" runat="server" 
                               Text='<%# Bind("DetailsOfPreservingFiles") %>' />
                           <br />
                           TypesOfRecord:
                           <asp:Label ID="TypesOfRecordLabel" runat="server" 
                               Text='<%# Bind("TypesOfRecord") %>' />
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
                   </asp:FormView></center>
                   
               </asp:View>
               </asp:MultiView>
                    
    </asp:Content>
   
                    
 

