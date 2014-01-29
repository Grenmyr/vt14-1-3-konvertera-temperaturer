<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="temperaturer._default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Konvertera temperaturer</h1>
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
        <%-- Textfält för starttemperatur --%>
        <div>
            <h4>Starttemperatur</h4>
            <asp:TextBox ID="MinTextBox" runat="server"></asp:TextBox>
        </div>
        <%-- Textfält för sluttemperatur --%>
        <div>
            <h4>Sluttemperatur</h4>
            <asp:TextBox ID="MaxTextBox" runat="server"></asp:TextBox>
        </div>
        <%-- Textfält för temperatursteg --%>
        <div>
            <h4>Temperatursteg</h4>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            <h4>Typ av konvertering</h4>
        <div><asp:RadioButton ID="Celsius" runat="server" GroupName="Scale" Text="Celsius" /></div>
          <div><asp:RadioButton ID="Fahrenheit" runat="server" GroupName="Scale" Text="Fahrenheit" /></div>
            </div>
    </form>
</body>
</html>
