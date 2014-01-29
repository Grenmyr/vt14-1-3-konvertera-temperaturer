<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="temperaturer._default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Konvertera temperaturer</h1>
    <form id="form1" runat="server" defaultbutton="SubmitButton" >
        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
        <%-- Textfält för starttemperatur --%>
        <div>
            <h4>Starttemperatur</h4>
            <asp:TextBox ID="MinTextBox" runat="server" ValidationGroup="TemperatureField"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Starttemperatur kan ej lämnas tomt." ControlToValidate="MinTextBox"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Starttemperatur måste anges som ett heltal." Type="Integer" ControlToValidate="MinTextBox" Operator="DataTypeCheck"></asp:CompareValidator>

        </div>
        <%-- Textfält för sluttemperatur --%>
        <div>
            <h4>Sluttemperatur</h4>
            <asp:TextBox ID="MaxTextBox" runat="server" ValidationGroup="TemperatureField"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Sluttemperatur kan ej lämnas tomt." ControlToValidate="MaxTextBox"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Sluttemperatur måste anges som ett heltal." Type="Integer" Operator="DataTypeCheck" ControlToValidate="MaxTextBox"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Sluttemperatur måste vara större än starttemperatur." Operator="GreaterThanEqual" ControlToCompare="MinTextBox" ControlToValidate="MaxTextBox" Type="Integer"></asp:CompareValidator>
        </div>
        <%-- Textfält för temperatursteg --%>
        <div>
            <h4>Temperatursteg</h4>
            <asp:TextBox ID="RangeTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Temperatursteg kan ej lämnas tomt." ControlToValidate="RangeTextBox"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Temperatursteg måste anges som ett heltal." Type="Integer" Operator="DataTypeCheck" ControlToValidate="RangeTextBox"></asp:CompareValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Intervallet måste ligga mellan 1-100." Type="Integer" MaximumValue="100" MinimumValue="1" ControlToValidate="RangeTextBox" Text="*"></asp:RangeValidator>
        </div>
        <div>
            <h4>Typ av konvertering</h4>
            <div>
                <asp:RadioButton ID="Celsius" runat="server" GroupName="Scale" Text="Celsius" Checked="True" />
            </div>
            <div>
                <asp:RadioButton ID="Fahrenheit" runat="server" GroupName="Scale" Text="Fahrenheit" ValidationGroup="Scale" Checked="True" Enabled="True" />
            </div>
            <div>
                <asp:Button ID="SubmitButton" runat="server" Text="Button" OnClick="SubmitButton_Click"  />               
            </div>
        </div>
    </form>
</body>
</html>
