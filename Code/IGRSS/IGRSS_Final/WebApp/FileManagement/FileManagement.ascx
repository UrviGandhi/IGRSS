<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FileManagement.ascx.cs" Inherits="FileManagement" %>

<asp:FormView ID="fvFileManagement" runat="server" DataSourceID="OdsFileManagementUserCotrol" AllowPaging="True" DefaultMode="Insert">
    <InsertItemTemplate>

<table  width="100%">

<tr>

<td width="10%">
    <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>


</td>

<td width="100%">
    <asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>

</td>

</tr>

<tr>

<td style="height: 53px">
    <asp:Label ID="lblBody" runat="server" Text="Body"></asp:Label>


</td>

<td style="height: 100px" >
    <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="100px" Text='<%# Bind("Body") %>'></asp:TextBox>
    

</td>

</tr>

<tr>
<td align="right">
    &nbsp;</td>
<td >
    &nbsp;</td>
<td>
    &nbsp;<asp:Button ID="btnRemark" runat="server" Text="Add" CommandName="Insert" OnClick="btnRemark_Click"  /></td>

</tr>





</table>
    </InsertItemTemplate>
	<ItemTemplate>
		<table width="100%">
			<tr>
				<td>
					<asp:Label ID="lblRemarkSubject" runat="server" Text="Subject:"></asp:Label></td>
				<td>
					<asp:TextBox ID="txtRemarkSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox></td>
			</tr>
			<tr>
				<td width="10%">
					<asp:Label ID="lblRemarkBody" runat="server" Text="Body:"></asp:Label></td>
				<td>
					<asp:TextBox ID="txtRemarkBody" runat="server" Height="100px" TextMode="MultiLine" Text='<%# Bind("Body") %>'></asp:TextBox></td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="OdsFileManagementUserCotrol" runat="server" InsertMethod="InsertFileRemarks"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetFileMasterDetails"
    TypeName="IGRSS.BusinessLogicLayer.FileManagement">
    <InsertParameters>
        <asp:Parameter Name="FieldId" Type="Object" />
        <asp:Parameter Name="Subject" Type="String" />
        <asp:Parameter Name="Body" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>

