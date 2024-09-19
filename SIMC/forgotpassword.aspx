<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="SIMC.forgotpassword" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMC</title>
    <link href="assets/css/main/Style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/main/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
    <link rel="shortcut icon" href="assets/images/logo/AT.png" type="image/png">
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">
                    <img style="height: 868.13px;" src="asset/img/image.jpg" />
                </div>
            </div>
            <div class="col-lg-5 col-12">
                <div class="card" style="border-radius: 0;">
                    <div id="auth-left">
                        <div class="card-body">
                            <div class="auth-logo">
                                <a href="forgotpassword.aspx">
                                    <img src="assets/images/logo/ATL.png" alt="Logo">
                                </a>
                            </div>
                            <h1 class="auth-title">Forgot Password</h1>
                            <p class="auth-subtitle mb-5">Input your email and we will send you reset password link.</p>

                            <form runat="server">

                                <div class="form-group position-relative has-icon-left mb-4">
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="email" ErrorMessage="Enter Valid Email address"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <div class="form-control-icon">
                                        <i class="bi bi-envelope"></i>
                                    </div>
                                    <asp:Label ID="lbresult" runat="server"></asp:Label>
                                </div>
                                <div class="col-12">
                                    <asp:Button ID="BtnSubmitAdd" runat="server" Text="  Kirim  " class="btn btn-primary btn-block btn-lg shadow-lg " OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                                </div>
                            </form>
                            <div class="text-center  text-lg fs-4">
                                <p class='text-gray-600'>
                                    Remember your account? <a href="Login.aspx" class="font-bold">Login</a>

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
