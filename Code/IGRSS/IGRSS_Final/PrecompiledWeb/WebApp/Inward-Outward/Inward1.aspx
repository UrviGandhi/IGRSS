<%@ page language="C#" autoeventwireup="true" masterpagefile="~/IGRSS_Default.master" inherits="Inward_Outward_Inward1, App_Web_dhxbsoqy" stylesheettheme="IGRSS_Skin" %>

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
                                <asp:BoundField DataField="Inward_outwardId" HeaderText="Inward_outwardId" 
                                    SortExpression="Inward_outwardId" ReadOnly="true" />
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" />
                                <asp:BoundField DataField="RegisterType" HeaderText="RegisterType" 
                                    SortExpression="RegisterType" />
                                <asp:BoundField DataField="DocumentNo" HeaderText="DocumentNo" 
                                    SortExpression="DocumentNo" />
                                <asp:BoundField DataField="InOutDate" HeaderText="InOutDate" 
                                    SortExpression="InOutDate" />
                                <asp:BoundField DataField="DocType" HeaderText="DocType" 
                                    SortExpression="DocType" />
                                <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                                    SortExpression="ApplicantName" />
                                <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                                    SortExpression="ApplicantAddress" />
                                <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                                    SortExpression="ApplicationDate" />
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
                                    SortExpression="CreatedAt" />
                                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                                    SortExpression="ModifiedBy" />
                                <asp:BoundField DataField="ModifiedAt" HeaderText="ModifiedAt" 
                                    SortExpression="ModifiedAt" />
                                <asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" 
                                    SortExpression="IsDeleted" />
                                <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                                    SortExpression="DeletedBy" />
                                <asp:BoundField DataField="DeletedAt" HeaderText="DeletedAt" 
                                    SortExpression="DeletedAt" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                            </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                            DeleteMethod="Delete" InsertMethod="AddInwardOutwardDetails" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetData" 
                            TypeName="IGRSS.DataAccessLayer.InwardTableAdapters.Inward_OutwardRegisterTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                                <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                                <asp:Parameter Name="Original_RegisterType" Type="String" />
                                <asp:Parameter Name="Original_DocumentNo" Type="String" />
                                <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="Original_DocType" />
                                <asp:Parameter Name="Original_ApplicantName" Type="String" />
                                <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
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
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                                <asp:Parameter Name="InwardNo" Type="Int32" />
                                <asp:Parameter Name="RegisterType" Type="String" />
                                <asp:Parameter Name="DocumentNo" Type="String" />
                                <asp:Parameter Name="InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="DocType" />
                                <asp:Parameter Name="ApplicantName" Type="String" />
                                <asp:Parameter Name="ApplicantAddress" Type="String" />
                                <asp:Parameter Name="ApplicationDate" Type="DateTime" />
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
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter DbType="Guid" Name="Inward_outwardId" />
                                <asp:Parameter Name="InwardNo" Type="Int32" />
                                <asp:Parameter Name="RegisterType" Type="String" />
                                <asp:Parameter Name="DocumentNo" Type="String" />
                                <asp:Parameter Name="InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="DocType" />
                                <asp:Parameter Name="ApplicantName" Type="String" />
                                <asp:Parameter Name="ApplicantAddress" Type="String" />
                                <asp:Parameter Name="ApplicationDate" Type="DateTime" />
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
                                <asp:Parameter DbType="Guid" Name="Original_Inward_outwardId" />
                                <asp:Parameter Name="Original_InwardNo" Type="Int32" />
                                <asp:Parameter Name="Original_RegisterType" Type="String" />
                                <asp:Parameter Name="Original_DocumentNo" Type="String" />
                                <asp:Parameter Name="Original_InOutDate" Type="DateTime" />
                                <asp:Parameter DbType="Guid" Name="Original_DocType" />
                                <asp:Parameter Name="Original_ApplicantName" Type="String" />
                                <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
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
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                        </td>
                </tr>
            </table>
              <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
 </asp:View>
  <asp:View ID="vieFv" runat="server">
      <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
          AutoGenerateRows="False" DataKeyNames="Inward_outwardId" 
          DataSourceID="ObjectDataSource1" EnableModelValidation="True" Height="50px" 
          Width="125px">
          <Fields>
              <asp:BoundField DataField="Inward_outwardId" HeaderText="Inward_outwardId" 
                  ReadOnly="True" SortExpression="Inward_outwardId" />
              <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                  SortExpression="InwardNo" />
              <asp:BoundField DataField="RegisterType" HeaderText="RegisterType" 
                  SortExpression="RegisterType" />
              <asp:BoundField DataField="DocumentNo" HeaderText="DocumentNo" 
                  SortExpression="DocumentNo" />
              <asp:BoundField DataField="InOutDate" HeaderText="InOutDate" 
                  SortExpression="InOutDate" />
              <asp:BoundField DataField="DocType" HeaderText="DocType" 
                  SortExpression="DocType" />
              <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                  SortExpression="ApplicantName" />
              <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                  SortExpression="ApplicantAddress" />
              <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                  SortExpression="ApplicationDate" />
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
                  SortExpression="CreatedAt" />
              <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                  SortExpression="ModifiedBy" />
              <asp:BoundField DataField="ModifiedAt" HeaderText="ModifiedAt" 
                  SortExpression="ModifiedAt" />
              <asp:CheckBoxField DataField="IsDeleted" HeaderText="IsDeleted" 
                  SortExpression="IsDeleted" />
              <asp:BoundField DataField="DeletedBy" HeaderText="DeletedBy" 
                  SortExpression="DeletedBy" />
              <asp:BoundField DataField="DeletedAt" HeaderText="DeletedAt" 
                  SortExpression="DeletedAt" />
              <asp:CommandField ShowInsertButton="True" />
          </Fields>
      </asp:DetailsView>
  </asp:View>
</asp:MultiView>
</asp:Content>