<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="bilgilerimi-guncelle.aspx.cs" Inherits="YarismaSitesi.bilgilerimi_guncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .auto-style11 {
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" id="panelBilgi">
        <table class="auto-style1">
            <tr>
                <td class="h1" colspan="3"><strong>BİLGİLERİM</strong></td>
            </tr>
            <tr>
                <td class="auto-style7">*MAİL</td>
                <td class="auto-style3">:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">*USERNAME</td>
                <td class="auto-style2">:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">*MEVCUT ŞİFRE</td>
                <td class="auto-style4">:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">YENİ ŞİFRE</td>
                <td class="auto-style4">:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">NOT:Zorunlu alanlar * ile işaretlenmiştir</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">
                    <button id="Button1" runat="server" onserverclick="Button1_Click" class="your-custom-button-class btngnclle">
                        <span class="button__text">Güncelle</span>
                        <span class="button__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" viewBox="0 0 48 48" height="48" class="svg">
                                <path d="M35.3 12.7c-2.89-2.9-6.88-4.7-11.3-4.7-8.84 0-15.98 7.16-15.98 16s7.14 16 15.98 16c7.45 0 13.69-5.1 15.46-12h-4.16c-1.65 4.66-6.07 8-11.3 8-6.63 0-12-5.37-12-12s5.37-12 12-12c3.31 0 6.28 1.38 8.45 3.55l-6.45 6.45h14v-14l-4.7 4.7z"></path><path fill="none" d="M0 0h48v48h-48z"></path></svg></span></button>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8 ">
                    <button class="btnio" runat="server" onserverclick="Button4_Click">Hesabımı Sil</button>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel runat="server" id="panelSil" Visible="false">
        <table class="auto-style1">
            <tr>
                <td class="h1" colspan="2">HESABI GERÇEKTEN SİLMEK İSTİYOR MUSUNUZ?</td>
            </tr>
            <tr>
                <td class="auto-style11 yesNO">
                    <button id="Button2" runat="server" onserverclick="Button2_Click">
                        <span class="text">Evet</span></button>
                    <button id="Button3" runat="server" onserverclick="Button3_Click">
                        <span class="text">Hayır</span></button>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
