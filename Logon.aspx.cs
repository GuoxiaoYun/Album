using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Today.ToLongDateString();
        Label2.Text = DateTime.Today.ToLongDateString();
        if (!IsPostBack)
            DataListBind();
    }

    protected void btnLogon_Click(object sender, EventArgs e)
    {
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("photo.mdb")))
        {
            //查询数据库中数据
            OleDbDataAdapter da =
                new OleDbDataAdapter(
                    "select * from tb_User where userName='" + txtUserName.Text + "'and userPwd='" + txtPwd.Text + "'",
                    conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Table");
            //如果查询结果记录数大于0 则用户名称和密码正确。否则，用户名称或密码不正确。
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["User"] = txtUserName.Text;
                //判断选中的单选按钮
                if (rdoBtnIndex.Checked)
                    Response.Redirect("Default.aspx"); //浏览相片
                else
                    Response.Redirect(@"BackGround\Default.aspx"); //管理图片
            }
            else
                WebMessageBox.Show("用户名称或密码不正确！");
        }
    }

    protected void dlPictrue_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Session["User"] = dlPictrue.DataKeys[e.Item.ItemIndex].ToString();
        Response.Redirect("Default.aspx");
    }

    /// <summary>
    ///   将数据绑定到DataList控件
    /// </summary>
    public void DataListBind()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("id", typeof (int)));
        dt.Columns.Add(new DataColumn("photoUser", typeof (string)));
        dt.Columns.Add(new DataColumn("photoPath", typeof (string)));
        dt.PrimaryKey = new[] {dt.Columns["photoUser"]};

        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("photo.mdb")))
        {
            //查询数据库中数据
            OleDbDataAdapter da = new OleDbDataAdapter("select userName from tb_User", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Table");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                OleDbDataAdapter dap =
                    new OleDbDataAdapter(
                        "select id,photoUser, photoPath from tb_Photo where photoUser='" + ds.Tables[0].Rows[i][0] + "'",
                        conn);
                DataSet dss = new DataSet();
                dap.Fill(dss);
                if (dss.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = dss.Tables[0].Rows[0][0].ToString();
                    dr[1] = dss.Tables[0].Rows[0][1].ToString();
                    dr[2] = dss.Tables[0].Rows[0][2].ToString();
                    dt.Rows.Add(dr);
                }
            }
        }

        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = dt.DefaultView; //将查询结果绑定到分页数据源上。
        pds.AllowPaging = true; //允许分页
        pds.PageSize = 6; //设置每页显示多少张图片
        pds.CurrentPageIndex = Convert.ToInt32(lblCurrentPage.Text) - 1; //设置当前页
        lnkBtnFirst.Enabled = true; //控件翻页控件都设置为可用
        lnkBtnLast.Enabled = true;
        lnkBtnNext.Enabled = true;
        lnkBtnPrevious.Enabled = true;
        if (lblCurrentPage.Text == "1") //如果当前显示第一页，“第一页”和“上一页”按钮不可用。
        {
            lnkBtnPrevious.Enabled = false;
            lnkBtnFirst.Enabled = false;
        }
        if (lblCurrentPage.Text == pds.PageCount.ToString()) //如果显示最后一页，“末一页”和“下一页”按钮不可用。
        {
            lnkBtnNext.Enabled = false;
            lnkBtnLast.Enabled = false;
        }
        lblSumPage.Text = pds.PageCount.ToString(); //实现总页数
        //将分页结果绑定到DataList控件上
        dlPictrue.DataSource = pds; //绑定数据源
        dlPictrue.DataKeyField = "photoUser";
        dlPictrue.DataBind();
    }

    protected void lnkBtnFirst_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = "1";
        DataListBind();
    }

    protected void lnkBtnPrevious_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) - 1).ToString();
        DataListBind();
    }

    protected void lnkBtnNext_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = (Convert.ToInt32(lblCurrentPage.Text) + 1).ToString();
        DataListBind();
    }

    protected void lnkBtnLast_Click(object sender, EventArgs e)
    {
        lblCurrentPage.Text = lblSumPage.Text;
        DataListBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}