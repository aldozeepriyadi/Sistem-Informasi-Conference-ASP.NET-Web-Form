<%@ Page Title="" Language="C#" MasterPageFile="~/PageReviewer.Master" AutoEventWireup="true" CodeBehind="ReviewFullpaper.aspx.cs" Inherits="SIMC.ReviewFullpaper" ValidateRequest="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
   <style type="text/css">
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

            .switch input {
                opacity: 0;
            }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

            .slider.round:before {
                border-radius: 50%;
            }
    </style>
    <div class="container-fluid">
        <div class="table-responsive my-3">
            <div class="row" id="ViewFullpaper" runat="server">
                <div runat="server">
                    <asp:GridView runat="server" ID="DGReviewFullpaper" CssClass="datatbemp" Width="100%" AutoGenerateColumns="false"
                        OnRowCommand="DGReviewFullpaper_RowCommand" OnPageIndexChanging="DGReviewFullpaper_PageIndexChanging" OnSorting="DGReviewFullpaper_Sorting" OnSelectedIndexChanged="DGReviewFullpaper_SelectedIndexChanged">
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
                            <asp:BoundField DataField="keterangan" HeaderText="Catatan Revisi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="Reviewer" />
                            <asp:BoundField DataField="topic" HeaderText="Topik " NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="statusKarya" />
                            <asp:BoundField DataField="title" HeaderText="Judul" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="keterangan" />
                            <asp:BoundField DataField="nameEvent" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="nameEvent" />
                            <asp:BoundField DataField="submittedbyID" HeaderText="Event" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="submittedbyID" />
                            <asp:BoundField DataField="deadlineRevisi" HeaderText="Deadline" NullDisplayText="-" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="left" SortExpression="deadlineRevisi" />

                            <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>

                                    <%--<asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'--%>
                                    <asp:LinkButton runat="server" ID="LinkManage" CommandName="Manage" CssClass="btn btn-primary mb-2" CommandArgument='<%#Eval("IdDetailFpp") %>' ToolTip="Manage">
                                        <span class="bi-pencil" aria-hidden="true">
                                        </span>Manage</asp:LinkButton>
                                    <%--<asp:LinkButton runat="server" ID="linkEdit" class="btn btn-primary mb-2" CommandName="Manage" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                        ToolTip="Ubah Data Table">Manage</asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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

            <div class="card">
            </div>

        </div>
    </div>


    <div class="container-fluid">
        <div class="row" id="ManageFullpaper" runat="server">
            <div class="col">
                <div class="form-group">
                    <%--<label>ID USER</label>--%>
                    <br />
                    <asp:Label ID="lblId" Visible="false" runat="server"></asp:Label>
                    <asp:Label ID="lblId2" Visible="false" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="Label10" Text="*" ForeColor="Red" runat="server"></asp:Label>
                    <label>Pilih Status</label><br />
                    <asp:DropDownList ID="DDLStatusFullpaper" CssClass="form-select" runat="server">
                        <asp:ListItem Text="" Value="">Pilih Status</asp:ListItem>
                        <asp:ListItem Text="OK" Value="OK">OK</asp:ListItem>
                        <asp:ListItem Text="Revisi" Value="Revisi">Revisi</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DDLStatusFullpaper" runat="server"
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
                    <label>Deadline Revisi</label>
                    <asp:TextBox ID="txtTanggalRevisi" runat="server" TextMode="date" Rows="5" CssClass="form-control" Style="resize: none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTanggalRevisi" runat="server"
                        Display="Dynamic" ForeColor="Red" Text="(Required)" SetFocusOnError="true" ValidationGroup="ValAdd" EnableClientScript="True">
                    </asp:RequiredFieldValidator>
                    <br />



                    <div class="w-100"></div>
                    <div class="col">

                        <asp:Button ID="btnManage" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="BtnEditSubmit_Click" DValidationGroup="valAdd" OnClientClick="return functionConfirm(this);" />
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="BtnEditCancel_Click" />


                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
