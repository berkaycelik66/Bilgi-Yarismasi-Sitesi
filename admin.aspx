<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="YarismaSitesi.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="admin" border="1">

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
                    <td><a href="soru-sil.aspx?id=<%#Eval("id")%>">Sil</a></td>
                    <td><a href="soru-duzenle.aspx?id=<%#Eval("id")%>">Düzenle</a></td>
                    <td><a href="soru-onay.aspx?id=<%#Eval("id")%>">Onayı Değiştir</a></td> 
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Panel ID="pnlsyf" runat="server" CssClass="paginationPanel">
    </asp:Panel>


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
