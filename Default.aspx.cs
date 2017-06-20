using System;
using System.Data.OleDb;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Today.ToLongDateString();
        Label2.Text = DateTime.Today.ToLongDateString();
        if (Session["User"] == null)
            Response.Redirect("logon.aspx");
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("photo.mdb")))
        {
            //初始化数据添加操作
            OleDbCommand cmd =
                new OleDbCommand(
                    "update tb_show set showUser='" + Session["User"] + "', showType='" + TreeView1.SelectedValue +
                    "' where id=0", conn);
            //打开数据库连接
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
        }
        //Response.Write("<script language=javascript>parent.mainFrame.location='PlayPhoto.aspx';</script>");
        mainFrame.Attributes.Add("src", "PlayPhoto.aspx");
    }
}