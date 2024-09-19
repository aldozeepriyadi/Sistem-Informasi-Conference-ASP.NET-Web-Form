<%@ Page Title="" Language="C#" MasterPageFile="~/PageReviewer.Master" AutoEventWireup="true" CodeBehind="fullpaperrev.aspx.cs" Inherits="SIMC.WebForm15" ValidateRequest="false" %>

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
                                <asp:BoundField DataField="IdDetailFpp" HeaderText="Id Detail Fullpaper" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdDetailFpp" />
                                <asp:BoundField DataField="IdFullpaper" HeaderText="Id Fullpaper" Visible="false" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdFullpaper" />
                                <asp:BoundField DataField="statusKarya" HeaderText="Status" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="title" />
                                <asp:BoundField DataField="namaUser" HeaderText="Reviewer" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="topic" />
                                <asp:BoundField DataField="keterangan" HtmlEncode="false" HeaderText="Catatan Revisi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="Reviewer" />
                                <asp:BoundField DataField="topic" HeaderText="Topik " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                                <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="keterangan" />
                                <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                                <asp:BoundField DataField="deadlineRevisi" HeaderText="Deadline" Visible="false" NullDisplayText="-" DataFormatString="{0:dd MMMM yyyy}" ItemStyle-HorizontalAlign="left" SortExpression="deadlineRevisi" />

                                <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton runat="server" ID="LinkManage" CommandName="Manage" CssClass="btn icon icon-left btn-warning" CommandArgument='<%#Eval("IdDetailFpp") %>' ToolTip="Review"><span style="color:black;" class="bi bi-pencil-square" aria-hidden="true">
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
    <div class="container-fluid">
        <div class="row" id="ManageFullpaper" runat="server">
            <div class="col">
                <div class="form-group">
                    <%--<label>ID USER</label>--%>
                    <br />
                    <asp:TextBox ID="txtid" type="Hidden" runat="server"></asp:TextBox>
                    <asp:Label ID="lblId" runat="server"></asp:Label>
                    <asp:Label ID="lblId2" Visible="false" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Pilih Status</label><br />
                    <asp:DropDownList ID="DDLStatusFullpaper" CssClass="form-select" runat="server">
                        <asp:ListItem Text="" Value="">Pilih Status</asp:ListItem>
                        <asp:ListItem Text="OK" Value="OK">OK</asp:ListItem>
                        <asp:ListItem Text="Revisi" Value="Revisi">Revisi</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DDLStatusFullpaper" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />
                    <div class='form-group mandatory'>
                        <asp:Label ID="Label14" Text="*" ForeColor="Red" runat="server"></asp:Label>
                        <label>Catatan Revisi</label>
                        <asp:TextBox ID="txtCatatanRevisiFullpaper" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <script type="text/javascript" lang="javascript">
                            CKEDITOR.replace('<%=txtCatatanRevisiFullpaper.ClientID%>');
                        </script>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtCatatanRevisiFullpaper" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <label>Deadline Revisi</label>
                    <asp:TextBox ID="txtTanggalRevisi" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTanggalRevisi" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />



                    <div class="w-100"></div>
                    <div class="col">

                        <asp:Button ID="btnManage" runat="server" Text="Simpan" CssClass="btn btn-primary" OnClick="BtnEditSubmit_Click" ValidationGroup="ValAdd" />
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Kembali" CssClass="btn btn-danger" OnClick="BtnEditCancel_Click" />


                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
