using Base.Identity;
using BaseWeb.Acciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaseWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        private void LlenarGrid()
        {
            try
            {
                var acciones = new APalabra();
                var resultado = acciones.ListaPalabras();
                gvPalabras.DataSource = resultado;
                gvPalabras.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
            }
        }

        public bool EvaluaPalabra(string palabra)
        {
            char[] charArray = palabra.ToCharArray();
            Array.Reverse(charArray);
            string filaInversa = new string(charArray);
            string longest = string.Empty;
            string shortest = string.Empty;
            bool res = false;

            if (palabra.Equals(filaInversa, StringComparison.OrdinalIgnoreCase))
            {
                res = true;
            }
            else
            {
                res = false;
            }
            return res;
        }

        private bool ExistePalabra(string palabra)
        {
            bool exitePalabra = false;
            var acciones = new APalabra();
            //Polindromo _polindromo = ObtenerPolindromoVista();
            var res = acciones.ExistePalabra(palabra);
            if (res)
            {
                exitePalabra = true;
            }
            return exitePalabra;
        }

        private Polindromo ObtenerPolindromoVista()
        {
            Polindromo polindromo = new Polindromo();
            polindromo.Id = Guid.NewGuid();
            polindromo.Palabra = txtPalabra.Text;
            return polindromo;
        }

        protected void gvPalabras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Guid idPalabra;
            if (e.CommandName.Equals("Eliminar"))
            {
                idPalabra = new Guid(e.CommandArgument.ToString());
                try
                {
                    var acciones = new APalabra();
                    acciones.EliminarPalabra(idPalabra);
                    LlenarGrid();
                }
                catch (FaultException ex)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("FALSE Lorem ipsum dolor sit amet ") + "')</script>");
                }
            }
        }

        protected void btnBuscarPalabra_Click(object sender, EventArgs e)
        {
            var acciones = new APalabra();
            Polindromo _polindromo = ObtenerPolindromoVista();

            if (!ExistePalabra(_polindromo.Palabra))
            {
                var res = acciones.GuardaPalabra(_polindromo);

                if (EvaluaPalabra(_polindromo.Palabra))
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("TRUE") + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode("FALSE Lorem ipsum dolor sit amet") + "')</script>");
                    res = acciones.GuardaPalabra(_polindromo);
                }
            }
            else if (EvaluaPalabra(_polindromo.Palabra))
            {
                Response.Write("<script>alert('" + Server.HtmlEncode("TRUE") + "')</script>");
                var res = acciones.GuardaPalabra(_polindromo);
            }
            else
            {
                Response.Write("<script>alert('" + Server.HtmlEncode("FALSE Lorem ipsum dolor sit amet ") + "')</script>");
            }
            txtPalabra.Text = "";
            LlenarGrid();
        }
    }
}