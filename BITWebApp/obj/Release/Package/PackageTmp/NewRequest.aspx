<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRequest.aspx.cs" Inherits="BITWebApp.NewRequest" %>

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
                                    <img width="100px" src="Images/bit-user-pic.jpg" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div style="text-align: center">
                                    <h4>New Request </h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Choose where the job needs to be done.</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlLocation"
                                        runat="server" placeholder="Location">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>What do you need assistance with? </label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlSkills"
                                        runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>Session Starting Time </label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlStartTime"
                                        runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="9:00AM" Value="9:00" />
                                        <asp:ListItem Text="10:00AM" Value="10:00" />
                                        <asp:ListItem Text="11:00AM" Value="11:00" />
                                        <asp:ListItem Text="12:00PM" Value="12:00" />
                                        <asp:ListItem Text="01:00PM" Value="13:00" />
                                        <asp:ListItem Text="02:00PM" Value="14:00" />
                                        <asp:ListItem Text="03:00PM" Value="15:00" />
                                        <asp:ListItem Text="04:00PM" Value="16:00" />
                                        <asp:ListItem Text="05:00PM" Value="17:00" />
                                    </asp:DropDownList>
                                </div>
                                 <div class="form-group">
                                     <label>Session Ending Time</label>
                                    <asp:DropDownList CssClass="form-control" ID="ddlEndTime"
                                        runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="9:00AM" Value="9:00" />
                                        <asp:ListItem Text="10:00AM" Value="10:00" />
                                        <asp:ListItem Text="11:00AM" Value="11:00" />
                                        <asp:ListItem Text="12:00PM" Value="12:00" />
                                        <asp:ListItem Text="01:00PM" Value="13:00" />
                                        <asp:ListItem Text="02:00PM" Value="14:00" />
                                        <asp:ListItem Text="03:00PM" Value="15:00" />
                                        <asp:ListItem Text="04:00PM" Value="16:00" />
                                        <asp:ListItem Text="05:00PM" Value="17:00" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- this is where we will add one more new control to select date -->
                                <label>Booking Date </label>
                                <div class="form-group">
                                    <asp:Calendar onSelectionChanged="calBookDate_SelectionChanged"  ID="calBookDate" runat="server"></asp:Calendar>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div style="text-align: center">
                                    <asp:Button CssClass="btn btn-primary btn-block btn-lg"
                                        ID="btnFindSessions" runat="server"
                                        Text="Find a Session"
                                        OnClick="btnFindSessions_Click" />
                                </div>
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
                                                 <asp:Button ID="btnConfirm" runat="server" CommandName="Select"
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
