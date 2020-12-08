using SolutionForGIBDD.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

namespace SolutionForGIBDD
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static GibddTestEntities db = new GibddTestEntities();
        public MainWindow()
        {
            InitializeComponent();
            Frame.Navigate(new Pages.MainMenuPage());      
        }
        private void Home_MouseEnter(object sender, MouseEventArgs e)
        {
            popup_uc.PlacementTarget = Home;
            popup_uc.Placement = PlacementMode.Right;
            popup_uc.IsOpen = true;
            Header.PopupText.Text = "Главная";
        }

        private void Home_MouseLeave(object sender, MouseEventArgs e)
        {
            popup_uc.Visibility = Visibility.Collapsed;
            popup_uc.IsOpen = false;
        }

        private void Profile_MouseEnter(object sender, MouseEventArgs e)
        {
            popup_uc.PlacementTarget = Profile;
            popup_uc.Placement = PlacementMode.Right;
            popup_uc.IsOpen = true;
            Header.PopupText.Text = "Проверка";
        }

        private void Profile_MouseLeave(object sender, MouseEventArgs e)
        {
            popup_uc.Visibility = Visibility.Collapsed;
            popup_uc.IsOpen = false;
        }

        private void Settings_MouseEnter(object sender, MouseEventArgs e)
        {
            popup_uc.PlacementTarget = Draw;
            popup_uc.Placement = PlacementMode.Right;
            popup_uc.IsOpen = true;
            Header.PopupText.Text = "Оформление";
        }

        private void Settings_MouseLeave(object sender, MouseEventArgs e)
        {
            popup_uc.Visibility = Visibility.Collapsed;
            popup_uc.IsOpen = false;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Home_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(new MainMenuPage());
        }

        private void Profile_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(new VerifyAmountPage());
        }

        private void Settings_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(new DrawCarPage());
        }

        private void RegisterCar_MouseEnter(object sender, MouseEventArgs e)
        {
            popup_uc.PlacementTarget = RegisterCar;
            popup_uc.Placement = PlacementMode.Right;
            popup_uc.IsOpen = true;
            Header.PopupText.Text = "Регистрация";
        }

        private void RegisterCar_MouseLeave(object sender, MouseEventArgs e)
        {
            popup_uc.Visibility = Visibility.Collapsed;
            popup_uc.IsOpen = false;
        }

        private void RegisterCar_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(new Pages.CheckRegisterCar());
        }
    }
}
