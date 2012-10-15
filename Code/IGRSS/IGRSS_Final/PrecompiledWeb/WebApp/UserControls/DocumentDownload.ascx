<%@ control language="C#" autoeventwireup="true" inherits="UserControls_DocumentDownload, App_Web_ljp04ovk" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsDocuments">
    <Columns>
        <asp:BoundField DataField="FileID" HeaderText="FileID" SortExpression="FileID" Visible="False" />
        <asp:BoundField DataField="DocId" HeaderText="DocId" SortExpression="DocId" Visible="False" />
        <asp:BoundField DataField="UploadedBy" HeaderText="UploadedBy" SortExpression="UploadedBy"
            Visible="False" />
        <asp:BoundField DataField="DocName" HeaderText="Name" SortExpression="DocName" />
        <asp:BoundField DataField="UploadedAt" HeaderText="UploadedAt" SortExpression="UploadedAt" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsDocuments" runat="server" InsertMethod="InsertNewFile"
    SelectMethod="GetAttachedDocuments" TypeName="IGRSS.BusinessLogicLayer.FileManagement">
    <SelectParameters>
        <asp:ControlParameter ControlID="flddocId" Name="fileId" PropertyName="Value" Type="Object" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="OfficeId" Type="Object" />
        <asp:Parameter Name="FileDepartment" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:HiddenField ID="flddocId" runat="server" />
