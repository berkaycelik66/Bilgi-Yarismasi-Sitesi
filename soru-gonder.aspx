<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="soru-gonder.aspx.cs" Inherits="YarismaSitesi.soru_gonder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            height: 17px;
        }

        .auto-style4 {
            height: 26px;
        }

        .auto-style5 {
            height: 29px;
        }

        .auto-style6 {
            height: 17px;
            text-align: center;
            width: 469px;
        }

        .auto-style7 {
            text-align: center;
            width: 469px;
        }

        .auto-style8 {
            height: 29px;
            text-align: center;
            width: 469px;
        }

        .auto-style9 {
            height: 26px;
            text-align: center;
            width: 469px;
        }

        .auto-style10 {
            height: 17px;
            width: 469px;
        }

        .auto-style11 {
            height: 17px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="h1" colspan="3"><strong>SORU GÖNDER</strong></td>
        </tr>
        <tr>
            <td class="auto-style7">Soru</td>
            <td>:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="101px" TextMode="MultiLine" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;&nbsp;&nbsp; Doğru Cevap</td>
            <td class="auto-style4">:</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox2" runat="server" Width="345px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternatif Cevap 1</td>
            <td class="auto-style5">:</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox3" runat="server" Width="345px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternatif Cevap 2</td>
            <td class="auto-style5">:</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox4" runat="server" Width="345px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alternatif Cevap 3</td>
            <td class="auto-style3">:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox5" runat="server" Width="345px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Kategoriler</td>
            <td class="auto-style3">:</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                    <asp:ListItem>Spor</asp:ListItem>
                    <asp:ListItem>Tarih</asp:ListItem>
                    <asp:ListItem>Bilim</asp:ListItem>
                    <asp:ListItem>Sanat</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3 btnGonder">
                <button id="Button1" runat="server" onserverclick="Button1_Click">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                        width="24"
                        height="24">
                        <path fill="none" d="M0 0h24v24H0z"></path>
                        <path
                            fill="currentColor"
                            d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z">
                        </path>
                    </svg><span class="text">Gönder</span></button>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11" colspan="3">NOT: Sorular onaylandıktan sonra yarışmalara eklenmektedir.</td>
        </tr>
    </table>
</asp:Content>
