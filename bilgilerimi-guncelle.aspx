<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="bilgilerimi-guncelle.aspx.cs" Inherits="YarismaSitesi.bilgilerimi_guncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 15px;
        }

        .auto-style2 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 5px;
        }

        .auto-style3 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="panelBilgi">
        <h1 class="h1">BİLGİLERİM</h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <div class="form__group field">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Email" CssClass="form__field"></asp:TextBox>
                        <label for="name" class="form__label">*MAIL</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div class="form__group field">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form__field"></asp:TextBox>
                        <label for="name" class="form__label">*USERNAME</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div class="form__group field">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form__field"></asp:TextBox>
                        <label for="name" class="form__label">*MEVCUT ŞİFRE</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div class="form__group field">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form__field"></asp:TextBox>
                        <label for="name" class="form__label">YENİ ŞİFRE</label>
                    </div>
                </td>
            </tr>
        </table>
        <table class="auto-style2">
            <tr>
                <td class="auto-style2">NOT: Zorunlu alanlar * ile işaretlenmiştir</td>
            </tr>
        </table>
        <table class="auto-style3">
            <tr>
                <td class="auto-style3">
                    <button id="Button1" runat="server" onserverclick="Button1_Click" class="your-custom-button-class btngnclle">
                        <span class="button__text">Güncelle</span>
                        <span class="button__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" viewBox="0 0 48 48" height="48" class="svg">
                                <path d="M35.3 12.7c-2.89-2.9-6.88-4.7-11.3-4.7-8.84 0-15.98 7.16-15.98 16s7.14 16 15.98 16c7.45 0 13.69-5.1 15.46-12h-4.16c-1.65 4.66-6.07 8-11.3 8-6.63 0-12-5.37-12-12s5.37-12 12-12c3.31 0 6.28 1.38 8.45 3.55l-6.45 6.45h14v-14l-4.7 4.7z"></path><path fill="none" d="M0 0h48v48h-48z"></path></svg></span></button>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <button class="btnio" runat="server" onserverclick="Button4_Click">Hesabımı Sil</button>
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
    </asp:Panel>

    <asp:Panel runat="server" ID="panelSil" Visible="false">
        <table class="auto-style1">
            <tr>
                <td class="h1" colspan="2">HESABI GERÇEKTEN SİLMEK İSTİYOR MUSUNUZ?</td>
            </tr>
            <tr>
                <td class="auto-style1 yesNO">
                    <button id="Button2" runat="server" onserverclick="Button2_Click">
                        <span class="text">Evet</span></button>
                    <button id="Button3" runat="server" onserverclick="Button3_Click">
                        <span class="text">Hayır</span></button>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
