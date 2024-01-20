<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin-kullanicilar.aspx.cs" Inherits="YarismaSitesi.admin_kullanicilar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="paginationPanel">
        <a href="admin-sorular.aspx">SORULAR</a>
        <a class="current-page" href="admin-kullanicilar.aspx">KULLANICILAR</a>
    </div>

    <div class="table">

        <div class="table-header">
            <div class="tableheader__item">Email</div>
            <div class="tableheader__item">Kullanıcı Adı</div>
            <div class="tableheader__item"></div>
        </div>

        <asp:Repeater ID="rpt2" runat="server">
            <ItemTemplate>
                <div class="table-row">
                    <div class="table-data"><%#Eval("mail")%></div>
                    <div class="table-data"><%#Eval("username")%></div>
                    <div class="table-data btnengel">
                        <%# Eval("task").Equals("banned") ? "<a href='engel.aspx?id=" + Eval("id") + "'><span class=\"text\">Kaldır</span>\r\n<span class=\"icon\">\r\n<svg style=\"color: white\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d=\"M367.2 412.5L99.5 144.8C77.1 176.1 64 214.5 64 256c0 106 86 192 192 192c41.5 0 79.9-13.1 111.2-35.5zm45.3-45.3C434.9 335.9 448 297.5 448 256c0-106-86-192-192-192c-41.5 0-79.9 13.1-111.2 35.5L412.5 367.2zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z\"/></svg></span></a>" : "<a href='engel.aspx?id=" + Eval("id") + "'><span class=\"text\">Engelle</span>\r\n<span class=\"icon\">\r\n<svg style=\"color: white\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d=\"M367.2 412.5L99.5 144.8C77.1 176.1 64 214.5 64 256c0 106 86 192 192 192c41.5 0 79.9-13.1 111.2-35.5zm45.3-45.3C434.9 335.9 448 297.5 448 256c0-106-86-192-192-192c-41.5 0-79.9 13.1-111.2 35.5L412.5 367.2zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z\"/></svg></span></a>" %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:Panel ID="pnlsyf2" runat="server" CssClass="paginationPanel">
    </asp:Panel>
</asp:Content>
