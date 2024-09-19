<%@ Page Title="" Language="C#" MasterPageFile="~/LandingPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SIMC.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="home-center">
                <div class="home-desc-center">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row justify-content-between">
                                            <div class="col-auto">
                                                <form class="d-flex flex-wrap align-items-center">
                                                    <label for="inputPassword2" class="visually-hidden">Search</label>
                                                    <div class="me-3">
                                                        <input type="search" class="form-control my-1 my-lg-0" id="inputPassword2" placeholder="Search">
                                                    </div>
                                                    <label for="status-select" class="me-2">Sebelum Publish</label>
                                                    <div class="me-sm-3">
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Tahun</option>
                                                            <option value="1">2019</option>
                                                            <option value="2">2020</option>
                                                            <option value="3">2021</option>
                                                            <option value="4">2022</option>
                                                        </select>
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Bulan</option>
                                                            <option label="January" value="01">January</option>
                                                            <option label="February" value="02">February</option>
                                                            <option label="March" value="03">March</option>
                                                            <option label="April" value="04">April</option>
                                                            <option label="May" value="05">May</option>
                                                            <option label="June" value="06">June</option>
                                                            <option label="July" value="07">July</option>
                                                            <option label="August" value="08">August</option>
                                                            <option label="September" value="09">September</option>
                                                            <option label="October" value="10">October</option>
                                                            <option label="November" value="11">November</option>
                                                            <option label="December" value="12">December</option>
                                                        </select>
                                                        
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Tanggal</option>
                                                        <option label="01" value="1">01</option>
                                                        <option label="02" value="2">02</option>
                                                        <option label="03" value="3">03</option>
                                                        <option label="04" value="4">04</option>
                                                        <option label="05" value="5">05</option>
                                                        <option label="06" value="6">06</option>
                                                        <option label="07" value="7">07</option>
                                                        <option label="08" value="8">08</option>
                                                        <option label="09" value="9">09</option>
                                                        <option label="10" value="10">10</option>
                                                        <option label="11" value="11">11</option>
                                                        <option label="12" value="12">12</option>
                                                        <option label="13" value="13">13</option>
                                                        <option label="14" value="14">14</option>
                                                        <option label="15" value="15">15</option>
                                                        <option label="16" value="16">16</option>
                                                        <option label="17" value="17">17</option>
                                                        <option label="18" value="18">18</option>
                                                        <option label="19" value="19">19</option>
                                                        <option label="20" value="20">20</option>
                                                        <option label="21" value="21">21</option>
                                                        <option label="22" value="22">22</option>
                                                        <option label="23" value="23">23</option>
                                                        <option label="24" value="24">24</option>
                                                        <option label="25" value="25">25</option>
                                                        <option label="26" value="26">26</option>
                                                        <option label="27" value="27">27</option>
                                                        <option label="28" value="28">28</option>
                                                        <option label="29" value="29">29</option>
                                                        <option label="30" value="30">30</option>
                                                        <option label="31" value="31">31</option>
                                                        </select>

                                                    </div>
                                                    
                                                    <label for="status-select" class="me-2">Sesudah Publish</label>
                                                    <div class="me-sm-3">
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Tahun</option>
                                                            <option value="1">2019</option>
                                                            <option value="2">2020</option>
                                                            <option value="3">2021</option>
                                                            <option value="4">2022</option>
                                                        </select>
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Bulan</option>
                                                            <option label="January" value="01">January</option>
                                                            <option label="February" value="02">February</option>
                                                            <option label="March" value="03">March</option>
                                                            <option label="April" value="04">April</option>
                                                            <option label="May" value="05">May</option>
                                                            <option label="June" value="06">June</option>
                                                            <option label="July" value="07">July</option>
                                                            <option label="August" value="08">August</option>
                                                            <option label="September" value="09">September</option>
                                                            <option label="October" value="10">October</option>
                                                            <option label="November" value="11">November</option>
                                                            <option label="December" value="12">December</option>
                                                        </select>
                                                        
                                                        <select class="form-select my-1 my-lg-0" id="status-select">
                                                            <option selected="">Tanggal</option>
                                                        <option label="01" value="1">01</option>
                                                        <option label="02" value="2">02</option>
                                                        <option label="03" value="3">03</option>
                                                        <option label="04" value="4">04</option>
                                                        <option label="05" value="5">05</option>
                                                        <option label="06" value="6">06</option>
                                                        <option label="07" value="7">07</option>
                                                        <option label="08" value="8">08</option>
                                                        <option label="09" value="9">09</option>
                                                        <option label="10" value="10">10</option>
                                                        <option label="11" value="11">11</option>
                                                        <option label="12" value="12">12</option>
                                                        <option label="13" value="13">13</option>
                                                        <option label="14" value="14">14</option>
                                                        <option label="15" value="15">15</option>
                                                        <option label="16" value="16">16</option>
                                                        <option label="17" value="17">17</option>
                                                        <option label="18" value="18">18</option>
                                                        <option label="19" value="19">19</option>
                                                        <option label="20" value="20">20</option>
                                                        <option label="21" value="21">21</option>
                                                        <option label="22" value="22">22</option>
                                                        <option label="23" value="23">23</option>
                                                        <option label="24" value="24">24</option>
                                                        <option label="25" value="25">25</option>
                                                        <option label="26" value="26">26</option>
                                                        <option label="27" value="27">27</option>
                                                        <option label="28" value="28">28</option>
                                                        <option label="29" value="29">29</option>
                                                        <option label="30" value="30">30</option>
                                                        <option label="31" value="31">31</option>
                                                        </select>

                                                    </div>
                                                     <br>
                                                                        
                                                        <label for="inputPassword2" class="visually-hidden">Search</label>
                                                        <div class="me-3">
                                                        <input type="search" class="form-control my-1 my-lg-0" id="inputPassword2" placeholder="Author">
                                                        </div>    
                                                    <br>
                                                    </div> 
                                                    </div>  
                                                    <br>
                                                    <div class="col-auto">
                                                        <div class="text-lg-left my-1 my-lg-0">
                                                            <button type="button" class="btn btn-success waves-effect waves-light me-1"><i class="mdi mdi-cog"></i>Search</button>
                                                            
                                                        </div>
                                                </form>
                                            </div>
                                            
                                            </div><!-- end col-->
                                        </div> <!-- end row -->
                                    </div>
                                </div> <!-- end card -->
                            </div> <!-- end col-->
                        </div>
                            
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end container-fluid -->
                </div>
            </div>
</asp:Content>
