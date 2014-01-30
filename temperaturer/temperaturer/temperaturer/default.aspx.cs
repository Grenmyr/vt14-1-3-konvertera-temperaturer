using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using temperaturer.Model;

namespace temperaturer
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MinTextBox.Focus();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Kastar undantag ingen av checkboxarna är iklikade.
                if (!CelsiusToFahrenheit.Checked && !FahrenheitToCelsius.Checked)
                {
                    ModelState.AddModelError(string.Empty, "Du är en Stygg användare");
                }
                myMethod();
                TablePanel.Visible = true;
            }
        }
        protected void myMethod()
        {
            // Byter plats på Tableheader OM användare väljer fahrenheit till celcius annars används standard som är satt på mina tableheadercells.
            if (FahrenheitToCelsius.Checked)
            {
                leftHeader.Text = "&deg;F";
                rightHeader.Text = "&deg;C";
            }
            // Forloop som använder alla mina texxtfälts data.
            for (int temperature = int.Parse(MinTextBox.Text); temperature <= int.Parse(MaxTextBox.Text); temperature += int.Parse(RangeTextBox.Text))
            {
                // Skapar nya celler och rader.
                var tc1 = new TableCell();
                var tc2 = new TableCell();
                var tr = new TableRow();
                tc1.Text = temperature.ToString();

                // if else sats shorthanded Styr om jag i tc2 ska använda formel för CelsiusToFahrenheit eller FahrenheitToCelsius som uträkning.
                tc2.Text = CelsiusToFahrenheit.Checked ?
                    tc2.Text = TemperatureConverter.CelsiusToFahrenheit(temperature).ToString()
                    : tc2.Text = TemperatureConverter.FahrenheitToCelsius(temperature).ToString();
                tr.Cells.Add(tc1);
                tr.Cells.Add(tc2);
                // Dunkar in mina TR som nu även innehåller mina td i min tablell
                Table.Rows.Add(tr);
            }
        }
    }
}