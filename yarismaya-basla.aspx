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
    <h1 class="h1">KATEGORİ SEÇ</h1>

        <div class="row">
            <div class="label">
                <button class="icon-box" runat="server" onserverclick="btnGenelSorular_Click">
                    <i class="fa-solid fa-question"></i>
                    <span>Genel</span>
                </button>

                <button class="icon-box" runat="server" onserverclick="btnSanat_Click">
                    <i class="fa-solid fa-palette"></i>
                    <span>Sanat</span>
                </button>

                <button class="icon-box" runat="server" onserverclick="btnSpor_Click">
                    <i class="fa-solid fa-basketball"></i>
                    <span>Spor</span>
                </button>

                <button class="icon-box" runat="server" onserverclick="btnTarih_Click">
                    <i class="fa-solid fa-book"></i>
                    <span>Tarih</span>
                </button>

                <button class="icon-box" runat="server" onserverclick="btnBilim_Click">
                    <i class="fa-solid fa-flask"></i>
                    <span>Bilim</span>
                </button>
            </div>
        </div>
</asp:Content>
