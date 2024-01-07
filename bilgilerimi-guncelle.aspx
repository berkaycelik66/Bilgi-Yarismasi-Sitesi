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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4" colspan="3"><strong>BİLGİLERİ GÜNCELLE</strong></td>
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
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Güncelle" />
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
</asp:Content>
