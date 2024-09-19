<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="KonfirmasiPembayaran.aspx.cs" Inherits="SIMC.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
     <!-- OPEN TAG VIEW Truk-->
    <div class="container-fluid">
        <div class="row" id="ViewUser" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGUser" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="title" HeaderText="Judul" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="NameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="statusPayment" HeaderText="Status Pembayaran" ItemStyle-CssClass="text-capitalize" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusPayment" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%--                                    <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'--%>

                                        <asp:LinkButton ID="LinkButton1" runat="server" Text="Manage" OnClientClick=' <%# "senddata(`" + Eval("statusPayment") + "`,`" + Eval("nameEvent") + "`,`" + Eval("title")  +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit" />

                                        <%-- <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-primary mb-2" data-toogle="modal" data-target="#modaledit" data-role="<%# Eval("role") %>" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                            ToolTip="Ubah Data Table">Manage</asp:LinkButton>--%>
                                        <%--<a id="edituser" data-toggle="modal" data-target="#modaledit" data-email="<%# Eval("email")  %>"--%>
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
                                <asp:Label ID="lblId" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Pilih Event</label>
                                <br />
                                <asp:DropDownList ID="DDLTambahEvent" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DDLTambahEvent" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="TXTID"  runat="server" CssClass="form-control"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Pilih role</label>
                                <br />
                                <asp:DropDownList ID="DDLROLE" CssClass="dropdown-item border border-5 bg-white" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLROLE" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                               
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                       </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function senddata(value0, value1, value2) {
            console.log(value0, value1, value2)
            var a = document.getElementById('ContentPlaceHolder2_DDLROLE')
            a.value = value0
            var b = document.getElementById('ContentPlaceHolder2_DDLTambahEvent')
            b.value = value1
            var c = document.getElementById('ContentPlaceHolder2_TXTID')
            c.value = value2
        }
    </script>
</asp:Content>
