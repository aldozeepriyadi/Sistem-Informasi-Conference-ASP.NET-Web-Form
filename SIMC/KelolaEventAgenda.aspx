<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="KelolaEventAgenda.aspx.cs" Inherits="SIMC.KelolaEventAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Kelola Event</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Admin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Kelola Event</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <div class="container-fluid">
        <div class="card">

            <div class="card-header">
                <div class="container-fluid">
                    <div id="Div1" runat="server">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-primary" data-bs-toggle="modal" data-bs-target="#modaltambah"><span class="bi bi-plus-circle"> Tambah</span></asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive my-3">
                    <div class="row" id="viewsub" runat="server">
                        <div runat="server">
                            <asp:GridView runat="server" ID="DGReviewAbstrak" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="kategori" HeaderText="Kategori" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="kategori" />
                                    <asp:BoundField DataField="tanggalAwal" HeaderText="Tanggal Awal" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAwal" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="tglAwalEve" Visible="false" HeaderText="Tanggal Awal eve" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tglAwalEve" />
                                    <asp:BoundField DataField="tglAkhirEve" Visible="false" HeaderText="Tanggal Akhir eve" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tglAkhirEve" />
                                    <asp:BoundField DataField="tanggalAkhir" HeaderText="Tanggal Akhir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAkhir" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="IdEvent" Visible="false" HeaderText="Id Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="idEvent" />

                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn icon icon-left btn-danger" OnClientClick=' <%# "senddataHapus(`" + Eval("IdSubEvent") + "`);"%> ' data-bs-toggle="modal" data-bs-target="#hapusdata"><span style="color:white;" class="bi bi-trash" aria-hidden="true">
                                                        </span></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdEvent") + "`,`" + Eval("tanggalAwal") + "`,`"+ Eval("IdSubEvent")+ "`,`"+Eval("kategori") + "`,`" +Eval("tglAkhirEve") + "`,`"+Eval("tglAwalEve") + "`,`"+ Eval("tanggalAkhir")  +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                            </asp:GridView>
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
            </div>
        </div>
    </div>

    <asp:Label ID="lbresult" runat="server"></asp:Label>
    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Ubah Data Sub Event</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="lblid" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <asp:TextBox ID="txtId" Style="display: none" runat="server" CssClass="form-control" placeholder="Id Sub"></asp:TextBox>
                                    <asp:TextBox ID="txteve" Style="display: none" runat="server" CssClass="form-control" placeholder="Id Event"></asp:TextBox>
                                    <%-- style="display:none;"--%>
                                    <label>Kategori</label>
                                    <asp:TextBox ID="txtkategori" runat="server" CssClass="form-control" placeholder="Ketegori"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtkategori" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NamaEvt" ControlToValidate="txtkategori" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                    <br />

                                    <!-- Tanggal Pengumpulan Abstrak-->
                                    <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Tanggal Awal</label>
                                    <asp:TextBox ID="txtAddtanggalAwal" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtAddtanggalAwal" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="comparevalidator1" ForeColor="Red" runat="server" ControlToCompare="txtAddtanggalAwal" ControlToValidate="txttglawaleve" ErrorMessage="Tanggal awal harus lebih dari atau sama dengan  tanggal awal event" Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                    <br />
                                    <!-- Tanggal Final Abstrak-->
                                    <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Tanggal Akhir</label>
                                    <asp:TextBox ID="txtAddtanggalAkhir" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtAddtanggalAkhir" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="comparevalidator2" ForeColor="Red" runat="server" ControlToCompare="txtAddtanggalAkhir" ControlToValidate="txttglakhireve" ErrorMessage="Tanggal akhir harus kurang dari atau sama dengan tanggal akhir event" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                                    <asp:CompareValidator ID="comparevalidator5" ForeColor="Red" runat="server" ControlToCompare="txtAddtanggalAkhir" ControlToValidate="txtAddtanggalAwal" ErrorMessage="Tanggal akhir harus kurang dari  tanggal awal sub event" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                                    <br />
                                    <asp:TextBox ID="txttglawaleve" Style="display: none;" runat="server" TextMode="date" Rows="5" CssClass="form-control"></asp:TextBox>
                                    <asp:TextBox ID="txttglakhireve" Style="display: none;" runat="server" TextMode="date" Rows="5" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnSubmitAdde" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdde_Click" ValidationGroup="ValAdd" />
                            <i class="bx bx-x d-block d-sm-none"></i>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Xl size -->
        <div class="me-1 mb-1 d-inline-block">
            <!--Extra Large Modal -->
            <div class="modal fade text-left w-100" id="modaltambah" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel17" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                    role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel17">Tambah Data Sub Event</h4>
                            <button type="button" class="close" data-bs-dismiss="modal"
                                aria-label="Close">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="form-group">
                                    <div class="form-group">

                                        <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Kategori</label>
                                        <asp:TextBox ID="txtkategoriE" runat="server" CssClass="form-control" placeholder="Ketegori"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtkategoriE" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtkategoriE" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                                        <br />
                                        <!-- Tanggal Pengumpulan Abstrak-->
                                        <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Tanggal Awal</label>
                                        <asp:TextBox ID="txtAddtanggalAwalE" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtAddtanggalAwalE" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="comparevalidator3" ForeColor="Red" runat="server" ControlToValidate="txtAddtanggalAwalE" Operator="GreaterThanEqual" ErrorMessage="Tanggal awal harus lebih dari atau sama dengan tanggal awal event" Type="Date"></asp:CompareValidator>
                                        <br />
                                        <!-- Tanggal Final Abstrak-->
                                        <asp:Label ID="Label4" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Tanggal Akhir</label>
                                        <asp:TextBox ID="txtAddtanggalAkhirE" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAddtanggalAkhirE" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="comparevalidator4" ForeColor="Red" runat="server" ControlToValidate="txtAddtanggalAkhirE" Operator="LessThanEqual" ErrorMessage="Tanggal akhir harus kurang dari atau sama dengan tanggal akhir event" Type="Date"></asp:CompareValidator>
                                        <br />

                                        <%--                     <asp:TextBox ID="txtaddtglawaleve" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                     <asp:TextBox ID="txtaddtglakhireve" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdd_Click" ValidationGroup="ValAdd" />
                                <i class="bx bx-x d-block d-sm-none"></i>

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
                                    <asp:Label ID="Label13" Text="Yakin Ingin Menghapus Data?" ForeColor="Red" runat="server"></asp:Label>
                                    <asp:TextBox ID="TextBox2" Style="display: none" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button1" runat="server" Text="Yakin" CssClass="btn btn-primary ml-1" OnClick="Button1_Click" ValidationGroup="valAdd" OnClientClick="return ConfirmUpdate();" />
                                <i class="bx bx-x d-block d-sm-none"></i>
                                <asp:Button ID="Button2" runat="server" Text="Batal" CssClass="btn btn-primary ml-1" OnClick="Button2_Click" ValidationGroup="valAdd" />
                                <i class="bx bx-x d-block d-sm-danger"></i>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <script>
                function senddata(value0, value1, value2, value3, value4, value5, value6) {
                    console.log(value0, value1, value2, value3, value4, value5, value6)
                    var a = document.getElementById('ContentPlaceHolder2_txteve')
                    a.value = value0

                    var tglAwal = value1.split(" ");
                    var tanggalaw = tglAwal[0].split("/");
                    var dda = tanggalaw[0];
                    //if (parseInt(dda) < 10) {
                    //    dda = "0" + dda;
                    //}
                    var mma = tanggalaw[1];
                    var angka = mma.split("0");
                    //console.log(mma);
                    //if (parseInt(mma) < 10) {
                    //    mma = "0" + mma;

                    //}
                    /*   console.log(mma);*/
                    var yyyya = tanggalaw[2];
                    var tglaw = yyyya + "-" + mma + "-" + dda;
                    var b = document.getElementById('ContentPlaceHolder2_txtAddtanggalAwal')
                    b.value = tglaw;
                    console.log(tglaw);

                    //var b = document.getElementById('ContentPlaceHolder2_txtAddtanggalAwal')
                    //b.value = value1

                    var c = document.getElementById('ContentPlaceHolder2_txtId')
                    c.value = value2

                    var d = document.getElementById('ContentPlaceHolder2_txtkategori')
                    d.value = value3

                    var tglAkhir = value6.split(" ");
                    var tanggalak = tglAkhir[0].split("/");
                    var dda = tanggalak[0];
                    //if (parseInt(dda) < 10) {
                    //    dda = "0" + dda;
                    //}
                    var mma = tanggalak[1];
                    var angka = mma.split("0");
                    //console.log(mma);
                    //if (parseInt(mma) < 10) {
                    //    mma = "0" + mma;

                    //}
                    /*   console.log(mma);*/
                    var yyyya = tanggalak[2];
                    var tgla = yyyya + "-" + mma + "-" + dda;
                    var e = document.getElementById('ContentPlaceHolder2_txtAddtanggalAkhir')
                    e.value = tgla;
                    console.log(tgla);

                    var tglAkhirEve = value5.split(" ");
                    var tanggalakEv = tglAkhirEve[0].split("/");
                    var ddae = tanggalakEv[0];
                    //if (parseInt(ddae) < 10) {
                    //    ddae = "0" + ddae;
                    //}
                    var mmae = tanggalakEv[1];
                    var angka = mmae.split("0");
                    //console.log(mma);
                    //if (parseInt(mmae) < 10) {
                    //    mmae = "0" + mmae;

                    //}
                    /*   console.log(mma);*/
                    var yyyyae = tanggalakEv[2];
                    var tglae = yyyyae + "-" + ddae + "-" + mmae;
                    var q = document.getElementById('ContentPlaceHolder2_txttglakhireve')
                    q.value = tglae;
                    console.log(tglae);

                    var tglAwalEve = value4.split(" ");
                    var tanggalawEv = tglAwalEve[0].split("/");
                    var ddawe = tanggalawEv[0];
                    //if (parseInt(ddawe) < 10) {
                    //    ddawe = "0" + ddawe;
                    //}
                    var mmawe = tanggalawEv[1];
                    var angka = mmawe.split("0");
                    //console.log(mma);
                    //if (parseInt(mmawe) < 10) {
                    //    mmawe = "0" + mmawe;

                    //}
                    /*   console.log(mma);*/
                    var yyyyawe = tanggalawEv[2];
                    var tglawe = yyyyawe + "-" + mmawe + "-" + ddawe;
                    var w = document.getElementById('ContentPlaceHolder2_txttglawaleve')
                    w.value = tglawe;
                    console.log(tglawe);
                }

                function senddataHapus(value0) {
                    console.log(value0)


                    var id = document.getElementById('ContentPlaceHolder2_TextBox2')
                    id.value = value0

                }
            </script>
            <script type="text/javascript">
                function ConfirmUpdate() {
                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Delete it!'
                    }).then((result) => {
                        if (result.value) {
                            __doPostBack('<%= Button1.UniqueID %>', '');
                            }
                        });
                    return false;
                }
            </script>
</asp:Content>
