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
        
    <div class="table">

        <div class="table-header">
            <div class="tableheader__item">Username</div>
            <div class="tableheader__item">Points</div>
            <div class="tableheader__item">Date</div>
            <div class="tableheader__item">Category</div>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <div class="table-row">
                    <div class="table-data">
                        <a href='<%# "kullanici.aspx?uname=" + Eval("username") %>'>
                            <%#Eval("username")%>
                        </a>
                    </div>
                    <div class="table-data"><%#Eval("points")%></div>
                    <div class="table-data"><%#Eval("dates")%></div>
                    <div class="table-data"><%#Eval("category")%></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    &nbsp;
</asp:Content>
