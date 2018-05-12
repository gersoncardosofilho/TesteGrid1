using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TesteGrid.Model
{
    public class Carteira
    {
        public string Perfil { get; set; }
        public int Mes { get; set; }
        public int Ano { get; set; }
        public double CDI12m { get; set; }
        public double CDI24m { get; set; }
    }
}