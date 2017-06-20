using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;

public partial class BackGround_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Today.ToLongDateString();
        Label2.Text = DateTime.Today.ToLongDateString();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //验证注册用户是否存在
        if (CheckUser(txtName.Text))
        {
            WebMessageBox.Show("该用户名称存在，请重新选择！", "login.aspx");
        }
        else
        {
            using (
                OleDbConnection conn =
                    new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                                        Server.MapPath("~/photo.mdb")))
            {
                //初始化数据添加操作
                OleDbCommand cmd =
                    new OleDbCommand(
                        "insert into tb_User(userName,UserPwd)values('" + txtName.Text + "','" + txtPwd.Text + "')",
                        conn);
                //打开数据库连接
                conn.Open();
                //执行数据添加操作，并判断其实返回值，大于0添加成功，反之，失败。
                if (cmd.ExecuteNonQuery() > 0)
                {
                    //关闭数据库连接
                    conn.Close();
                    //提示成功信息
                    WebMessageBox.Show("注册成功", "Logon.aspx");
                }
                else
                {
                    //关闭数据库连接
                    conn.Close();
                    //提示错误信息
                    WebMessageBox.Show("注册失败！");
                }
            }
        }
    }

    private bool CheckUser(string user)
    {
        //使用using的意图是，数据库访问后，自动释放其使用资料。
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/photo.mdb")))
        {
            //查询数据库中数据
            OleDbDataAdapter da = new OleDbDataAdapter("select * from tb_User where UserName='" + user + "'", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            //判断用户是否存在
            if (ds.Tables[0].Rows.Count > 0)
                return true; //存在该用户
            else
                return false; //不存在该用户
        }
    }
}