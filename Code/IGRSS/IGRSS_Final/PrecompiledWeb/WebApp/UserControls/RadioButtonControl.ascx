<%@ control language="C#" autoeventwireup="true" inherits="UserControls_RadioButtonControl, App_Web_ljp04ovk" %>
<asp:RadioButton ID="rdbYes" runat="server" Text="Yes" GroupName="a" OnCheckedChanged="rdbYes_CheckedChanged" />
<asp:RadioButton ID="rdbNo" runat="server" Text="No" GroupName="a" OnCheckedChanged="rdbNo_CheckedChanged"/>
<asp:HiddenField ID="fldValue" runat="server" />
