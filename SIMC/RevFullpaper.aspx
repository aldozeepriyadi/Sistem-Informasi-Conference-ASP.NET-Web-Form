<%@ Page Title="" Language="C#" MasterPageFile="~/PageReviewer.Master" AutoEventWireup="true" CodeBehind="RevFullpaper.aspx.cs" Inherits="SIMC.WebForm13" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <script src="ckeditor/ckeditor.js"></script>
    <!-- OPEN TAG VIEW Tanggal-->
    <div class="container-fluid">
        <div class="row" id="ViewFullpaper" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGReviewFullpaper" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false"
                            OnRowCommand="DGReviewFullpaper_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdDetailFpp" HeaderText="Id Detail Fullpaper" Visible="false" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdDetailFpp" />
                                <asp:BoundField DataField="IdFullpaper" HeaderText="Id Fullpaper" Visible="false" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdFullpaper" />
                                <asp:BoundField DataField="statusKarya" HeaderText="Status" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="namaUser" HeaderText="Reviewer" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                <asp:BoundField DataField="keterangan" HtmlEncode="false" HeaderText="Catatan Revisi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="Reviewer" />
                                <asp:BoundField DataField="topic" HeaderText="Topik " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="keterangan" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="deadlineRevisi" HeaderText="Deadline" NullDisplayText="-" DataFormatString="{0:dd MMMM yyyy}" ItemStyle-HorizontalAlign="left" SortExpression="deadlineRevisi" />

                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <%--                                    <asp:LinkButton runat="server" ID="LinkManage" CommandName="Manage" CssClass="btn icon icon-left btn-warning" CommandArgument='<%#Eval("IdDetailFpp") %>' ToolTip="Review"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>--%>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-warning" OnClientClick=' <%# "senddata(`" + Eval("IdFullpaper")  +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
                                                        </span></asp:LinkButton>
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
    </div>
   
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
                            <asp:TextBox ID="TXTID" runat="server" CssClass="form-control"></asp:TextBox>
                            <br />

                            <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                            <label>Pilih Status</label><br />
                            <asp:DropDownList ID="DDLStatusFullpaper" CssClass="form-select" runat="server">
                        <asp:ListItem Text="" Value="">Pilih Status</asp:ListItem>
                        <asp:ListItem Text="OK" Value="OK">OK</asp:ListItem>
                        <asp:ListItem Text="Revisi" Value="Revisi">Revisi</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DDLStatusFullpaper" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                           ]<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DDLStatusFullpaper" runat="server"
                                Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="TextBox1" Style="display: none" runat="server" CssClass="form-control"></asp:TextBox>

                           <div class='form-group mandatory'>
                        <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>Catatan Revisi</label>
                        <asp:TextBox ID="txtCatatanRevisiFullpaper" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <script type="text/javascript" lang="javascript">
                            CKEDITOR.replace('<%=txtCatatanRevisiFullpaper.ClientID%>');
                        </script>
                    </div>
                    <label>Deadline Revisi</label>
                    <asp:TextBox ID="txtTanggalRevisi" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTanggalRevisi" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />



                    <div class="w-100"></div>
                    <div class="col">

                        <asp:Button ID="Edit" runat="server" Text="Simpan" CssClass="btn btn-primary" OnClick="Edit_Click"  CausesValidation="false" />
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Kembali" CssClass="btn btn-danger" OnClick="BtnEditCancel_Click" />

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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
