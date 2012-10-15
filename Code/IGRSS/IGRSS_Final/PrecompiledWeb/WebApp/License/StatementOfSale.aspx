<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="License_StatementOfSale, App_Web_syjfv0ab" title="Untitled Page" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <table style="width: 100%">
        <tr>
            <td colspan="6">
            <asp:Label ID="LBlSRHeading" runat="server" SkinID="Heading" Text="Sales Register" 
                                    ></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblVendorId" runat="server" Text="Vendor" meta:resourcekey="lblVendorIdResource1"></asp:Label></td>
            <td style="width: 20%">
                <asp:DropDownList ID="ddlVendorId" runat="server" DataSourceID="odsLicense" DataTextField="NameOfApplicant"
                    DataValueField="LicenseApplicationId" AutoPostBack="True" OnSelectedIndexChanged="ddlVendorId_SelectedIndexChanged" meta:resourcekey="ddlVendorIdResource1">
                </asp:DropDownList>
            </td>
            <td style="width: 10%">
            </td>
            <td style="width: 20%">
                <asp:Label ID="lblDate" runat="server" Text="Date" meta:resourcekey="lblDateResource1"></asp:Label>
            </td>
            <td style="width: 20%">
                <asp:TextBox ID="txtDate" runat="server" Width="75%" ReadOnly="True" meta:resourcekey="txtDateResource1"></asp:TextBox>
                <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtDate" meta:resourcekey="PopCalendar2Resource1" />
            </td>
            <td style="width: 10%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate"
                    ErrorMessage="Please Enter the Date" Width="5%" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:FormView ID="fvSaleRegister" runat="server" DataSourceID="odsSaleRegister" DefaultMode="Insert"
        OnItemInserting="fvSaleRegister_ItemInserting" meta:resourcekey="fvSaleRegisterResource1" OnItemInserted="fvSaleRegister_ItemInserted">
        <EditItemTemplate><table style="width: 100%">
            <tr>
            </tr>
            <tr>
                <td style="width: 20%">
                    <asp:Label ID="lbllicenseId" runat="server" meta:resourcekey="lbllicenseIdResource1"
                        Text="License Id" Visible="False"></asp:Label></td>
                <td style="width: 15px">
                    <asp:DropDownList ID="ddlVendor" runat="server" DataSourceID="odsLicense" DataTextField="NameOfApplicant"
                            DataValueField="LicenseApplicationId" Visible="False" meta:resourcekey="ddlVendorResource1">
                    </asp:DropDownList></td>
                <td style="width: 10%">
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDateResource2" Text="Date:"
                        Visible="False"></asp:Label></td>
                <td style="width: 20%">
                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="DateTextBoxResource2"
                        ReadOnly="True" Visible="False" Width="75%"></asp:TextBox></td>
                <td style="width: 10%">
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <asp:Label ID="lblDenomination" runat="server" meta:resourcekey="lblDenominationResource1"
                        Text="Denomination"></asp:Label></td>
                <td style="width: 20%">
                    <asp:DropDownList ID="ddlDenomination" runat="server" DataSourceID="odsRevenueStamType"
                            DataTextField="Name" DataValueField="Amount" SelectedValue='<%# Bind("Denomination") %>' meta:resourcekey="ddlDenominationResource1">
                    </asp:DropDownList></td>
                <td style="width: 10%">
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lblQuantity" runat="server" meta:resourcekey="lblQuantityResource1"
                        Text="Quantity"></asp:Label></td>
                <td style="width: 20%">
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="5" meta:resourcekey="QuantityTextBoxResource2"
                        Text='<%# Bind("Quantity") %>'></asp:TextBox></td>
                <td style="width: 20%">
                    <asp:RequiredFieldValidator ID="reqfldQuantity" runat="server" ControlToValidate="QuantityTextBox"
                        ErrorMessage="Please Enter the Quantity" meta:resourcekey="reqfldQuantityResource1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="QuantityTextBox"
                        ErrorMessage="Please Enter Only Numbers" meta:resourcekey="RegularExpressionValidator1Resource1"
                        ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblStartSerialNo" runat="server" meta:resourcekey="lblStartSerialNoResource1"
                        Text="Start SerialNo"></asp:Label></td>
                <td style="">
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" meta:resourcekey="StartSerialNoTextBoxResource2"
                        Text='<%# Bind("StartSerialNo") %>'></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfldStartSerialNo" runat="server" ControlToValidate="StartSerialNoTextBox"
                        ErrorMessage="Please Enter the Starting Serial Number" meta:resourcekey="reqfldStartSerialNoResource1">*</asp:RequiredFieldValidator></td>
                <td>
                    <asp:Label ID="lblEndSerialNo" runat="server" meta:resourcekey="lblEndSerialNoResource1"
                        Text="End SerialNo"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="10" meta:resourcekey="EndSerialNoTextBoxResource2"
                        Text='<%# Bind("EndSerialNo") %>'></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfldEndSerialNo" runat="server" ControlToValidate="EndSerialNoTextBox"
                        ErrorMessage="Please Enter the End Serial Number" meta:resourcekey="reqfldEndSerialNoResource1">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSoldTo" runat="server" meta:resourcekey="lblSoldToResource1" Text="Sold To"></asp:Label></td>
                <td style="">
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="30" meta:resourcekey="SoldToTextBoxResource2"
                        Text='<%# Bind("SoldTo") %>'></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfldSoldTo" runat="server" ControlToValidate="SoldToTextBox"
                        ErrorMessage="Please Enter the Name of Party to whome the stamp is sold" meta:resourcekey="reqfldSoldToResource1">*</asp:RequiredFieldValidator></td>
                <td>
                    <asp:Label ID="lblTime" runat="server" meta:resourcekey="lblTimeResource1" Text="Time"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlHours" runat="server" Width="29%">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMinutes" runat="server" Width="29%">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                        <asp:ListItem>32</asp:ListItem>
                        <asp:ListItem>33</asp:ListItem>
                        <asp:ListItem>34</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>36</asp:ListItem>
                        <asp:ListItem>37</asp:ListItem>
                        <asp:ListItem>38</asp:ListItem>
                        <asp:ListItem>39</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>41</asp:ListItem>
                        <asp:ListItem>42</asp:ListItem>
                        <asp:ListItem>43</asp:ListItem>
                        <asp:ListItem>44</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>46</asp:ListItem>
                        <asp:ListItem>47</asp:ListItem>
                        <asp:ListItem>48</asp:ListItem>
                        <asp:ListItem>49</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>51</asp:ListItem>
                        <asp:ListItem>52</asp:ListItem>
                        <asp:ListItem>53</asp:ListItem>
                        <asp:ListItem>54</asp:ListItem>
                        <asp:ListItem>55</asp:ListItem>
                        <asp:ListItem>56</asp:ListItem>
                        <asp:ListItem>57</asp:ListItem>
                        <asp:ListItem>58</asp:ListItem>
                        <asp:ListItem>59</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="">
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" Visible="False" meta:resourcekey="btnAddResource1" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    &nbsp;</td>
                <td colspan="1">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 15px">
                </td>
                <td>
                </td>
                <td>
                </td>
                <td align="right">
                    <asp:Button ID="btnInsert" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnInsertResource1" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="cancel" CausesValidation="False" meta:resourcekey="btnCancelResource1" /></td>
                <td align="right">
                </td>
            </tr>
        </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 100%">
                <tr>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="lbllicenseId" runat="server" meta:resourcekey="lbllicenseIdResource1"
                            Text="License Id" Visible="False"></asp:Label></td>
                    <td style="width: 15px">
                        <asp:DropDownList ID="ddlVendor" runat="server" DataSourceID="odsLicense" DataTextField="NameOfApplicant"
                            DataValueField="LicenseApplicationId" Visible="False" meta:resourcekey="ddlVendorResource1">
                        </asp:DropDownList></td>
                    <td style="width: 10%">
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDateResource2" Text="Date:"
                            Visible="False"></asp:Label></td>
                    <td style="width: 20%">
                        <asp:TextBox ID="DateTextBox" runat="server" meta:resourcekey="DateTextBoxResource2"
                            ReadOnly="True" Visible="False" Width="75%"></asp:TextBox></td>
                    <td style="width: 10%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="lblDenomination" runat="server" meta:resourcekey="lblDenominationResource1"
                            Text="Denomination"></asp:Label></td>
                    <td style="width: 20%">
                        <asp:DropDownList ID="ddlDenomination" runat="server" DataSourceID="odsRevenueStamType"
                            DataTextField="Name" DataValueField="Amount" SelectedValue='<%# Bind("Denomination") %>' meta:resourcekey="ddlDenominationResource1">
                        </asp:DropDownList></td>
                    <td style="width: 10%">
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="lblQuantity" runat="server" meta:resourcekey="lblQuantityResource1"
                            Text="Quantity"></asp:Label></td>
                    <td style="width: 20%">
                        <asp:TextBox ID="QuantityTextBox" runat="server" MaxLength="5" meta:resourcekey="QuantityTextBoxResource2"
                            Text='<%# Bind("Quantity") %>'></asp:TextBox></td>
                    <td style="width: 20%">
                        <asp:RequiredFieldValidator ID="reqfldQuantity" runat="server" ControlToValidate="QuantityTextBox"
                            ErrorMessage="Please Enter the Quantity" meta:resourcekey="reqfldQuantityResource1">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="QuantityTextBox"
                            ErrorMessage="Please Enter Only Numbers" meta:resourcekey="RegularExpressionValidator1Resource1"
                            ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblStartSerialNo" runat="server" meta:resourcekey="lblStartSerialNoResource1"
                            Text="Start SerialNo"></asp:Label></td>
                    <td style="">
                        <asp:TextBox ID="StartSerialNoTextBox" runat="server" MaxLength="10" meta:resourcekey="StartSerialNoTextBoxResource2"
                            Text='<%# Bind("StartSerialNo") %>'></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="reqfldStartSerialNo" runat="server" ControlToValidate="StartSerialNoTextBox"
                            ErrorMessage="Please Enter the Starting Serial Number" meta:resourcekey="reqfldStartSerialNoResource1">*</asp:RequiredFieldValidator></td>
                    <td>
                        <asp:Label ID="lblEndSerialNo" runat="server" meta:resourcekey="lblEndSerialNoResource1"
                            Text="End SerialNo"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="EndSerialNoTextBox" runat="server" MaxLength="10" meta:resourcekey="EndSerialNoTextBoxResource2"
                            Text='<%# Bind("EndSerialNo") %>'></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="reqfldEndSerialNo" runat="server" ControlToValidate="EndSerialNoTextBox"
                            ErrorMessage="Please Enter the End Serial Number" meta:resourcekey="reqfldEndSerialNoResource1">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSoldTo" runat="server" meta:resourcekey="lblSoldToResource1" Text="Sold To"></asp:Label></td>
                    <td style="">
                        <asp:TextBox ID="SoldToTextBox" runat="server" MaxLength="30" meta:resourcekey="SoldToTextBoxResource2"
                            Text='<%# Bind("SoldTo") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="reqfldSoldTo" runat="server" ControlToValidate="SoldToTextBox"
                            ErrorMessage="Please Enter the Name of Party to whome the stamp is sold" meta:resourcekey="reqfldSoldToResource1">*</asp:RequiredFieldValidator></td>
                    <td>
                        <asp:Label ID="lblTime" runat="server" meta:resourcekey="lblTimeResource1" Text="Time"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="ddlHours" runat="server" Width="29%">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlMinutes" runat="server" Width="29%">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                            <asp:ListItem>32</asp:ListItem>
                            <asp:ListItem>33</asp:ListItem>
                            <asp:ListItem>34</asp:ListItem>
                            <asp:ListItem>35</asp:ListItem>
                            <asp:ListItem>36</asp:ListItem>
                            <asp:ListItem>37</asp:ListItem>
                            <asp:ListItem>38</asp:ListItem>
                            <asp:ListItem>39</asp:ListItem>
                            <asp:ListItem>40</asp:ListItem>
                            <asp:ListItem>41</asp:ListItem>
                            <asp:ListItem>42</asp:ListItem>
                            <asp:ListItem>43</asp:ListItem>
                            <asp:ListItem>44</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                            <asp:ListItem>46</asp:ListItem>
                            <asp:ListItem>47</asp:ListItem>
                            <asp:ListItem>48</asp:ListItem>
                            <asp:ListItem>49</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>51</asp:ListItem>
                            <asp:ListItem>52</asp:ListItem>
                            <asp:ListItem>53</asp:ListItem>
                            <asp:ListItem>54</asp:ListItem>
                            <asp:ListItem>55</asp:ListItem>
                            <asp:ListItem>56</asp:ListItem>
                            <asp:ListItem>57</asp:ListItem>
                            <asp:ListItem>58</asp:ListItem>
                            <asp:ListItem>59</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" Visible="False" meta:resourcekey="btnAddResource1" /></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        &nbsp;</td>
                    <td colspan="1">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 15px">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Insert" meta:resourcekey="btnInsertResource1" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="cancel" CausesValidation="False" meta:resourcekey="btnCancelResource1" /></td>
                    <td align="right">
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            licenseId:
            <asp:Label ID="licenseIdLabel" runat="server" Text='<%# Bind("licenseId") %>' meta:resourcekey="licenseIdLabelResource1"></asp:Label><br />
            SoldTo:
            <asp:Label ID="SoldToLabel" runat="server" Text='<%# Bind("SoldTo") %>' meta:resourcekey="SoldToLabelResource1"></asp:Label><br />
            Denomination:
            <asp:Label ID="DenominationLabel" runat="server" Text='<%# Bind("Denomination") %>' meta:resourcekey="DenominationLabelResource1"></asp:Label><br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' meta:resourcekey="QuantityLabelResource1"></asp:Label><br />
            StartSerialNo:
            <asp:Label ID="StartSerialNoLabel" runat="server" Text='<%# Bind("StartSerialNo") %>' meta:resourcekey="StartSerialNoLabelResource1"></asp:Label><br />
            EndSerialNo:
            <asp:Label ID="EndSerialNoLabel" runat="server" Text='<%# Bind("EndSerialNo") %>' meta:resourcekey="EndSerialNoLabelResource1"></asp:Label><br />
            Date:
            <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' meta:resourcekey="DateLabelResource1"></asp:Label><br />
            Time:
            <asp:Label ID="TimeLabel" runat="server" Text='<%# Bind("Time") %>' meta:resourcekey="TimeLabelResource1"></asp:Label><br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" meta:resourcekey="NewButtonResource1"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    &nbsp; &nbsp;&nbsp;&nbsp;
    <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="False" DataSourceID="odsRegistreDetails" meta:resourcekey="gvSalesResource1">
        <Columns>
            <asp:BoundField DataField="licenseId" HeaderText="licenseId" SortExpression="licenseId" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="SoldTo" HeaderText="SoldTo" SortExpression="SoldTo" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="Denomination" HeaderText="Denomination" SortExpression="Denomination" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="StartSerialNo" HeaderText="StartSerialNo" SortExpression="StartSerialNo" meta:resourcekey="BoundFieldResource5" />
            <asp:BoundField DataField="EndSerialNo" HeaderText="EndSerialNo" SortExpression="EndSerialNo" meta:resourcekey="BoundFieldResource6" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" meta:resourcekey="BoundFieldResource7" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsSaleRegister" runat="server" InsertMethod="AddNewSalseDetails"
        SelectMethod="getSalseDataByLicenseId" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication"
        OnInserting="odsSaleRegister_Inserting" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:Parameter Name="LicenseId" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLicense" runat="server" InsertMethod="NewLicenseApplication"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorSalesDetails"
        TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="rem" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="fldLicenseId" runat="server" />
    <asp:ObjectDataSource ID="odsRevenueStamType" runat="server" InsertMethod="NewRevenueStampMaster" SelectMethod="GetrevenueStampMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRegistreDetails" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewSalseDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getSalseDataByLicenseId" TypeName="IGRSS.BusinessLogicLayer.LicenseApplication">
        <SelectParameters>
            <asp:ControlParameter ControlID="fldLicenseId" Name="LicenseId" PropertyName="Value"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
