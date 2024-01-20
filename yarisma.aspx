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
    }

    .auto-style4 {
        height: 134px;
        text-align: center;
    }

    .auto-style5 {
        text-align: right;
        float: right;
    }

    .auto-style6 {
        text-align: left;
    }

    .auto-style7 {
        width: 100%;
        background-color: lightgray;
        touch-action: manipulation;
        transition: all 0.3s;
        transform: none !important;
        box-shadow: none !important;
        outline: none !important;
        border-radius : 5px;
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
        <table style="text-align: center">
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
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Puanımı Kaydet" Visible="false" CssClass="yarisma-style-button" />
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
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
                <td>
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
