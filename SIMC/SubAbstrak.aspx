<%@ Page Title="" Language="C#" MasterPageFile="~/PagePeserta.Master" AutoEventWireup="true" CodeBehind="SubAbstrak.aspx.cs" Inherits="SIMC.SubAbstrak" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Submit Abstrak</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Author.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Submit Asbtrak</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <script src="ckeditor/ckeditor.js"></script>

    <!-- OPEN TAG VIEW Tanggal-->
    <div class="container-fluid">
        <div class="row" id="ViewSubAbstrak" runat="server">
            <div class="card">
                <div class="card-header">
                    <div id="BtnAction" runat="server">
                        <asp:Button ID="btnTambah" runat="server" CssClass="btn icon icon-left btn-primary" OnClick="btnTambah_Click" Text="Unggah Abstrak" />
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGSubAbstrak" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdAbstrak" Visible="false" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                <asp:BoundField DataField="abstract" Visible="false" HeaderText="Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="abstract" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="Topic" HeaderText="Topik " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="Topic" />
                                <asp:BoundField DataField="statusKarya" HeaderText="Status Karya" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                                <asp:BoundField DataField="statusDistribusi" HeaderText="Status Distribusi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusDistribusi" />
                                <asp:BoundField DataField="submittedby" Visible="false" HeaderText="Submitted By" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="submittedby" />
                                <asp:BoundField DataField="modifiedby" Visible="false" HeaderText="Modified By" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="modifiedby" />
                                <asp:BoundField DataField="reviewedby" Visible="false" HeaderText="Reviewed By" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="reviewedby" />
                                <asp:BoundField DataField="IdEvent" Visible="false" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdEvent" />
                                <asp:BoundField DataField="modifieddate" Visible="false" HeaderText="Modified Date" NullDisplayText="-" ItemStyle-HorizontalAlign="left" DataFormatString="{0:dd/MM/yyyy}" SortExpression="modifieddate" />
                                <asp:BoundField DataField="deadlineRevisi" HeaderText="Deadline" NullDisplayText="-" DataFormatString="{0:dd MMMM yyyy}" ItemStyle-HorizontalAlign="left" SortExpression="deadlineRevisi" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak") + "`,`" + Eval("abstract") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
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


    <!-- OPEN TAG TAMBAH VENDOR-->
    <div class="container-fluid">
        <div class="row" id="TambahAbstrak" runat="server">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Data Author
                    </div>
                    <div class="card-body">
                        <section id="multiple-column-form">
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <asp:TextBox ID="TxtTambahId" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:TextBox ID="TxtTambahIdAbstrak" runat="server" CssClass="form-control"></asp:TextBox>

                                        <!-- Cari Author -->
                                        <asp:Label ID="Label15" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Cari Author</label>
                                        <asp:TextBox ID="TxtSearchAuthor" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TxtSearchAuthor" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAut" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12">
                                    <asp:Button ID="BtnSearchAut" runat="server" Text="Cari" CssClass="btn btn-primary " OnClick="BtnSearchAut_Click" ValidationGroup="valAut" />
                                    &nbsp;
                                    
                                </div>

                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Nama -->
                                        <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Nama Lengkap</label>
                                        <asp:TextBox ID="TxtTambahNama" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahNama" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="NamaMhs" ControlToValidate="TxtTambahNama" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />--%>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Email -->
                                        <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Email</label>
                                        <asp:TextBox ID="TxtTambahEmail" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TxtTambahEmail" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtTambahEmail" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Email Pattern Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="True" />--%>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Alamat -->
                                        <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Alamat</label>
                                        <asp:TextBox ID="TxtTambahAlamat" ReadOnly="true" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TxtTambahAlamat" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Instance -->
                                        <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Instansi</label>
                                        <asp:TextBox ID="TxtTambahInstansi" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Instansi"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtTambahInstansi" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="alAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TxtTambahInstansi" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />--%>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- No Handphone -->
                                        <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>No Handphone</label>
                                        <asp:TextBox ID="TxtTambahHP" ReadOnly="true" runat="server" CssClass="form-control" placeholder="No Handphone"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TxtTambahHP" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="alAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtTambahHP" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                            ValidationExpression="^[0-9]*$" EnableClientScript="True" />--%>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Jenis Kelamin -->
                                        <asp:Label ID="Label5" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Jenis Kelamin</label>
                                        <asp:TextBox ID="TxtTambahJK" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Jenis Kelamin"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="TxtTambahJK" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="alAdd" EnableClientScript="False">
                                        </asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Jenis Status -->
                                        <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Kategori</label>
                                        <asp:TextBox ID="TxtTambahJS" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Kategori"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TxtTambahJS" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="alAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12">
                                    <div class='form-group mandatory'>

                                        <!-- Pendidikan Terakhir -->
                                        <asp:Label ID="Label9" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                        <label>Pendidikan Terakhir</label>
                                        <asp:TextBox ID="TxtTambahPddT" ReadOnly="true" runat="server" CssClass="form-control" placeholder="No Handphone"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahPddT" runat="server"
                                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="alAdd" EnableClientScript="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                        </section>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        Data Presenter
                    </div>
                    <div class="card-body">
                        <div class='form-group mandatory'>

                            <!-- Nama -->
                            <asp:Label ID="Label4" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Nama Presenter</label>
                            <asp:TextBox ID="TxtTambahNamaPresenter" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtTambahNamaPresenter" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtTambahNamaPresenter" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValAdd"
                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        Data Abstrak
                    </div>
                    <div class="card-body">
                        <div class='form-group mandatory'>
                            <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Pilih Event</label>
                            <br />
                            <asp:DropDownList ID="DDLTambahEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DDLTambahEvent" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <br />
                        </div>


                        <div class='form-group mandatory'>
                            <!-- Judul -->
                            <asp:Label ID="Label11" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Judul</label>
                            <asp:TextBox ID="txtTambahJudul" runat="server" CssClass="form-control" placeholder="Judul"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegularExpressionValidator3" ControlToValidate="txtTambahJudul" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtTambahJudul" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        </div>


                        <div class='form-group mandatory'>
                            <!-- Topik -->
                            <asp:Label ID="Label12" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Topik</label>
                            <asp:TextBox ID="txtTambahTopic" runat="server" CssClass="form-control" placeholder="Topik"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTambahTopic" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtTambahTopic" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValAdd"
                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        </div>

                        <div class='form-group mandatory'>
                            <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Abstrak</label>
                            <asp:TextBox ID="TxtTambahAbstrak" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <script type="text/javascript" lang="javascript">
                                CKEDITOR.replace('<%=TxtTambahAbstrak.ClientID%>');
                            </script>
                        </div>


                        <div class='form-group mandatory'>
                            <!-- Kata Kunci -->
                            <asp:Label ID="Label13" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Kata Kunci</label>
                            <asp:TextBox ID="txtTambahKeyword" runat="server" CssClass="form-control" placeholder="Kata Kunci"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtTambahKeyword" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtTambahKeyword" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValAdd"
                                ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        </div>

                        <div class="col">
                            <asp:Button ID="BtnAddSubmit" runat="server" Text="  Simpan  " CssClass="btn btn-primary" OnClick="BtnAddSubmit_Click" ValidationGroup="ValAdd" />
                            &nbsp;
                            &nbsp;
                            &nbsp;
                            <asp:Button ID="BtnAddCancel" runat="server" Text="Kembali" CssClass="btn btn-secondary" OnClick="BtnAddCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CLOSED TAG TAMBAH VENDOR-->

    <script>
        function senddata(value0, value1) {
            console.log(value0, value1)
            var a = document.getElementById('ContentPlaceHolder2_txtid')
            a.value = value0
            var b = document.getElementById('ContentPlaceHolder2_TXTABSTRAK')
            b.value = value1

            //var desc = $("#DSC").val();
            ////var desc = CKEDITOR.instances.DSC.getData('ContentPlaceHolder2_DSC');
            //desc.value = value1
        }
    </script>
    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Ubah Data Abstrak</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtid" type="hidden" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtid" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAut" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <asp:Label ID="lblId" runat="server"></asp:Label>
                            <br />


                            <div class='form-group mandatory'>
                                <asp:Label ID="Label16" Text="*" ForeColor="Red" runat="server"></asp:Label>
                               
                                <label>Abstrak</label>
                                <asp:TextBox ID="TXTABSTRAK" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <script type="text/javascript" lang="javascript">
                                    CKEDITOR.replace('<%=TXTABSTRAK.ClientID%>');
                                </script>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col">
                            <asp:Button ID="btnEditSubmit" runat="server" Text="Ubah" CssClass="btn btn-primary" OnClick="BtnEditSubmit_Click" ValidationGroup="valAdd" OnClientClick="return successalert();" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
