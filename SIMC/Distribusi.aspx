<%@ Page Title="" Language="C#" MasterPageFile="~/PageAdmin.Master" AutoEventWireup="true" CodeBehind="Distribusi.aspx.cs" Inherits="SIMC.PemetaanKarya" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Distribusi</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Admin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Distribusi</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive my-3">
                    <div class="row" id="ViewReviewAbstrak" runat="server">
                        <div runat="server">
                            <asp:GridView runat="server" ID="DGReviewAbstrak" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IdAbstrak" Visible="false" HeaderText="Id Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                    <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                    <asp:BoundField DataField="topic" HeaderText="Topik" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                    <asp:BoundField DataField="statusDistribusi" HeaderText="Status Distribusi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusDistribusi" />
                                    <asp:BoundField DataField="reviewedbyID" HeaderText="reviewed by " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="reviewedbyID" />
                                    <asp:BoundField DataField="nameEvent"  Visible="false" HeaderText="nameEvent" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />

                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                          <%--  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak") +  "`,`" + Eval("reviewedby") + "`,`" + Eval("email") + "`,`" + Eval("namaUser") + "`,`" + Eval("nameEvent") + "`,`" + Eval("title") +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit" ><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>--%>

                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak") +  "`,`" + Eval("reviewedbyID") + "`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit" ><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>

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
                        <h4 class="modal-title" id="myModalLabel16">Atur Reviewer</h4>
                        <button type="button" class="close" data-bs-dismiss="modal"
                            aria-label="Close">
                            <i data-feather="x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                    <label>Pilih Reviewer</label>
                                    <br />
                                    <asp:TextBox ID="txtid" type="hidden" runat="server" CssClass="form-control" placeholder="id"></asp:TextBox>
                                    <asp:TextBox Style="display: none" ID="txtnama" runat="server"></asp:TextBox>
                                    <asp:TextBox  Style="display: none" ID="txtevent" runat="server"></asp:TextBox>
                                    <asp:TextBox  Style="display: none" ID="txtemail" runat="server"></asp:TextBox>
                                    <asp:TextBox  Style="display: none" ID="txtjudul" runat="server"></asp:TextBox>
                                    <asp:DropDownList ID="DDLREVIEW" CssClass="dropdown-item border border-5 bg-white"  runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLREVIEW" runat="server"
                                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdd_Click" ValidationGroup="valAdd" />
                            <i class="bx bx-x d-block d-sm-none"></i>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function senddata(value0, value1) {
                console.log(value0, value1)
                var a = document.getElementById('ContentPlaceHolder2_txtid')
                a.value = value0
                var b = document.getElementById('ContentPlaceHolder2_DDLREVIEW')
                b.value = value1
                //var email = document.getElementById('ContentPlaceHolder2_txtemail')
                //console.log(value2)
                //    email.value = value2
                //var nama = document.getElementById('ContentPlaceHolder2_txtnama')
                //nama.value = value3
                //var event = document.getElementById('ContentPlaceHolder2_txtevent')
                //event.value = value4
                // var judul = document.getElementById('ContentPlaceHolder2_txtjudul')
                //judul.value = value5
            }
        </script>
</asp:Content>
