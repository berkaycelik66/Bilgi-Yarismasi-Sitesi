<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="yarisma.aspx.cs" Inherits="YarismaSitesi.yarisma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            height: 22px;
            text-align: center;
            font-size: 25px;
        }

        .auto-style4 {
            height: 250px;
            text-align: center;
            font-size: 25px;
        }

        .auto-style5 {
            text-align: right;
            float: right;
        }

        .auto-style6 {
            text-align: left;
            font-size: 20px;
        }

        .auto-style7 {
            width: 100%;
            background-color: lightgray;
            touch-action: manipulation;
            transition: all 0.3s;
            transform: none !important;
            box-shadow: none !important;
            outline: none !important;
            border-radius: 5px;
        }
    </style>
    <script>
        // Tarayıcı geri tuşu algılandığında çalışacak fonksiyon
        function geriTusuKontrol(event) {
            // Tarayıcı geri tuşu algılandığında, kullanıcıya bir uyarı göster
            var uyarıMetni = "Yarışmadan çıkacaksınız. Devam etmek istiyor musunuz?";
            if (confirm(uyarıMetni)) {
                // Kullanıcı onaylarsa belirli bir sayfaya yönlendir
                window.location.href = "yarismaya-basla.aspx"; // Yönlendirilecek sayfanın URL'si
            } else {
                // Kullanıcı onaylamazsa mevcut sayfada kal
                history.pushState(null, null, window.location.href);
            }
        }

        // Tarayıcı geri tuşu algılama olayını dinle
        window.addEventListener("popstate", geriTusuKontrol);
        window.history.pushState(null, null, window.location.href);

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="yarisma-style">
        <table style="text-align: center;">
            <tr>
                <td>
                    <asp:Button ID="Soru1" runat="server" Text="1" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru2" runat="server" Text="2" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru3" runat="server" Text="3" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru4" runat="server" Text="4" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru5" runat="server" Text="5" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru6" runat="server" Text="6" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru7" runat="server" Text="7" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru8" runat="server" Text="8" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru9" runat="server" Text="9" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
                <td>
                    <asp:Button ID="Soru10" runat="server" Text="10" CssClass="auto-style7" OnClientClick="return false"></asp:Button></td>
            </tr>
        </table>
        <table class="auto-style2">

            <tr>
                <td class="auto-style3">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:Timer runat="server" Enabled="false" ID="UpdateTimer" Interval="1000" OnTick="UpdateTimer_Tick" />
                    <asp:UpdatePanel runat="server" ID="TimedPanel" UpdateMode="Conditional">
                        <ContentTemplate>
                            Süre:<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td class="auto-style3">Puan:<asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Label" CssClass="kopyalanamaz"></asp:Label>
                    <table style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td>
                                <button class="btnrpt" id="Button7" runat="server" onserverclick="Button7_Click" visible="false">
                                    <svg class="svg-icon" fill="none" height="20" viewBox="0 0 20 20" width="20" xmlns="http://www.w3.org/2000/svg">
                                        <g stroke="#eee" stroke-linecap="round" stroke-width="1.5">
                                            <path d="m3.33337 10.8333c0 3.6819 2.98477 6.6667 6.66663 6.6667 3.682 0 6.6667-2.9848 6.6667-6.6667 0-3.68188-2.9847-6.66664-6.6667-6.66664-1.29938 0-2.51191.37174-3.5371 1.01468"></path>
                                            <path d="m7.69867 1.58163-1.44987 3.28435c-.18587.42104.00478.91303.42582 1.0989l3.28438 1.44986"></path>
                                        </g></svg>
                                    <span class="lable">Tekrar Yarış</span></button>
                            </td>
                            <td>
                                <button class="btnsave" id="Button6" runat="server" onserverclick="Button6_Click" visible="false">
                                    <span class="text">Puanımı Kaydet</span>
                                    <span class="icon">
                                        <?xml version="1.0" ?>
                                        <svg class="svg" id="Layer_1" style="enable-background: new 0 0 30 30;" version="1.1" viewBox="0 0 30 30" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <path d="M22,4h-2v6c0,0.552-0.448,1-1,1h-9c-0.552,0-1-0.448-1-1V4H6C4.895,4,4,4.895,4,6v18c0,1.105,0.895,2,2,2h18  c1.105,0,2-0.895,2-2V8L22,4z M22,24H8v-6c0-1.105,0.895-2,2-2h10c1.105,0,2,0.895,2,2V24z" />
                                            <rect height="5" width="2" x="16" y="4" />
                                        </svg></span></button>
                            </td>
                        </tr>

                    </table>
                    <asp:Label ID="Label5" runat="server" CssClass="kopyalanamaz"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="top-list">
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button_Click" CssClass="btnscnk yarisma-style-button" />
                </td>
                <td class="top-list">
                    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button_Click" CssClass="btnscnk yarisma-style-button" />
                </td>
            </tr>
            <tr>
                <td class="top-list">
                    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button_Click" CssClass="btnscnk yarisma-style-button" />
                </td>
                <td class="top-list">
                    <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button_Click" CssClass="btnscnk yarisma-style-button" />
                </td>
            </tr>

            <tr>
                <td class="auto-style6">
                    <br />
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td>
                    <br />
                    <button class="btnnext auto-style5" id="Button5" runat="server" onserverclick="Button5_Click" visible="false">
                        Sıradaki Soru<div class="icon">
                            <svg
                                height="24"
                                width="24"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path d="M0 0h24v24H0z" fill="none"></path>
                                <path
                                    d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"
                                    fill="currentColor">
                                </path>
                            </svg>
                        </div>
                    </button>
            </tr>
        </table>
    </div>
</asp:Content>
