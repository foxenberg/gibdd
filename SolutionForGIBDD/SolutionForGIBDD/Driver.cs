//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SolutionForGIBDD
{
    using System;
    using System.Collections.Generic;
    
    public partial class Driver
    {
        public int ID_Driver { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string MiddleName { get; set; }
        public Nullable<System.DateTime> DateBirth { get; set; }
        public Nullable<System.DateTime> DateFine { get; set; }
        public string CarNumber { get; set; }
        public Nullable<int> DriverLicense { get; set; }
        public Nullable<int> ID_Fine { get; set; }
        public Nullable<int> ID_Inspector { get; set; }
    
        public virtual Car Car { get; set; }
        public virtual Fine Fine { get; set; }
        public virtual TrafficPolice TrafficPolice { get; set; }
    }
}
