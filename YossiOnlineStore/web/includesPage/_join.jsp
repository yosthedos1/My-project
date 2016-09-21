<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type ="text/javascript" src="js/headerJoinScript.js"></script>
<div id = "topWrapper">
    <div class="container_16">
        <div class="grid_16">
            <div id="logo" class="grid_6"> <a href="index.jsp"><img src="images/logo/rsz_bs-shop-online-web-banner_970w-x-315h_opt2.jpg"  style="width:250px;height:35px" style="padding-left:1000px"/></a>
            </div>
            <div class="grid_6" id="top">
                <ul>
                    <a href="#" id="join"><li   class ="Btn showForm">לחץ כאן כדי להירשם או להתחבר</li></a>
<!--                    <a href="#" id="join"><li   class ="Btn showForm"><img src="images/logo/login or register button_3.jpg" style="width:200px;height:30px;margin-top:-5px;"</li></a>-->
<!--                    <img src="../../../../../../../Pictures/project/login/login or register button.jpg" alt=""/>-->
                </ul>
            </div>
        </div>
    </div>
</div>

<div id = "topLogin">
    <div class="container_16">
        <div id="LoginBox" class="grid_16">

            <div class="grid_6" id = "loginForm">
                <form autocomplete="false" method="post" action="loginServlet"  name="login">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; align:right; padding:20px 0px; color:#FFF;">התחבר</h1></strong>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="email" name="email" placeholder="john_smit@gmail.com" required/><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="התחבר!" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_2" id = "RegisterForm">
                <form autocomplete="false" method="POST" action="register" name="registerServlet">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">הירשם עכשיו</h1></strong>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="email" name="emailReg" placeholder="john_smit@gmail.com" required/><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="passReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password Again</label>
                            </td>
                            <td>
                                <input type="password" name="passAgainReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr>
                      

                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" value="הירשם" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>
</div>
