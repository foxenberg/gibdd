using System;
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

namespace SolutionForGIBDD.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegisterDriverLicense.xaml
    /// </summary>
    public partial class RegisterDriverLicense : Page
    {
        public RegisterDriverLicense()
        {
            InitializeComponent();
        }



        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TbPassportPeople.Text) && (!string.IsNullOrWhiteSpace(TbOldDriver.Text))
                && !string.IsNullOrWhiteSpace(TbPhone.Text))
            {
                GibddClass.AddLicense(
                    new SolutionForGIBDD.RegisterDriverLicense
                    {

                        PassportDriver = TbPassportPeople.Text,
                        NumberPostLicense = TbOldDriver.Text,
                        NumberPhone = TbPhone.Text

                    });
                MessageBox.Show("Вы записаны. Вам придет сообщение на номер телефона");
                NavigationService?.Navigate(new Pages.UserPage());
            }
            else
                MessageBox.Show("Заполните все данные");
        }

        private void TbPassportPeople_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !(Char.IsDigit(e.Text, 0));
        }
    }
}
