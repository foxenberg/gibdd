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
using System.Windows.Shapes;

namespace SolutionForGIBDD
{
    /// <summary>
    /// Логика взаимодействия для WindowUser.xaml
    /// </summary>
    public partial class WindowUser : Window
    {
        public WindowUser()
        {
            InitializeComponent();
        }

        private void BtnHome_Click(object sender, RoutedEventArgs e)
        {
            int index = int.Parse(((Button)e.Source).Uid);

            GridCursor.Margin = new Thickness(10 + (150 * index), 0, 0, 0);
            FrameMain.NavigationService.Navigate(new Pages.UserPage());
        }


        private void RegisterCar_Click(object sender, RoutedEventArgs e)
        {
            int index = int.Parse(((Button)e.Source).Uid);

            GridCursor.Margin = new Thickness(10 + (150 * index), 0, 0, 0);
            FrameMain.NavigationService.Navigate(new Pages.RegisterCar());
        }

        private void BPower_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void RegisterLicense_Click(object sender, RoutedEventArgs e)
        {
            int index = int.Parse(((Button)e.Source).Uid);

            GridCursor.Margin = new Thickness(10 + (150 * index), 0, 0, 0);
            FrameMain.NavigationService.Navigate(new Pages.RegisterDriverLicense());
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            FrameMain.NavigationService.Navigate(new Pages.UserPage());
        }
    }
}
