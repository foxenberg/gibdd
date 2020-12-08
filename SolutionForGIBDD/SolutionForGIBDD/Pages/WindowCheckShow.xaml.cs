using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace SolutionForGIBDD.Pages
{
    /// <summary>
    /// Логика взаимодействия для окна печати квитанции
    /// </summary>
    public partial class WindowCheckShow : Window
    {
        public WindowCheckShow(Driver driver)
        {
            InitializeComponent();



            using (var db = new GibddTestEntities())
            {
                ////var fine = db.Driver.FirstOrDefault(i => i.ID_Driver == driver.ID_Driver).ID_Fine;
                ////tbNameFine.Text = driver.Fine.NameFine;
                ////labelAmountFine.Content = driver.Fine.AmountFine;

                var Car = db.Driver.FirstOrDefault(i => i.ID_Driver == driver.ID_Driver).Car;
                labelMark.Content = Car.MarkCar;
                labelModel.Content = Car.ModelCar;
                labelCarNumber.Content = Car.CarNumber;


                labelName.Content = driver.Name;
                labelSurname.Content = driver.Surname;
                labelPatron.Content = driver.MiddleName;
                labelDateFine.Content = driver.DateFine;

                var Police = db.Driver.FirstOrDefault(i => i.ID_Driver == driver.ID_Driver).TrafficPolice;
                labelPolice.Content = Police.Surname;
                labelPoliceName.Content = Police.Name;
            }
        }
        private string text = "";

        void PrintPageHandler(object sender, PrintPageEventArgs e)
        {
            e.Graphics.DrawString(text, new Font("Arial", 11),
                System.Drawing.Brushes.Black, 0, 0);

        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog dialog = new PrintDialog();
            if (dialog.ShowDialog() == true)
            {
                dialog.PrintVisual(check, "Печать");
            }
        }
    }
}
