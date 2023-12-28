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
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="auto-style2">TOP LİST</h3>
    <div class="top-list">
        <a href="top-list.aspx">Genel Puan Durumu</a> | <a href="top-list.aspx?k=Spor">Spor</a> | <a href="top-list.aspx?k=Tarih">Tarih</a> | <a href="top-list.aspx?k=Sanat">Sanat</a>
    </div>
    <table border="1" class="auto-style1">

        <tr>
            <td>Username</td>
            <td>Points</td>
            <td>Date</td>
            <td>Category</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <tr>
                    <td>
                        <a href='<%# "kullanici.aspx?uname=" + Eval("username") %>'>
                            <%#Eval("username")%>
                        </a>
                    </td>
                    <td><%#Eval("points")%></td>
                    <td><%#Eval("dates")%></td>
                    <td><%#Eval("category")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    &nbsp;
</asp:Content>
