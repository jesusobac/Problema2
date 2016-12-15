using Base.Identity;
using BaseLogica.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaseWeb.Acciones
{
    public class APalabra
    {
        internal object ListaPalabras()
        {
            PalabrasON p = new PalabrasON();
            var lista = p.ListaPalabras();
            return lista;        
        }

        internal Polindromo GuardaPalabra(Polindromo _polindromo)
        {
            var t = new PalabrasON();
            return t.GuardarPalabra(_polindromo);
        }

        internal void EliminarPalabra(Guid idPalabra)
        {
            var t = new PalabrasON();
            t.EliminarPalabra(idPalabra);
        }

        internal bool ExistePalabra(string palabra)
        {
            var t = new PalabrasON();
            return t.ExistePalabra(palabra);
        }
    }
}