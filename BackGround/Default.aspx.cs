using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackGround_Default : Page
{
    private static string PhotoID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = DateTime.Today.ToLongDateString();
        if (Session["User"] == null)
            Response.Redirect("../logon.aspx");
        if (!IsPostBack)
            GetFileSource();
        //Response.Write(this.GetFileAttribute(""));
        lbUserName.Text = Session["User"].ToString();
    }

    private void GetFileSource()
    {
        //使用using的意图是，数据库访问后，自动释放其使用资源。
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../photo.mdb")))
        {
            //查询数据库中数据
            OleDbDataAdapter da =
                new OleDbDataAdapter(
                    "select * from tb_photo where photoUser ='" + Session["User"] + "' order by id desc", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            //将查询结果，绑定到GridView控件中。
            GridView1.DataSource = ds;
            //设置主键字段
            GridView1.DataKeyNames = new[] {"ID"};
            GridView1.DataBind();
        }

        //获取最大图片ID
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../photo.mdb")))
        {
            //查询数据库中数据
            OleDbDataAdapter da = new OleDbDataAdapter("select * from tb_photo order by id desc", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            //获取图片记录最大ID，用户上传图片命名
            if (ds.Tables[0].Rows.Count > 0)
                PhotoID = (Convert.ToInt32(ds.Tables[0].Rows[0][0]) + 1).ToString(); //获取最大ID,然后加1，为新添加的图片命名
            else
                PhotoID = "0";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //将附件传送到服务器上
        string path = FileUpload1.PostedFile.FileName; //获取上传图片路径
        string ext = path.Substring(path.LastIndexOf(".") + 1); //获取图片扩展名
        if (ext.ToLower() == "jpg" || ext.ToLower() == "bmp" || ext.ToLower() == "gif" || ext.ToLower() == "png" ||
            ext.ToLower() == "tif")
        {
            string sPath = Server.MapPath("..\\Photo\\" + PhotoID + "." + ext); //设置图片保存到服务器上路径
            path = ".\\Photo\\" + PhotoID + "." + ext; //保存到数据库中路径
            using (
                OleDbConnection conn =
                    new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                                        Server.MapPath("../photo.mdb")))
            {
                //初始化数据添加操作
                OleDbCommand cmd =
                    new OleDbCommand(
                        "insert into tb_Photo(PhotoTitle,photoContent,photoPath,photoType,photoUser)values('" +
                        txtTitle.Text + "','" + txtContent.Text + "','" + path + "','" + ddlPicType.Text + "','" +
                        Session["User"] + "')", conn);
                //打开数据库连接
                conn.Open();
                //执行数据添加操作，并判断其实返回值，大于0添加成功，反之，失败。
                if (cmd.ExecuteNonQuery() > 0)
                {
                    //关闭数据库连接
                    conn.Close();
                    //调用自定义方法，获取数据库中最新数据。
                    GetFileSource(); //获取最新数据
                    FileUpload1.PostedFile.SaveAs(sPath); //保存到服务器
                    //提示成功信息
                    WebMessageBox.Show("已成功保存到数据库中......", "Default.aspx");
                }
                else
                {
                    //关闭数据库连接
                    conn.Close();
                    //提示错误信息
                    WebMessageBox.Show("操作失败！");
                }
            }
        }
        else
        {
            WebMessageBox.Show("只能上传图片文件！");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //获取当前页索引，进行分页操作
        GridView1.PageIndex = e.NewPageIndex;
        GetFileSource();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //获取将要删除照片的ID编号
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string photoPath = "";
        //获取图片途径
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../photo.mdb")))
        {
            OleDbDataAdapter da = new OleDbDataAdapter("select * from tb_photo where id=" + id, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            photoPath = ds.Tables[0].Rows[0][2].ToString();
        }
        //删除数据库将照片信息
        using (
            OleDbConnection conn =
                new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../photo.mdb")))
        {
            OleDbCommand cmd = new OleDbCommand("delete from tb_Photo where id=" + id, conn);
            conn.Open();
            //返回值大于0，则删除成功
            if (cmd.ExecuteNonQuery() > 0)
            {
                conn.Close();
                GetFileSource(); //获取最新数据
                File.Delete(photoPath); //删除服务器上的照片
                WebMessageBox.Show("照片删除成功！", "Default.aspx");
            }
            else
            {
                conn.Close();
                WebMessageBox.Show("操作失败！");
            }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //高亮显示指定行
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#336699'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
            //删除指定行数据时，弹出询问对话框
            ((LinkButton) (e.Row.Cells[3].Controls[0])).Attributes.Add("onclick", "return confirm('是否删除当前行数据！')");
        }
    }
}