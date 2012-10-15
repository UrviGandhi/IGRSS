<%@ page language="C#" autoeventwireup="true" masterpagefile="~/IGRSS_Default.master" inherits="Inward_Outward_Inward1, App_Web_b0gavear" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="content1" ContentPlaceHolderID="Main" runat="server">
<asp:MultiView ID="mvInward" runat="server" ActiveViewIndex="0">
 <asp:View ID="vieGrid" runat="server">
 <table width="100%">
             <tr>
                    <td align="left" class="labelColumn">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number" meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" class="textColumn">
                        <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" OnTextChanged="txtFileNo_TextChanged"
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" colspan="6">
                        <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="height: 198px">
                        <asp:GridView ID="gvInwarddtl" runat="server" AutoGenerateColumns="False" DataKeyNames="Inward_outwardId"
                            DataSourceID="ObjectDataSource1"
                            meta:resourcekey="gvInwarddtlResource1" AllowPaging="True" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" />
                                <asp:BoundField DataField="DocumentNo" HeaderText="DocumentNo" 
                                    SortExpression="DocumentNo" />
                                <asp:BoundField DataField="Inward_outwardId" HeaderText="Inward_outwardId" 
                                    ReadOnly="true" SortExpression="Inward_outwardId" Visible="False" />
                                <asp:BoundField DataField="RegisterType" HeaderText="RegisterType" 
                                    SortExpression="RegisterType" />
                                <asp:BoundField DataField="InOutDate" HeaderText="InOutDate" 
                                    SortExpression="InOutDate" />
                                <asp:BoundField DataField="DocType" HeaderText="DocType" 
                                    SortExpression="DocType" />
                                <asp:BoundField DataField="SentOfficeID" HeaderText="SentOfficeID" 
                                    SortExpression="SentOfficeID" />
                                <asp:BoundField DataField="ReceivingOfficeID" HeaderText="ReceivingOfficeID" 
                                    SortExpression="ReceivingOfficeID" />
                                <asp:BoundField DataField="DocumentSentFrom" HeaderText="DocumentSentFrom" 
                                    SortExpression="DocumentSentFrom" />
                                <asp:BoundField DataField="DocumentSentTo" HeaderText="DocumentSentTo" 
                                    SortExpression="DocumentSentTo" />
                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" />
                                <asp:BoundField DataField="StampValueAffixed" HeaderText="StampValueAffixed" 
                                    SortExpression="StampValueAffixed" />
                                <asp:BoundField DataField="DeliveryType" HeaderText="DeliveryType" 
                                    SortExpression="DeliveryType" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                    SortExpression="Remarks" />
                                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                                    SortExpression="CreatedBy" />
                                <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" 
                                    SortExpression="CreatedAt" Visible="False" />
                                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                                    SortExpression="ModifiedBy" Visible="False" />
                                <asp:BoundField DataField="ModifiedAt" HeaderText="ModifiedAt" 
                                    SortExpression="ModifiedAt" />
                                <asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" 
                                    SortExpression="IsDeleted" />
                                <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                                    SortExpression="DeletedBy" />
                                <asp:BoundField DataField="DeletedAt" HeaderText="DeletedAt" 
                                    SortExpression="DeletedAt" />
                                <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                                    SortExpression="ApplicantName" />
                                <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                                    SortExpression="ApplicantAddress" />
                                <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                                    SortExpression="ApplicationDate" />
                                <asp:BoundField DataField="DeliveryBranch" HeaderText="DeliveryBranch" 
                                    SortExpression="DeliveryBranch" />
                                <asp:BoundField DataField="DocumentSender" HeaderText="DocumentSender" 
                                    SortExpression="DocumentSender" />
                                <asp:BoundField DataField="ReceiversName" HeaderText="ReceiversName" 
                                    SortExpression="ReceiversName" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                            </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                            DeleteMethod="Delete" InsertMethod="AddInwardOutwardDetails" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetAllInwardOutwardDetails" 
                            TypeName="IGRSS.DataAccessLayer.InwardOutwardTableAdapters.Inward_OutwardRegisterTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                                <asp:Parameter Name="Original_RegisterType" Type="String" />
                                <asp:Parameter Name="Original_DocumentNo" Type="String" />
                                <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="Original_DocType" />
                                <asp:Parameter DbType="Guid" Name="Original_SentOfficeID" />
                                <asp:Parameter DbType="Guid" Name="Original_ReceivingOfficeID" />
                                <asp:Parameter Name="Original_DocumentSentFrom" Type="String" />
                                <asp:Parameter Name="Original_DocumentSentTo" Type="String" />
                                <asp:Parameter Name="Original_Description" Type="String" />
                                <asp:Parameter Name="Original_StampValueAffixed" Type="Decimal" />
                                <asp:Parameter DbType="Guid" Name="Original_DeliveryType" />
                                <asp:Parameter Name="Original_Remarks" Type="String" />
                                <asp:Parameter Name="Original_CreatedBy" Type="String" />
                                <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                                <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                                <asp:Parameter Name="Original_DeletedBy" Type="String" />
                                <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_ApplicantName" Type="String" />
                                <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                                <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                                <asp:Parameter Name="RegisterType" Type="String" />
                                <asp:Parameter Name="DocumentNo" Type="String" />
                                <asp:Parameter Name="InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="DocType" />
                                <asp:Parameter DbType="Guid" Name="SentOfficeID" />
                                <asp:Parameter DbType="Guid" Name="ReceivingOfficeID" />
                                <asp:Parameter Name="DocumentSentFrom" Type="String" />
                                <asp:Parameter Name="DocumentSentTo" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="StampValueAffixed" Type="Decimal" />
                                <asp:Parameter DbType="Guid" Name="DeliveryType" />
                                <asp:Parameter Name="Remarks" Type="String" />
                                <asp:Parameter Name="CreatedBy" Type="String" />
                                <asp:Parameter Name="CreatedAt" Type="DateTime" />
                                <asp:Parameter Name="InwardNo" Type="Int32" />
                                <asp:Parameter Name="AplicantName" Type="String" />
                                <asp:Parameter Name="ApplicantAddress" Type="String" />
                                <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                                <asp:Parameter Name="RegisterType" Type="String" />
                                <asp:Parameter Name="DocumentNo" Type="String" />
                                <asp:Parameter Name="InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="DocType" />
                                <asp:Parameter DbType="Guid" Name="SentOfficeID" />
                                <asp:Parameter DbType="Guid" Name="ReceivingOfficeID" />
                                <asp:Parameter Name="DocumentSentFrom" Type="String" />
                                <asp:Parameter Name="DocumentSentTo" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="StampValueAffixed" Type="Decimal" />
                                <asp:Parameter DbType="Guid" Name="DeliveryType" />
                                <asp:Parameter Name="Remarks" Type="String" />
                                <asp:Parameter Name="CreatedBy" Type="String" />
                                <asp:Parameter Name="CreatedAt" Type="DateTime" />
                                <asp:Parameter Name="ModifiedBy" Type="String" />
                                <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                                <asp:Parameter Name="IsDeleted" Type="Boolean" />
                                <asp:Parameter Name="DeletedBy" Type="String" />
                                <asp:Parameter Name="DeletedAt" Type="DateTime" />
                                <asp:Parameter Name="ApplicantName" Type="String" />
                                <asp:Parameter Name="ApplicantAddress" Type="String" />
                                <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                                <asp:Parameter Name="InwardNo" Type="Int32" />
                                <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                                <asp:Parameter Name="Original_RegisterType" Type="String" />
                                <asp:Parameter Name="Original_DocumentNo" Type="String" />
                                <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="Original_DocType" />
                                <asp:Parameter DbType="Guid" Name="Original_SentOfficeID" />
                                <asp:Parameter DbType="Guid" Name="Original_ReceivingOfficeID" />
                                <asp:Parameter Name="Original_DocumentSentFrom" Type="String" />
                                <asp:Parameter Name="Original_DocumentSentTo" Type="String" />
                                <asp:Parameter Name="Original_Description" Type="String" />
                                <asp:Parameter Name="Original_StampValueAffixed" Type="Decimal" />
                                <asp:Parameter DbType="Guid" Name="Original_DeliveryType" />
                                <asp:Parameter Name="Original_Remarks" Type="String" />
                                <asp:Parameter Name="Original_CreatedBy" Type="String" />
                                <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                                <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                                <asp:Parameter Name="Original_DeletedBy" Type="String" />
                                <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                                <asp:Parameter Name="Original_ApplicantName" Type="String" />
                                <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                                <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                        </td>
                </tr>
            </table>
              <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
 </asp:View>
  <asp:View ID="vieFv" runat="server">
  <asp:FormView ID="FvInward" runat="server" DataKeyNames="Inward_outwardId" 
          DataSourceID="ObjectDataSource1" EnableModelValidation="True" DefaultMode="Insert">
  
      <EditItemTemplate>
         <table border="0px" cellspacing="0" class="header" width="100%">
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_inwardno0" runat="server" Text="Inward No"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_inwardno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_affixedstampvalue" runat="server" 
                          Text="Affixed Stamp Value"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_affixedstampvalue" Text='<%# Bind("StampValueAffixed") %>' runat="server" 
                          style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_letterno" runat="server" Text="Letter No"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_letterno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverybranch" runat="server" Text="Delivery Branch"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverybranch" runat="server" Text='<%# Bind("ReceivingOfficeId") %>' style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                      <asp:Label ID="Label_lettertype" runat="server" Text="Letter Type"></asp:Label>
                  </td>
                  <td class="style3" style="margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_lettertype" runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td class="style3">
                      <asp:Label ID="Label_receivername" runat="server" Text="Receiver Name"></asp:Label>
                  </td>
                  <td class="style3">
                      <asp:TextBox ID="TextBox_receivername" runat="server" Height="50px" Text='<%# Bind("ReceiversName") %>'
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_officesentfrom" runat="server" Text="Office Sent From"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_officesentfrom" TabIndex='<%# Bind("SentOfficeID") %>' runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_inoutdate" runat="server" Text="In/Out Date"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_inoutdate" Text='<%# Bind("InOutDate") %>' runat="server" style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantname" runat="server" Text="Applicant's Name"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantname" Text='<%# Bind("ApplicantName") %>' runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_description" runat="server" Text="Description"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_description" Text='<%# Bind("Description") %>' runat="server" style="margin-top: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantaddress" runat="server" 
                          Text="Applicant's Address"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantaddress" runat="server" Height="50px" Text='<%# Bind("ApplicantAddress") %>' 
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_sentto" runat="server" Text="Sent To"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_sentto" Text='<%# Bind("DocumentSentTo") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicationdate" runat="server" Text="Application Date"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_applicationdate" Text='<%# Bind("ApplicationDate") %>' runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverytype" runat="server" Text="Delivery Type"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverytype" Text='<%# Bind("DeliveryType") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      &nbsp;</td>
                  <td style="height: 25px" valign="top">
                      &nbsp;</td>
                  <td>
                      <asp:Label ID="Label_sendername" runat="server" Text="Sender Name"></asp:Label>
                  </td>
                  <td>
                                        <asp:TextBox ID="TextBox1" Text='<%# Bind("DocType") %>' runat="server"></asp:TextBox>

                      <asp:TextBox ID="TextBox_sendername" Text='<%# Bind("DocumentSender") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td style="margin-left: 40px">
                      &nbsp;</td>
                  <td style="height: 25px" valign="top">
                      &nbsp;</td>
                  <td>
                      <asp:Label ID="Label_remarks" runat="server" Text="Remarks"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_remarks" runat="server" Height="50px" 
                          TextMode="MultiLine" Width="190px" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                  </td>
                  <td class="style3" valign="top">
                      &nbsp;</td>
                  <td class="style4">
                      <asp:Button ID="btn_add" runat="server" Text="Add" CommandName="Insert" />
                      <asp:Button ID="btn_update" runat="server" Text="Update" />
                  </td>
                  <td class="style3">
                      <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
                  </td>
              </tr>
          </table>

      </EditItemTemplate>
      <InsertItemTemplate>
          <table border="0px" cellspacing="0" class="header" width="100%">
              <tr align="left">
                  <td>
                      <asp:Label ID="lblguid" runat="server"  Text='<%# Bind("Inward_OutwardId") %>'></asp:Label>
                    
                      <asp:Label ID="Label_inwardno0" runat="server" Text="Inward No"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_inwardno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_affixedstampvalue" runat="server" 
                          Text="Affixed Stamp Value"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_affixedstampvalue" Text='<%# Bind("StampValueAffixed") %>' runat="server" 
                          style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_letterno" runat="server" Text="Letter No"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_letterno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverybranch" runat="server" Text="Delivery Branch"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverybranch" runat="server" Text='<%# Bind("DeliveryBranch") %>' style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                      <asp:Label ID="Label_lettertype" runat="server" Text="Letter Type"></asp:Label>
                  </td>
                  <td class="style3" style="margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_lettertype" runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td class="style3">
                      <asp:Label ID="Label_receivername" runat="server" Text="Receiver Name"></asp:Label>
                  </td>
                  <td class="style3">
                      <asp:TextBox ID="TextBox_receivername" runat="server" Height="50px" Text='<%# Bind("ReceiversName") %>'
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_officesentfrom" runat="server" Text="Office Sent From"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_officesentfrom" TabIndex='<%# Bind("SentOfficeID") %>' runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_inoutdate" runat="server" Text="In/Out Date"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_inoutdate" Text='<%# Bind("InOutDate") %>' runat="server" style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantname" runat="server" Text="Applicant's Name"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantname" Text='<%# Bind("ApplicantName") %>' runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_description" runat="server" Text="Description"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_description" Text='<%# Bind("Description") %>' runat="server" style="margin-top: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantaddress" runat="server" 
                          Text="Applicant's Address"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantaddress" runat="server" Height="50px" Text='<%# Bind("ApplicantAddress") %>' 
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_sentto" runat="server" Text="Sent To"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_sentto" Text='<%# Bind("DocumentSentTo") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicationdate" runat="server" Text="Application Date"></asp:Label>
                  </td>
                  <td style="height: 25px" valign="top">
                      <asp:TextBox ID="TextBox_applicationdate" Text='<%# Bind("ApplicationDate") %>' runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverytype" runat="server" Text="Delivery Type"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverytype" Text='<%# Bind("DeliveryType") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      &nbsp;</td>
                  <td style="height: 25px" valign="top">
                      &nbsp;</td>
                  <td>
                                        <asp:Label ID="lbldoctype" runat="server" Text='<%# Bind("DocType") %>'></asp:Label>
                                         <asp:Label ID="lblReceivingID" runat="server" Text='<%# Bind("ReceivingOfficeId") %>'></asp:Label>

                      <asp:Label ID="Label_sendername" runat="server" Text="Sender Name"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_sendername" Text='<%# Bind("DocumentSender") %>' runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td style="margin-left: 40px">
                      &nbsp;</td>
                  <td style="height: 25px" valign="top">
                      &nbsp;</td>
                  <td>
                      <asp:Label ID="Label_remarks" runat="server" Text="Remarks"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_remarks" runat="server" Height="50px" 
                          TextMode="MultiLine" Width="190px" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                  </td>
                  <td class="style3" valign="top">
                      &nbsp;</td>
                  <td class="style4">
                      <asp:Button ID="btn_add" runat="server" Text="Add" CommandName="Insert" />
                      <asp:Button ID="btn_update" runat="server" Text="Update" />
                  </td>
                  <td class="style3">
                      <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
                  </td>
              </tr>
          </table>
      </InsertItemTemplate>
      <ItemTemplate>
          <table border="0px" cellspacing="0" class="header">
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_inwardno0" runat="server" Text="Inward No"></asp:Label>
                  </td>
                  <td style="height: 25px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_inwardno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_affixedstampvalue" runat="server" 
                          Text="Affixed Stamp Value"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_affixedstampvalue"  runat="server" 
                          style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_letterno" runat="server" Text="Letter No"></asp:Label>
                  </td>
                  <td style="height: 25px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_letterno" runat="server" Width="80px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverybranch" runat="server" Text="Delivery Branch"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverybranch" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                      <asp:Label ID="Label_lettertype" runat="server" Text="Letter Type"></asp:Label>
                  </td>
                  <td class="style3" style="margin-left: 40px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_lettertype" runat="server"></asp:TextBox>
                  </td>
                  <td class="style3">
                      <asp:Label ID="Label_receivername" runat="server" Text="Receiver Name"></asp:Label>
                  </td>
                  <td class="style3">
                      <asp:TextBox ID="TextBox_receivername" runat="server" Height="50px" 
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_officesentfrom" runat="server" Text="Office Sent From"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_officesentfrom" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_inoutdate" runat="server" Text="In/Out Date"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_inoutdate" runat="server" style="margin-top: 4px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantname" runat="server" Text="Applicant's Name"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantname" runat="server" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_description" runat="server" Text="Description"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_description" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicantaddress" runat="server" 
                          Text="Applicant's Address"></asp:Label>
                  </td>
                  <td style="height: 25px; margin-left: 40px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_applicantaddress" runat="server" Height="50px" 
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_sentto" runat="server" Text="Sent To"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_sentto" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td>
                      <asp:Label ID="Label_applicationdate1" runat="server" Text="Application Date"></asp:Label>
                  </td>
                  <td style="height: 25px; width: 265px;" valign="top">
                      <asp:TextBox ID="TextBox_applicationdate0" runat="server"></asp:TextBox>
                  </td>
                  <td>
                      <asp:Label ID="Label_deliverytype" runat="server" Text="Delivery Type"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_deliverytype" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td style="margin-left: 40px">
                      &nbsp;</td>
                  <td style="height: 25px; width: 265px;" valign="top">
                      &nbsp;</td>
                  <td>
                      <asp:Label ID="Label_sendername" runat="server" Text="Sender Name"></asp:Label>
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox_sendername" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style2">
                      &nbsp;</td>
                  <td class="style2" style="width: 265px" valign="top">
                      &nbsp;</td>
                  <td class="style2">
                      <asp:Label ID="Label_remarks" runat="server" Text="Remarks"></asp:Label>
                  </td>
                  <td class="style2">
                      <asp:TextBox ID="TextBox_remarks" runat="server" Height="50px" 
                          TextMode="MultiLine" Width="190px"></asp:TextBox>
                  </td>
              </tr>
              <tr align="left">
                  <td class="style3">
                      &nbsp;</td>
                  <td class="style3" style="width: 265px" valign="top">
                      &nbsp;</td>
                  <td class="style4">
                      &nbsp;</td>
                  <td class="style3">
                      &nbsp;</td>
              </tr>
              <tr align="left">
                  <td class="style3">
                  </td>
                  <td class="style3" style="width: 265px" valign="top">
                      <asp:Button ID="btn_add" runat="server" CommandName="Insert" Text="Add" />
                  </td>
                  <td class="style4">
                      <asp:Button ID="btn_update" runat="server" Text="Update" />
                  </td>
                  <td class="style3">
                      <asp:Button ID="btn_cancel" runat="server" Text="Cancel" />
                  </td>
              </tr>
          </table>
      </ItemTemplate>
  
  </asp:FormView>
  </asp:View>
</asp:MultiView>
</asp:Content>