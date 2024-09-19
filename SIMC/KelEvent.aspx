<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KelEvent.aspx.cs" Inherits="SIMC.KelEvent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Kelola Event</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="SuperAdmin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Kelola Event</li>
        </ol>
    </nav>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://stakpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">


    <!-- OPEN TAG VIEW Event-->
    <div class="container-fluid">
        <div class="row" id="ViewEvent" runat="server">
            <div class="card">
                <div class="card-header">
                    <div class="container-fluid">
                        <div id="BtnAction" runat="server">
                            <asp:LinkButton runat="server" CssClass="btn icon icon-left btn-primary" data-bs-toggle="modal" data-bs-target="#tambahdata"><span class="bi bi-plus-circle"> Tambah</span></asp:LinkButton>
                        </div>
                        <asp:TextBox ID="TextBox1" Style="display: none" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGEvent" CssClass="table table-responsive table-bordered table-hover datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdEvent" Visible="false" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdEvent" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="theme" HeaderText="Tema" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="theme" />
                                <asp:BoundField DataField="topic" HeaderText="Topik" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                <asp:BoundField DataField="tanggalAwal" HeaderText="Tanggal Awal" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAwal" DataFormatString="{0:dd MMMM yyyy}" />
                                <asp:BoundField DataField="tanggalAkhir" HeaderText="Tanggal Akhir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAkhir" DataFormatString="{0:dd MMMM yyyy}" />
                                <asp:BoundField DataField="biaya" HeaderText="Biaya" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="biaya" />
                                <asp:BoundField DataField="kategori" HeaderText="Kategori" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="kategori" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%--                                        <asp:LinkButton runat="server" ID="LinkManage" CommandName="Delete"  CssClass="btn btn-success mb-2" CommandArgument='<%#Eval("IdEvent") %>'>
                                                        <span class="bi bi-check" aria-hidden="true"  >
                                                        </span></asp:LinkButton>--%>

                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn icon icon-left btn-danger" OnClientClick=' <%# "senddataHapus(`" + Eval("IdEvent") + "`);"%> ' data-bs-toggle="modal" data-bs-target="#hapusdata"><span style="color:black;" class="bi bi-check" aria-hidden="true">
                                                        </span></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("nameEvent") + "`,`" + Eval("theme") + "`,`" + Eval("topic")  + "`,`" + Eval("tanggalAwal") + "`,`" + Eval("tanggalAkhir") + "`,`" + Eval("IdEvent") +"`,`" + Eval("biaya") +"`,`" + Eval("kategori") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#updatedata"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                        </asp:GridView>
                    </div>
                </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
                <script>
                    $(document).ready(function () {
                        $(".datatbemp").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
                    });
                </script>
            </div>
        </div>
    </div>
    <!-- CLOSED TAG VIEW Tanggal-->


    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="tambahdata" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Tambah Data Event</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <section id="multiple-column-form1">
                            <div class="form-group">

                                <div class="row" id="NewUserForm" role="form">
                                    <!-- Nama -->
                                    <div class="col-md-6 col-12">
                                        <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>

                                        <label class="control-label col-sm-2" for="<%= TxtTambahNama.UniqueID %>">Nama Event</label>
                                        <asp:TextBox ID="TxtTambahNama" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahNama" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                            runat="server"
                                            ControlToValidate="TxtTambahNama"
                                            ErrorMessage="Isi Nama Event"> *
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TxtTambahNama" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="valAdd"
                                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                    </div>

                                    <!-- Tema -->
                                    <div class="col-md-6 col-12">
                                        <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Tema</label>
                                        <asp:TextBox ID="TxtTambahTema" runat="server" placeholder="Tema" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="TxtTambahTema" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="NamaTema" ControlToValidate="TxtTambahTema" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[0-9]*^[a-zA-Z ]*$" EnableClientScript="True" />
                                    </div>

                                    <div class="col-md-6 col-12">
                                        <!-- Tanggal Pengumpulan Abstrak-->
                                        <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Tanggal Awal</label>
                                        <asp:TextBox ID="txtAddtanggalAwal" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtAddtanggalAwal" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="comparevalidator2" ForeColor="Red" runat="server" ControlToValidate="txtAddtanggalAwal" Operator="GreaterThanEqual" ErrorMessage="Tanggal awal harus lebih dari atau sama dengan hari ini" Type="Date"></asp:CompareValidator>
                                        <br />
                                    </div>

                                    <div class="col-md-6 col-12">
                                        <!-- Tanggal Final Abstrak-->
                                        <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Tanggal Akhir</label>
                                        <asp:TextBox ID="txtAddtanggalAkhir" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtAddtanggalAkhir" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="comparevalidator1" ForeColor="Red" runat="server" ControlToCompare="txtAddtanggalAwal" ControlToValidate="txtAddtanggalAkhir" ErrorMessage="Tanggal akhir harus lebih dari tanggal awal" Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                                        <br />
                                    </div>


                                    <div class="col-md-6 col-12">
                                        <!-- Biaya -->
                                        <asp:Label ID="Label18" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Biaya</label>
                                        <asp:TextBox ID="TxtAddBiaya" runat="server" placeholder="Biaya" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TxtAddBiaya" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtAddBiaya" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                    </div>

                                    <div class="col-md-6 col-12">
                                        <!-- Kategori -->
                                        <asp:Label ID="Label9" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Kategori</label>
                                        <asp:TextBox ID="txtkategori" runat="server" placeholder="Kategori" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtkategori" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtkategori" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <!-- Topic -->
                                        <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Topic</label>
                                        <asp:TextBox ID="txtAddTopic" TextMode="MultiLine" runat="server" placeholder="Topik" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtAddTopic" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd"  />
                                <i class="bx bx-x d-block d-sm-none"></i>

                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Xl size -->
        <div class="me-1 mb-1 d-inline-block">
            <!--Extra Large Modal -->
            <div class="modal fade text-left w-100" id="updatedata" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel16" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
                    role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel17">Ubah Data Event</h4>
                            <button type="button" class="close" data-bs-dismiss="modal"
                                aria-label="Close">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <section id="multiple-column-form">
                                <div class="form-group">
                                    <asp:TextBox ID="txtid" type="hidden" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                    <div class="row" id="formedit" role="form">

                                        <div class="col-md-6 col-12">
                                            <!-- Nama -->
                                            <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Nama</label>
                                            <asp:TextBox ID="TxtEditNama" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TxtEditNama" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                            </asp:RequiredFieldValidator>

                                            <br />
                                        </div>
                                        <div class="col-md-6 col-12">

                                            <!-- Tema -->
                                            <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Tema</label>
                                            <asp:TextBox ID="TxtEditTema" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtEditTema" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtEditTema" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="valAdd"
                                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />

                                            <br />
                                        </div>

                                        <div class="col-md-6 col-12">
                                            <!-- Tanggal Awal-->
                                            <asp:Label ID="Label4" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Tanggal Awal</label>
                                            <asp:TextBox ID="TxtEdittanggalAwal" runat="server" TextMode="date" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                            <asp:CompareValidator ID="comparevalidator4" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="TxtEdittanggalAwal" Operator="GreaterThanEqual" ErrorMessage="Tanggal awal harus lebih dari atau sama dengan hari ini" Type="Date"></asp:CompareValidator>

                                            <br />
                                        </div>

                                        <div class="col-md-6 col-12">
                                            <!-- Tanggal Akhir-->
                                            <asp:Label ID="Label11" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Tanggal Akhir</label>
                                            <asp:TextBox ID="TxtEdittanggalAkhir" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                            <asp:CompareValidator ID="comparevalidator3" Display="Dynamic" ForeColor="Red" runat="server" ControlToCompare="TxtEdittanggalAwal" ControlToValidate="TxtEdittanggalAkhir" ErrorMessage="Tanggal akhir harus lebih dari tanggal awal" Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                                            <br />
                                        </div>

                                        <div class="col-md-6 col-12">
                                            <!-- Biaya -->
                                            <asp:Label ID="Label5" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Biaya</label>
                                            <asp:TextBox ID="TxtEditBiaya" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtEditBiaya" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtEditBiaya" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="valAdd"
                                                ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                            <br />
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <!-- Kategori -->
                                            <asp:Label ID="Label12" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Kategori</label>
                                            <asp:TextBox ID="txtEdtkategori" runat="server" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtEdtkategori" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtEdtkategori" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="valAdd"
                                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />

                                        </div>
                                        <div class="col-md-6 col-12">
                                            <!-- Topik -->
                                            <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                            <label>Topik</label>
                                            <asp:TextBox ID="txtEdtTopic" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtEdtTopic" runat="server"
                                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                            </asp:RequiredFieldValidator>

                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnEditSubmit" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnEditSubmit_Click" CausesValidation="false" ValidationGroup="valAdd" />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="me-1 mb-1 d-inline-block">
            <!--Extra Large Modal -->
            <div class="modal fade text-left w-100" id="hapusdata" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel16" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                    role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel18">Ubah Data Event</h4>
                            <button type="button" class="close" data-bs-dismiss="modal"
                                aria-label="Close">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Yakin Ingin Menghapus Data?</label>
                                <asp:TextBox ID="TextBox2" Style="display: none" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button1" runat="server" Text="Yakin" CssClass="btn btn-primary ml-1" OnClick="Button1_Click" OnClientClick="return ConfirmUpdate();" CausesValidation="false" />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function senddata(value0, value1, value2, value3, value4, value5, value6, value7) {
                console.log(value0, value1, value2, value3, value4, value5, value6, value7)
                var a = document.getElementById('ContentPlaceHolder2_TxtEditNama')
                a.value = value0
                var b = document.getElementById('ContentPlaceHolder2_TxtEditTema')
                b.value = value1
                var c = document.getElementById('ContentPlaceHolder2_txtEdtTopic')
                c.value = value2

                var tglAwal = value3.split(" ");
                var tanggalaw = tglAwal[0].split("/");
                var dda = tanggalaw[0];
                //if (parseInt(dda) < 10) {
                //    dda = "0" + dda;
                //}
                var mma = tanggalaw[1];
                //if (parseInt(mma) < 10) {
                //    mma = "0" + mma;
                //}
                var yyyya = tanggalaw[2];
                var tgla = yyyya + "-" + dda + "-" + mma;
                var d = document.getElementById('ContentPlaceHolder2_TxtEdittanggalAwal')
                d.value = tgla;
                console.log(tgla);


                var tglAkhir = value4.split(" ");
                var tanggal = tglAkhir[0].split("/");
                var dd = tanggal[0];
                //if (parseInt(dd) < 10) {
                //    dd = "0" + dd;
                //}
                var mm = tanggal[1];
                //if (parseInt(mm) < 10) {
                //    mm = "0" + mm;
                //}
                var yyyy = tanggal[2];
                var tgl = yyyy + "-" + mm + "-" + dd;
                var e = document.getElementById('ContentPlaceHolder2_TxtEdittanggalAkhir')
                e.value = tgl;
                console.log(tgl)

                var id = document.getElementById('ContentPlaceHolder2_txtid')
                id.value = value5

                var f = document.getElementById('ContentPlaceHolder2_TxtEditBiaya')
                f.value = value6

                var g = document.getElementById('ContentPlaceHolder2_txtEdtkategori')
                g.value = value7
            }

            function senddataHapus(value0) {
                console.log(value0)


                var id = document.getElementById('ContentPlaceHolder2_TextBox2')
                id.value = value0

            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript">
            function ConfirmUpdate() {
                Swal.fire({
                    title: 'Apakah Anda Yakin?',
                    text: "Data  akan dinon-aktifkan",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yakin!'
                }).then((result) => {
                    if (result.value) {
                        __doPostBack('<%= Button1.UniqueID %>', '');
                        }
                    });
                return false;
            }
        </script>

    </div>
</asp:Content>


