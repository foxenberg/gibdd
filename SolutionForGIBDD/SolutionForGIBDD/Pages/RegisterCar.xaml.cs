    using System;
    using GibddLib;
    using System.Collections.Generic;
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
    using System.Text.RegularExpressions;

    namespace SolutionForGIBDD.Pages
    {
        /// <summary>
        /// Логика взаимодействия для RegisterCar.xaml
        /// </summary>
        public partial class RegisterCar : Page
        {
            public RegisterCar()
            {
                InitializeComponent();
            }

            private void BtnSave_Click(object sender, RoutedEventArgs e)
            {

                if (!string.IsNullOrWhiteSpace(TbPassportPeople.Text) && (!string.IsNullOrWhiteSpace(TbOsago.Text))
                    && !string.IsNullOrWhiteSpace(TbPassportCar.Text) && !string.IsNullOrWhiteSpace(TbPhone.Text))
                {
                    GibddClass.AddRegisterCar(
                    new SolutionForGIBDD.RegisterCar
                    {

                        PassportDriver = TbPassportPeople.Text,
                        PassportVehicle = TbPassportCar.Text,
                        InsuranceCar = TbOsago.Text,
                        NumberPhone = TbPhone.Text

                    });
                    MessageBox.Show("Вы записаны. Вам придет сообщение на номер телефона");
                    NavigationService?.Navigate(new Pages.UserPage());
                }
                else
                    MessageBox.Show("Заполните все данные");


            }


            private void TbPhone_PreviewTextInput(object sender, TextCompositionEventArgs e)
            {
                e.Handled = !(Char.IsDigit(e.Text, 0));
            }

            private void TbPassportCar_PreviewTextInput(object sender, TextCompositionEventArgs e)
            {
                e.Handled = !(Char.IsDigit(e.Text, 0));
            }

            private void TbPassportPeople_PreviewTextInput(object sender, TextCompositionEventArgs e)
            {
                e.Handled = !(Char.IsDigit(e.Text, 0));
            }
        }
    }
