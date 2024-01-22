<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa1.Master" AutoEventWireup="true" CodeBehind="soru-gonder.aspx.cs" Inherits="YarismaSitesi.soru_gonder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            padding-top: 20px;
            margin-right: auto;
        }

        .auto-style2 {
            text-align: center;
            margin-left: auto;
            padding-top: 20px;
        }

        .auto-style3 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 10px;
        }

        .auto-style4 {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-top: 5px;
        }

        .auto-style11 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="h1">Soru Gönder</h1>
    <table width="1000px" style="margin-left:85px;">
        <tr>
            <td>
                <table width="500px" class="auto-style1">
                    <tr>
                        <td class="auto-style1">
                            <div class="form__group field">
                                <asp:TextBox ID="TextBox1" runat="server" Height="101px" TextMode="MultiLine" Width="350px" CssClass="form__field"></asp:TextBox>
                                <label for="name" class="form__label">SORU</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <div class="form__group field">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form__field">
                                    <asp:ListItem>Seçiniz</asp:ListItem>
                                    <asp:ListItem>Spor</asp:ListItem>
                                    <asp:ListItem>Tarih</asp:ListItem>
                                    <asp:ListItem>Bilim</asp:ListItem>
                                    <asp:ListItem>Sanat</asp:ListItem>
                                </asp:DropDownList>
                                <label for="name" class="form__label">KATEGORİ</label>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table width="500px" class="auto-style2">
                    <tr>
                        <td class="auto-style2">
                            <div class="form__group field">
                                <asp:TextBox ID="TextBox2" runat="server" Width="345px" CssClass="form__field"></asp:TextBox>
                                <label for="name" class="form__label">DOĞRU CEVAP</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <div class="form__group field">
                                <asp:TextBox ID="TextBox3" runat="server" Width="345px" CssClass="form__field"></asp:TextBox>
                                <label for="name" class="form__label">YANLIŞ CEVAP 1</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <div class="form__group field">
                                <asp:TextBox ID="TextBox4" runat="server" Width="345px" CssClass="form__field"></asp:TextBox>
                                <label for="name" class="form__label">YANLIŞ CEVAP 2</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <div class="form__group field">
                                <asp:TextBox ID="TextBox5" runat="server" Width="345px" CssClass="form__field"></asp:TextBox>
                                <label for="name" class="form__label">YANLIŞ CEVAP 3</label>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table class="auto-style3">
        <tr>
            <td class="btnGonder auto-style3">
                <button id="Button1" runat="server" onserverclick="Button1_Click">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                        width="24"
                        height="24">
                        <path fill="none" d="M0 0h24v24H0z"></path>
                        <path
                            fill="currentColor"
                            d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z">
                        </path>
                    </svg><span class="text">Gönder</span></button>
            </td>
        </tr>
    </table>
    <table class="auto-style4">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
