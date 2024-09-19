<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran.aspx.cs" Inherits="SIMC.Pendaftaran" %>

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
            <div class="col-lg-5 col-12">
                <div id="auth-right">

                    <img style="height: 868.13px;" src="asset/img/image.jpg" />

                </div>
            </div>

            <div class="col-lg-7 d-none d-lg-block">

                <div class="card" style="border-radius: 0;">
                    <div id="auth-left">
                        <div class="card-body">
                            <div class="auth-logo">
                                <a href="Register.aspx">
                                    <img src="assets/images/logo/ATL.png" alt="Logo">
                            </div>
                            <h1 class="auth-title">Daftar</h1>

                            <section id="multiple-column-form">
                                <form runat="server">
                                    <div class=" row">
                                       
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:TextBox ID="nama" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nama" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="NamaMhs" ControlToValidate="nama" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                                    ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                                <div class="form-control-icon">
                                                    <i class="bi bi-person"></i>
                                                </div>
                                            </div>
                                       
                                        <div class="col-md-6 col-12">

                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="email" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="email" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Email Pattern Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="True" />
                                                <div class="form-control-icon">
                                                    <i class="bi bi-envelope"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">

                                            <div class="form-group position-relative has-icon-right mb-4">
                                                <asp:TextBox TextMode="Password" ID="pw" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="pw" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <div class="form-control-icon">
                                                    <i id="togglePassword" class="bi bi-eye"></i>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:TextBox ID="Alamat" runat="server" CssClass="form-control" placeholder="Alamat"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="alamat" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="alamat" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                                    ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                                <div class="form-control-icon">
                                                    <i class="bi bi-person"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">

                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:DropDownList ID="ddlstatus" CssClass="form-select" runat="server">
                                                    <asp:ListItem Text="---Select Status---" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Dosen" Value="Dosen"></asp:ListItem>
                                                    <asp:ListItem Text="Mahasiswa" Value="Mahasiswa"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="ddlstatus" InitialValue="0" runat="server" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:DropDownList ID="ddlpdkakhir" CssClass="form-select" runat="server">
                                                    <asp:ListItem Text="---Select Pendidikan Terakhir---" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="D3" Value="D3"></asp:ListItem>
                                                    <asp:ListItem Text="D4" Value="D4"></asp:ListItem>
                                                    <asp:ListItem Text="S1" Value="S1"></asp:ListItem>
                                                    <asp:ListItem Text="S2" Value="S2"></asp:ListItem>
                                                    <asp:ListItem Text="S3" Value="S3"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="ddlpdkakhir" InitialValue="0" runat="server" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:TextBox ID="Instansi" runat="server" CssClass="form-control" placeholder="Instansi"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="instansi" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="instansi" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                                    ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                                <div class="form-control-icon">
                                                    <i class="bi bi-person"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <asp:TextBox ID="TxtTambahHP" runat="server" CssClass="form-control" placeholder="No Handphone"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TxtTambahHP" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtTambahHP" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                                    ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group position-relative has-icon-left mb-4">
                                                <label>JenisKelamin</label>
                                                <asp:RadioButtonList ID="rbJK" runat="server" RepeatDirection="Vertical" Width="100%">
                                                    <asp:ListItem Text="Laki-Laki" Value="Laki-Laki" />
                                                    <asp:ListItem Text="Perempuan" Value="Perempuan" />
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="rbJK" runat="server"
                                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValForm" EnableClientScript="False">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <asp:Button ID="BtnSubmitAdd" runat="server" Text="  Buat Akun  " class="btn btn-primary btn-block btn-lg shadow-lg" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                                        </div>
                                    </div>
                                </form>
                            </section>
                            <div class="text-center text-lg fs-4">
                                <p class='text-gray-600'>
                                    Sudah punya akun sebelumnya? <a href="Login.aspx" class="font-bold">Log
                        in</a>.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var togglePassword = document.querySelector('#togglePassword');
        var password = document.querySelector('#pw');
        togglePassword.addEventListener('click', function (e) {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('bi-eye-slash');
        });
    </script>
</body>

</html>
