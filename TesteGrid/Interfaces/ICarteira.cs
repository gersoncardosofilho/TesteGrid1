using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using TesteGrid.Model;

namespace TesteGrid.Interfaces
{
    public interface ICarteira
    {
        DataSet GetCarteiras();
        void SaveCarteira(Carteira carteira);
    }
}
