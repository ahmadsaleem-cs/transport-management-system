<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="tms.Aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/AboutusSheet.css" rel="stylesheet" />
    <div class="container">
   
   <div class="about-section">
  <h1>About Us</h1>
  <p>TMS has been very recognized for its efficient services</p>
  <p>We have the largest nationwide networks to take the passengers to its destionation safely.</p>
</div>
        <div class="row" style="padding-top:100px">
               <div class="col-md-6">

                   <center>
             <img width="400px"  src="imgs/About Us.jpg" />
                       

                   </center>

               </div>

               <div class="col-md-6">

                   <center>
            
                        <h2 style="padding-top:100px">Now you can Book & Purchase your favorite seat without hassle or visiting our terminal.  </h2>
                   </center>

               </div>

           </div>






    <h2 style="text-align:center; padding-top:98px">For any Queries</h2>     
<div class="row" style="padding-top:100px">
    
    <h3 style="text-align:center">Contacts</h3>    
  <div class="col-md-4" >
    <div class="card">
      <img src="imgs/pngegg (3).png"  alt="Mike" style="width:300px">
      <div class="container" >
        <h2>Mike Ross</h2>
        <p class="title">Manager</p>
        <p>Manager of TMS limited</p>
        <p>mike@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="col-md-4">
    <div class="card">
      <img src="imgs/pngegg (3).png" alt="John" style= "width:300px">
      <div class="container">
        <h2>John Doe</h2>
        <p class="title">Assistant Manager</p>
        <p>Assistant Manager of TMS</p>
        <p>john@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
       
    </div>
        </div>

</asp:Content>
