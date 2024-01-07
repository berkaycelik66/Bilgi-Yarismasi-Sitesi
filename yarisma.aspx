<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="yarisma.aspx.cs" Inherits="YarismaSitesi.yarisma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            height: 22px;
            text-align: center;
        }

        .auto-style4 {
            height: 134px;
            text-align: center;
        }

        .auto-style5 {
            text-align: right;
        }
        .auto-style6 {
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        // Sayfa yenilendiğinde belirli bir sayfaya yönlendirme
        window.onload = function() {
            // Yönlendirilecek URL'yi burada belirtin
            var yeniURL = "yarismaya-basla.aspx";

            // Yenileme işlemi olduğunda belirtilen sayfaya yönlendirme
            if (performance.navigation.type === 1) {
                window.location.href = yeniURL;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="yarisma-style">
        <table class="auto-style2" border="1">

            <tr>
                <td class="auto-style3">Süre:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style3">Puan:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Label" CssClass="kopyalanamaz"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="top-list">
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button_Click" CssClass="yarisma-style-button" />
                </td>
                <td class="top-list">
                    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button_Click" CssClass="yarisma-style-button" />
                </td>
            </tr>
            <tr>
                <td class="top-list">
                    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button_Click" CssClass="yarisma-style-button" />
                </td>
                <td class="top-list">
                    <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button_Click" CssClass="yarisma-style-button" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Sıradaki Soru" Visible="false" CssClass="yarisma-style-button" />
            </tr>
        </table>
    </div>
</asp:Content>
