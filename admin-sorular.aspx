<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="admin-sorular.aspx.cs" Inherits="YarismaSitesi.admin_sorular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="paginationPanel">
        <a class="current-page" href="admin-sorular.aspx">SORULAR</a>
        <a href="admin-kullanicilar.aspx">KULLANICILAR</a>
    </div>
    <table class="table2">

        <tr class="table2-header">
            <td >Kategori</td>
            <td >Soru</td>
            <td >Doğru Cevap</td>
            <td >Gönderen</td>
            <td >Onay</td>
            <td ></td>
            <td ></td>
            <td ></td>
        </tr>

        <asp:Repeater ID="rpt1" runat="server">
            <ItemTemplate>

                <tr class="table2-row">
                    <td><%#Eval("category")%></td>
                    <td><%#Eval("question")%></td>
                    <td><%#Eval("true_answer")%></td>
                    <td><%#Eval("sender")%></td>
                    <td><%#Eval("state").Equals(true) ? "Onaylandı": "Onaylanmadı"%></td>
                    <td class="btnonay"><a href="soru-onay.aspx?id=<%#Eval("id")%>"><span class="text">Onay</span>
                        <span class="icon">
                            <svg style="color: white" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" zoomAndPan="magnify" viewBox="0 0 30 30.000001" height="40" preserveAspectRatio="xMidYMid meet" version="1.0">
                                <defs>
                                    <clipPath id="id1">
                                        <path d="M 2.847656 4.792969 L 26.796875 4.792969 L 26.796875 24.390625 L 2.847656 24.390625 Z M 2.847656 4.792969 " clip-rule="nonzero" fill="white"></path>
                                    </clipPath>
                                </defs><g clip-path="url(#id1)"><path fill="white" d="M 11.078125 24.3125 L 2.847656 15.890625 L 6.128906 12.53125 L 11.078125 17.597656 L 23.519531 4.875 L 26.796875 8.230469 Z M 11.078125 24.3125 " fill-opacity="1" fill-rule="nonzero"></path>
                                </g></svg></span></a></td>
                    <td class="btnedit"><a href="soru-duzenle-admin.aspx?id=<%#Eval("id")%>"><span class="text">Düzenle</span>
                        <span class="icon">
                            <svg class="svg" viewBox="0 0 512 512">
                                <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg></span></a></td>
                    <td class="btnsil"><a href="soru-sil-admin.aspx?id=<%#Eval("id")%>"><span class="text">Sil</span>
                        <span class="icon">
                            <svg class="svg" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                                <title></title>
                                <path d="M112,112l20,320c.95,18.49,14.4,32,32,32H348c17.67,0,30.87-13.51,32-32l20-320" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="stroke: #fff; stroke-linecap: round; stroke-miterlimit: 10; stroke-width: 32px" x1="80" x2="432" y1="112" y2="112"></line><path d="M192,112V72h0a23.93,23.93,0,0,1,24-24h80a23.93,23.93,0,0,1,24,24h0v40" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="256" x2="256" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="184" x2="192" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="328" x2="320" y1="176" y2="400"></line></svg></span></a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Panel ID="pnlsyf" runat="server" CssClass="paginationPanel">
    </asp:Panel>
</asp:Content>
