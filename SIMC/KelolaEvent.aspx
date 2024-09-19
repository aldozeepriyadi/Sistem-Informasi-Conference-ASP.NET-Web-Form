<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="KelolaEvent.aspx.cs" Inherits="SIMC.WebForm2" %>

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
    <!-- OPEN TAG VIEW value-->
    <div class="container-fluid">
        <div class="row" id="ViewEvent" runat="server">
            <div class="card">
                <div class="card-header">
                    <div class="container-fluid">
                        <div id="BtnAction" runat="server">
                            <asp:Button ID="btnTambah" runat="server" CssClass="form-check-label btn btn-primary" OnClick="btnTambah_Click" Text="Tambah" />
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGEvent" CssClass="table table-responsive table-bordered table-hover datatbemp" Width="100%" AutoGenerateColumns="false">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdEvent" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdEvent" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="tanggalAwal" HeaderText="Tanggal Awal" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAwal" DataFormatString="{0:dd MMM yyyy}" />
                                <asp:BoundField DataField="tanggalAkhir" HeaderText="Tanggal Akhir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="tanggalAkhir" DataFormatString="{0:dd MMM yyyy}" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah"  CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                            ToolTip="Ubah Data Table"><span class="bi-pencil"  aria-hidden="true"></span></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
            <script>
                $(document).ready(function () {
                    $(".datatbemp").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
                });
            </script>
        </div>
    </div>
    <!-- OPEN TAG TAMBAH value-->

    <!-- OPEN TAG TAMBAH Event-->
    <div class="container-fluid">
        <div class="row" id="AddEvent" runat="server">
            <div class="col">
                <div class="form-group">
                    <!-- Nama -->
                    <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Nama</label>
                    <asp:TextBox ID="TxtTambahNama" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahNama" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="NamaEvt" ControlToValidate="TxtTambahNama" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />

                    <br />
                    <!-- Tema -->
                    <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tema</label>
                    <asp:TextBox ID="TxtTambahTema" runat="server" TextMode="MultiLine" placeholder="Tema" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TxtTambahTema" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>

                    <br />

                    <!-- Tanggal -->
                    <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tanggal pertemuan</label>
                    <asp:TextBox ID="TxtTambahTanggal" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtTambahTanggal" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>

                    <br />


                </div>

                <div class="col">
                    <asp:Button ID="BtnSubmitAdd" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    <asp:Button ID="BtnCancelAdd" runat="server" Text="Cancel" CssClass="btn " OnClick="BtnCancelAdd_Click" />
                </div>
            </div>

        </div>
    </div>
    <!-- CLOSED TAG TAMBAH Event-->

    <!-- OPEN TAG EDIT Event-->
    <div class="container-fluid">
        <div class="row" id="EditEvent" runat="server">
            <div class="col">
                <div class="form-group">
                    <asp:TextBox ID="TxtEditId" type="hidden" runat="server" CssClass="form-control"></asp:TextBox>
                    <!-- Nama -->
                    <asp:Label ID="Label5" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Nama</label>
                    <asp:TextBox ID="TxtEditNama" runat="server" CssClass="form-control" placeholder="Nama"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtEditNama" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtEditNama" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                    <br />

                    <!-- Tema -->
                    <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tema</label>
                    <asp:TextBox ID="TxtEditTema" runat="server" TextMode="MultiLine" placeholder="Tema" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TxtEditTema" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />

                    <!-- Tema -->
                    <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tanggal Pertemuan</label>
                    <asp:TextBox ID="TxtEditTanggal" runat="server" TextMode="Date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TxtEditTanggal" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />

                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
                <div class="col">
                    <asp:Button ID="Button1" runat="server" Text="  Save  " CssClass="btn btn-primary" OnClick="BtnEditSubmit_Click" ValidationGroup="valAdd" />
                    &nbsp;
                        &nbsp;
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="BtnEditCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- CLOSED TAG EDIT VENDOR-->

</asp:Content>

