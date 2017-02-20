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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    w;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
            <asp:BoundField DataField="addressline1" HeaderText="addressline1" SortExpression="addressline1" />
            <asp:BoundField DataField="addressline2" HeaderText="addressline2" SortExpression="addressline2" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Otheremail" HeaderText="Otheremail" SortExpression="Otheremail" />
            <asp:BoundField DataField="About" HeaderText="About" SortExpression="About" />
            <asp:BoundField DataField="Remuneration" HeaderText="Remuneration" SortExpression="Remuneration" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
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
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Address Line 2</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">City</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">County</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Contact Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="contact e-mail (can be different from user e-mail)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Upload Profile Photo</td>
            <td class="auto-style4">
                <asp:Image ID="Image1" runat="server" Height="129px" Width="116px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style4">
                
            <asp:fileupload ID ="Fileupload1" runat="server"></asp:fileupload>
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

