<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactsList.aspx.cs" Inherits="ContactManagementApplication.ContactsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="hypAdd" runat="server" NavigateUrl="~/ContactEdit.aspx">Add a contact</asp:HyperLink>
    <asp:GridView ID="gridContacts" DataSourceID="sqlContacts" runat="server">
        <EmptyDataTemplate>
            No data exists yet!
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:HyperLink ID="hypAddFooter" runat="server" NavigateUrl="~/ContactEdit.aspx">Add a contact</asp:HyperLink>
    <asp:SqlDataSource ID="sqlContacts" ConnectionString="<%$ ConnectionStrings:dbCMA %>" runat="server"
        SelectCommandType="Text" SelectCommand="select * from contacts"></asp:SqlDataSource>
</asp:Content>
