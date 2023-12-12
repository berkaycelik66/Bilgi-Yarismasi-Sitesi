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
            <td class="auto-style2" colspan="3"><strong>SORU GÖNDER</strong></td>
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
            <td class="auto-style3">
                <asp:Button ID="Button1" runat="server" Text="Gönder" OnClick="Button1_Click" />
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
