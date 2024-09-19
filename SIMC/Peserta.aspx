﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PagePeserta.Master" AutoEventWireup="true" CodeBehind="Peserta.aspx.cs" Inherits="SIMC.Peserta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />

    <h2>Dashboard</h2>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Author.aspx">Dashboard</a></li>
        </ol>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="row">
        <div class="col-12 col-lg-12">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div
                                    class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon purple mb-2">
                                        <i class="iconly-boldDocument"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">Abstrak Revisi</h6>
                                    <asp:Label ID="lblAbstrakRevisi" CssClass="font-extrabold mb-0" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div
                                    class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon blue mb-2">
                                        <i class="iconly-boldPaper"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">Fullpaper Revisi</h6>
                                    <asp:Label ID="lblFullpaperRevisi" CssClass="font-extrabold mb-0" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div
                                    class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon green mb-2">
                                        <i class="iconly-boldDocument"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">Abstrak Diterima</h6>
                                    <asp:Label ID="lblAbstrakDiterima" CssClass="font-extrabold mb-0" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-4 py-4-5">
                            <div class="row">
                                <div
                                    class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-start ">
                                    <div class="stats-icon red mb-2">
                                        <i class="iconly-boldPaper"></i>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                                    <h6 class="text-muted font-semibold">Fullpaper Diterima</h6>
                                    <asp:Label ID="lblFullpaperDiterima" CssClass="font-extrabold mb-0" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-xl-12">
                    <div class="container-fluid">
                        <div class="row" id="btnAksi" runat="server">
                            <div class="card">
                                <div class="card-header">
                                    <button type="button" class="btn btn-primary btn-icon icon-left">
                                        <i class="bi bi-bell-fill"></i>Notifications
                                        <asp:Label ID="lblnotif" CssClass="badge bg-transparent" runat="server"></asp:Label>
                                    </button>
                                </div>

                                <div class="row" id="ViewNotifikasi" runat="server">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <asp:GridView runat="server" ID="DGPeserta" OnRowCommand="DGPeserta_RowCommand" DataKeys="IdNotif" CssClass="table table-hover table-lg datatbemp" Width="100%" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex +1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="IdUser" Visible="false" HeaderText="Id User" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdUser" />
                                                    <asp:BoundField DataField="message" HeaderText="Notifikasi" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="message" />
                                                     <asp:BoundField DataField="IdNotif" Visible="false" HeaderText="IdNotif" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="IdNotif" />
                                                   <asp:BoundField DataField="status" Visible="false" HeaderText="IdNotif" NullDisplayText="-" ItemStyle-HorizontalAlign="left" SortExpression="status" />
                                                   <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="LinkManage" CommandName="Hapus" CssClass="btn btn-success mb-2" CommandArgument='<%#Eval("IdNotif") %>'>
                                                        <span class="bi bi-check" aria-hidden="true" onclick="return confirm('Yakin sudah membaca notifikasi?');">
                                                        </span></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
</asp:Content>
