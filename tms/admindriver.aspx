<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admindriver.aspx.cs" Inherits="tms.admindriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <link href="css/CustomStyleSheet1.css" rel="stylesheet" />
    <div style="background-color:#F1F1F1">
<div class="container"  >
    <div class="row">
        <div class="col-md-6" id="drive">
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
                             <h4>Driver Details</h4>
                             <span>Account Status - </span>
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
                     <div class="col-md-6">
                        <label>Driver ID</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID"></asp:TextBox>
                         
                         
                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click1"  />
                         </div>
                             </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Driver Name</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Driver Name "></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 


                 <div class="row">
                     <div class="col-md-6">
                        <label>Contact Number</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Contact Number" ></asp:TextBox>

                         </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Vehicle No</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Vehicle No" ></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 

                  

                 
                     

               

                         
                 <div class="row">
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-success btn-block btn-lg" ID="Button1" runat="server"  Text="Add"  OnClick="Button1_Click"  />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-primary btn-block btn-lg" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-danger btn-block btn-lg" ID="Button4" runat="server" Text="Delete" Onclick="Button4_Click" />
                     </div>
                 </div> 
                 



             </div>

         </div>

         <a href="homepage.aspx"><< HomePage</a><br />

        </div>
        <div class="col-md-6" id="driver">
            <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <center>
                            <img src="imgs/driver.jpg"  width="100"  height="100" />
                         </center>
                          
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                         <center>
                             <h4>Details</h4>
                             <asp:Label Class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Driver Details"></asp:Label>
                         </center>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                        <hr> 
                     </div>
                 </div> 
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tmsdatabaseDBConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [driver]"></asp:SqlDataSource>
                     <div class="col">
                         <asp:GridView class="table table-striped table-bordered table-dark"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="driverid" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="driverid" HeaderText="driverid" ReadOnly="True" SortExpression="driverid" />
                                 <asp:BoundField DataField="drivername" HeaderText="drivername" SortExpression="drivername" />
                                 <asp:BoundField DataField="contactnumber" HeaderText="contactnumber" SortExpression="contactnumber" />
                                 <asp:BoundField DataField="vehicleno" HeaderText="vehicleno" SortExpression="vehicleno" />
                             </Columns>
                         </asp:GridView>
                     </div>
                 </div> 

                  


         
             </div>
         </div>
            </div>
    </div>

</div>
 </div>
</asp:Content>
