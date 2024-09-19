<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="landingpage.aspx.cs" Inherits="SIMC.landingpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>SNEEMO 2021</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="aset/images/logo/AT.png" rel="icon">
    <link href="asset/img/apple-touch-icon.png" rel="apple-touch-icon">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

    <link href="asset/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="asset/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="asset/lib/animate/animate.min.css" rel="stylesheet">
    <link href="asset/lib/icofont/icofont.min.css" rel="stylesheet">
    <link href="asset/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="asset/lib/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="asset/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="asset/lib/magnific-popup/magnific-popup.css" rel="stylesheet">

    <link href="asset/css/style.css" rel="stylesheet">


</head>
<body id="body">
    <form id="form1" runat="server">
        <header id="header">
            <div class="container-fluid d-flex justify-content-between">

                <div id="logo">

                    <h1>
                        <a href="#body" class="scrollto">

                            <img src="asset/img/IMG_Logo.png" alt="ASTRATech LOGO" loading="lazy" style="width: 60%; height: auto; padding-left: 20px; margin-top: -20px;">
                        </a>
                    </h1>
                </div>

                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <li><a href="#about">Beranda</a></li>
                        <li><a href="#prosiding">Buku Prosiding</a></li>
                        <li><a href="#arsip">Arsip</a></li>
                        <li><a href="#jadwal">Jadwal</a></li>
                        <li><a href="#payment">Registrasi</a></li>
                        <li><a href="Login.aspx">Login</a></li>

                    </ul>
                </nav>
            </div>
        </header>


        <section id="call-to-action" class="wow fadeInUp">
            <div class="container">
                <div class="text-center">
                    <h2 style="text-align: center; color: #FFF; font-weight: bold;">Astra Tech Conference</h2>
                </div>
            </div>
        </section>

        <main id="main">
           <%-- <div id="dialog">
                <iframe id="ifModal" style="border: 0px; overflow: scroll; position: fixed;" width="100%" height="100%" runat="server"></iframe>
            </div>--%>

            <section id="about" class="wow fadeInUp">
                <div class="container">
                    <div class="section-header">
                        <h2>Tentang Kami</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 about-img mb-5">
                            <picture>
                                <source media="(max-width: 600px)" srcset="asset/img/Poster-SNEEMO 2022.jpg">
                                <img src="asset/img/Poster-SNEEMO 2022.jpg" alt="SNEEMO 2021 Flyer"></img>
                            </picture>
                        </div>

                        <div class="col-lg-6 content">
                            <h2>Call For Papers SNEEMO 2022</h2>
                            <p style="text-align: justify">
                                SNEEMO adalah kependekan dari <b><i>Seminar Nasional Efisiensi Energi untuk Peningkatan Daya Saing Industri Manufaktur dan Otomotif Nasional</i></b>. SNEEMO adalah Seminar (Konferensi) tingkat nasional yang sejak 2019 diadakan setiap 1 tahun sekali oleh Politeknik Astra (ASTRA-Tech). SNEEMO sendiri telah dilaksanakan secara berlanjut oleh Politeknik Astra semenjak tahun 2010.
                            <br>
                                <br>
                                Pada SNEEMO 2022 terdiri dari dua sesi yaitu sesi plenary (konferensi) dan juga sesi parallel (pemaparan hasil penelitian berupa paper) akan dilaksanakan dengan skema hybrid.
                            </p>

                            <p style="text-align: justify">
                                Dalam konferensi ini para Peneliti dipersilakan untuk menyerahkan karya
                            berupa
                            <b>abstrak</b>
                                <span class="italic-bold">paper</span>.
                            <span class="italic-bold">Paper</span> yang diterima akan diterbitkan pada Prosiding SNEEMO 2022 dan beberapa <span class="italic-bold">paper</span> terpilih akan
                            diterbitkan pada Jurnal Nasional TECHNOLOGIC yaitu Jurnal Nasional dengan
                            <span class="text-bold-black whitespace-no">p–ISSN 2085-8507</span> dan
                            <span class="text-bold-black">e-ISSN 2722-3280</span> yang diterbitkan oleh LPPM Politeknik
                            Astra.
                            </p>

                            <h3>Tema SNEEMO 2022 yaitu "MEMPERKUAT RISET TERAPAN YANG KOLABORATIF DALAM MENJAWAB TANTANGAN PEMBANGUNAN INDUSTRI YANG BERKELANJUTAN", dengan topik-topik paper sebagai berikut:
                            </h3>

                            <ul>
                                <li><i class="icofont-check-circled"></i>Digitalisasi</li>
                                <li><i class="icofont-check-circled"></i>Internet of Things dan Aplikasinya</li>
                                <li><i class="icofont-check-circled"></i>Artificial Intelligence dan Aplikasinya</li>
                                <li><i class="icofont-check-circled"></i>Efisiensi Energi dan Renewable Energy</li>
                                <li><i class="icofont-check-circled"></i>Desain dan Manufaktur</li>
                                <li><i class="icofont-check-circled"></i>Teknologi Konstruksi berbasis Digital</li>
                            </ul>


                        </div>
                    </div>
                </div>
            </section>

            <section id="prosiding" class="wow fadeInUp">
                <div class="container">

                    <div class="section-header">
                        <center>
                            <h2>Buku Prosiding  </h2>
                        </center>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-6">
                            <div class="member">
                                <div class="pic">
                                    <asp:Image ID="Image1" runat="server" />
                                </div>

                                <div class="details">
                                    <asp:Label ID="lbltitle" runat="server" Font-Bold="true" />
                                    <asp:Label ID="lbltopik" runat="server" Font-Bold="true" />
                           

                                    <br />
                                </div>
                            </div>
                            <center>
                                <asp:LinkButton ID="ENameLinkBtn" runat="server" Text="halo"  CommandArgument='<%# Eval("ProsidingFile") %>'
    CssClass="btn btn-info" Style="color: white;"
    OnCommand="ENameLinkBtn_Click" >Baca Selengkapnya</asp:LinkButton>
                            </center>
                        </div>

                    </div>

                </div>

            </section>


            <section id="arsip">
                <div class="container">
                    <div class="section-header">
                        <h2>Arsip</h2>
                    </div>


                    <div class="col-xl-4 col-md-4 col-sm-12">
                        <div class="wow fadeInLeft ">

                            <asp:Literal ID="ltEmbed" runat="server" />

                            <asp:DataList ID="dl1" runat="server"
                                RepeatDirection="Horizontal"
                                RepeatColumns="3" OnItemCommand="datalist1_ItemCommand">
                                <ItemTemplate>
                                    <div class="card">
                                        <div class="card-header">
                                        </div>
                                        <div class="card-body">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProsidingImg", "~/ProsidingImg/{0}") %>' Style="width: 330px; height: 330px;" />
                                        </div>
                                        <div class="card-footer">
                                            <asp:LinkButton ID="detailsButton" runat="server" CssClass="btn btn-info" Style="color: white;"
                                                CommandName="MoreDetailsPlease"
                                                CommandArgument='<%# Eval("ProsidingFile") %>'>Baca Selengkapnya</asp:LinkButton>
                                 
                                        </div>
                                </ItemTemplate>

                            </asp:DataList>

                        </div>
                    </div>
                </div>


            </section>

            <section id="jadwal">
                <div class="container">
                    <div class="section-header">
                        <h2>Jadwal</h2>
                        <p></p>
                    </div>
                    <div class="col-lg-6 content">
                        <h3>Tanggal Penting</h3>
                    </div>
                    <div class="row mt-md-5">
                        <div class="col-md-10 mx-auto">
                            <!-- Timeline -->
                            <div class="timeline timeline-one">
                                <asp:Repeater ID="RepterDetails" runat="server">
                                    <ItemTemplate>
                                        <div class="timeline-item">
                                            <asp:Label class="my-3" ID="lbltglAwal" Text='<%#Eval("tanggalAwal", "{0: dd MMMM yyyy}") %>' runat="server" Font-Bold="true" />
                                            -
                                            <asp:Label ID="lblTglAkhir" Text='<%#Eval("tanggalAkhir", "{0: dd MMMM yyyy}") %>' runat="server" Font-Bold="true" />
                                            <br />
                                            <asp:Label Style="color: rgba(31, 58, 147, 1); font-weight: bold;" ID="lblkategori" Text='<%#Eval("kategori") %>' runat="server" Font-Bold="true" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
            </section>
            <section id="payment" class="mb-5">
                <div class="container">
                    <div class="section-header">
                        <h2>Registrasi</h2>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="box wow fadeInLeft">
                                <h4 class="title">Biaya Registrasi</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead class="thead-inverse">
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="background: #FFF">
                                                    <h7 style="font-weight: bold;">Pemakalah</h7>
                                                </td>
                                                <td style="background: #FFF"></td>
                                                <td style="background: #FFF"></td>
                                            </tr>

                                            <tr>
                                                <td class="option h6 "><asp:Label ID="pemakalah1" runat="server" Font-Bold="true" /></td>
                                                <td></td>
                                                <td style="text-align: right;">Rp. <asp:Label ID="uang1" runat="server" Font-Bold="true" /></td>
                                            </tr>
                                            <tr class="border-bottom">
                                                <td class="option h6 "><asp:Label ID="pemakalah2" runat="server" Font-Bold="true" /></td>
                                                <td></td>
                                                <td style="text-align: right;">Rp. <asp:Label ID="uang2" runat="server" Font-Bold="true" /></td>
                                            </tr>


                                            <tr>
                                                <td>
                                                    <h7 style="font-weight: bold;">Peserta</h7>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="option h6">Dosen/Umum</td>
                                                <td></td>
                                                <td style="text-align: right;">Gratis</td>
                                            </tr>
                                            <tr class="border-bottom">
                                                <td class="option h6">Mahasiswa</td>
                                                <td></td>
                                                <td style="text-align: right;">Gratis</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="box wow fadeInRight">
                                <h4 class="title">Pembayaran</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td class="option h6 ">Bank</td>
                                                <td>Permata Cabang AMDI Sunter</td>
                                            </tr>
                                            <tr>
                                                <td class="option h6 ">No. Rek</td>
                                                <td>0468.480.018</td>
                                            </tr>
                                            <tr>
                                                <td class="option h6">Atas Nama</td>
                                                <td>Politeknik Manufaktur Astra</td>
                                            </tr>
                                            <tr>
                                                <td class="option h6">Konfirmasi Pembayaran</td>
                                                <td><a style="color: blue" href="mailto:sneemo.polman@gmail.com">sneemo.polman@gmail.com</a></td>
                                            </tr>
                                            <tr>
                                                <td class="option h6"></td>
                                                <td>0857-7567-8737 (Asri Aisyah)</td>
                                            </tr>
                                            <tr>
                                                <td style="background: #FFF;">&nbsp;</td>
                                                <td style="background: #FFF;">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>


        </main>

        <footer id="footer">
            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong>Reveal</strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>
        </footer>
        <!-- #footer -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->

        <script src="asset/lib/jquery/jquery.min.js"></script>
        <script src="asset/lib/jquery/jquery-migrate.min.js"></script>
        <script src="asset/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="asset/lib/easing/easing.min.js"></script>
        <script src="asset/lib/superfish/hoverIntent.js"></script>
        <script src="asset/lib/superfish/superfish.min.js"></script>
        <script src="asset/lib/wow/wow.min.js"></script>
        <script src="asset/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="asset/lib/magnific-popup/magnific-popup.min.js"></script>
        <script src="asset/lib/sticky/sticky.js"></script>

        <script src="asset/js/main.js"></script>

    </form>
</body>
</html>
