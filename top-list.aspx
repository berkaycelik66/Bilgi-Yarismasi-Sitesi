<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="top-list.aspx.cs" Inherits="YarismaSitesi.top_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            text-align: center;
            height: 21px;
        }

        .auto-style4 {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style3" colspan="4">TOP LİST</td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style2">
                <a href="top-list.aspx"><span class="auto-style4">Genel Puan Durumu</span></a> | <a href="top-list.aspx?k=Spor"><span class="auto-style4">Spor</span></a> | <a href="top-list.aspx?k=Tarih"><span class="auto-style4">Tarih</span></a> | <a href="top-list.aspx?k=Sanat"><span class="auto-style4">Sanat</span></a> | <a href="soru-gonder.aspx"><span class="auto-style4">Soru Gönder</span></a></td>
        </tr>
        <tr>
            <td>Username</td>
            <td>Points</td>
            <td>Date</td>
            <td>Category</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("username")%></td>
                    <td><%#Eval("points")%></td>
                    <td><%#Eval("date")%></td>
                    <td><%#Eval("category")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    &nbsp;
</asp:Content>
