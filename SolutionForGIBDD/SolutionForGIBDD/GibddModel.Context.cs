﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GibddTestEntities : DbContext
    {
        public GibddTestEntities()
            : base("name=GibddTestEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Car> Car { get; set; }
        public virtual DbSet<Driver> Driver { get; set; }
        public virtual DbSet<DriverForFine> DriverForFine { get; set; }
        public virtual DbSet<Fine> Fine { get; set; }
        public virtual DbSet<RegisterCar> RegisterCar { get; set; }
        public virtual DbSet<RegisterDriverLicense> RegisterDriverLicense { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TrafficPolice> TrafficPolice { get; set; }
        public virtual DbSet<UserPolice> UserPolice { get; set; }
    }
}
