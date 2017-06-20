<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayPhoto.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>电子相册</title>
        <link href="css.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            <!--

            body {
                margin-bottom: 0px;
                margin-left: 62px;
                margin-right: 62px;
                margin-top: 0px;
            }
-->
        </style>
    </head>
    <body style="margin: 0px">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="width: 600px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="height: 21px">
                                    <asp:Image ID="Image1" runat="server" Height="320px" Width="623px" /></td>
                            </tr>
                            <tr>
                                <td class="tupianzhuti" align="center" style="height: 38px">
                                    「<asp:Label ID="lblTitle" runat="server" CssClass="daohangweizi2"></asp:Label>」『
                                    <asp:Label ID="lblShow" runat="server" BorderColor="Transparent" CssClass="daohangwenzi"></asp:Label>』</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <cc1:SlideShowExtender ID="SlideShowExtender1" runat="server" TargetControlID="Image1"
                                                           AutoPlay="false" ImageDescriptionLabelID="lblShow" Loop="true" NextButtonID="btnNext"
                                                           PreviousButtonID="btnPrev" PlayButtonID="btnPlay" PlayInterval="5000" PlayButtonText="自动播放"
                                                           StopButtonText="停止自动播放" SlideShowServicePath="PhotoService.asmx" SlideShowServiceMethod="GetPhoto"
                                                           ImageTitleLabelID="lblTitle" Enabled="True">
                                    </cc1:SlideShowExtender>
                                    <asp:ImageButton ID="btnPrev" runat="server" ImageUrl="~/images/上一幅.jpg" />
                                    <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/images/下一幅.jpg" />
                                    <asp:ImageButton ID="btnPlay" runat="server" ImageUrl="~/images/自动播放.jpg" /></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <area shape="rect" coords="0,0,49,22" href="#" />
                <area shape="rect" coords="0,0,89,30" href="#" />
                <area shape="rect" coords="1,0,90,31" href="#" />
                <area shape="rect" coords="1,1,89,32" href="#" />
            </div>
        </form>
    </body>
</html>