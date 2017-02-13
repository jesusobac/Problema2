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

    <div class="row">
        E-mail de envio(*)<asp:TextBox ID="txtEmailEnvio" runat="server" CssClass="form-control" placeholder="remitente" />
        <br />
        Contraseña(*)<asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control" placeholder="contraseña" />
        <br />
        E-mail Destino (*)<asp:TextBox ID="txtDestino" runat="server" CssClass="form-control" placeholder="destino" />
        <br />
        cc Email (*)<asp:TextBox ID="txtCopia" runat="server" CssClass="form-control" />
        <br />
        Asunto
        <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control" placeholder="Asunto" />
        <br />
        Cuerpo del mensaje
        <asp:TextBox ID="txtCuerpo" runat="server" CssClass="form-control" placeholder="cuerpo" TextMode="MultiLine"/>
        <br />

        <asp:Button ID="btnEnviarMail" runat="server" OnClick="btnEnviarMail_Click" Text="Enviar Correo" CssClass="btn btn-primary"/>
    </div>

    <div class="notificationBaloon" id="container"
        style="border: 2px solid #ff6a00; padding: 6px; background-color: #ffd800; text-align: center; font-weight: bold; width: 300px; position: absolute; display: none;">
    </div>

</asp:Content>
