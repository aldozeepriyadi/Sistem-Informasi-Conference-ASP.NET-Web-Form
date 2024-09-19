<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KelAuthor.aspx.cs" Inherits="SIMC.KelAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>List Author</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="SuperAdmin.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">List Author</li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />


    <!-- OPEN TAG VIEW Truk-->
    <div class="container-fluid">
        <div class="row" id="ViewAuthor" runat="server">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGAuthor" CssClass="table table-bordered table-hover datatbemp" Width="100%" AutoGenerateColumns="false">

                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="email" HeaderText="Email" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="email" />
                            <asp:BoundField DataField="namaUser" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaUser" />
                            <asp:BoundField DataField="role" HeaderText="Role" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="role" />
                            <asp:BoundField DataField="address" HeaderText="Alamat" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="address" />
                            <asp:BoundField DataField="instance" HeaderText="Instansi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="instance" />
                            <asp:BoundField DataField="phone" HeaderText="No Telpon" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="phone" />
                            <asp:BoundField DataField="gender" HeaderText="Jenis Kelamin" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="gender" />
                            <asp:BoundField DataField="kategori" HeaderText="Jenis Status" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="kategori" />
                            <asp:BoundField DataField="LastEducation" HeaderText="Pendidikan Terakhir" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="LastEducation" />
                            <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
                        </asp:GridView>
                        </div>
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

    <!-- CLOSED TAG VIEW Truk-->
</asp:Content>
