<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetlink.aspx.cs" Inherits="SIMC.resetlink" %>

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
                                <a href="resetlink.aspx">
                                    <img src="assets/images/logo/ATL.png" alt="Logo">
                                </a>
                            </div>
                            <h1 class="auth-title">Reset Password</h1>
                            <p class="auth-subtitle mb-5">Masukkan kata sandi reset Anda.</p>

                            <form runat="server">
                                <asp:Label ID="lblEmail" Visible="true" runat="server"></asp:Label>
                                <div class="form-group position-relative has-icon-left mb-4">
                                    <asp:TextBox TextMode="Password" ID="pw" runat="server" CssClass="form-control" placeholder="Password">Password Baru</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="pw" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <div class="form-control-icon">
                                        <i class="bi bi-shield-lock"></i>
                                    </div>
                                    <asp:Label ID="lbresult" runat="server"></asp:Label>
                                </div>

                                <div class="col-12">
                                    <asp:Button ID="BtnSubmitAdd" runat="server" Text="  Kirim  " class="btn btn-primary btn-block btn-lg shadow-lg mt-5" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                                </div>
                            </form>
                            <div class="text-center mt-5 text-lg fs-4">
                                <p class='text-gray-600'>
                                    Ingat akun Anda? <a href="Login.aspx" class="font-bold">Masuk</a>.
               
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
