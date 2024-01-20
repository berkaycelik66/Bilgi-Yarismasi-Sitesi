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
        <tr class="light-button">
            <td>
                <button class="bt" id="btnGenelSorular" runat="server" onserverclick="btnGenelSorular_Click">
                    <div class="light-holder">
                        <div class="dot"></div>
                        <div class="light"></div>
                    </div>
                    <div class="button-holder">
                        <p>GENEL</p>
                    </div>
                </button>
            </td>
            <td>
                <button class="bt" id="btnSanat" runat="server" onserverclick="btnSanat_Click">
                    <div class="light-holder">
                        <div class="dot"></div>
                        <div class="light"></div>
                    </div>
                    <div class="button-holder">
                        <p>SANAT</p>
                    </div>
                </button>
            </td>
            <td>
                <button class="bt" id="btnSpor" runat="server" onserverclick="btnSpor_Click">
                    <div class="light-holder">
                        <div class="dot"></div>
                        <div class="light"></div>
                    </div>
                    <div class="button-holder">
                        <p>SPOR</p>
                    </div>
                </button>
            </td>
            <td>
                <button class="bt" id="btnTarih" runat="server" onserverclick="btnTarih_Click">
                    <div class="light-holder">
                        <div class="dot"></div>
                        <div class="light"></div>
                    </div>
                    <div class="button-holder">
                        <p>TARİH</p>
                    </div>
                </button>
            </td>
        </tr>
    </table>
</asp:Content>
