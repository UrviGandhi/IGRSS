<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_LicensceReport2, App_Web_syjfv0ab" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<table width="100%">
 <tr>
     <td>
        <asp:Label ID="lblType" runat="server" Text="Report Type"></asp:Label>     
     </td>
     <td>
     <asp:DropDownList ID="ddlReport" runat="server" Width="150px">
     <asp:ListItem Text="Individual" Value="Individual"></asp:ListItem>
     <asp:ListItem Text="Bank" Value="Bank"></asp:ListItem>
     </asp:DropDownList>  
     </td>
 </tr>
 <tr>
  <td align="left">
   <asp:Label ID="lblLicenseNo" runat="server" Text="LicenseNumber"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtLicenseNo" runat="server" Width="150px"></asp:TextBox>
  </td>
  <td align="left">
   <asp:Label ID="lblBmachine" runat="server" Text="Brand Machine"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtBmachine" runat="server" Width="150px"></asp:TextBox>
  </td>
 </tr>
 <tr>
  <td align="left">
   <asp:Label ID="lblMmachine" runat="server" Text="Model Machine"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtMmachine" runat="server" Width="150px"></asp:TextBox>
  </td>
  <td align="left">
   <asp:Label ID="Label2" runat="server" Text="No of Machine"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtNoMachine" runat="server" Width="150px"></asp:TextBox>
  </td>
 </tr>
 <tr>
  <td align="left">
   <asp:Label ID="Label1" runat="server" Text="No of Meter"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtMeters" runat="server" Width="150px"></asp:TextBox>
  </td>
  <td align="left">
   <asp:Label ID="Label3" runat="server" Text="Range of frame"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtRange" runat="server" Width="150px"></asp:TextBox>
  </td>
 </tr>
 <tr>
  <td align="left">
   <asp:Label ID="Label4" runat="server" Text="Maximum Amount"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtMaximum" runat="server" Width="150px"></asp:TextBox>
  </td>
  <td align="left">
   <asp:Label ID="Label5" runat="server" Text="Kind of Stamp"></asp:Label>
   </td>
   <td align="left">
   <asp:TextBox ID="txtStamp" runat="server" Width="150px"></asp:TextBox>
  </td>
 </tr>
 <tr>
  <td>      
  </td>
  <td>
  </td>
  <td>
  </td>
  <td>
  <asp:Button ID="btnReport" runat="server" Text="Reports" OnClick="btnReport_Click" />
  </td>
 </tr>
 
 
 
 
</table>
</asp:Content>

