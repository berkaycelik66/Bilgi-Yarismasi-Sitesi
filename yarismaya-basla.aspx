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
                <asp:Button ID="btnGenelSorular" runat="server" Text="GENEL SORULAR" OnClick="btnGenelSorular_Click" />
                <asp:Button ID="btnSanat" runat="server" Text="SANAT" OnClick="btnSanat_Click" />
                <asp:Button ID="btnSpor" runat="server" Text="SPOR" OnClick="btnSpor_Click" />
                <asp:Button ID="btnTarih" runat="server" Text="TARİH" OnClick="btnTarih_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
