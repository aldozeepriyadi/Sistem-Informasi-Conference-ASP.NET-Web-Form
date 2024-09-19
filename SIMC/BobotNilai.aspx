<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="BobotNilai.aspx.cs" Inherits="SIMC.BobotNilai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Bobot Nilai</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Admin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Bobot Nilai</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />


    <!-- OPEN TAG VIEW value-->
    <div class="container-fluid">
        <div class="row" id="Viewvalue" runat="server">
            <div class="card">
                <div class="card-header">
                    <div id="BtnAction" runat="server">
                        <asp:Button ID="btnTambah" runat="server" CssClass="form-check-label btn btn-primary" OnClick="btnTambah_Click" Text="Tambah" />
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGvalue" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="assessmentCriteria" HeaderText="Kirteria Penilaian " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="assessmentCriteria" />
                                <asp:BoundField DataField="value" HeaderText="Nilai" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="value" DataFormatString="" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                            ToolTip="Ubah Data Table"><span class="bi-pencil" aria-hidden="true"></span></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                            ToolTip="Hapus Data Table"><span class="bi-trash" aria-hidden="true" onclick="return alert('data anda berhasil dihapus');"></span></asp:LinkButton>
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
        <!-- CLOSE TAG VIEW value-->


        <!-- OPEN TAG TAMBAH value-->
        <div class="container-fluid">
            <div class="row" id="Addvalue" runat="server">
                <div class="col">
                    <div class="form-group">
                        <br />
                        <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>assessmentCriteria</label>
                        <asp:TextBox ID="TxtTambahassessmentCriteria" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" ControlToValidate="TxtTambahassessmentCriteria" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtTambahassessmentCriteria" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        <br />
                        <br />

                        <asp:Label ID="Label9" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>value</label>
                        <asp:TextBox ID="TxtTambahvalue" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TxtTambahvalue" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TxtTambahvalue" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                            ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                        <br />
                        <br />
                    </div>
                </div>

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
        <!-- CLOSED TAG TAMBAH value-->
        <!-- OPEN TAG EDIT value-->
        <div class="container-fluid">
            <div class="row" id="Editvalue" runat="server">
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="Label13" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>ID</label>
                        <asp:TextBox ID="TxtEditID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TxtEditID" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="TxtEditID" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                            ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                        <br />
                        <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>assessmentCriteria</label>
                        <asp:TextBox ID="TxtEditassessmentCriteria" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtEditassessmentCriteria" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtEditassessmentCriteria" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                            ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />
                        <br />
                        <br />

                        <asp:Label ID="Label7" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>value</label>
                        <asp:TextBox ID="TxtEditvalue" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtEditvalue" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtEditvalue" runat="server"
                            Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                            ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                        <br />
                        <br />

                    </div>
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
        <!-- CLOSED TAG EDIT value-->
</asp:Content>
