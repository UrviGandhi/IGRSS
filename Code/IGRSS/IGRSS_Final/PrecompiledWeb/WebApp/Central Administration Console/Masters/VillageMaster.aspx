<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_Masters_VillageMaster, App_Web_qawyqul4" title="Untitled Page" stylesheettheme="IGRSS_Skin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="gvVillageMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="villcd"
        DataSourceID="OdsVillageMaster" AllowPaging="True" PageSize="5">
        <Columns>
            <asp:BoundField DataField="villcd" HeaderText="villcd" ReadOnly="True" SortExpression="villcd" />
            <asp:BoundField DataField="distcd" HeaderText="distcd" SortExpression="distcd" />
            <asp:BoundField DataField="talcd" HeaderText="talcd" SortExpression="talcd" />
            <asp:BoundField DataField="villname" HeaderText="villname" SortExpression="villname" />
            <asp:BoundField DataField="villname_g" HeaderText="villname_g" SortExpression="villname_g" />
            <asp:BoundField DataField="gamtalrate" HeaderText="gamtalrate" SortExpression="gamtalrate" />
            <asp:BoundField DataField="NARATE" HeaderText="NARATE" SortExpression="NARATE" />
            <asp:BoundField DataField="gamtalrate_HIGH" HeaderText="gamtalrate_HIGH" SortExpression="gamtalrate_HIGH" />
            <asp:BoundField DataField="gamtalrate_medi" HeaderText="gamtalrate_medi" SortExpression="gamtalrate_medi" />
            <asp:BoundField DataField="gamtalrate_low" HeaderText="gamtalrate_low" SortExpression="gamtalrate_low" />
            <asp:BoundField DataField="gamtalrate_prop" HeaderText="gamtalrate_prop" SortExpression="gamtalrate_prop" />
            <asp:BoundField DataField="taluka" HeaderText="taluka" SortExpression="taluka" />
            <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
            <asp:BoundField DataField="district" HeaderText="district" SortExpression="district" />
            <asp:CheckBoxField DataField="opentag" HeaderText="opentag" SortExpression="opentag" />
        </Columns>
    </asp:GridView>
    <table width="40%">
        <tr>
            <td>
                <asp:Button ID="btnAddNewVillage" runat="server" OnClick="btnAddNewVillage_Click"
                    Text="Add New Village" Width="192px" /></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
        </tr>
    </table>
    <asp:FormView ID="fvVillageMaster" runat="server" DataKeyNames="villcd" DataSourceID="OdsVillageMaster" Width="40%">
        <EditItemTemplate>
            villcd:
            <asp:Label ID="villcdLabel1" runat="server" Text='<%# Eval("villcd") %>'></asp:Label><br />
            distcd:
            <asp:TextBox ID="distcdTextBox" runat="server" Text='<%# Bind("distcd") %>'>
            </asp:TextBox><br />
            talcd:
            <asp:TextBox ID="talcdTextBox" runat="server" Text='<%# Bind("talcd") %>'>
            </asp:TextBox><br />
            villname:
            <asp:TextBox ID="villnameTextBox" runat="server" Text='<%# Bind("villname") %>'>
            </asp:TextBox><br />
            villname_g:
            <asp:TextBox ID="villname_gTextBox" runat="server" Text='<%# Bind("villname_g") %>'>
            </asp:TextBox><br />
            gamtalrate:
            <asp:TextBox ID="gamtalrateTextBox" runat="server" Text='<%# Bind("gamtalrate") %>'>
            </asp:TextBox><br />
            NARATE:
            <asp:TextBox ID="NARATETextBox" runat="server" Text='<%# Bind("NARATE") %>'>
            </asp:TextBox><br />
            gamtalrate_HIGH:
            <asp:TextBox ID="gamtalrate_HIGHTextBox" runat="server" Text='<%# Bind("gamtalrate_HIGH") %>'>
            </asp:TextBox><br />
            gamtalrate_medi:
            <asp:TextBox ID="gamtalrate_mediTextBox" runat="server" Text='<%# Bind("gamtalrate_medi") %>'>
            </asp:TextBox><br />
            gamtalrate_low:
            <asp:TextBox ID="gamtalrate_lowTextBox" runat="server" Text='<%# Bind("gamtalrate_low") %>'>
            </asp:TextBox><br />
            gamtalrate_prop:
            <asp:TextBox ID="gamtalrate_propTextBox" runat="server" Text='<%# Bind("gamtalrate_prop") %>'>
            </asp:TextBox><br />
            taluka:
            <asp:TextBox ID="talukaTextBox" runat="server" Text='<%# Bind("taluka") %>'>
            </asp:TextBox><br />
            office:
            <asp:TextBox ID="officeTextBox" runat="server" Text='<%# Bind("office") %>'>
            </asp:TextBox><br />
            district:
            <asp:TextBox ID="districtTextBox" runat="server" Text='<%# Bind("district") %>'>
            </asp:TextBox><br />
            opentag:
            <asp:CheckBox ID="opentagCheckBox" runat="server" Checked='<%# Bind("opentag") %>' /><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblVillageInsertHeading" runat="server" SkinID="heading" Text="Village Master."></asp:Label></td>
                </tr>
                <tr>
                    <td width="10%">
                        <asp:Label ID="lblVillageCode" runat="server" Text="Village Code:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="villcdTextBox" runat="server" Text='<%# Bind("villcd") %>'></asp:TextBox></td>
                    <td style="width: 3px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDistcode" runat="server" Text="District Code:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="distcdTextBox" runat="server" Text='<%# Bind("distcd") %>'></asp:TextBox></td>
                    <td style="width: 3px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTalukaCode" runat="server" Text="Taluka Code:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="talcdTextBox" runat="server" Text='<%# Bind("talcd") %>'></asp:TextBox></td>
                    <td style="width: 3px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVillageName" runat="server" Text="Village Name:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="villnameTextBox" runat="server" Text='<%# Bind("villname") %>'></asp:TextBox></td>
                    <td style="width: 3px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblvillageName_g" runat="server" Text="Gugrathi "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="villname_gTextBox" runat="server" Text='<%# Bind("villname_g") %>'></asp:TextBox></td>
                    <td style="width: 3px">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="Btncancel" runat="server" OnClick="Btncancel_Click" Text="Cancel" /></td>
                    <td style="width: 3px">
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="gamtalrateTextBox" runat="server" Text='<%# Bind("gamtalrate") %>'
                Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="NARATETextBox" runat="server" Text='<%# Bind("NARATE") %>' Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="gamtalrate_HIGHTextBox" runat="server" Text='<%# Bind("gamtalrate_HIGH") %>'
                Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="gamtalrate_mediTextBox" runat="server" Text='<%# Bind("gamtalrate_medi") %>'
                Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="gamtalrate_lowTextBox" runat="server" Text='<%# Bind("gamtalrate_low") %>'
                Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="gamtalrate_propTextBox" runat="server" Text='<%# Bind("gamtalrate_prop") %>'
                Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="talukaTextBox" runat="server" Text='<%# Bind("taluka") %>' Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="officeTextBox" runat="server" Text='<%# Bind("office") %>' Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="districtTextBox" runat="server" Text='<%# Bind("district") %>' Visible="False"></asp:TextBox><br />
            <asp:CheckBox ID="opentagCheckBox" runat="server" Checked='<%# Bind("opentag") %>'
                Visible="False" /><br />
            &nbsp;
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert" Visible="False"></asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" Visible="False"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:Label ID="villcdLabel" runat="server" Text='<%# Eval("villcd") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="distcdLabel" runat="server" Text='<%# Bind("distcd") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="talcdLabel" runat="server" Text='<%# Bind("talcd") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="villnameLabel" runat="server" Text='<%# Bind("villname") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="villname_gLabel" runat="server" Text='<%# Bind("villname_g") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="gamtalrateLabel" runat="server" Text='<%# Bind("gamtalrate") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="NARATELabel" runat="server" Text='<%# Bind("NARATE") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="gamtalrate_HIGHLabel" runat="server" Text='<%# Bind("gamtalrate_HIGH") %>' Visible="False"></asp:Label><br />
            <asp:Label ID="gamtalrate_mediLabel" runat="server" Text='<%# Bind("gamtalrate_medi") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="gamtalrate_lowLabel" runat="server" Text='<%# Bind("gamtalrate_low") %>' Visible="False"></asp:Label><br />
            <asp:Label ID="gamtalrate_propLabel" runat="server" Text='<%# Bind("gamtalrate_prop") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="talukaLabel" runat="server" Text='<%# Bind("taluka") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="officeLabel" runat="server" Text='<%# Bind("office") %>' Visible="False"></asp:Label><br />
            &nbsp;<asp:Label ID="districtLabel" runat="server" Text='<%# Bind("district") %>' Visible="False"></asp:Label><br />
            
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" Visible="False"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="OdsVillageMaster" runat="server" InsertMethod="AddnewVillage" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.VillageMasterAdministratorTableAdapters.villagemasterAdministratorTableAdapter" DeleteMethod="Delete" UpdateMethod="Update">
        <InsertParameters>
            <asp:Parameter Name="villcd" Type="Int32" />
            <asp:Parameter Name="distcd" Type="Int32" />
            <asp:Parameter Name="talcd" Type="Int32" />
            <asp:Parameter Name="villname" Type="String" />
            <asp:Parameter Name="villname_g" Type="String" />
            <asp:Parameter Name="gamtalrate" Type="Int32" />
            <asp:Parameter Name="NARATE" Type="Int32" />
            <asp:Parameter Name="gamtalrate_HIGH" Type="Int32" />
            <asp:Parameter Name="gamtalrate_medi" Type="Int32" />
            <asp:Parameter Name="gamtalrate_low" Type="Int32" />
            <asp:Parameter Name="gamtalrate_prop" Type="Int32" />
            <asp:Parameter Name="taluka" Type="Int32" />
            <asp:Parameter Name="office" Type="Int32" />
            <asp:Parameter Name="district" Type="Int32" />
            <asp:Parameter Name="opentag" Type="Boolean" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="Original_villcd" Type="Int32" />
            <asp:Parameter Name="Original_distcd" Type="Int32" />
            <asp:Parameter Name="Original_talcd" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate" Type="Int32" />
            <asp:Parameter Name="Original_NARATE" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_HIGH" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_medi" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_low" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_prop" Type="Int32" />
            <asp:Parameter Name="Original_taluka" Type="Int32" />
            <asp:Parameter Name="Original_office" Type="Int32" />
            <asp:Parameter Name="Original_district" Type="Int32" />
            <asp:Parameter Name="Original_opentag" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="villcd" Type="Int32" />
            <asp:Parameter Name="distcd" Type="Int32" />
            <asp:Parameter Name="talcd" Type="Int32" />
            <asp:Parameter Name="villname" Type="String" />
            <asp:Parameter Name="villname_g" Type="String" />
            <asp:Parameter Name="gamtalrate" Type="Int32" />
            <asp:Parameter Name="NARATE" Type="Int32" />
            <asp:Parameter Name="gamtalrate_HIGH" Type="Int32" />
            <asp:Parameter Name="gamtalrate_medi" Type="Int32" />
            <asp:Parameter Name="gamtalrate_low" Type="Int32" />
            <asp:Parameter Name="gamtalrate_prop" Type="Int32" />
            <asp:Parameter Name="taluka" Type="Int32" />
            <asp:Parameter Name="office" Type="Int32" />
            <asp:Parameter Name="district" Type="Int32" />
            <asp:Parameter Name="opentag" Type="Boolean" />
            <asp:Parameter Name="Original_villcd" Type="Int32" />
            <asp:Parameter Name="Original_distcd" Type="Int32" />
            <asp:Parameter Name="Original_talcd" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate" Type="Int32" />
            <asp:Parameter Name="Original_NARATE" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_HIGH" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_medi" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_low" Type="Int32" />
            <asp:Parameter Name="Original_gamtalrate_prop" Type="Int32" />
            <asp:Parameter Name="Original_taluka" Type="Int32" />
            <asp:Parameter Name="Original_office" Type="Int32" />
            <asp:Parameter Name="Original_district" Type="Int32" />
            <asp:Parameter Name="Original_opentag" Type="Boolean" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

