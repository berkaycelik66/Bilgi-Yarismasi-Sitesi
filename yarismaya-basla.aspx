<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="yarismaya-basla.aspx.cs" Inherits="YarismaSitesi.yarismaya_basla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 26px;
            text-align: center;
            font-size: xx-large;
        }

        .auto-style3 {
            height: 73px;
        }

        .auto-style4 {
            height: 73px;
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">KATEGORİ SEÇ</td>
        </tr>
        <tr>
            <td>
                <a href="yarisma.aspx">GENEL SORULAR</a> |
                <a href="yarisma.aspx?k=Sanat">SANAT</a> |
                <a href="yarisma.aspx?k=Spor">SPOR</a> |
                <a href="yarisma.aspx?k=Tarih">TARİH</a> |
            </td>
        </tr>
    </table>
</asp:Content>
