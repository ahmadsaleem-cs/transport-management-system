<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="tms.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="background-color:#F1F1F1">
<div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto" >
         <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <center>
                            <img src="imgs/admin.png" width="100" 
     height="100" />
                         </center>
                          
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                         <center>
                             <h4>User SignUp</h4>
                         </center>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                        <hr> 
                     </div>
                 </div> 
                 
                 <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>

                         </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Date of Birth</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 


                 <div class="row">
                     <div class="col-md-6">
                        <label>Contact Number</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>

                         </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Email ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 

                 <div class="row">
                     <div class="col-md-6">
                        <label>Province</label>
                         <div class="form-group">
                             <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server" >

                             <asp:ListItem Text="Select" Value="Select" />
                              <asp:ListItem Text="Punjab" Value="Punjab" />
                              <asp:ListItem Text="Sindh" Value="Sindh" />
                              <asp:ListItem Text="Khyber Pakhtunkhawa" Value="Khyber Pakhtunkhawa" />
                              <asp:ListItem Text="Balochistan" Value="Balochistan" />
                              <asp:ListItem Text="Azad Jammu and Kashmir" Value="Azad Jammu and Kashmir" />
                              <asp:ListItem Text="Jhang" Value="Rajasthan" />
                
                             </asp:DropDownList>
                         </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>City</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>

                         </div>
                         
                     </div>

   

                 </div> 

                 
                     <div class="col">
                        <label>Address</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>

                         </div>
                         
                     </div>

                 <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-success">Enter Login Credentials</span>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>User ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="User ID" TextMode="SingleLine"></asp:TextBox>

                         </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Password</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 

                 
                 <div class="row">
                     <div class="col">
                        
                        <div class="form-group">
                            <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="SIGN UP" OnClick="Button1_Click"  />
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
