<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>无标题页</title>
        <link href="css/css.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <table width="866" height="600" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="280" valign="top" background="images/相册_03.jpg">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/首页_04.jpg">
                            <tr>
                                <td height="110" colspan="3">
                                    <label>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td width="23%" rowspan="4">
                                    <label>
                                    </label>
                                </td>
                                <td width="19%" height="20">
                                    <label>
                                        登录名：</label>
                                </td>
                                <td width="58%" align="left">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="98px"></asp:TextBox>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20">
                                    <label>
                                        密&nbsp; 码：</label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="98px"></asp:TextBox>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20" colspan="2">
                                    &nbsp;<label><asp:RadioButton ID="rdoBtnIndex" runat="server" Checked="True" GroupName="direction"
                                                                  Text="浏览相片" /></label>&nbsp;<asp:RadioButton ID="rdoBtnManage" runat="server" GroupName="direction"
                                                                                                               Text="管理图片" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <label>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
                                    &nbsp;</label>
                                    <label>
                                        <asp:Button ID="btnLogon" runat="server" Text="登 录" Height="23px" Width="50px" OnClick="btnLogon_Click" /></label>
                                </td>
                            </tr>
                            <tr>
                                <td height="10" colspan="3">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="10" colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td height="10" colspan="3">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="586" height="241" valign="top" background="images/相册_04.jpg">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="10">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" style="color: #FFFFFF">
                                    <span class="STYLE1">欢迎您登录电子相册系统，祝您天天有个好心情！</span>
                                </td>
                            </tr>
                            <tr>
                                <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900" class="auto-style4">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label2" runat="server" Text=""></asp:Label>&nbsp;欢迎使用电子相册系统，祝您天天有个好心情！</span>
                    </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="31" colspan="2" valign="top">
                        <img src="images/相册_07.jpg" width="866" height="31" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="360" align="center" background="images/gbb_08.jpg">
                                    <table width="95%" height="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="#74a248">
                                        <tr>
                                            <td width="33%" align="center" bgcolor="#FFFFFF">
                                                <asp:DataList ID="dlPictrue" runat="server" RepeatColumns="3" OnDeleteCommand="dlPictrue_DeleteCommand"
                                                              RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <table style="width: 116px">
                                                            <tr>
                                                                <td class="tdborder">
                                                                    <asp:Image ID="Image1" runat="server" Width="248px" ImageUrl='<%#                                        DataBinder.Eval(Container.DataItem, "photoPath") %>'
                                                                               Height="266px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" class="a">
                                                                    <span class="tupianmingcheng2">[</span><%#                                        DataBinder.Eval(Container.DataItem, "photoUser") %><span
                                                                                                                                                                                                             class="tupianmingcheng2">]</span>
                                                                    <br />
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="进入并浏览" CommandName="Delete"
                                                                                     ImageUrl="images/djll.jpg" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="20" align="center" background="images/gbb_08.jpg">
                          
                                </td>
                            </tr>
                            <tr>
                                <td height="23" align="right" background="images/相册_09.jpg">
                                    当前页码为［<asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>］页 总页码［<asp:Label
                                                                                                                        ID="lblSumPage" runat="server" Text="0"></asp:Label>］页
                                    <asp:LinkButton ID="lnkBtnFirst" runat="server" Font-Underline="False" OnClick="lnkBtnFirst_Click"> 第一页 </asp:LinkButton>
                                    <asp:LinkButton ID="lnkBtnPrevious" runat="server" Font-Underline="False" OnClick="lnkBtnPrevious_Click"> 上一页 </asp:LinkButton>
                                    <asp:LinkButton ID="lnkBtnNext" runat="server" Font-Underline="False" OnClick="lnkBtnNext_Click"> 下一页 </asp:LinkButton>
                                    <asp:LinkButton ID="lnkBtnLast" runat="server" Font-Underline="False" OnClick="lnkBtnLast_Click"> 末一页 </asp:LinkButton>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="12" align="right" background="images/gbb_08.jpg">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900" class="auto-style4">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;欢迎使用电子相册系统，祝您天天有个好心情！</span>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>