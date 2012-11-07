﻿<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MLAandMinisterRegister.aspx.cs" Inherits="LatestPages_MLAandMinisterRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">

   

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
        });
    }
    $(function () {
        $('input[id*="InwardNoTextBox"]').keydown(function (event) {
            // Allow: backspace, delete, tab, escape, and enter
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $('input[id*="InwardNoTextBox"]').blur(function () {
            if (isNaN($('input[id*="InwardNoTextBox"]').val()) || $('input[id*="InwardNoTextBox"]').val().length == 0) { $('input[id*="InwardNoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="InwardNoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="InwardNoTextBox"]').val(formattedNumber.toString());
        });

        var datePickers = ["LetterDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<asp:MultiView ID="MultiviewMLA" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>MLA and Minister&#39;s Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_MLA" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_MLA" EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="InwardNo" HeaderText="Inward No" 
                              SortExpression="InwardNo" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="MLAname" HeaderText="MLA Name" 
                              SortExpression="MLAname" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="LetterNo" HeaderText="Letter No" 
                              SortExpression="LetterNo" />
                          <asp:BoundField DataField="LetterDate" HeaderText="Letter Date" 
                              SortExpression="LetterDate" />
                          <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" 
                              SortExpression="DepartmentName" />
                          <asp:BoundField DataField="FileNumber" HeaderText="File Number" 
                              SortExpression="FileNumber" />
                          <asp:BoundField DataField="DetailsofOutput" HeaderText="DetailsofOutput" 
                              SortExpression="DetailsofOutput" Visible="False" />
                          <asp:BoundField DataField="DetailsofFilePreservation" 
                              HeaderText="DetailsofFilePreservation" 
                              SortExpression="DetailsofFilePreservation" Visible="False" />
                          <asp:BoundField DataField="DetailsOfRecord" HeaderText="DetailsOfRecord" 
                              SortExpression="DetailsOfRecord" Visible="False" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>MLA and Minister's Register</h1>
<asp:FormView ID="FormView_MLA" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_MLA" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%" oniteminserting="FormView_MLA_ItemInserting" 
        onitemcommand="FormView_MLA_ItemCommand" >
        <EditItemTemplate>
                <table>
        <tr><td>Inward No:</td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" /></td>
		</tr>					
            
        <tr><td>File No:</td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
		</tr>	          
         
        <tr><td>MLA/MP/Minister's Name:</td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" Text='<%# Bind("MLAname") %>' 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter No:</td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" 
                Text='<%# Bind("LetterNo") %>' Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter Date:</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Department Name:</td>
			<td>
                <asp:DropDownList ID="Drop_departmentname" runat="server" 
                    DataSourceID="ods_departmentname" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
            </td>
		</tr>	           
            
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" 
                Text='<%# Bind("FileNumber") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Details Of Output:</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Details Of File Preservation:</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr><td>Details Of Record:</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=2 align="center"><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Updat" Text="Updat" />
			&nbsp;<asp:Button ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" />	
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" />
			</td>
		</tr>
    </table>		
            
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr><td>Inward No:</td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" /></td>
		</tr>					
            
        <tr><td>File No:</td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
		</tr>	          
         
        <tr><td>MLA/MP/Minister's Name:</td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" Text='<%# Bind("MLAname") %>' 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter No:</td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" 
                Text='<%# Bind("LetterNo") %>' Width="160px" /></td>
		</tr>	            
            
        <tr><td>Letter Date:</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Department Name:</td>
			<td>
                <asp:DropDownList ID="Drop_departmentname" runat="server" 
                    DataSourceID="ods_departmentname" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
            </td>
		</tr>	           
            
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" 
                Text='<%# Bind("FileNumber") %>' Width="160px" /></td>
		</tr>	           
            
        <tr><td>Details Of Output:</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr><td>Details Of File Preservation:</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr><td>Details Of Record:</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=2 align="center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" />	
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" />
			</td>
		</tr>
    </table>		
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            InwardNo:
            <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
            <br />
            MLAname:
            <asp:Label ID="MLAnameLabel" runat="server" Text='<%# Bind("MLAname") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            LetterNo:
            <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
            <br />
            LetterDate:
            <asp:Label ID="LetterDateLabel" runat="server" 
                Text='<%# Bind("LetterDate") %>' />
            <br />
            DepartmentName:
            <asp:Label ID="DepartmentNameLabel" runat="server" 
                Text='<%# Bind("DepartmentName") %>' />
            <br />
            FileNumber:
            <asp:Label ID="FileNumberLabel" runat="server" 
                Text='<%# Bind("FileNumber") %>' />
            <br />
            DetailsofOutput:
            <asp:Label ID="DetailsofOutputLabel" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' />
            <br />
            DetailsofFilePreservation:
            <asp:Label ID="DetailsofFilePreservationLabel" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' />
            <br />
            DetailsOfRecord:
            <asp:Label ID="DetailsOfRecordLabel" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" CssClass="standardButton"/>
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" CssClass="standardButton"/>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" CssClass="standardButton"/>
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_MLA" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.MLATableAdapters.MLATableAdapter" 
        UpdateMethod="Update" onselecting="ods_MLA_Selecting" >
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_departmentname" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DepartmentMasterTableAdapters.DepartmentMasterTableAdapter">
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView> 
</asp:Content>

