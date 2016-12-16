<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BaseWeb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.js"></script>
    <script src="/signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {
            var proxy = $.connection.notificationHub;

            proxy.client.receiveNotification = function (message) {
                $("#container").html(message);
                $("#container").slideDown(2000);
                setTimeout('$("#container").slideUp(2000);', 6000);
            };

            $.connection.hub.start();
        });
    </script>


    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        jesus obac<br />
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:jesusobac@gmail.com">jesusobac@gmail.com</a><br />
    </address>

    <div class="notificationBaloon" id="container"
        style="border: 2px solid #ff6a00; padding: 6px; background-color: #ffd800; text-align: center; font-weight: bold; width: 300px; position: absolute; display: none;">
    </div>

</asp:Content>
