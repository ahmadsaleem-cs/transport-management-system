<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="tms.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="css/CustomStyleSheet1.css" rel="stylesheet" />    
    <div style="background-color:#F1F1F1">
    <div class="container" id="loginmain">
    <div class="row">
        <div class="col-md-6 mx-auto">
         <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <center>
                            <img  src="imgs/pngfind.com-user-png-756588.png" width="100" 
     height="100" />
                         </center>
                          
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                         <center>
                             <h3>User Login</h3>
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
                        <label>User ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>

                         </div>
                          <label>Password</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

                         </div>

                         <div class="form-group">
                             <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="LOG IN" OnClientClick="Button" OnClick="Button1_Click" />

                         </div>
                         <div class="form-group">
                             <a href="signup.aspx"> <input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="SIGN UP" /></a>
                         </div>

                     </div>
                 </div> 
                 



             </div>

         </div>

         <a href="homepage.aspx"><< HomePage</a><br />

        </div>

    </div>

</div>
        </div>
</asp:Content>
