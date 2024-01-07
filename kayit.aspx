<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayit.aspx.cs" Inherits="YarismaSitesi.kayit" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Bilgi Yarışması</title>
    <link rel="stylesheet" href="stil.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 18px;
            text-align: center;
        }
        .auto-style3 {
            height: 28px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            text-align: right;
            width: 502px;
        }
        .auto-style6 {
            height: 18px;
            text-align: right;
            width: 502px;
        }
        .auto-style7 {
            height: 28px;
            text-align: right;
            width: 502px;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            height: 18px;
            text-align: left;
        }
        .auto-style10 {
            height: 28px;
            text-align: left;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="header">
            <table>
                <tr>
                    <td>
                        <a href="anasayfa.aspx">
                            <img
                                src="https://www.bilgiyarismasi.com/images/yarisma-logo.jpg"
                                alt="Logo" class="auto-style1" />
                        </a>

                    </td>
                    <td style="width: 250px"></td>
                    <td>

                        <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" Font-Size="Large" OnClick="btnGiris_Click" />
                        <asp:Button ID="btnKayit" runat="server" Text="Kayıt Ol" Font-Size="Large" />

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
                    <td class="auto-style4" colspan="3"><strong>KAYIT OL</strong></td>
                </tr>
                <tr>
                    <td class="auto-style7">MAİL</td>
                    <td class="auto-style3">:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">USERNAME</td>
                    <td class="auto-style2">:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">ŞİFRE</td>
                    <td class="auto-style4">:</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Kayıt Ol" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
