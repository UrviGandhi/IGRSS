<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IGRSS_Default.master" CodeFile="WorkSheetRegister.aspx.cs" Inherits="LatestPages_WorkSheetRegister" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
<asp:MultiView ID="MultiView_worksheet" runat="server" ActiveViewIndex="0">
<asp:View ID="viewGrid" runat="server">
<table>
<tr>
                <td align="right" style="width: 641px">
                    <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                        meta:resourcekey="lblllsResource1"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" 
                        meta:resourcekey="txtFileNoResource1" Width="160px" 
                        ontextchanged="txtFileNo_TextChanged"></asp:TextBox> 
                </td>
                <td>
                    <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search" meta:resourcekey="btnSearchAppNoResource1" />           
                </td>
            </tr>
    <tr>
        <td align="right" colspan="3">
            <asp:GridView ID="GridView_worksheet" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SrNo" 
                DataSourceID="ods_worksheet" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="SrNo" HeaderText="SrNo" ReadOnly="True" 
                        SortExpression="SrNo" Visible="False" />
                    <asp:BoundField DataField="Inward_No" HeaderText="Inward_No" 
                        SortExpression="Inward_No" />
                    <asp:BoundField DataField="WorkSheet_no" HeaderText="WorkSheet_no" 
                        SortExpression="WorkSheet_no" />
                    <asp:BoundField DataField="NameofPerson" HeaderText="NameofPerson" 
                        SortExpression="NameofPerson" />
                    <asp:BoundField DataField="Letter_details" HeaderText="Letter_details" 
                        SortExpression="Letter_details" />
                    <asp:BoundField DataField="Work_Disposal" HeaderText="Work_Disposal" 
                        SortExpression="Work_Disposal" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="3" style="text-align: left;">
            <asp:Button ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" />
        </td>
    </tr>
</table>
</asp:View>

<asp:View ID="Worksheetregister" runat="server">

    <asp:ObjectDataSource ID="ods_worksheet" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.WorksheetregisterTableAdapters.Worksheet_RegisterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Inward_No" Type="Int32" />
            <asp:Parameter Name="Original_WorkSheet_no" Type="Int32" />
            <asp:Parameter Name="Original_NameofPerson" Type="String" />
            <asp:Parameter Name="Original_Letter_details" Type="String" />
            <asp:Parameter Name="Original_Work_Disposal" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
            <asp:Parameter Name="Inward_No" Type="Int32" />
            <asp:Parameter Name="WorkSheet_no" Type="Int32" />
            <asp:Parameter Name="NameofPerson" Type="String" />
            <asp:Parameter Name="Letter_details" Type="String" />
            <asp:Parameter Name="Work_Disposal" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Inward_No" Type="Int32" />
            <asp:Parameter Name="WorkSheet_no" Type="Int32" />
            <asp:Parameter Name="NameofPerson" Type="String" />
            <asp:Parameter Name="Letter_details" Type="String" />
            <asp:Parameter Name="Work_Disposal" Type="DateTime" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Inward_No" Type="Int32" />
            <asp:Parameter Name="Original_WorkSheet_no" Type="Int32" />
            <asp:Parameter Name="Original_NameofPerson" Type="String" />
            <asp:Parameter Name="Original_Letter_details" Type="String" />
            <asp:Parameter Name="Original_Work_Disposal" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <center><asp:FormView ID="FormView_worksheet" Width="50%" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_worksheet" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserted="FormView_worksheet_ItemInserted" 
        onitemupdated="FormView_worksheet_ItemUpdated">
        <EditItemTemplate>
         <table>
<tr><td>SrNo:</td><td><asp:TextBox ID="SrNoTextBox" runat="server" 
        Text='<%# Bind("SrNo") %>' Width="160px" /></td></tr>

 <tr><td>           Inward_No:</td><td>
            <asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" /></td></tr>

<tr><td>            WorkSheet_no:</td><td>
            <asp:TextBox ID="WorkSheet_noTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_no") %>' Width="160px" /></td></tr>

<tr><td>            NameofPerson:</td><td>
            <asp:TextBox ID="NameofPersonTextBox" runat="server" 
                Text='<%# Bind("NameofPerson") %>' Width="160px" /></td></tr>

<tr><td>            Letter_details:</td><td>
            <asp:TextBox ID="Letter_detailsTextBox" runat="server" 
                Text='<%# Bind("Letter_details") %>' Width="160px" /></td></tr>

<tr><td>            Work_Disposal:</td><td>
            <asp:TextBox ID="Work_DisposalTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal") %>' Width="160px" /></td></tr>

<tr><td>            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>



</table>
        </EditItemTemplate>
        <InsertItemTemplate>
           <table>
<tr><td>SrNo:</td><td><asp:TextBox ID="SrNoTextBox" runat="server" 
        Text='<%# Bind("SrNo") %>' Width="160px" /></td></tr>

 <tr><td>           Inward_No:</td><td>
            <asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" /></td></tr>

<tr><td>            WorkSheet_no:</td><td>
            <asp:TextBox ID="WorkSheet_noTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_no") %>' Width="160px" /></td></tr>

<tr><td>            NameofPerson:</td><td>
            <asp:TextBox ID="NameofPersonTextBox" runat="server" 
                Text='<%# Bind("NameofPerson") %>' Width="160px" /></td></tr>

<tr><td>            Letter_details:</td><td>
            <asp:TextBox ID="Letter_detailsTextBox" runat="server" 
                Text='<%# Bind("Letter_details") %>' Width="160px" /></td></tr>

<tr><td>            Work_Disposal:</td><td>
            <asp:TextBox ID="Work_DisposalTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal") %>' Width="160px" /></td></tr>

<tr><td>            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>



</table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Inward_No:
            <asp:Label ID="Inward_NoLabel" runat="server" Text='<%# Bind("Inward_No") %>' />
            <br />
            WorkSheet_no:
            <asp:Label ID="WorkSheet_noLabel" runat="server" 
                Text='<%# Bind("WorkSheet_no") %>' />
            <br />
            NameofPerson:
            <asp:Label ID="NameofPersonLabel" runat="server" 
                Text='<%# Bind("NameofPerson") %>' />
            <br />
            Letter_details:
            <asp:Label ID="Letter_detailsLabel" runat="server" 
                Text='<%# Bind("Letter_details") %>' />
            <br />
            Work_Disposal:
            <asp:Label ID="Work_DisposalLabel" runat="server" 
                Text='<%# Bind("Work_Disposal") %>' />
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