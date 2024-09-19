<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="SIMC.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-heading">
        <h3>Kelola Event</h3>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- OPEN TAG VIEW Tanggal-->
    <div class="container-fluid">
        <div class="row" id="ViewTanggal" runat="server">
            <div class="card">
                <div class="card-header">
                    <div id="BtnAction" runat="server">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Cari"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" CssClass="form-check-label btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
                        <asp:Button ID="btnTambah" runat="server" CssClass="form-check-label btn btn-primary" OnClick="btnTambah_Click" Text="Tambah" />
                    </div>
                </div>
                <div class="card-body">
                    <asp:GridView runat="server" ID="DGTanggal" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"
                        AllowSorting="true" AutoGenerateColumns="false" DataKeyNames="IdTanggal" EmptyDataText="Tidak Ada Data" PageSize="5" PagerStyle-CssClas="pagination-ys"
                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="DGTanggal_PageIndexChanging" OnRowCommand="GridView1_RowCommand" OnSorting="DGTanggal_Sorting">
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                        <Columns>
                            <asp:BoundField DataField="namaAgenda" HeaderText="Nama" />
                            <asp:BoundField DataField="tanggalAgenda" HeaderText="Tanggal" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Width="60" Text="Edit" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                    <asp:Button ID="btnHapus" runat="server" Width="60" Text="Hapus" CommandName="HapusButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <!-- CLOSE TAG TAMBAH Tanggal-->


    <!-- OPEN TAG TAMBAH Tanggal-->
    <div class="container-fluid">
        <div class="row" id="AddTanggal" runat="server">
            <div class="col">
                <div class="form-group">
                    <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Nama Agenda</label>
                    <asp:TextBox ID="TxtTambahnamaAgenda" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" ControlToValidate="TxtTambahnamaAgenda" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtTambahnamaAgenda" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                    <br />
                    <br />

                    <asp:Label ID="Label9" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tanggal Agenda</label>
                    <asp:TextBox ID="TxtTambahTanggal" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TxtTambahTanggal" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />
                    <br />

                    <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Pilih Event</label>
                    <br />
                    <asp:DropDownList ID="DDLTambahEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DDLTambahEvent" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />
                    <div class="w-100"></div>
                    <div class="col">
                        <asp:Button ID="BtnSubmitAdd" runat="server" Text="  Save  " CssClass="btn btn-primary" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                        &nbsp;
                    &nbsp;
                    &nbsp;
                    <asp:Button ID="BtnCancelAdd" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="BtnCancelAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CLOSED TAG TAMBAH Tanggal-->

    <!-- OPEN TAG EDIT Tanggal-->
    <div class="container-fluid">
        <div class="row" id="EditTanggal" runat="server">
            <div class="col">
                <div class="form-group">
                    <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>namaAgenda</label>
                    <asp:TextBox ID="TxtEditnamaAgenda" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtEditnamaAgenda" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtEditnamaAgenda" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                    <br />
                    <br />
                    <!-- Tanggal -->
                    <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Tanggal Agenda</label>
                    <asp:TextBox ID="TxtEditTanggal" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtEditTanggal" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />

                    <asp:Label ID="Label8" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Event</label>
                    <br />
                    <asp:DropDownList ID="DDLEditEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="DDLEditEvent" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />
                    <br />


                    <asp:TextBox ID="TxtEditID" runat="server" Visible="false" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TxtEditID" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="TxtEditID" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                        ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                    <br />

                    <br />
                </div>
                <div class="w-100"></div>
                <div class="col">
                    <asp:Button ID="BtnEditSubmit" runat="server" Text="  Update  " CssClass="btn btn-primary" OnClick="BtnEditSubmit_Click" ValidationGroup="valAdd" />
                    &nbsp;
                        &nbsp;
                        &nbsp;
                        <asp:Button ID="BtnEditCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="BtnEditCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- CLOSED TAG EDIT Tanggal-->
</asp:Content>
