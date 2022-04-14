<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientRego.aspx.cs" Inherits="BITWebApp.ClientRego" %>

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
                <a class="nav-link" href="Login.aspx">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ClientRego.aspx">Register</a>
            </li>
            <li>
                <a class="nav-link" href="a"></a>
            </li>
        </ul>
    </div>
</nav>
<!-- Design of Registration page -->
<form action="#" runat="server">
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
                                    <h4>New Client Sign Up</h4>
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
                                <label>First Name</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server"
                                        placeholder="First Name">
                                    </asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Last Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtLName" runat="server"
                                        placeholder="Last Name">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- this row will be divided into three parts with first two columns with a span of 
                                3 each and last one 6 -->
                            <div class="col-md-3">
                                <label>Date Of Birth (dd/mm/yyyy)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server"
                                        placeholder="Date of Birth" TextMode="Date">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label>Phone Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPhone" MaxLength="10" runat="server"
                                        placeholder="Phone Number">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"
                                        placeholder="Email Address" TextMode="Email">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Address Line</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtStreet" runat="server"
                                        placeholder="Address Line">
                                    </asp:TextBox>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server"
                                        placeholder="Password">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>Suburb</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSuburb" runat="server"
                                        placeholder="Suburb">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlState" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="NSW" Value="NSW" />
                                        <asp:ListItem Text="ACT" Value="ACT" />
                                        <asp:ListItem Text="WA" Value="WA" />
                                        <asp:ListItem Text="QLD" Value="QLD" />
                                        <asp:ListItem Text="TAS" Value="TAS" />
                                        <asp:ListItem Text="NT" Value="NT" />
                                        <asp:ListItem Text="VIC" Value="VIC" />
                                        <asp:ListItem Text="SA" Value="SA" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label>PostCode</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPostCode" runat="server"
                                        placeholder="Post Code" MaxLength="4">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-primary btn-block btn-lg" runat="server"
                                        ID="btnSignUp" OnClick="btnSignUp_Click" Text="Sign Up" Back />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
