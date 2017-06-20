using System;
using System.Web.UI;

public partial class LoginOut : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Logon.aspx");
    }
}