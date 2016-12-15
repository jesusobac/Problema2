using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Base;
using Base.Identity;
using System.Data;
using System.Data.Entity;

namespace BaseLogica.Negocio
{
    public class PalabrasON
    {
        public List<Polindromo> ListaPalabras()
        {
            try
            {
                using (var db = new postgresEntities())
                {
                    var query = db.Polindromo.AsQueryable();
                    query = query.OrderBy(p => p.Palabra);
                    return query.ToList();
                }
            }
            catch (Exception e)
            {
                throw new Exception("Ocurrió un error en la capa de datos", e);
            }
        }

        public Polindromo GuardarPalabra(Polindromo _polindromo)
        {
            try
            {
                if (_polindromo == null)
                {
                    throw new ArgumentException("No se puede guardar un valor nulo ");
                }
                using (var db = new postgresEntities())
                {
                    db.Entry(_polindromo).State = EntityState.Added;
                    db.SaveChanges();
                }
                return _polindromo;
            }
            catch (Exception e)
            {
                throw new Exception("Ocurrió un error en la capa de datos", e);
            }
        }

        public bool ExistePalabra(string palabra)
        {
            try
            {
                if (string.IsNullOrEmpty(palabra))
                {
                    throw new ArgumentException("idPersona no puede estar vacío", "idPersona");
                }
                using (var db = new postgresEntities())
                {
                    var result = db.Polindromo.Any(t => t.Palabra == palabra);
                    return result;
                }
            }
            catch (Exception e)
            {
                throw new Exception("Ocurrió un error en la capa de datos", e);
            }

        }

        public void EliminarPalabra(Guid idPalabra)
        {
            try
            {
                if (idPalabra == null || idPalabra == Guid.Empty)
                {
                    throw new ArgumentException("No se puede eliminar la palabra. idPalabra no puede estar vacío.");
                }

                using (var db = new postgresEntities())
                {
                    Polindromo polindormo = db.Polindromo.Find(idPalabra);
                    db.Polindromo.Remove(polindormo);
                    db.SaveChanges();
                }
            }
            catch (Exception e)
            {
                throw new Exception("Ocurrió un error en la capa de datos", e);
            }
        }
    }
}
