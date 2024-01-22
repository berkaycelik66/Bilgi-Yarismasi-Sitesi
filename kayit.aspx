<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayit.aspx.cs" Inherits="YarismaSitesi.kayit" %>

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
                        <asp:Button ID="btnKayit" runat="server" Text="Kayıt Ol" Font-Size="Large" CssClass="btnio" />

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
            <h1 class="h1">Kayıt Ol</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style1">
                        <div class="form__group field">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form__field"></asp:TextBox>
                            <label for="name" class="form__label">MAIL</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <div class="form__group field">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form__field"></asp:TextBox>
                            <label for="name" class="form__label">USERNAME</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <div class="form__group field">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" CssClass="form__field"></asp:TextBox>
                            <label for="name" class="form__label">ŞİFRE</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Kayıt Ol" CssClass="btnio auto-style11" />
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

        <div id="footer">
            <table width="auto" style="margin-left: auto; margin-right: auto;">
                <tr>
                    <td style="margin-top: 10px;">
                        <a href="https://github.com/berkaycelik66/Bilgi-Yarismasi-Sitesi" class="github">
                            <svg viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                <path fill="#FFFFFF" d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"></path>
                            </svg>
                            <span class="text">Proje Github Linki</span>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
