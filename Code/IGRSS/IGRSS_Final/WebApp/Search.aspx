<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="UserControls_Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    
    <asp:MultiView ID="mvSearch" runat="server">
        <asp:View ID="View1" runat="server">
    <table width="100%">
        <tr>
            <td colspan="6">
                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                    SkinID="SubHeading" Text="Search File"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%;">
                <asp:Label ID="lblFileNumber" runat="server" Text="Department"></asp:Label>
            </td>
            <td style="width: 20%">
                <asp:DropDownList ID="ddlModule" runat="server">
                    <asp:ListItem Value="LIC">License</asp:ListItem>
                    <asp:ListItem Value="APL">Appeal</asp:ListItem>
                    <asp:ListItem Value="REF">Refund</asp:ListItem>
                    <asp:ListItem Value="COM">Complain</asp:ListItem>
                    <asp:ListItem Value="ADJ">Adjudication</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 10%">
            </td>
            <td style="width: 20%; height: 26px">
                <asp:Label ID="lblOffice" runat="server" Text="Office"></asp:Label>
            </td>
            <td style="width: 20%">
                <asp:DropDownList ID="ddlOffice" runat="server" DataSourceID="OdsOfficeMaster" DataTextField="OfficeName"
                    DataValueField="OfficeId">
                </asp:DropDownList>
            </td>
            <td style="width: 10%">
            </td>
        </tr>
        <tr>
            <td style="height: 26px">
                <asp:Label ID="lblFileNo" runat="server" Text="Number"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtFileNumber" runat="server" MaxLength="5" meta:resourcekey="txtRefundSlNoInsResource1"></asp:TextBox></td>
            <td style="width: 10%; height: 26px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid Number" ControlToValidate="txtFileNumber" ValidationExpression="^\d{0,5}$">*</asp:RegularExpressionValidator>
            </td>
            <td style="height: 26px">
                <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtFileYear" runat="server" MaxLength="4"></asp:TextBox></td>
            <td style="height: 26px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFileYear"
                    ErrorMessage="Please enter valid Year" ValidationExpression="^\d{4}$">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="height: 26px">
                <asp:Label ID="lblNameOfApplicant" runat="server" Text="Applicant Name"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtApplicantName" runat="server" MaxLength="30"></asp:TextBox></td>
            <td style="height: 26px">
            <asp:RegularExpressionValidator ID="regAppnamet" runat="server" ControlToValidate="txtApplicantName"
                                    ErrorMessage="Enter Valid Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>">*</asp:RegularExpressionValidator>
            </td>
            <td style="height: 26px">
            </td>
            <td align="right" style="height: 26px">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
            <td align="right" style="height: 26px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
    <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" DataKeyNames="fileid" DataSourceID="odsSearch"  OnRowEditing="gvSearch_RowEditing" OnPageIndexChanged="gvSearch_PageIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="fileid" SortExpression="fileid" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fileid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblfileId" runat="server" Text='<%# Bind("fileid") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department" SortExpression="filedepartment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("filedepartment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("filedepartment") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="File Number" SortExpression="FileNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FileNo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblfileNo" runat="server" Text='<%# Bind("FileNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year" SortExpression="fileyear">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fileyear") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFileYear" runat="server" Text='<%# Bind("fileyear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OfficeId" SortExpression="OfficeId" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OfficeId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("OfficeId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Applicant Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" EditText="Select" />
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="lblresultnull" runat="server" ForeColor="Red" Text="No Records Found!!"></asp:Label>
        </EmptyDataTemplate>
    </asp:GridView>
            &nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Search</asp:LinkButton></asp:View>
    </asp:MultiView>
    &nbsp;
    <asp:ObjectDataSource ID="odsSearch" runat="server" InsertMethod="InsertNewFile"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetApplicantDetailsByValues"
        TypeName="IGRSS.BusinessLogicLayer.FileManagement" OnSelecting="odsSearch_Selecting">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="FileDepartment" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlModule" Name="filePrefix" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtFileNumber" Name="FileNo" PropertyName="Text"
                Type="Int32" />
            <asp:ControlParameter ControlID="txtFileYear" Name="FileYear" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtApplicantName" Name="ApplicantName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlOffice" Name="officeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeActivateOffice" InsertMethod="UpdateOfficeDetailsById" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
        <InsertParameters>
            <asp:Parameter Name="OfficeId" Type="Object" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="OfficeTypeId" Type="Object" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
