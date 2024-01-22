<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="YarismaSitesi.giris" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Bilgi Yarışması</title>
    <link rel="stylesheet" href="stil.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 20px;
        }

        .auto-style2 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 5px;
        }


        .auto-style11 {
            height: 25px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="header">
            <table>
                <tr>
                    <td class="logo">
                        <a href="anasayfa.aspx">
                            <span class="actual-text">&nbsp;BİLGİYARIŞMASI&nbsp;</span>
                            <span aria-hidden="true" class="hover-text">&nbsp;BİLGİYARIŞMASI&nbsp;</span>
                        </a>
                    </td>
                    <td style="width: 250px"></td>
                    <td>

                        <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" Font-Size="Large" OnClick="btnGiris_Click" CssClass="btnio" />
                        <asp:Button ID="btnKayit" runat="server" Text="Kayıt Ol" Font-Size="Large" OnClick="btnKayit_Click" CssClass="btnio" />

                    </td>
                </tr>
            </table>

            <br />

            <nav class="header-link">
                <a href="anasayfa.aspx">Ana Sayfa</a> | <a href="yarismaya-basla.aspx">Yarışmaya Başla</a> |
                <a href="yarisma-kurallari.aspx">Yarışma Kuralları</a> | <a href="top-list.aspx">Top List</a> |
                <a href="soru-gonder.aspx">Soru Gönder</a>
            </nav>
        </div>

        <div id="content">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style1">
                        <div class="form__group field">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form__field"></asp:TextBox>
                            <label for="name" class="form__label">MAIL / USERNAME</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <div class="form__group field">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form__field"></asp:TextBox>
                            <label for="name" class="form__label">ŞİFRE</label>
                        </div>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Giriş Yap" Width="78px" CssClass="btnio auto-style11" />
                    </td>
                </tr>

            </table>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>

