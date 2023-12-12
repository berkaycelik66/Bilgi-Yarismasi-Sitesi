<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="yarisma-kurallari.aspx.cs" Inherits="YarismaSitesi.yarisma_kurallari" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        font-size: x-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Yarışma Kuralları</h1>
     <p class="auto-style1">Bilgi Yarışması 15 sorudan oluşur. Kolaydan zora doğru sırayla 15 soru sorulur. Sorulardan birine yanlış yanıt verilirse yarışma sona erer; kalan sorular sorulmaz. Her bir yarışmacıya sorulacak olan sorular, soru kümesinden rastgele seçilir. Her yarışma "kolay", "orta zorlukta" ve "zor" olmak üzere tüm gruplardan soru içerir. Yarışma sonunda alacağınız puan, doğru yanıtladığınız soruların puanları toplamıdır. Yarışmada sorulan sorular yanlış cevaplandırıldıkça puanı artar, doğru cevaplandırdıkça puanı azalır. Bu nedenle zor soruların puanı yüksek iken, kolay soruların puanı düşüktür.
    </p>
</asp:Content>
