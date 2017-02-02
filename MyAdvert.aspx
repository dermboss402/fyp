<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyAdvert.aspx.cs" Inherits="MyAdvert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
  <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
      .auto-style2 {
          width: 293px;
      }
      .auto-style3 {
          width: 239px;
      }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Upload Your profile Picture</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Enter the Address you want to operate from</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Phone</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Renumeration</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>


