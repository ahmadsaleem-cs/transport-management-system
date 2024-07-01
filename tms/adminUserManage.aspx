<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminUserManage.aspx.cs" Inherits="tms.adminSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-5" id="driver">
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
                             <h4>User Management</h4>
                             <span>User Status</span>
                             <asp:Label Class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Status"></asp:Label>
                         </center>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                        <hr> 
                     </div>
                 </div> 
                 
                 <div class="row">
                     <div class="col-md-3">
                        <label>User ID</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="User ID"></asp:TextBox>
                         
                         
                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click"  />
                         </div>
                             </div>
                         
                     </div>

                     <div class="col-md-4">
                        <label>Full Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>

                         </div>
                         
                     </div>
   

                 
                     <div class="col-md-5">
                        <label>Account Status</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Account Status"></asp:TextBox>
                                 <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                               <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                               <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server"><i class="fas fa-times-circle"></i></asp:LinkButton>
                     
                          
                         </div>
                         </div>                        
                     </div>
                     </div>
           
                 
                 <div class="row">
                     <div class="col-md-3">
                        <label>DOB</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>

                         </div>
                         </div>
                       
                      
                <div class="col-md-4">
                        <label>Contact Number</label>
                      <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Contact Number" ReadOnly="True"></asp:TextBox>

                         </div>
                         
                     </div>
                      <div class="col-md-4">
                        <label>Email ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>

                         </div>
                         
                     </div>

                 </div>

                 <div class="row">
                     <div class="col-md-3">
                        <label>Province</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Province" ReadOnly="True"></asp:TextBox>

                         </div>
                         </div>
                        
                      
                <div class="col-md-4">
                     <div class="form-group">
                        <label>City</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>

                         </div>
                         
                     </div>
                      <div class="col-md-4">
                        <label>Address</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Address" ReadOnly="True"></asp:TextBox>

                         </div>
                         
                     </div>

                 </div>



                  <div class="row">
                   
                     <div class="col-5">
                         <asp:Button type="button" class="btn btn-danger btn-block btn-lg" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
                     </div>
                 </div> 







           
                 



             </div>

         </div>

         <a href="homepage.aspx"><< HomePage</a><br />

        </div>
    
        <div class="col-md-7" id="drive">
            <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <center>
                            <img src="imgs/admin.png" width="100"  height="100" />
                         </center>
                          
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                         <center>
                             <h4>User</h4>
                             <asp:Label Class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Booking Status"></asp:Label>
                         </center>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                        <hr> 
                     </div>
                 </div> 
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tmsdatabaseDBConnectionString2 %>" SelectCommand="SELECT * FROM [usersignup]"></asp:SqlDataSource>
                     <div class="col">
                         <asp:GridView class="table table-striped table-bordered table-dark"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                                 <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                                 <asp:BoundField DataField="dateofbirth" HeaderText="dateofbirth" SortExpression="dateofbirth" />
                                 <asp:BoundField DataField="contactnumber" HeaderText="contactnumber" SortExpression="contactnumber" />
                                 <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                                 <asp:BoundField DataField="province" HeaderText="province" SortExpression="province" />
                                 <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                 <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                 <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                             </Columns>
                         </asp:GridView>


                     </div>
                 </div> 

                  


         
             </div>
         </div>
            </div>
    </div>

</div>
</asp:Content>
