<%@ Page Title="" Language="C#" MasterPageFile="~/PageReviewer.Master" AutoEventWireup="true" CodeBehind="RevAbstrak.aspx.cs" Inherits="SIMC.RevAbstrak" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Revisi Abstrak</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Reviewer.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Revisi Abstrak</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://stakpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
    <script src="ckeditor/ckeditor.js"></script>

    <!-- OPEN TAG VIEW Truk-->
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive my-3">
                    <div class="row" id="ViewReviewAbstrak" runat="server">
                        <asp:GridView runat="server" ID="DGReviewAbstrak" OnRowCommand="DGReviewAbstrak_RowCommand" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdAbstrak" Visible="false" HeaderText="Id Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                <asp:BoundField DataField="title" HeaderText="title" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="topic" HeaderText="topic" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                <asp:BoundField DataField="statusKarya" HeaderText="Status Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                                <asp:BoundField DataField="keterangan" HtmlEncode="false" HeaderText="Catatan Revisi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="keterangan" />


                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak")  +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                        </asp:GridView>
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
    </div>
    <!-- CLOSED TAG VIEW Abstrak-->

    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Review Abstrak</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox Style="display: none;" ID="TXTID" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />

                            <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Pilih Status</label><br />
                            <asp:DropDownList ID="DDLTambahStatus" CssClass="form-select" runat="server">
                                <asp:ListItem Text="" Value="">Pilih Status</asp:ListItem>
                                <asp:ListItem Text="OK" Value="OK">OK</asp:ListItem>
                                <asp:ListItem Text="Revisi" Value="Revisi">Revisi</asp:ListItem>
                                <asp:ListItem Text="Ditolak" Value="Revisi">Revisi</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLTambahStatus" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="TextBox1" Style="display: none" runat="server" CssClass="form-control"></asp:TextBox>

                            <div class='form-group mandatory'>
                                <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Catatan Revisi</label>
                                <asp:TextBox ID="txtCatatanRevisi" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <script type="text/javascript" lang="javascript">
                                    CKEDITOR.replace('<%=txtCatatanRevisi.ClientID%>');
                                </script>
                            </div>ss

                            <div class="col">
                                <asp:Button ID="BtnEditSubmit" runat="server" Text="Simpan" CssClass="btn btn-primary" EnablePageMethods="true" OnClick="BtnEditSubmit_Click" ValidationGroup="ValAdd"  />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function senddata(value0) {
                console.log(value0)
                var c = document.getElementById('ContentPlaceHolder2_TXTID')
                c.value = value0
            }
        </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <script type="text/javascript" src="https://tinymce.cachefly.net/5.0/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.init({ selector: 'textarea', width: 300 });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        $(document).ready(function () {
            $(".datatbemp").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });
    </script>
    <%--<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
    <script src="assets/js/pages/ckeditor.js"></script>--%>
    <script type="text/javascript">
        function ConfirmUpdate() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, update it!'
            }).then((result) => {
                if (result.value) {
                    __doPostBack('<%= BtnEditSubmit.UniqueID %>', '');
            }
        });
            return false;
        }
    </script>

    <!-- CLOSED TAG EDIT Tanggal-->
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>


</asp:Content>
