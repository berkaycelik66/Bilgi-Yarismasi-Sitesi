<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="yarisma-kurallari.aspx.cs" Inherits="YarismaSitesi.yarisma_kurallari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: 25px;
        }

        .auto-style2 {
            color: #001b5b;
        }

            .auto-style2:hover {
                color: #258e51;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="h1">Yarışma Kuralları</h1>
    <ul>
        <li class="auto-style1">Bilgi Yarışması 10 sorudan oluşur. Yarışmacıya seçtiği kategoriden sırayla 10 soru sorulur. Sorulardan birine yanlış yanıt verilirse yarışma sona erer; kalan sorular sorulmaz. 
        </li>
        <li class="auto-style1">Her bir yarışmacıya sorulacak olan sorular, soru kümesinden rastgele seçilir.</li>
        <li class="auto-style1">Yarışma sonunda alacağınız puan, her doğru yanıtladığınız soru için 10 puan ve her soruda arttırdığınız sürenin toplamıdır. Hızlı olan yarışmacılar daha yüksek puan almaktadır. </li>
        <li class="auto-style1">Yarışma sonunda Puanınızı kaydedebilirsiniz.En yüksek puanın alındığı yarışmalar Top List sayfasında gösterilmektedir.(Giriş yapılmadan yapılan yarışmalar ve puanı 0 olan yarışmalar kaydedilmez.)</li>
        <li class="auto-style1">Profilim sayfasına girerek kaydettiğiniz yarışma sonuçlarını görebilir ve dilediğiniz zaman silebilirsiniz</li>
        <li class="auto-style1"><a class="auto-style2" href="soru-gonder.aspx">Soru Gönder</a> sayfası aracılığı ile yarışmalarda sorulmasını istediğiniz soruları bize gönderebilirsiniz.Gönderdiğiniz sorular onaylandıktan sonra yarışmalarda görülecektir ve Yarışma sırasında soruyu gönderen kullanıcının kullanıcı adı sorunun altında yer alacaktır.( Kullanıcıların yarışmaya gönderdiği sorular kendi yarışmasında karşısına çıkmaz.)</li>
    </ul>
</asp:Content>
