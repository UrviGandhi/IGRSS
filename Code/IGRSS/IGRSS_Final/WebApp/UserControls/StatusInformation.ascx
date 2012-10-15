<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatusInformation.ascx.cs"
    Inherits="UserControls_StatusInformation" %>

<script type="text/javascript">
    function showDetails(){
        if(document.getElementById("detailsRow").style.display=="block") {
            document.getElementById("detailsRow").style.display="none";
        }
        else {
            document.getElementById("detailsRow").style.display="block";
        }
    }
</script>

<table width="100%" <%--style="background-color:#FCF9D8"--%> >
    <tr>
        <td align="center" style="width: 32px">
            <asp:Image ID="imgIcon" runat="server" Width="20px" Height="20px" />
        </td>
        <td align="left">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="False" Font-Size="Large" ToolTip="Shatus for the previous Operation"
                Width="100%">LinkButton</asp:Label>
        </td>
    </tr>
    <tr id="detailsRow" style="display: none">
        <td style="width: 32px">
        </td>
        <td align="left">
            <asp:Label ID="lblMessageDetails" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
</table>
