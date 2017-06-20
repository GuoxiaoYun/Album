<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BackGround_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head id="Head1" runat="server">
        <title>无标题页</title>
        <link href="css/css.css" rel="stylesheet" type="text/css" />
        <style type="text/css">

            .auto-style1 {
                height: 60px;
                width: 1493px;
            }
            .auto-style2 {
                width: 1493px;
            }
            .auto-style3 {
                height: 21px;
                width: 1493px;
            }
            .auto-style4 {
                width: 857px;
            }
            </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <table width="866" border="0" cellpadding="0" cellspacing="0" 
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
            <div>
                <table style="height: 256px; width: 867px;">
                    <tr>
                        <td align="center" class="auto-style1">
                            <h1>个人信息</h1></td>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <h3>用户名称：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtName" runat="server" Width="200px" Height="21px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                        ErrorMessage="*必填项"></asp:RequiredFieldValidator></td>
                            </h3>
                    </tr>
                    <tr>
                        <td align="center" class="auto-style2">
                             <br/><h3>&nbsp; 用户密码：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                                        ErrorMessage="* 必填项"></asp:RequiredFieldValidator></td>
                         </h3>
                    </tr>
                    <tr>
                        <td >
                            <br/> 
                            <h3> &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                 确认密码：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtRePwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         </td> 
                           
                    </tr>
                    <tr>
                        <td align="center">
                         <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPwd"
                                                  ControlToValidate="txtRePwd" ErrorMessage="*两次输入密码不一致"></asp:CompareValidator>
                         </td>
                    </tr>
                    <tr>  
                         <br/><td align="center" class="auto-style3">
                             <br />
                            <asp:Button ID="btnLogin" runat="server" Text="注 册" OnClick="btnLogin_Click" Height="34px" Width="112px" /></td>
                        </tr>
                </table>
                <br/>
                <br/>
                <br/>
                <div>
                    <table>
                        <tr>
                    <td height="30" colspan="2" align="right" valign="middle" bgcolor="#275900" class="auto-style4">
                        <span class="STYLE1" style="color: #FFFFFF">今天是 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;欢迎使用电子相册系统，祝您天天有个好心情！</span>
                    </td>
                            </tr>
                        </table>
                </div>
            </div>
        </form>
    </body>
</html>