
<%@ page language="C#" autoeventwireup="true" masterpagefile="~/IGRSS_Default.master" theme="IGRSS_Skin" inherits="GovtDoc, App_Web_av4af3yi" stylesheettheme="IGRSS_Skin" %>

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
                                    ReadOnly="True" />
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
               <asp:FormView ID="FvGovtDoc" runat="server" DataSourceID="ObjectDataSource_govtdoc" 
                       EnableModelValidation="True">
                   <EditItemTemplate>
                       <table align="center" width="100%">
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label24" runat="server" Text="Sr No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox22" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label25" runat="server" Text="Name Of Department"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox23" runat="server" Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label26" runat="server" Text="Inward Number"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox24" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label27" runat="server" Text="File No"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox25" runat="server" Width="200px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label28" runat="server" Text="Details"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox26" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label29" runat="server" Text="Details Of Output"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox27" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;<asp:Label ID="Label30" runat="server" Text="Letter No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox28" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label31" runat="server" Text="Details Of Preserving Files"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox29" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label32" runat="server" Text="Letter Date"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox30" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label33" runat="server" Text="Type Of Record"></asp:Label>
                               </td>
                               <td style="margin-left: 80px">
                                   <asp:DropDownList ID="DropDownList3" runat="server" Width="200px">
                                       <asp:ListItem>Select</asp:ListItem>
                                       <asp:ListItem>A</asp:ListItem>
                                       <asp:ListItem>B</asp:ListItem>
                                       <asp:ListItem>C</asp:ListItem>
                                       <asp:ListItem>D</asp:ListItem>
                                       <asp:ListItem>E</asp:ListItem>
                                   </asp:DropDownList>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Label ID="Label34" runat="server" Text="Remarks"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox31" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Button ID="Button6" runat="server" onclick="Button1_Click" Text="Add" />
                               </td>
                               <td>
                                   <asp:Button ID="Button_update" runat ="server" Text="Update" />
                                   </td>
                               <td>
                                   <asp:Button ID="Button7" runat="server" Text="Cancel" />
                               </td>
                           </tr>
                       </table>
                   </EditItemTemplate>
                   <InsertItemTemplate>
                       <table align="center" width="100%">
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label24" runat="server" Text="Sr No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox22" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label25" runat="server" Text="Name Of Department"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox23" runat="server" Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label26" runat="server" Text="Inward Number"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox24" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label27" runat="server" Text="File No"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox25" runat="server" Width="200px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label28" runat="server" Text="Details"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox26" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label29" runat="server" Text="Details Of Output"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox27" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;<asp:Label ID="Label30" runat="server" Text="Letter No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox28" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label31" runat="server" Text="Details Of Preserving Files"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox29" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label32" runat="server" Text="Letter Date"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox30" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label33" runat="server" Text="Type Of Record"></asp:Label>
                               </td>
                               <td style="margin-left: 80px">
                                   <asp:DropDownList ID="DropDownList3" runat="server" Width="200px">
                                       <asp:ListItem>Select</asp:ListItem>
                                       <asp:ListItem>A</asp:ListItem>
                                       <asp:ListItem>B</asp:ListItem>
                                       <asp:ListItem>C</asp:ListItem>
                                       <asp:ListItem>D</asp:ListItem>
                                       <asp:ListItem>E</asp:ListItem>
                                   </asp:DropDownList>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Label ID="Label34" runat="server" Text="Remarks"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox31" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Button ID="Button6" runat="server" onclick="Button1_Click" Text="Add" />
                               </td>
                               <td>
                              <asp:Button ID="Button_update" runat="server" Text="Update" />
                               </td>
                               <td>
                                   <asp:Button ID="Button7" runat="server" Text="Cancel" />
                               </td>
                           </tr>
                       </table>
                   </InsertItemTemplate>
                   <ItemTemplate>
                       <table align="center" width="100%">
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label24" runat="server" Text="Sr No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox_SrNo" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label25" runat="server" Text="Name Of Department"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox_deptname" runat="server" Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label26" runat="server" Text="Inward Number"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox_InwardNo" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label27" runat="server" Text="File No"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox_fileno" runat="server" Width="200px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label28" runat="server" Text="Details"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox_details" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label29" runat="server" Text="Details Of Output"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox_outputdetails" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;<asp:Label ID="Label30" runat="server" Text="Letter No"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox_letterno" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label31" runat="server" Text="Details Of Preserving Files"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox_preservingfilesdetails" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   <asp:Label ID="Label32" runat="server" Text="Letter Date"></asp:Label>
                               </td>
                               <td align="left">
                                   <asp:TextBox ID="TextBox_letterdate" runat="server" Width="200px"></asp:TextBox>
                               </td>
                               <td align="left">
                                   <asp:Label ID="Label33" runat="server" Text="Type Of Record"></asp:Label>
                               </td>
                               <td style="margin-left: 80px">
                                   <asp:DropDownList ID="DropDownList_record" runat="server" Width="200px">
                                       <asp:ListItem>Select</asp:ListItem>
                                       <asp:ListItem>A</asp:ListItem>
                                       <asp:ListItem>B</asp:ListItem>
                                       <asp:ListItem>C</asp:ListItem>
                                       <asp:ListItem>D</asp:ListItem>
                                       <asp:ListItem>E</asp:ListItem>
                                   </asp:DropDownList>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Label ID="Label34" runat="server" Text="Remarks"></asp:Label>
                               </td>
                               <td>
                                   <asp:TextBox ID="TextBox_remarks" runat="server" Height="60px" TextMode="MultiLine" 
                                       Width="190px"></asp:TextBox>
                               </td>
                           </tr>
                           <tr>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   &nbsp;</td>
                               <td align="left">
                                   <asp:Button ID="Button_add" runat="server" onclick="Button1_Click" Text="Add" />
                               </td>
                               <td>
                              <asp:Button ID="Button_update" runat="server" Text="Update" />
                               </td>
                               <td>
                                   <asp:Button ID="Button_cancel" runat="server" Text="Cancel" />
                               </td>
                           </tr>
                       </table>
                   </ItemTemplate>
               
                   </asp:FormView>
                   
                   <asp:ObjectDataSource ID="ObjectDataSource_govtdoc" runat="server" 
                       DeleteMethod="Delete" InsertMethod="InsertQuery" 
                       OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                       TypeName="IGRSS.DataAccessLayer.GovtDocTableAdapters.GovtDocsTableAdapter" 
                       UpdateMethod="Update"  OnInserted=" ObjectDataSource_govtdoc_inserted" >
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
               </asp:View>
               </asp:MultiView>
                    
    </asp:Content>
   
                    
 

