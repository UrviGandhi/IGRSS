<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Test_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="ecmascript" type="text/javascript">
    function confirmSubmit() 
    { 
        var doc = document.forms[0];
        var msg = "Are you sure you want to submit this data?"; 
        if (confirm(msg)) 
         doc.submit();
    } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="label" runat="server" Text="sssssssssss"></asp:LinkButton>
            <br />
      <%--      <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button"/>--%>
            </div>
   </form>
</body>
</html>
