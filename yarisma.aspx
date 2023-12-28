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
    }
    .auto-style4 {
        height: 134px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
    <tr>
        <td class="auto-style3">Süre:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="auto-style3">Puan:
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="2">
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button_Click" />
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button_Click"/>
        </td>
        <td>
            <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button_Click" />
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
