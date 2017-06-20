<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BackGround_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>无标题页</title>
        <link href="css.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            <!--

            body {
                margin-bottom: 0px;
                margin-left: 62px;
                margin-right: 62px;
                margin-top: 0px;
            }
            .auto-style3 {
                width: 116px;
            }
            .auto-style4 {
                color: #000000;
                font-family: "宋体";
                font-size: 12px;
                width: 81px;
            }
            .auto-style5 {
                color: #000000;
                font-family: "宋体";
                font-size: 12px;
                width: 116px;
            }
            .auto-style6 {
                width: 89px;
            }
-->
        </style>
    </head>
    <body>
        <form id="form1"  runat="server">
            <table  align="center" width="866" border="0" cellpadding="0" cellspacing="0" 
                   style="color: #FFFFFF; height: 220px;">
                <tr>
                    <td height="10" colspan="2" valign="top">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label2" runat="server" Text=""></asp:Label>&nbsp;欢迎您登录电子相册系统，祝您天天有个好心情！</span>
                    </td>
                </tr>
                <tr>
                    <td height="173" colspan="2" valign="top">
                        <img src="images/管理相册_05.jpg" width="866" height="173" />
                    </td>
                </tr>
          </table>

            <table align="center" width="900" height="12" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="23" height="12" background="images/tiao1.gif"></td>
                    <td width="853" height="12" background="images/tiao2.gif"></td>
                    <td width="22" height="12" background="images/tiao3.gif"></td>
                </tr>
            </table>
            <table  align="center" width="900" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="20" background="images/zuoce1.gif">&nbsp;</td>
                    <td width="35" height="35" background="images/tou1.gif">&nbsp;</td>
                    <td width="8" background="images/tou2.gif">&nbsp;</td>
                    <td width="816" background="images/tou2.gif" class="gundongzi">欢迎您登录电子相册系统，祝您天天有个好心情！</td>
                    <td width="21" background="images/youce1.gif">&nbsp;</td>
                </tr>
                <tr>
                    <td width="20" background="images/zuoce1.gif">&nbsp;</td>
                    <td colspan="3"><table width="859" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="21">&nbsp;</td>
                                            <td width="820">欢迎<asp:Label ID="lbUserName" runat="server"></asp:Label>
                                                登录本系统，<asp:HyperLink ID="HyperLink1" runat="server" 
                                                                     NavigateUrl="~/LoginOut.aspx">退出登录</asp:HyperLink>
                                                &nbsp;&nbsp;
                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Logon.aspx">返回主页</asp:HyperLink>
                                            </td>
                                            <td width="18">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td width="820" height="255" valign="top" class="border"><table align="center" width="820" height="253" border="0" cellpadding="0" cellspacing="0" class="biaodanzi">
                                                                                                         <tr>
                                                                                                             <td height="11" class="auto-style6">&nbsp;</td>
                                                                                                             <td height="11" class="auto-style3">&nbsp;</td>
                                                                                                             <td height="11" colspan="3">&nbsp;</td>
                                                                                                             <td width="70" height="11">&nbsp;</td>
                                                                                                         </tr>
                                                                                                         <tr>
                                                                                                             <td height="26" class="auto-style6">&nbsp;</td>
                                                                                                             <td class="auto-style5">相片类别：</td>
                                                                                                             <td colspan="3"><label>
                                                                                                                                 <asp:DropDownList ID="ddlPicType" runat="server" Width="97px">
                                                                                                                                     <asp:ListItem>大一</asp:ListItem>
                                                                                                                                     <asp:ListItem>大二</asp:ListItem>
                                                                                                                                     <asp:ListItem>大三</asp:ListItem>
                                                                                                                                     <asp:ListItem>大四</asp:ListItem>
                                                                                                                                     <asp:ListItem>毕业照</asp:ListItem>
                                                                                                                                     <asp:ListItem>校园美景</asp:ListItem>
                                                                                                                                 </asp:DropDownList></label></td>
                                                                                                             <td>&nbsp;</td>
                                                                                                         </tr>
                                                                                                         <tr>
                                                                                                             <td height="28" class="auto-style6">&nbsp;</td>
                                                                                                             <td class="auto-style5">上传图片：</td>
                                                                                                             <td colspan="2"><label>
                                                                                                                                 <asp:FileUpload ID="FileUpload1" runat="server" Width="489px" /></label></td>
                                                                                                             <td width="232">
                                                                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1"
                                                                                                                                             ErrorMessage="**  必填项"></asp:RequiredFieldValidator></td>
                                                                                                             <td>&nbsp;</td>
                                                                                                         </tr>
                                                                                                         <tr>
                                                                                                             <td height="32" class="auto-style6">&nbsp;</td>
                                                                                                             <td class="auto-style5">图片标题：</td>
                                                                                                             <td colspan="3"><label>
                                                                                                                                 &nbsp;<asp:TextBox ID="txtTitle" runat="server" Width="320px"></asp:TextBox>
                                                                                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                                                                                                                                             ErrorMessage="**  必填项"></asp:RequiredFieldValidator></label></td>
                                                                                                             <td>&nbsp;</td>
                                                                                                         </tr>
                                                                                                         <tr>
                                                                                                             <td height="113" class="auto-style6">&nbsp;</td>
                                                                                                             <td class="auto-style5">图片描述：</td>
                                                                                                             <td colspan="3" valign="top"><label>
                                                                                                                                              &nbsp;<asp:TextBox ID="txtContent" runat="server" Height="106px" TextMode="MultiLine" Width="484px"></asp:TextBox>
                                                                                                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContent"
                                                                                                                                                                          ErrorMessage="**  必填项"></asp:RequiredFieldValidator></label></td>
                                                                                                             <td>&nbsp;</td>
                                                                                                         </tr>
                                                                                                         <tr>
                                                                                                             <td height="32" class="auto-style6">&nbsp;</td>
                                                                                                             <td height="32" class="auto-style3">&nbsp;</td>
                                                                                                             <td width="114" height="32">&nbsp;</td>
                                                                                                             <td width="290">
                                                                                                                 &nbsp;<asp:Button ID="btnSavePhoto" runat="server" OnClick="Button1_Click" Text="    " CssClass="btn" Height="27px" Width="77px" /></td>
                                                                                                             <td height="32">&nbsp;</td>
                                                                                                             <td height="32">&nbsp;</td>
                                                                                                         </tr>
                                                                                                     </table></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td class="border"><table width="820" border="0" cellspacing="0" cellpadding="0">
                                                                   <tr>
                                                                       <td width="35">&nbsp;</td>
                                                                       <td width="759">&nbsp;</td>
                                                                       <td width="26">&nbsp;</td>
                                                                   </tr>
                                                                   <tr>
                                                                       <td>&nbsp;</td>
                                                                       <td>
                                                                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="745px"
                                                                                         AllowPaging="True" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound" EnableModelValidation="True">
                                                                               <Columns>
                                                                                   <asp:BoundField DataField="photoType" HeaderText="照片类别" >
                                                                                       <ItemStyle CssClass="fenye1" />
                                                                                   </asp:BoundField>
                                                                                   <asp:BoundField DataField="photoTitle" HeaderText="照片标题" >
                                                                                       <ItemStyle CssClass="fenye1" />
                                                                                   </asp:BoundField>
                                                                                   <asp:BoundField DataField="PhotoContent" HeaderText="照片描述" >
                                                                                       <ItemStyle CssClass="fenye1" />
                                                                                   </asp:BoundField>
                                                                                   <asp:CommandField ShowDeleteButton="True" >
                                                                                       <ControlStyle CssClass="shanchu" />
                                                                                       <ItemStyle CssClass="shanchu" />
                                                                                   </asp:CommandField>
                                                                               </Columns>
                                                                               <HeaderStyle CssClass="biaogese" />
                                                                               <PagerSettings FirstPageText="第一页" LastPageText="最后一页" NextPageText="下一页" PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                                                                               <FooterStyle CssClass="shanchu" />
                                                                               <PagerStyle CssClass="shanchu" Font-Bold="True" Font-Size="12px" ForeColor="Green"
                                                                                           HorizontalAlign="Right" />
                                                                           </asp:GridView>
                                                                       </td>
                                                                       <td>&nbsp;</td>
                                                                   </tr>
          
                                                                   <tr>
                                                                       <td>&nbsp;</td>
                                                                       <td>&nbsp;</td>
                                                                       <td>&nbsp;</td>
                                                                   </tr>
                                                               </table></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table></td>
                    <td width="21" background="images/youce1.gif">&nbsp;</td>
                </tr>
            </table>
            <table align="center" width="900" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="3" background="images/tupian3.gif"></td>
                </tr>
            </table>
            <table align="center" width="900" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="5" bgcolor="#FFFFFF"></td>
                </tr>
            </table>
            <table align="center" width="900" border="0" cellspacing="0" cellpadding="0" style="height: 28px">
                <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;欢迎使用电子相册系统，祝您天天有个好心情！</span>
                    </td>
                    
                </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table align="center" width="900" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td background="images/tupian3.gif"></td>
                </tr>
            </table>


            <map name="Map" id="Map">
                <area shape="rect" coords="0,0,49,22" href="#" />
            </map>
            <map name="Map2" id="Map2">
                <area shape="rect" coords="0,0,59,22" href="#" />
            </map>
            <map name="Map3" id="Map3"><area shape="rect" coords="58,15,59,16" href="#" /><area shape="rect" coords="1,0,70,22" href="#" /></map>
        </form>
    </body>
</html>