<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BITWebApp.HomePage" %>

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

<img src="Images/bit-background.jpg" class="img-fluid" />


<div class="container">
    <div class="row">
        <div class="col-12">
            <center>
                        <h2 class="header"> Welcome to BIT Services </h2>
                        <p><b> Only the most elite of services for out valued clients </b></p>
                    </center>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <center>
                        <h4> Book Online</h4>
                        <p class="text-justify">Duis aute irure dolor in reprehenderit in
voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor.
reprehenderit</p>
                    </center>
        </div>
        <!-- next column -->
        <div class="col-md-4">
            <center>
                        <h4> Search Sessions </h4>
                        <p class="text-justify">Duis aute irure dolor in reprehenderit in
voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor.
reprehenderit</p>
                    </center>
        </div>
        <!-- Last Column -->
        <div class="col-md-4">
            <div style="text-align: center">
                <h4>Mobile Notifications </h4>
                <p class="text-justify">
                    Duis aute irure dolor in reprehenderit in
voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor.
reprehenderit
                </p>
            </div>
        </div>
    </div>
</div>
