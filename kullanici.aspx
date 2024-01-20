<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="kullanici.aspx.cs" Inherits="YarismaSitesi.kullanici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            font-size: x-large;
        }

        .ok {
            background-color: forestgreen;
        }

        .hata {
            background-color: lightcoral;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="top-list" colspan="6">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" CssClass="auto-style2"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:Panel ID="pnlPoints" runat="server">
        <div class="table">
            <div class="table-header">
                <div class="tableheader__item">Points</div>
                <div class="tableheader__item">Date</div>
                <div class="tableheader__item">Category</div>
                <%
                    if (Session["username"].ToString() == Request.QueryString["uname"])
                    {

                %>
                <div class="tableheader__item"></div>
                <%}%>
            </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="table-row">
                        <div class="table-data">
                            <%#Eval("points")%>
            </div>
            <div class="table-data"><%#Eval("dates")%></div>
            <div class="table-data"><%#Eval("category")%></div>

            <!--Eğer kullanıcı başka birinin profiline giriyorsa, profiline girdiği kullanıcının verilerini silememesi gerekir.-->
            <%
                if (Session["username"].ToString() == Request.QueryString["uname"])
                {

            %>
            <div class="table-data btnsil">
                <a id="soru_sil" href="puan-sil.aspx?id=<%#Eval("id")%>"><span class="text">Sil</span>
                    <span class="icon">
                        <svg class="svg" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                            <title></title>
                            <path d="M112,112l20,320c.95,18.49,14.4,32,32,32H348c17.67,0,30.87-13.51,32-32l20-320" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="stroke: #fff; stroke-linecap: round; stroke-miterlimit: 10; stroke-width: 32px" x1="80" x2="432" y1="112" y2="112"></line><path d="M192,112V72h0a23.93,23.93,0,0,1,24-24h80a23.93,23.93,0,0,1,24,24h0v40" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="256" x2="256" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="184" x2="192" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="328" x2="320" y1="176" y2="400"></line></svg></span></a>
            </div>
            <%}%>
        </div>
        </ItemTemplate>
                <footertemplate>
                    <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                </footertemplate>
        </asp:Repeater>
        </div>

        <table class="auto-style1 top-list">
            <tr>
                <td colspan="3">
                    <%
                                if (Request.QueryString["YarışmaSil"] == "ok")
                                {%>
                    <div class="ok">
                        <center>Yarışma Sonucunuz Başarıyla Silindi</center>
                    </div>
                    <% }
                        else if (Request.QueryString["YarışmaSil"] == "hata")
                        {
                    %>
                    <div class="hata">
                        <center>Yarışma Sonucu Size Ait Değil</center>
                    </div>
                    <% } %>
                </td>
            </tr>

        </table>
    </asp:Panel>
    <table>
        <tr>
            <td class="top-list">
                <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <br />

    <asp:Panel ID="pnlQuestions" runat="server">

        <div class="table" border="1">
            <div class="table-header">
                <div class="tableheader__item">Kategori</div>
                <div class="tableheader__item">Eklenen Sorular</div>
                <div class="tableheader__item">Doğru Cevap</div>
                <div class="tableheader__item">Onay</div>
                <div class="tableheader__item"></div>
                <div class="tableheader__item"></div>
            </div>

            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="table-row">
                        <div class="table-data"><%#Eval("category")%></div>
                        <div class="table-data"><%#Eval("question")%></div>
                        <div class="table-data"><%#Eval("true_answer")%></div>
                        <div class="table-data"><%#Eval("state").Equals(true) ? "Onaylandı": "Onaylanmadı"%></div>
                        <div class="table-data btnedit">
                            <a href="soru-duzenle.aspx?id=<%#Eval("id")%>"><span class="text">Düzenle</span>
                                <span class="icon">
                                    <svg class="svg" viewBox="0 0 512 512">
                                        <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg></a>
                        </div>
                        <div class="table-data btnsil">
                            <a href="soru-sil.aspx?id=<%#Eval("id")%>"><span class="text">Sil</span>
                                <span class="icon">
                                    <svg class="svg" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                                        <title></title>
                                        <path d="M112,112l20,320c.95,18.49,14.4,32,32,32H348c17.67,0,30.87-13.51,32-32l20-320" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="stroke: #fff; stroke-linecap: round; stroke-miterlimit: 10; stroke-width: 32px" x1="80" x2="432" y1="112" y2="112"></line><path d="M192,112V72h0a23.93,23.93,0,0,1,24-24h80a23.93,23.93,0,0,1,24,24h0v40" style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px"></path><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="256" x2="256" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="184" x2="192" y1="176" y2="400"></line><line style="fill: none; stroke: #fff; stroke-linecap: round; stroke-linejoin: round; stroke-width: 32px" x1="328" x2="320" y1="176" y2="400"></line></svg></span></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

        <table class="auto-style1 top-list">
            <tr>
                <td colspan="3">
                    <%
                        if (Request.QueryString["SoruSil"] == "ok")
                        {%>
                    <div class="ok">
                        <center>Sorunuz Başarıyla Silindi</center>
                    </div>
                    <% }
                        else if (Request.QueryString["SoruSil"] == "hata")
                        {
                    %>
                    <div class="hata">
                        <center>Soru Size Ait Değil</center>
                    </div>
                    <% } %>
                </td>
            </tr>

        </table>

    </asp:Panel>
</asp:Content>
