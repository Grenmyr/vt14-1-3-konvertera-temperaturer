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
                    if (!Celsius.Checked && !Fahrenheit.Checked)
                    {
                        //throw new ApplicationException("Du är en stygg användare!");
                        ModelState.AddModelError(string.Empty, "Du är en Stygg användare");
                    }

                    if (Celsius.Checked)
                    {
                        TemperatureConverter.CelsiusToFahrenheit(20);
                        temp.CelciusToFahrenheit();
                         //int temp = 20.CelsiusToFahrenheit();
                    }
                    else if (Fahrenheit.Checked)
                    {

                    }

                
            }
           
        }
    }
}