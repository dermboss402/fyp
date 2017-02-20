<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Select Level of study"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Professional</asp:ListItem>
                    <asp:ListItem>Third Level</asp:ListItem>
                    <asp:ListItem>Secondary</asp:ListItem>
                    <asp:ListItem>Primary</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Select subject"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Browse Tutors" OnClick="Button1_Click1" OnClientClick="initMap()"/>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

      
 <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
  
    <h3>My Google Maps Demo</h3>
    <div id="map"></div>

    <script>
      function initMap() {
          var uluru = { lat: 53.4239, lng: 7.9407 };
          var contentstrin = "hello world";

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: uluru
        });
        <%=GetMarkers() %>
      }
       
       

       
    </script> 


        <script 
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfBjoCsufJ-6X8SsWKuwAIR3GpZnj1jTM&callback=initMap">
         </script>
</asp:Content>

