<%@ Page Title="" Language="C#" MasterPageFile="~/PagePeserta.Master" AutoEventWireup="true" CodeBehind="SubFullpaper.aspx.cs" Inherits="SIMC.SubFullpaperr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Submit Fullpaper</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Author.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Submit Fullpaper</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" 

    <!-- OPEN TAG VIEW Tanggal-->
    <div class="container-fluid">
        <div class="row" id="ViewSubFullpaper" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGSubFullpaper" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdAbstrak" Visible="true" HeaderText="id abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="Topic" HeaderText="Topik" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="Topic" />
                                <asp:BoundField DataField="statusKarya" HeaderText="Status Karya" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                                <asp:BoundField DataField="statusDistribusi" HeaderText="Status Distribusi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusDistribusi" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                         <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn icon icon-left btn-primary" OnClientClick=' <%# "senddata(`" + Eval("IdAbstrak") + "`,`" + Eval("title") + "`,`" + Eval("Topic")  +"`);"%> ' data-bs-toggle="modal" data-bs-target="#modaledit" >
                             
                                        <span class="bi bi-file-earmark-arrow-up" aria-hidden="true">
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
    <!-- CLOSE TAG VIEW Tanggal-->
    <!--Modal Xl size -->
    <div class="me-1 mb-1 d-inline-block">
        <!--Extra Large Modal -->
        <div class="modal fade text-left w-100" id="modaledit" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel16" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
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
                                <asp:TextBox ID="TxtIdAbstract" type="hidden" runat="server" CssClass="form-control"></asp:TextBox>
                                <!-- View Judul -->
                                <asp:Label ID="Label4" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Judul</label>
                                <asp:TextBox Readonly="true" ID="TxtViewJudul" runat="server" CssClass="form-control"></asp:TextBox>
                                <br />
                                <!-- View Topic --><asp:Label ID="Label5" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Topic</label>
                                <asp:TextBox Readonly="true" ID="TxtViewTopic" runat="server" CssClass="form-control"></asp:TextBox>
                               <br />

                                <!-- Bukti Pembayaran -->
                                <asp:Label ID="Label2" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>File Fullpaper</label>
                                <asp:FileUpload class="form-control" ID="fileuploadPdfFpp" runat="server" />
                                <asp:RegularExpressionValidator ControlToValidate="fileuploadPdfFpp"
                                    ValidationExpression="^.*\.(pdf)$" runat="server" Text="Only .pdf file formats are allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" EnableClientScript="True" />
                                <br />


                                <!-- Bukti Pembayaran -->
                                <asp:Label ID="Label3" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>File Presentasi</label>
                                <asp:FileUpload class="form-control" ID="fileuploadPpt" runat="server" />
                                <asp:RegularExpressionValidator ControlToValidate="fileuploadPpt"
                                    ValidationExpression="^.*\.(pptx)$" runat="server" Text="Only .pptx file formats are allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" EnableClientScript="True" />
                                <br />


                                <!-- Link Video -->
                                <asp:Label ID="Label1" Text="*" ForeColor="Red" runat="server"></asp:Label>
                                <label>Link Video</label>
                                <asp:TextBox  ID="TxtTambahLink" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTambahLink" runat="server"
                                    Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                                </asp:RequiredFieldValidator>
                                <br />


                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnSubmitAdd" runat="server" Text="Simpan" CssClass="btn btn-primary ml-1" OnClick="BtnSubmitAdd_Click" ValidationGroup="ValAdd" />
                        <i class="bx bx-x d-block d-sm-none"></i>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function senddata(value0, value1, value2) {
            console.log(value0, value1, value2)
            var a = document.getElementById('ContentPlaceHolder2_TxtIdAbstract')
            a.value = value0
            var b = document.getElementById('ContentPlaceHolder2_TxtViewJudul')
            b.value = value1
            var c = document.getElementById('ContentPlaceHolder2_TxtViewTopic')
            c.value = value2
        }
    </script>
    

</asp:Content>
