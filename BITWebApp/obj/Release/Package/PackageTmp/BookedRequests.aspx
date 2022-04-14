<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookedRequests.aspx.cs" Inherits="BITWebApp.BookedRequests" %>

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
                                    <h4>Booked Sessions </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!--  -->
                            <div class="col-12">
                                <asp:GridView ID="gvBookedSessions"
                                    CssClass="table table-striped table-bordered"
                                    runat="server"
                                    OnRowCommand="gvBookedSessions_RowCommand">
                                    <columns>
                            <asp:TemplateField HeaderText="Accept Request">
                                <ItemTemplate>
                                    <asp:Button ID="btnAccept" runat="server" CommandName="Accept"
                                        Height="40px" Text="Accept" Width="80px"
                                        CommandArgument="<%#Container.DataItemIndex %>"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject Request">
                                <ItemTemplate>
                                    <asp:Button ID="btnReject" runat="server" CommandName="Reject"
                                        Height="40px" Text="Reject" Width="80px"
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
                                    <h4>Accepted Sessions </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!--  -->
                            <div class="col-12">
                                <asp:GridView ID="gvAcceptedSessions"
                                    CssClass="table table-striped table-bordered"
                                    runat="server" OnRowCommand="gvAcceptedSessions_RowCommand">
                                    <columns>
                            <asp:TemplateField HeaderText="Complete Session">
                                <ItemTemplate>
                                    <asp:Button ID="btnComplete" runat="server" CommandName="Complete"
                                        Height="40px" Text="Complete" Width="80px"
                                        CommandArgument="<%#Container.DataItemIndex %>"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kilometers Travelled">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtKilometers" runat="server" 
                                        Height="40px" Text="0" Width="80px" />                                        
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
