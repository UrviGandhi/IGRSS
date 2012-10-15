<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="FileRegister.aspx.cs" Inherits="LatestPages_FileRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<asp:MultiView ID="MultiView_File" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server" >
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
                    <asp:GridView ID="GridView_File" runat="server">
                    </asp:GridView>
                </td>
    </tr>
   

    </table>
</asp:View>

<asp:View ID="FileRegister" runat="server">


    <asp:FormView ID="FormView_File" runat="server">
    </asp:FormView>
    <asp:ObjectDataSource ID="ods_fileregister" runat="server">
    </asp:ObjectDataSource>


</asp:View>
</asp:MultiView>
</asp:Content>

