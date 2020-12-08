using GibddLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
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
    /// Логика взаимодействия для оформления транспортного средства
    /// </summary>
    public partial class DrawCarPage : Page
    {
        public DrawCarPage()
        {
            InitializeComponent();
            
        }

        private void btnAddCar_Click(object sender, RoutedEventArgs e)
        {
            if (tbCarNumber.Text.Length != 0 && tbMarc.Text.Length != 0 &&
               tbModel.Text.Length != 0 && tbPassVehicle.Text.Length != 0
               && tbInsurance.Text.Length != 0)
            {

                GibddClass.AddCar
                (
                    new Car
                    {
                        CarNumber = tbCarNumber.Text,
                        MarkCar = tbMarc.Text,
                        ModelCar = tbModel.Text,
                        VehiclePassport = Convert.ToInt32(tbPassVehicle.Text),
                        InsuranceCar = Convert.ToInt32(tbInsurance.Text)
                    }
                );

                

                NavigationService?.Navigate(new DrawAmountPage());
            }
            else
                MessageBox.Show("Заполните все данные");
            
            
        }


        private void btnHelpFormat_MouseEnter(object sender, MouseEventArgs e)
        {
            popup_uc2.PlacementTarget = btnHelpFormat;
            popup_uc2.Placement = PlacementMode.Right;
            popup_uc2.IsOpen = true;
            Header.PopupText.Text = "Формат: У645НГ116";
        }

        private void btnHelpFormat_MouseLeave(object sender, MouseEventArgs e)
        {
            popup_uc2.Visibility = Visibility.Collapsed;
            popup_uc2.IsOpen = false;
        }

        private void tbInsurance_KeyDown(object sender, KeyEventArgs e)
        {
            if (KeyExt.IsKeyNumber(e))
            {
                e.Handled = true;
            }

        }

        private void tbPassVehicle_KeyDown(object sender, KeyEventArgs e)
        {
            if (KeyExt.IsKeyNumber(e))
            {
                e.Handled = true;
            }
        }

        
    }
}
