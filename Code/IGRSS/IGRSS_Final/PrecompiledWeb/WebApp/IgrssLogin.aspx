<%@ page autoeventwireup="true" inherits="IgrssLogin, App_Web_4wv3tozb" language="C#" masterpagefile="~/IGRSS_Default.master" title="Login Form" validaterequest="false" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:Login ID="Login" runat="server" Height="145px" Width="316px" BackColor="#F7F7DE"
        BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="10pt" CreateUserText="New User?" HelpPageText="Need Help?" PasswordRecoveryText="Forgot Password"
        RememberMeSet="True" meta:resourcekey="LoginResource1">
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <LayoutTemplate>
            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" style="width: 316px; height: 145px">
                            <tr>
                                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #6b696b">
                                    Log In</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" meta:resourcekey="UserNameLabelResource1">User Name:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Width="180px" meta:resourcekey="UserNameResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="IgrssLogin"
                                        meta:resourcekey="UserNameRequiredResource1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" meta:resourcekey="PasswordLabelResource1">Password:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="180px" meta:resourcekey="PasswordResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="IgrssLogin"
                                        meta:resourcekey="PasswordRequiredResource1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblLang" runat="server" meta:resourcekey="lblLang">Language:</asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="ddlLang" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged" Width="180px">
                                        <asp:ListItem Text="English" Value="en-US" />
                                        <asp:ListItem Text="Gujarati" Value="gu-IN" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" meta:resourcekey="RememberMeResource1"
                                        Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" meta:resourcekey="FailureTextResource1"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="IgrssLogin"
                                        meta:resourcekey="LoginButtonResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="~/Default.aspx"
                                        meta:resourcekey="PasswordRecoveryLinkResource1">Forgot Password?</asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    &nbsp;&nbsp;
</asp:Content>
