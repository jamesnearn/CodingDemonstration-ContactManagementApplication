<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactsList.aspx.cs" Inherits="ContactManagementApplication.ContactsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="hypAdd" runat="server" NavigateUrl="~/ContactEdit.aspx">Add a contact</asp:HyperLink>

    <asp:GridView ID="gridContacts" DataSourceID="sqlContacts" runat="server" AutoGenerateColumns="false" CssClass="gridLayout">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:HyperLink ID="hypEdit" runat="server" NavigateUrl='<%#Eval("ContactID", "~/ContactEdit.aspx?ContactID={0}") %>'>
                        <%#Eval("FirstName") %>&nbsp;
                        <%#Eval("LastName") %>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <%#Eval("Address1") %><br />
                    <%#Eval("Address2") %><br />
                    <%#Eval("City") %>, <%#Eval("State")%>, <%#Eval("Zip") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active">
                <ItemTemplate>
                    <asp:CheckBox ID="chkActive" runat="server" Checked='<%#Eval("IsActive") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No data exists yet!
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:HyperLink ID="hypAddFooter" runat="server" NavigateUrl="~/ContactEdit.aspx">Add a contact</asp:HyperLink>
    <asp:SqlDataSource ID="sqlContacts" ConnectionString="<%$ ConnectionStrings:dbCMA %>" runat="server"
        SelectCommandType="Text" SelectCommand="select * from contacts"></asp:SqlDataSource>
</asp:Content>
