<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="KelProsiding.aspx.cs" Inherits="SIMC.KelProsiding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Kelola Prosiding</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Admin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Kelola Prosiding</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />

    <!-- OPEN TAG VIEW Prosiding-->
    <div class="container-fluid">
        <div class="row" id="ViewProsiding" runat="server">
            <div class="card">
                <div class="card-header">
                    <div id="BtnAction" runat="server">
                        <asp:LinkButton runat="server" CssClass="btn icon icon-left btn-primary" data-bs-toggle="modal" data-bs-target="#tambahdata"><span class="bi bi-plus-circle"> Tambah</span></asp:LinkButton>

                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGProsiding" CssClass="table table-bordered table-hover table-responsive datatbemp" OnRowCommand="DGProsiding_RowCommand" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="year" HeaderText="Tahun" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="year" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="namaUser" Visible="false" HeaderText=" User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaUser" />
                                <asp:BoundField DataField="IdProsiding" Visible="false" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" HeaderText=" User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdProsiding" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Nama Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="ProsidingFile" Visible="false" HeaderText="ProsidingFile " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="ProsidingFile" />

                                <asp:TemplateField HeaderText="Prosiding File" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="ENameLinkBtn" runat="server" Text="halo" CommandArgument='<%# Eval("ProsidingFile") %>'
                                            CssClass="btn btn-info" Style="color: white;"
                                            OnCommand="ENameLinkBtn_Click">Baca Selengkapnya</asp:LinkButton>
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

    <!-- CLOSED TAG VIEW Prosiding-->
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
                        <div class="form-group">
                            <div class="form-group">
                                <!-- Tahun-->
                                <asp:Label ID="Label11" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:Label ID="LblUser" Visible="false" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Tahun</label>
                                <asp:TextBox ID="TxtTambahTahun" runat="server" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TxtTambahTahun" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtTambahTahun" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                    ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                <br />
                                <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Pilih Event</label>
                                <br />
                                <asp:DropDownList ID="DDLTambahEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLTambahEvent" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <br />

                                <!-- Tema -->
                                <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Judul</label>
                                <asp:TextBox ID="TxtTambahJudul" runat="server" placeholder="Judul" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtTambahJudul" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="Label12" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>File Prosiding</label>
                                &nbsp 
                                    <asp:FileUpload ID="fileupload" CssClass="form-control" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="fileupload" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="fileupload"
                                    ValidationExpression="^.*\.(pdf)$" runat="server" Text="Only .pdf file formats are allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" EnableClientScript="True" />
                                <br />
                                <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>File Gambar</label>
                                <asp:FileUpload ID="fileuploadimg" CssClass="form-control" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="fileuploadimg" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ControlToValidate="fileuploadimg"
                                    ValidationExpression="^.*\.(jpg)$" runat="server" Text="Only .jpg file formats are allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" EnableClientScript="True" />
                                <br />

                                <br />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" OnClick="BtnSubmitAdd_Click" CssClass="btn btn-primary ml-1" ValidationGroup="valAdd" />
                            <i class="bx bx-x d-block d-sm-none"></i>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
