<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Message, App_Web_4wv3tozb" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:LinkButton ID="lnkError" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="X-Large" ForeColor="OrangeRed" OnClick="lnkError_Click">System is unable to connect to some of the services...
Please verify if all hardware and software configurations are correct... or Please try after some time</asp:LinkButton><br />
    <br />
    <asp:Label ID="lblError" runat="server" Text="Message"></asp:Label>
</asp:Content>
