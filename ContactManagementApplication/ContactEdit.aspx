<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactEdit.aspx.cs" Inherits="ContactManagementApplication.ContactEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlID" runat="server">
        ID:<asp:Label ID="lblID" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <div>
        First Name:<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
    </div>
    <div>
        Last Name:<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
    </div>
    <div>
        Address (Line 1):<asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
    </div>
    <div>
        Address (Line 2):<asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
    </div>
    <div>
        City:<asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        State:<asp:TextBox ID="txtState" runat="server" Columns="2"></asp:TextBox>
        Zip:<asp:TextBox ID="txtZip" runat="server" Columns="10"></asp:TextBox>
    </div>
    <div>
        Active:<asp:CheckBox ID="chkIsActive" runat="server" Checked="true" />
    </div>
    <asp:Panel ID="pnlDateCreated" runat="server">
        Date Created:<asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlDateModified" runat="server">
        Date Modified:<asp:Label ID="lblDateModified" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <asp:Button ID="btnSave" runat="server" Text="Save Contact" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    <asp:Button ID="btnToggleIsActive" runat="server" Text="ToggleIsActive" OnClick="btnToggleIsActive_Click" />
</asp:Content>
