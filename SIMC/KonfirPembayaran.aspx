
<%@ Page Title="" Language="C#" MasterPageFile="~/PageFinance.Master" AutoEventWireup="true" CodeBehind="KonfirPembayaran.aspx.cs" Inherits="SIMC.KonfirPembayaran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Konfirmasi Pembayaran</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Finance.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Konfirmasi Pembayaran</li>
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
                              <%--  <asp:TemplateField HeaderText="Bukti Pembayaran" HeaderStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("proofOfPayment") %>' Height="80px" Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="title" HeaderText="Judul" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="IdPayment" Visible="false" HeaderText="ID" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdPayment" />
                                <asp:BoundField DataField="nameSender" HeaderText="Nama Pengirim" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameSender" />
                                <asp:BoundField DataField="accountNumber" HeaderText="Nomor Rekening" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="accountNumber" />
                                <asp:BoundField DataField="totalPayment" HeaderText="Total Pembayaran" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="totalPayment" DataFormatString="Rp. {0:N0}" />
                                <asp:BoundField DataField="NameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="statusPayment" HeaderText="Status Pembayaran" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusPayment" />
                                <asp:BoundField DataField="IdUser" visible="false" HeaderText="Status Pembayaran" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdUser" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddataDetail(`" + Eval("IdPayment") + "`,`" + Eval("nameSender") +"`,`" +  Eval("accountNumber") +"`,`" + Eval("totalPayment") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit5"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true"></span></asp:LinkButton>

                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-danger" Visible='<%# Eval("statusPayment").ToString() == "Diterima" ? false : true %>' OnClientClick=' <%# "senddata(`" + Eval("IdPayment") +"`,`" + Eval("IdUser") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit"><span class="bi bi-check-square" aria-hidden="true">
                                                        </span></asp:LinkButton>
                                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdPayment") + "`,`" +   Eval("nameSender") +"`,`" +   Eval("accountNumber") +"`,`" +   Eval("totalPayment") +"`,`" +   Eval("proofOfPayment") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit5"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true"></span></asp:LinkButton>--%>

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


    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit5" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl modal-lg"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel17">Detail Pembayran</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtidD" Style="display: none;" runat="server" CssClass="form-control"></asp:TextBox>

                            <asp:Label ID="lblId" runat="server"></asp:Label>
                            <br />

                            <asp:Label ID="Label16" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Nama Pengirim</label>
                            <asp:TextBox ReadOnly="true" ID="txtNamaSender" Visible="true" runat="server" CssClass="form-control"></asp:TextBox>

                            <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Nomor Rekening</label>
                            <asp:TextBox ReadOnly="true" ID="txtNoReken" Visible="true" runat="server" CssClass="form-control"></asp:TextBox>

                            <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Total Pembayaran</label>
                            <asp:TextBox ReadOnly="true" ID="txtPembayaran" Visible="true" runat="server" CssClass="form-control"></asp:TextBox>



                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col">
                            &nbsp;
                        &nbsp;
                        &nbsp;
                        
                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function senddataDetail(value0, value1, value2, value3, value4) {
            console.log(value0, value1, value2, value3, value4)
            var a = document.getElementById('ContentPlaceHolder2_txtidD')
            a.value = value0

            var b = document.getElementById('ContentPlaceHolder2_txtNamaSender')
            b.value = value1

            var c = document.getElementById('ContentPlaceHolder2_txtNoReken')
            c.value = value2

            var d = document.getElementById('ContentPlaceHolder2_txtPembayaran')
            d.value = value3
             var bukti = document.getElementById('ContentPlaceHolder2_image')
            bukti.value = value4


            //var d = document.getElementById('ContentPlaceHolder2_rbKonfir')
            //d.value = value1
        }
    </script>
    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel16">Konfirmasi Pembayaran</h4>
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
                                    <asp:TextBox ID="TXTID" type="hidden" runat="server"></asp:TextBox>
                                     <asp:TextBox ID="txtidu" type="hidden" runat="server"></asp:TextBox>
                                    <asp:RadioButtonList ID="rbKonfir" runat="server" RepeatDirection="Horizontal" Width="100%">
                                        <asp:ListItem Text="Diterima"  Value="Diterima" />
                                        <asp:ListItem Text="Ditolak"  Value="Ditolak" />
                                    </asp:RadioButtonList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="rbKonfir" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValForm" EnableClientScript="true">
                                    </asp:RequiredFieldValidator>--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="rbKonfir" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="Isi Data Terlebih Dahulu" SetFocusOnError="true" ValidationGroup="valAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
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

        function senddataDetail(value0, value1, value2, value3) {
            console.log(value0, value1, value2, value3)
            var a = document.getElementById('ContentPlaceHolder2_txtidD')
            a.value = value0

            var b = document.getElementById('ContentPlaceHolder2_txtNamaSender')
            b.value = value1

            var c = document.getElementById('ContentPlaceHolder2_txtNoReken')
            c.value = value2

            var d = document.getElementById('ContentPlaceHolder2_txtPembayaran')
            d.value = value3
            //var d = document.getElementById('ContentPlaceHolder2_rbKonfir')
            //d.value = value1
        }
        function senddata(value0) {
            console.log(value0)
            var c = document.getElementById('ContentPlaceHolder2_TXTID')
            c.value = value0

            var d = document.getElementById('ContentPlaceHolder2_txtidu')
            d.value = value1
        }
    </script>




</asp:Content>
