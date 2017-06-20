<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>无标题页</title>
        <link href="css/css.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <table width="866" height="600" border="0" cellpadding="0" cellspacing="0" 
                   style="color: #FFFFFF">
                <tr>
                    <td height="10" colspan="2" valign="top">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;欢迎您登录电子相册系统，祝您天天有个好心情！</span>
                    </td>
                </tr>
                <tr>
                    <td height="173" colspan="2" valign="top">
                        <img src="images/管理相册_05.jpg" width="866" height="173" />
                    </td>
                </tr>
                <tr>
                    <td width="632" valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/从基础到项目实战电子相册浏览_03-06.jpg" width="633" height="35" />
                                </td>
                            </tr>
                            <tr>
                                <td height="4">
                                    <img src="images/浏览_08.jpg" width="633" height="4" />
                                </td>
                            </tr>
                            <tr>
                                <td height="200" background="images/浏览_10.jpg">
                                    <iframe id="mainFrame" name="mainFrame" height="400" width="99%" runat="server"></iframe>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/浏览_11.jpg" width="633" height="9" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="234" valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/浏览_07.jpg" width="233" height="35" />
                                </td>
                            </tr>
                            <tr>
                                <td height="410" background="images/浏览_09.jpg" valign="top">
                                    <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                  Width="155px">
                                        <ParentNodeStyle ImageUrl="~/images0/tubiao.gif" ForeColor="Black" />
                                        <HoverNodeStyle ForeColor="Black" />
                                        <SelectedNodeStyle ForeColor="Black" />
                                        <Nodes>
                                            <asp:TreeNode Text="大一" Value="大一"></asp:TreeNode>
                                            <asp:TreeNode Text="大二" Value="大二"></asp:TreeNode>
                                            <asp:TreeNode Text="大三" Value="大三"></asp:TreeNode>
                                            <asp:TreeNode Text="大四" Value="大四"></asp:TreeNode>
                                            <asp:TreeNode Text="毕业照" Value="毕业照"></asp:TreeNode>
                                            <asp:TreeNode Text="校园美景" Value="校园美景"></asp:TreeNode>
                                            <asp:TreeNode NavigateUrl="~/Logon.aspx" Text="返回主页" Value="退出登录">
                                            </asp:TreeNode>
                                        </Nodes>
                                        <NodeStyle ImageUrl="~/images0/tubiao.gif" ForeColor="Black" />
                                        <RootNodeStyle ImageUrl="~/images0/tubiao.gif" ForeColor="Black" />
                                    </asp:TreeView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/浏览_12.jpg" width="233" height="9" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900" class="auto-style4">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label2" runat="server" Text=""></asp:Label>&nbsp;欢迎使用电子相册系统，祝您天天有个好心情！</span>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>