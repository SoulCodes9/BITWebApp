<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BITWebApp.Login" %>

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
<form runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="150px" src="Images/bitI-logo-unbit.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Member Login</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail"
                                        runat="server" placeholder="Email Address">
                                    </asp:TextBox>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPassword"
                                        runat="server" placeholder="Password" TextMode="Password">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg"
                                        ID="btnLogin" runat="server" Text="Login"
                                        OnClick="btnLogin_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="ClientRego.aspx">
                                        <input
                                            class="btn btn-secondary btn-block btn-lg"
                                            id="Button2" type="button" value="Sign Up" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
