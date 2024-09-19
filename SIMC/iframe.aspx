<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe.aspx.cs" Inherits="SIMC.iframe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div
              <!-- OPEN TAG VIEW Prosiding-->
    <div class="container-fluid">
        <div class="row" id="ViewProsiding" runat="server">
            <div class="card">
                <div class="card-header">
                    <div id="BtnAction" runat="server">
                        <asp:LinkButton runat="server" CssClass="btn icon icon-left btn-primary" data-bs-toggle="modal" data-bs-target="#tambahdata" ><span class="bi bi-plus-circle"> Tambah</span></asp:LinkButton>

                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive my-3">
                        <asp:GridView runat="server" ID="DGProsiding" CssClass="table table-bordered table-hover table-responsive datatbemp" OnRowCommand="DGProsiding_RowCommand" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="year" HeaderText="Tahun" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="year" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="namaUser" Visible="false" HeaderText=" User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="namaUser" />
                                <asp:BoundField DataField="IdProsiding" Visible="false" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" HeaderText=" User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdProsiding" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Nama Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="ProsidingFile" Visible="false" HeaderText="ProsidingFile " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="ProsidingFile" />

                                <asp:TemplateField HeaderText="ProsidingFile" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="ProsidingFile" CommandName="LihatPDF" runat="server" CommandArgument='<%#Eval("ProsidingFile")%>'  Text='<%# Bind("ProsidingFile") %>'></asp:LinkButton>
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
        </div></div>
        <div id="viewpdf" runat="server" visible="false">
            <iframe src="#" id="pdf" runat="server" width="100%" height="700px"></iframe>
        </div>
        </div>
    </form>
</body>
</html>
