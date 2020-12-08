using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SolutionForGIBDD
{
    public class GibddClass
    {
        public static void AddDriver(Driver driver)
        {
            if (driver == null) return;
            using (var db = new GibddTestEntities())
            {
                db.Driver.Add(driver);
                db.SaveChanges();
            }
        }
        public static void AddCar(Car car)
        {
            if (car == null) return;
            using (var db = new GibddTestEntities())
            {
                db.Car.Add(car);
                db.SaveChanges();
            }
        }
        public static void AddLicense(RegisterDriverLicense license)
        {
            if (license == null) return;
            using (var db = new GibddTestEntities())
            {
                db.RegisterDriverLicense.Add(license);
                db.SaveChanges();
            }
        }

        public static void AddRegisterCar(RegisterCar regCar)
        {
            if (regCar == null) return;
            using (var db = new GibddTestEntities())
            {
                db.RegisterCar.Add(regCar);
                db.SaveChanges();
            }
        }

        public static IEnumerable<Car> GetCars() //Получить информацию об автомобилях
        {
            using (var db = new GibddTestEntities())
            {
                return db.Car.ToList();
            }
        }

        public static IEnumerable<Driver> GetDrivers() //Получить информацию о нарушителях
        {
            using (var db = new GibddTestEntities())
            {
                return db.Driver.ToList();
            }
        }

        public static IEnumerable<Fine> GetFine() //Получить информацию о штрафах
        {
            using (var db = new GibddTestEntities())
            {
                return db.Fine.ToList();
            }
        }

        public static IEnumerable<TrafficPolice> GetPolice() // Получить информацию об инспекторах
        {
            using (var db = new GibddTestEntities())
            {
                return db.TrafficPolice.ToList();
            }
        }


    }
}
