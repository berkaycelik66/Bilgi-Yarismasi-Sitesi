<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="kullanici.aspx.cs" Inherits="YarismaSitesi.kullanici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="top-list" colspan="6">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" CssClass="auto-style2"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="auto-style1 top-list" border="1">
        <tr>
            <td>Points</td>
            <td>Date</td>
            <td>Category</td>
        </tr>

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("points")%></td>
                    <td><%#Eval("dates")%></td>
                    <td><%#Eval("category")%></td>

                    <!--Eğer kullanıcı başka birinin profiline giriyorsa, profiline girdiği kullanıcının verilerini silememesi gerekir.-->
                    <td <%# Eval("username").ToString() == Session["username"].ToString() ? "" : "style='display:none;'" %>>
                        <a id="soru_sil"
                            href="puan-sil.aspx?id=<%#Eval("id")%>">Sil
                        </a>
                    </td>

                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>

    <br />
    <br />

    <asp:Panel ID="pnlQuestions" runat="server">

        <table class="auto-style1 top-list" border="1">
            <tr>
                <td>Eklenen Sorular</td>
                <td>Doğru Cevap</td>
                <td>Onay</td>
            </tr>

            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("question")%></td>
                        <td><%#Eval("true_answer")%></td>
                        <td><%#Eval("state")%></td>
                        <td><a href="soru-duzenle.aspx?id=<%#Eval("id")%>">Düzenle</a></td>
                        <td><a href="soru-sil.aspx?id=<%#Eval("id")%>">Sil</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>

        </table>

    </asp:Panel>
</asp:Content>
