<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin-kullanicilar.aspx.cs" Inherits="YarismaSitesi.admin_kullanicilar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <a href="admin-sorular.aspx">SORULAR</a> |
    <a href="admin-kullanicilar.aspx">KULLANICILAR</a>

    <table class="admin" border="1">

        <tr>
            <td>Email</td>
            <td>Kullanıcı Adı</td>
        </tr>

        <asp:Repeater ID="rpt2" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("mail")%></td>
                    <td><%#Eval("username")%></td>
                    <td>
                        <%# Eval("task").Equals("banned") ? "<a href='engel.aspx?id=" + Eval("id") + "'>Engeli Kaldır</a>" : "<a href='engel.aspx?id=" + Eval("id") + "'>Engelle</a>" %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Panel ID="pnlsyf2" runat="server" CssClass="paginationPanel">
    </asp:Panel>
</asp:Content>
