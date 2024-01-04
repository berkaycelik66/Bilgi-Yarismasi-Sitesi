<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin-sorular.aspx.cs" Inherits="YarismaSitesi.admin_sorular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <a href="admin-sorular.aspx">SORULAR</a> |
    <a href="admin-kullanicilar.aspx">KULLANICILAR</a>

    <table class="admin" border="1">
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                    <asp:ListItem>Spor</asp:ListItem>
                    <asp:ListItem>Tarih</asp:ListItem>
                    <asp:ListItem>Bilim</asp:ListItem>
                    <asp:ListItem>Sanat</asp:ListItem>
                </asp:DropDownList></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                    <asp:ListItem>Onaylandı</asp:ListItem>
                    <asp:ListItem>Onaylanmadı</asp:ListItem>
                </asp:DropDownList></td>
        </tr>

        <tr>
            <td>Kategori</td>
            <td>Soru</td>
            <td>Doğru Cevap</td>
            <td>Gönderen</td>
            <td>Onay</td>
        </tr>

        <asp:Repeater ID="rpt1" runat="server">
            <ItemTemplate>

                <tr>
                    <td><%#Eval("category")%></td>
                    <td><%#Eval("question")%></td>
                    <td><%#Eval("true_answer")%></td>
                    <td><%#Eval("sender")%></td>
                    <td><%#Eval("state").Equals(true) ? "Onaylandı": "Onaylanmadı"%></td>
                    <td><a href="soru-sil-admin.aspx?id=<%#Eval("id")%>">Sil</a></td>
                    <td><a href="soru-duzenle.aspx?id=<%#Eval("id")%>">Düzenle</a></td>
                    <td><a href="soru-onay.aspx?id=<%#Eval("id")%>">Onayı Değiştir</a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Panel ID="pnlsyf" runat="server" CssClass="paginationPanel">
    </asp:Panel>
</asp:Content>
