<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactEdit.aspx.cs" Inherits="ContactManagementApplication.ContactEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlID" runat="server">
        ID:<asp:Label ID="lblID" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <div>
        First Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <div>
        Last Name:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>
    <div>
        Address (Line 1):<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
    <div>
        Address (Line 2):<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </div>
    <div>
        City:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        State:<asp:TextBox ID="TextBox7" runat="server" Columns="2"></asp:TextBox>
        Zip:<asp:TextBox ID="TextBox8" runat="server" Columns="10"></asp:TextBox>
    </div>
    <div>
        Active:<asp:CheckBox ID="chkActive" runat="server" Checked="true" />
    </div>
    <asp:Panel ID="pnlDateCreated" runat="server">
        Date Created:<asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlDateModified" runat="server">
        Date Modified:<asp:Label ID="lblDateModified" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <asp:Button ID="btnSave" runat="server" Text="Save" />
</asp:Content>
