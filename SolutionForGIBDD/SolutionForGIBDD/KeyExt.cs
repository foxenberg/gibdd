using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace GibddLib
{
    public static class KeyExt
    {
        public static bool IsKeyNumberOrComma(KeyEventArgs e)
        {
            return (Key.D0 > e.Key || Key.D9 < e.Key) && e.Key != Key.OemComma;
        }

        public static bool IsKeyNumber(KeyEventArgs e)
        {
            return Key.D0 > e.Key || Key.D9 < e.Key;
        }

        public static bool IsKeydf(KeyEventArgs e)
        {
            return Key.A > e.Key || Key.M < e.Key;
        }

    }
}
