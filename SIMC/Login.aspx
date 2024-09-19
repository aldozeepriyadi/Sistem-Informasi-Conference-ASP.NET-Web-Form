<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SIMC.Login" %>


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
                                <a href="Login.aspx">
                                    <img src="assets/images/logo/ATL.png" alt="Logo">
                                </a>
                            </div>
                            <h3 class="auth-title">Log in.</h3>
                            <p class="auth-subtitle mb-3">Masuk dengan data Anda yang Anda masukkan saat pendaftaran.</p>

                            <form runat="server">
                                <asp:Label ID="errorMsg2" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                <div class="form-group position-relative has-icon-left mb-4">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-xl" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtEmail" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False">
                                    </asp:RequiredFieldValidator>

                                    <div class="form-control-icon">
                                        <i class="bi bi-person"></i>
                                    </div>
                                    <asp:Label ID="errorMsg1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="form-group position-relative has-icon-left mb-4">
                                    <asp:TextBox TextMode="Password" ID="txtPassword" runat="server" CssClass="form-control form-control-xl" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="False">
                                    </asp:RequiredFieldValidator>

                                    <div class="form-control-icon">
                                        <i class="bi bi-shield-lock"></i>
                                    </div>
                                    <asp:Label ID="errorMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </div>

                                <asp:Button ID="btnLogin" runat="server" class="btn btn-primary w-100" Text="Login" OnClick="btnLogin_Click" ValidationGroup="valAdd" />
                            </form>
                            <div class="text-center mt-5 text-lg fs-4">
                                <p class="text-gray-600">
                                    Belum punya akun? <a href="Register.aspx" class="font-bold">Daftar</a>.
                                </p>
                                <p><a class="font-bold" href="forgotpassword.aspx">Lupa kata sandi?</a>.</p>
                                <p><a class="font-bold" href="landingpage.aspx">Kembali ke halaman utama</a>.</p>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>

</html>

