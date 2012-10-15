<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RadioButtonControl.ascx.cs" Inherits="UserControls_RadioButtonControl" %>
<asp:RadioButton ID="rdbYes" runat="server" Text="Yes" GroupName="a" OnCheckedChanged="rdbYes_CheckedChanged" />
<asp:RadioButton ID="rdbNo" runat="server" Text="No" GroupName="a" OnCheckedChanged="rdbNo_CheckedChanged"/>
<asp:HiddenField ID="fldValue" runat="server" />
