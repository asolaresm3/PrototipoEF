using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Logica
{
    public class Logica
    {
        Sentencias sn = new Sentencias();
        /*-----------------------------------------------------------------------Metodos Generales------------------------------------------------------------*/
        public string siguiente(string tabla, string campo)
        {
            string llave = sn.obtenerfinal(tabla, campo);
            return llave;
        }

        public OdbcDataReader Insertar(string[] datos)
        {
            return sn.Insertar(datos);
        }
        public OdbcDataReader Eliminar(string[] datos)
        {
            return sn.Eliminar(datos);
        }

        public OdbcDataReader Modificar(string[] datos, string[] campos)
        {
            return sn.Modificar(datos, campos);
        }

        public OdbcDataReader consultarMarca()
        {
            return sn.consultaMarca();
        }

        public OdbcDataReader consultarLinea()
        {
            return sn.consultaLinea();
        }

        public OdbcDataReader consultarVendedor()
        {
            return sn.consultaVendedor();
        }

        public OdbcDataReader consultarCliente()
        {
            return sn.consultaCliente();
        }

        public OdbcDataReader consultarProductos()
        {
            return sn.consultaProducto();
        }
    }
}
