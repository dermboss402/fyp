<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 49px;
        }
        .auto-style3 {
            height: 21px;
        }
        .auto-style4 {
            height: 77px;
        }
        .auto-style5 {
            width: 141px;
        }
        .auto-style6 {
            width: 141px;
            height: 20px;
        }
        .auto-style7 {
            height: 20px;
        }
        .auto-style8 {
            width: 141px;
            height: 18px;
        }
        .auto-style9 {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    <table class="nav-justified">
        <tr>
            <td class="auto-style6">Name</td>
            <td class="auto-style7">
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style7">
                <asp:Image ID="Image2" runat="server" Height="136px" Width="103px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">e-mail</td>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">address</td>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">phone number</td>
            <td class="auto-style9">
                <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">current level</td>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">current subject</td>
            <td>
                <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <br />

    <asp:Label ID="Label6" runat="server" Text="Some of the information being asked for here is considered sensitive. "></asp:Label>
    <br />
    <asp:Label ID="Label7" runat="server" Text="If you do not feel comfortable giving out your phone number or address just leave those fields blank."></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" Text="The mimimum requirement that somebody will need to contact you though is an e-mail address"></asp:Label>
    <br />
    <asp:Label ID="Label9" runat="server" Text="If you are also uncomfortable giving this out feel free to set up a new e-mail address for the purpose of findatutor.com"></asp:Label>
    <br />
    <br />
    <br />
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="What subject Would you like to teach?"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" style="margin-bottom: 0px">
                    <asp:ListItem>Maths</asp:ListItem>
                    <asp:ListItem>Irish</asp:ListItem>
                    <asp:ListItem>Englsih</asp:ListItem>
                    <asp:ListItem>Chemisty</asp:ListItem>
                    <asp:ListItem>Biology</asp:ListItem>
                    <asp:ListItem>Physics</asp:ListItem>
                    <asp:ListItem>Agricultural Science</asp:ListItem>
                    <asp:ListItem>Business Studies</asp:ListItem>
                    <asp:ListItem>Accounting</asp:ListItem>
                    <asp:ListItem>History</asp:ListItem>
                    <asp:ListItem>Geography</asp:ListItem>
                    <asp:ListItem>Music</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="What Level?"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Professional</asp:ListItem>
                    <asp:ListItem>Third Level</asp:ListItem>
                    <asp:ListItem>Secondary</asp:ListItem>
                    <asp:ListItem>Primary</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Please enter your address
                <br />
                or
                <br />
                an address where you would like to tutor someone from</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Address Line 1</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Address Line 2</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox8" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">City</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox9" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">County</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox10" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Contact Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5"  runat="server" Text="contact e-mail (can be different from user e-mail)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Upload Profile Photo</td>
            <td class="auto-style4">
                <asp:Image ID="Image1"  runat="server" Height="129px" Width="116px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style4">
                
            <asp:fileupload ID ="Fileupload1"  runat="server"></asp:fileupload>
                <asp:Button ID="Button2" runat="server" Height="33px" OnClick="Button2_Click" Text="Browse files" Width="118px" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Update profile" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

