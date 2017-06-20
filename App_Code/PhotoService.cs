using System.Data;
using System.Data.OleDb;
using System.Web.Script.Services;
using System.Web.Services;
using AjaxControlToolkit;

//引入新的命名空间

///<summary>
///  PhotoService 的摘要说明
///</summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
[ScriptService]
public class PhotoService : WebService
{
    [WebMethod]
    public Slide[] GetPhoto()
    {
        string sType = ""; //相册类型
        string sUser = ""; //用户
        //创建数据库连接
        OleDbConnection con =
            new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("photo.mdb"));
        //查询获取数据库中数据
        OleDbDataAdapter dap = new OleDbDataAdapter("Select * from tb_Show Where id=0", con);
        DataSet dss = new DataSet();
        dap.Fill(dss);
        if (dss.Tables[0].Rows.Count > 0)
        {
            sType = dss.Tables[0].Rows[0][2].ToString();
            sUser = dss.Tables[0].Rows[0][1].ToString();
        }

        //创建数据库连接
        OleDbConnection conn =
            new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("photo.mdb"));
        //查询获取数据库中数据
        OleDbDataAdapter da =
            new OleDbDataAdapter(
                "select * from tb_photo Where photoType='" + sType + "' and photoUser='" + sUser + "' order by id desc",
                conn);
        DataSet ds = new DataSet();
        //获取数据库结果，填充到DataSet中
        da.Fill(ds);
        //创建Slide数据对象对象，用语存储将要播放的相片。
        Slide[] ajaxPhoto = new Slide[ds.Tables[0].Rows.Count];
        int j = 0;
        foreach (DataRowView v in ds.Tables[0].DefaultView)
        {
            //读取数据库中数据，并存储到Slide数组中。
            ajaxPhoto.SetValue(new Slide(v[3].ToString(), v[1].ToString(), v[2].ToString()), j);
            j = j + 1;
        }
        return ajaxPhoto;
    }
}