using GibddLib;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SolutionForGIBDD.Pages
{
    /// <summary>
    /// Логика взаимодействия для оформления нарушителя
    /// </summary>
    public partial class DrawAmountPage : Page
    {
        public DrawAmountPage()
        {
            InitializeComponent();
            comboBoxPolice.ItemsSource = GibddClass.GetPolice();
            comboBoxFine.ItemsSource = GibddClass.GetFine();
            comboBoxCarNumber.ItemsSource = GibddClass.GetCars();
            pickerDatefine.DisplayDateEnd = DateTime.Now;
            pickerDateBirth.DisplayDateEnd = new DateTime (DateTime.Now.Subtract(new DateTime().AddYears(18)).Ticks);
        }

        private string text = "";

        void PrintPageHandler(object sender, PrintPageEventArgs e)
        {
            e.Graphics.DrawString(text, new Font("Arial", 11), 
                System.Drawing.Brushes.Black, 0, 0);

        }

        private void buttonCancel_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.GoBack();
        }

        private void buttonAddDriver_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(tbSurname.Text) && !string.IsNullOrWhiteSpace(tbName.Text) &&
                !string.IsNullOrWhiteSpace(tbMiddlename.Text) && pickerDateBirth.SelectedDate != null &&
                pickerDatefine != null)
            {

                GibddClass.AddDriver
                    (
                        new Driver
                        {
                            Surname = tbSurname.Text,
                            Name = tbName.Text,
                            MiddleName = tbMiddlename.Text,
                            CarNumber = comboBoxCarNumber.Text,
                            DateBirth = pickerDateBirth.SelectedDate,
                            DateFine = pickerDatefine.SelectedDate,
                            ID_Fine = (comboBoxFine.SelectedItem as Fine).ID_Fine,
                            ID_Inspector = (comboBoxPolice.SelectedItem as TrafficPolice).ID_Inspector,
                            DriverLicense = Convert.ToInt32(tbCarLic.Text),
                        }
                    );
                NavigationService.Navigate(new Pages.MainMenuPage());

            }
            else
                MessageBox.Show("Введите все данные");
        }

        private void buttonPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog dialog = new PrintDialog();
            if (dialog.ShowDialog() == true)
            {
                dialog.PrintVisual(gridFine, "Печать");
            }
        }

        private void tbCarLic_KeyDown(object sender, KeyEventArgs e)
        {
            if (KeyExt.IsKeyNumber(e))
            {
                e.Handled = true;
            }
        }
    }
}
