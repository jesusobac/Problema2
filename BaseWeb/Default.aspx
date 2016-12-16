<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BaseWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.js"></script>
    <script src="/signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {
            var proxy = $.connection.notificationHub;

            $("#button1").click(function () {
                proxy.server.sendNotifications($("#text1").val());
            });

            $.connection.hub.start();
        });
    </script>

    <script type="text/javascript">
        $(function () {
            var proxy = $.connection.notificationHub;

            $("#btnBuscarPalabra").click(function () {
                proxy.server.sendNotifications($("#txtPalabra").val());
            });

            $.connection.hub.start();
        });
    </script>


    <div class="row">
        <input id="text1" type="text" class="form-control" />
        <input id="button1" type="button" value="Send" class="btn btn-primary" />
    </div>

    <%--    <div class="jumbotron">
        <h1>Polindromo</h1>
        <p class="lead">
            Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
        </p>
        <p><a href="https://goo.gl/maps/k6TBjXGvAjp" target="_blank" class="btn btn-primary btn-lg">Lorem  &raquo;</a></p>
    </div>--%>

    <div class="row">
        <div class="col-md-4">
            <h2>Buscar Palabra</h2>
            <asp:TextBox ID="txtPalabra" runat="server" CssClass="form-control" />
            <asp:Button ID="btnBuscarPalabra" runat="server" CssClass="btn btn-primary" Text="Buscar" />
            <p>
                Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
            </p>
        </div>
        <div class="col-md-8">
            <h2>Lista de Palabras</h2>
            <p>
                Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
            </p>
            <p>
                <asp:GridView ID="gvPalabras" runat="server"
                    ItemType="Base.Identity.Polindromo"
                    AutoGenerateColumns="false"
                    GridLines="None"
                    CssClass=" table table-hover"
                    EmptyDataText="No se encontraron registros"
                    OnRowCommand="gvPalabras_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Item.Id %>'
                                    OnClientClick="return confirm('¿Eliminar Palabra?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Polindromo">
                            <ItemTemplate>
                                <%# EvaluaPalabra(Item.Palabra) ? "TRUE":"F" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Palabra">
                            <ItemTemplate>
                                <%# Item.Palabra%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </p>
            <%--        </div>
        <div class="col-md-4">--%>
            <%--<h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>--%>
        </div>
    </div>


</asp:Content>
