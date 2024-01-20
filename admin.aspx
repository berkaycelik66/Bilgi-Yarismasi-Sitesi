<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="YarismaSitesi.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="paginationPanel">
        <a href="admin-sorular.aspx">SORULAR</a>
        <a href="admin-kullanicilar.aspx">KULLANICILAR</a>
    </div>
</asp:Content>
