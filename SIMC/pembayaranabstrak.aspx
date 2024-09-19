<%@ Page Title="" Language="C#" MasterPageFile="~/PagePeserta.Master" AutoEventWireup="true" CodeBehind="WebForm12.aspx.cs" Inherits="SIMC.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Pembayaran</h2>
    <nav>
        <ol class="breadcrumb">
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <!-- OPEN TAG VIEW Truk-->
    <div class="container-fluid">
        <div class="row" id="ViewPayment" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGPayment" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdAbstrak"  Visible="false" HeaderText="Id Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                <asp:BoundField DataField="title" HeaderText="Title" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="statusPayment" HeaderText="Status Pembayaran" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusPayment" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server"  CssClass="btn icon icon-left btn-primary" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit" Visible='<%# Eval("statusPayment").ToString() == "Diterima" ? false : true %>' > <span class="bi bi-file-earmark-arrow-up"> </span></asp:LinkButton>
                                    
               
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
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Pembayaran</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="form-group">
                                <%--<label>ID USER</label>--%>
                                <div class="form-group position-relative has-icon-left mb-4">
                                    <asp:TextBox Style="display:none;" ID="TXTID" runat="server"></asp:TextBox>
                                    <asp:Label ID="Label6" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Nama Pengirim</label>
                                    <asp:TextBox ID="TxtTambahNP" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TxtTambahNP" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NamaEvt" ControlToValidate="TxtTambahNP" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Only Letters)" SetFocusOnError="true" ValidationGroup="ValForm"
                                        ValidationExpression="^[a-zA-Z ]*$" EnableClientScript="True" />


                                    <!-- Nomor Rekening -->
                                    <asp:Label ID="Label18" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Nomor Rekening</label>
                                    <asp:TextBox ID="TxtTambahNK" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="TxtTambahNK" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="TxtTambahNK" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                        ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                    <br />


                                    <!-- Total Pembayaran -->
                                    <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Total Pembayaran</label>
                                    <asp:TextBox ID="TxtTambahTP" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahTP" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtTambahTP" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Number Only)" SetFocusOnError="true" ValidationGroup="ValForm"
                                        ValidationExpression="^[0-9]*$" EnableClientScript="True" />
                                    <br />


                                    <!-- Bukti Pembayaran -->
                                    <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Bukti Pembayaran</label>
                                    <asp:FileUpload CssClass="form-control" ID="fileuploadimg" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="fileuploadimg"
                                        ValidationExpression="^.*\.(jpg)$" runat="server" Text="Only .jpg file formats are allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" EnableClientScript="True" />
                                    <br />
                                </div>
                            </div>
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


    <script>
        function senddata(value0) {
            console.log(value0)
            var c = document.getElementById('ContentPlaceHolder2_TXTID')
            c.value = value0

            //var d = document.getElementById('ContentPlaceHolder2_rbKonfir')
            //d.value = value1
        }
    </script>
</asp:Content>
