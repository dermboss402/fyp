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
                <asp:Button ID="Button1" runat="server" Text="Browse Tutors" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

      
 
    <h3>My Google Maps Demo</h3>

     <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
  
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
    </style>

    <div id="map"></div>
    <script> function initAutocomplete() {
     var map = new google.maps.Map(document.getElementById('map'), {
         center: { lat: -33.8688, lng: 151.2195 },
         zoom: 13,
         mapTypeId: 'roadmap'
     });

     // Create the search box and link it to the UI element.
     var input = document.getElementById('pac-input');
     var searchBox = new google.maps.places.SearchBox(input);
     map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

     // Bias the SearchBox results towards current map's viewport.
     map.addListener('bounds_changed', function () {
         searchBox.setBounds(map.getBounds());
     });

     var markers = [];
     // Listen for the event fired when the user selects a prediction and retrieve
     // more details for that place.
     searchBox.addListener('places_changed', function () {
         var places = searchBox.getPlaces();

         if (places.length == 0) {
             return;
         }

         // Clear out the old markers.
         markers.forEach(function (marker) {
             marker.setMap(null);
         });
         markers = [];

         // For each place, get the icon, name and location.
         var bounds = new google.maps.LatLngBounds();
         places.forEach(function (place) {
             if (!place.geometry) {
                 console.log("Returned place contains no geometry");
                 return;
             }
             var icon = {
                 url: place.icon,
                 size: new google.maps.Size(71, 71),
                 origin: new google.maps.Point(0, 0),
                 anchor: new google.maps.Point(17, 34),
                 scaledSize: new google.maps.Size(25, 25)
             };

             // Create a marker for each place.
             markers.push(new google.maps.Marker({
                 map: map,
                 icon: icon,
                 title: place.name,
                 position: place.geometry.location
             }));

             if (place.geometry.viewport) {
                 // Only geocodes have viewport.
                 bounds.union(place.geometry.viewport);
             } else {
                 bounds.extend(place.geometry.location);
             }
         });
         map.fitBounds(bounds);
     });
 }
        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABdRbnevMwmBYzBjcSH1PqzyJqT6DWyNE&callback=initMap">
         </script>
</asp:Content>

