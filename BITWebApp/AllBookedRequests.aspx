<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllBookedRequests.aspx.cs" Inherits="BITWebApp.AllBookedRequests" %>

<!DOCTYPE html>

<link href="BootStrap/CSS/bootstrap.css" rel="stylesheet" />

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
        <img src="Images/bit-logo.png" height="60" width="60" alt="logo" />
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="HomePage.aspx">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Login.aspx" >Logout</a>
            </li>
            <li>
                <a class="nav-link" href="NewRequest.aspx">Make an IT Request</a>
            </li>
        </ul>
    </div>
</nav>

<form runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div style="text-align: center">
                                    <h4>All Bookings </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="gvAllBookings"
                                    CssClass="table table-striped table-bordered"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div style="text-align: center">
                                    <h4>All Completed Bookings </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="gvCompletedBookings"
                                    CssClass="table table-striped table-bordered"
                                    runat="server" OnRowCommand="gvCompletedBookings_RowCommand">
                                    <columns>
                                         <asp:TemplateField HeaderText="Action">
                                             <ItemTemplate>
                                                 <asp:Button ID="btnConfirm" runat="server" CommandName="Confirm"
                                                     Height="40px" Text="Verify" Width="80px"
                                                     CommandArgument="<%#Container.DataItemIndex %>"/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div style="text-align: center">
                                    <h4>All Rejected Bookings </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="gvRejectedBookings"
                                    CssClass="table table-striped table-bordered"
                                    runat="server" OnRowCommand="gvRejectedBookings_RowCommand">
                                    <columns>
                                         <asp:TemplateField HeaderText="Action">
                                             <ItemTemplate>
                                                 <asp:Button ID="btnReBook" runat="server" CommandName="Book"
                                                     Height="40px" Text="Re-Book" Width="80px"
                                                     CommandArgument="<%#Container.DataItemIndex %>"/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div style="text-align: center">
                                    <h4>Available Sessions </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="gvAvailableSessions"
                                    CssClass="table table-striped table-bordered"
                                    runat="server" OnRowCommand="gvAvailableSessions_RowCommand">
                                    <columns>
                                         <asp:TemplateField HeaderText="Action">
                                             <ItemTemplate>
                                                 <asp:Button ID="Button1" runat="server" CommandName="Select"
                                                     Height="40px" Text="Confirm" Width="80px"
                                                     CommandArgument="<%#Container.DataItemIndex %>"/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </columns>

                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
