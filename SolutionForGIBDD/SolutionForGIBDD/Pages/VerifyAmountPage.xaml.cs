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
using GibddLib;

namespace SolutionForGIBDD.Pages
{
    /// <summary>
    /// Логика взаимодействия для странички оформление транспортного средства
    /// </summary>
    public partial class VerifyAmountPage : Page
    {
        private Dictionary<string, Func<Driver, bool>> _filters =
            new Dictionary<string, Func<Driver, bool>>();
        private readonly List<Driver> _driverCache;

        public VerifyAmountPage()
        {
            InitializeComponent();
            _driverCache = GibddClass.GetDrivers()
                .ToList();
            driverList.ItemsSource = _driverCache;

            

        }

        private void driverList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedItem = driverList.SelectedItem as Driver;
            //NavigationService?.Navigate(new MoreInfoDriverPage(selectedItem));


            WindowCheckShow window = new WindowCheckShow(selectedItem);
            window.Show();
        }


        private void UpdateList()
        {

            var filtered = _driverCache;
            foreach (var filter in _filters)
            {
                filtered = filtered.Where(filter.Value).ToList();
            }
            driverList.ItemsSource = filtered;
            driverList.Items.Refresh();
        }


        private void textBoxLicense_TextChanged(object sender, TextChangedEventArgs e)
        {
            string filterKey = "kk";
            if (!string.IsNullOrEmpty(textBoxLicense.Text))
            {
                if (_filters.ContainsKey(filterKey))
                {
                    _filters.Remove(filterKey);
                }
                _filters.Add(filterKey, (driver) =>
                {
                    return driver.DriverLicense.ToString().Contains(textBoxLicense.Text);
                });
                
            }

            UpdateList();
        }










        //private void textBoxLicense_TextChanged(object sender, TextChangedEventArgs e)
        //{
        //    string filterKey = "DriverLicense";
        //    if (!string.IsNullOrEmpty(textBoxLicense.Text))
        //    {
        //        if (_filters.ContainsKey(filterKey))
        //        {
        //            _filters.Remove(filterKey);
        //        }

        //        _filters.Add(filterKey, (driver) =>
        //        {
        //            return driver.DriverLicense.ToString().Contains(textBoxLicense.Text);
        //        });
        //    }
        //    else
        //    {
        //        _filters.Remove(filterKey);
        //    }
        //    UpdateWorkersList();

        //}

        //Фильтрация по имени

        //private void textBoxLicense_TextChanged(object sender, TextChangedEventArgs e)
        //{
        //    string filterKey = "NameFilter";
        //    if (!string.IsNullOrEmpty(textBoxLicense.Text))
        //    {
        //        if (_filters.ContainsKey(filterKey))
        //        {
        //            _filters.Remove(filterKey);
        //        }

        //        _filters.Add(filterKey, (driver) =>
        //        {
        //            return driver.Name.ToLower().Contains(textBoxLicense.Text.ToLower());
        //        });

        //    }
        //    else
        //    {
        //        _filters.Remove(filterKey);
        //    }


        //    UpdateWorkersList();


        private void textBoxLicense_KeyDown(object sender, KeyEventArgs e)
        {
            if (KeyExt.IsKeyNumber(e))
            {
                e.Handled = true;
            }

        }
        private void driverList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        
    }

    
}


