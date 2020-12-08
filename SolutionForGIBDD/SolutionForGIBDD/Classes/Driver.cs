using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SolutionForGIBDD
{
    public partial class Driver
    {
        public bool IsOtuedDate
        {
            get
            {
                return this.DateFine.GetValueOrDefault().AddMonths(2) <= DateTime.Today;
            }
        }
    }
}
