<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="temperaturer._default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/style.css" rel="stylesheet" />
</head>
<body>
    
    <h1>Konvertera temperaturer</h1>
    <form id="form" runat="server" defaultbutton="SubmitButton" >
        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
        <%-- Textfält för starttemperatur --%>
        <div class="leftDiv">
        <div class="formField">           
            <h4>Starttemperatur</h4>
            <asp:TextBox ID="MinTextBox" runat="server" ValidationGroup="TemperatureField"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Starttemperatur kan ej lämnas tomt." ControlToValidate="MinTextBox" Text="*"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Starttemperatur måste anges som ett heltal." Type="Integer" ControlToValidate="MinTextBox" Operator="DataTypeCheck" Text="*"></asp:CompareValidator>

        </div>
        <%-- Textfält för sluttemperatur --%>
        <div class="formField">
            <h4>Sluttemperatur</h4>
            <asp:TextBox ID="MaxTextBox" runat="server" ValidationGroup="TemperatureField"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Sluttemperatur kan ej lämnas tomt." ControlToValidate="MaxTextBox"  Text="*"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Sluttemperatur måste anges som ett heltal." Type="Integer" Operator="DataTypeCheck" ControlToValidate="MaxTextBox"  Text="*"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Sluttemperatur måste vara större än starttemperatur." Operator="GreaterThanEqual" ControlToCompare="MinTextBox" ControlToValidate="MaxTextBox" Type="Integer" Text="*"></asp:CompareValidator>
        </div>
        <%-- Textfält för temperatursteg --%>
        <div class="formField">
            <h4>Temperatursteg</h4>
            <asp:TextBox ID="RangeTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Temperatursteg kan ej lämnas tomt." ControlToValidate="RangeTextBox" Text="*"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Temperatursteg måste anges som ett heltal." Type="Integer" Operator="DataTypeCheck" ControlToValidate="RangeTextBox" Text="*"></asp:CompareValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Intervallet måste ligga mellan 1-100." Type="Integer" MaximumValue="100" MinimumValue="1" ControlToValidate="RangeTextBox" Text="*"></asp:RangeValidator>
        </div>
        
        <div class="formField">
            <%-- Radiobuttons för välja temperaturtyp --%>
            
          
            <div>
                <asp:RadioButton ID="CelsiusToFahrenheit" runat="server" GroupName="Scale" Text="Celsius till Fahrenheit." Checked="True" />
            </div>
            <div>
                <asp:RadioButton ID="FahrenheitToCelsius" runat="server" GroupName="Scale" Text="Fahrenheit till Celsius." ValidationGroup="Scale" Checked="False" Enabled="True" />
            </div>
            <div>
                <asp:Button ID="SubmitButton" runat="server" Text="Beräkna" OnClick="SubmitButton_Click"  />               
            </div>
               
        </div>
            </div>
        
        <%-- Min tabell för presentera data --%>
        <asp:Panel ID="TablePanel" runat="server" CssClass="tableDiv" Visible="False">
            <asp:Table ID="Table" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell ID="leftHeader">&deg;C</asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="rightHeader">&deg;F</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </asp:Panel> 
        <div class="clear"></div>
    </form>
</body>
</html>
