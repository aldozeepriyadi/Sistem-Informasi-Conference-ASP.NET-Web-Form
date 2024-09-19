<%@ Page Title="" Language="C#" MasterPageFile="~/PageReviewer.Master" AutoEventWireup="true" CodeBehind="riwfullpaper.aspx.cs" Inherits="SIMC.riwfullpaper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Riwayat Fullpaper</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Reviewer.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Riwayat Fullpaper</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://stakpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/extensions/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
    <script src="ckeditor/ckeditor.js"></script>


    <!-- OPEN TAG VIEW Riwayat-->
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive my-3">
                    <div class="row" id="ViewRiwayatFullpaper" runat="server">
                        <asp:GridView runat="server" ID="DGRiwayatFullpaper" OnRowCommand="DGRiwayatFullpaper_RowCommand" CssClass="table table-bordered table-hover table-responsive datatbemp" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IdAbstrak" Visible="false" HeaderText="Id Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdAbstrak" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="topic" HeaderText="topic" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                <asp:BoundField DataField="statusDistribusi" HeaderText="Status Abstrak" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusDistribusi" />
                                <asp:BoundField DataField="kataKunci" HtmlEncode="false" HeaderText="Kata Kunci" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="kataKunci" />
                                <asp:BoundField DataField="kodePaper" HtmlEncode="false" HeaderText="Kata Kunci" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="kodePaper" />
                                <asp:BoundField DataField="deadlineRevisi" HtmlEncode="false" HeaderText="Deadline Revisi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="deadlineRevisi" />
                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                        </asp:GridView>
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
    </div>
    <!-- CLOSED TAG VIEW Riwayat-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
