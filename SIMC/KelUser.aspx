<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KelUser.aspx.cs" Inherits="SIMC.KelUser" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Kelola User</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="SuperAdmin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Kelola User</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />


    <!-- OPEN TAG VIEW Truk-->
    <div class="container-fluid">
        <div class="row" id="ViewUser" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <br />
                    <asp:GridView runat="server" ID="DGUser" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IdUser" Visible="false" HeaderText="ID User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdUser" />
                            <asp:BoundField DataField="email" HeaderText="Email" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="email" />
                            <asp:BoundField DataField="namaUser" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaUser" />
                            <asp:BoundField DataField="role" HeaderText="Role" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="role" />
                            <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                            <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                           <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn icon icon-left btn-primary" OnClientClick=' <%# "senddata(`" + Eval("IdUser") + "`,`" + Eval("IdEvent") + "`,`" + Eval("role")+ "`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit">
                                                        <span class="bi bi-person-fill-gear" aria-hidden="true"></span></asp:LinkButton>
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


    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Ubah Data User</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="form-group">
                                <%--<label>ID USER</label>--%>
                                <asp:TextBox ID="TXTID" type="hidden" runat="server" CssClass="form-control"></asp:TextBox>
                                <br />

                                <asp:Label ID="lblId" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Pilih Event</label>
                                <br />
                                <asp:DropDownList ID="DDLTambahEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="DDLTambahEvent" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <br />
                                
                                <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Pilih role</label>
                                <br />
                                <asp:DropDownList ID="DDLEditROLE" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLEditROLE" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                                 <asp:TextBox Style="display: none" ID="txtnama" runat="server"></asp:TextBox>
                                    <asp:TextBox Style="display: none" ID="txtevent" runat="server"></asp:TextBox>
                                    <asp:TextBox Style="display: none" ID="txtemail" runat="server"></asp:TextBox>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd"  />
                        <i class="bx bx-x d-block d-sm-none"></i>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
            function ConfirmUpdate() {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        __doPostBack('<%= BtnSubmitAdd.UniqueID %>', '');
                        }
                    });
                return false;
            }
        </script>

    <script>
        function senddata(value0, value1,value2) {
            console.log(value0, value1,value2)
            var a = document.getElementById('ContentPlaceHolder2_TXTID')
            a.value = value0
            var b = document.getElementById('ContentPlaceHolder2_DDLTambahEvent')
            b.value = value1
            var c = document.getElementById('ContentPlaceHolder2_DDLEditROLE')
            c.value = value2
            //var email = document.getElementById('ContentPlaceHolder2_txtemail')
            //email.value = value3
            //var nama = document.getElementById('ContentPlaceHolder2_txtnama')
            //nama.value = value4
            //var event = document.getElementById('ContentPlaceHolder2_txtevent')
            //event.value = value5
        }
    </script>
</asp:Content>
