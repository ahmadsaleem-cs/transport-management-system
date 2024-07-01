<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbooking.aspx.cs" Inherits="tms.adminbooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-6" >
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
                             <h4>Passenger Booking</h4>
                             <span>Booking Status</span>
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
                        <label>Booking ID</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Booking ID"></asp:TextBox>
                         
                         
                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click"  />
                         </div>
                             </div>
                         
                     </div>

                     <div class="col-md-6">
                        <label>Schedule ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="SID"></asp:TextBox>

                         </div>
                         
                     </div>
                 </div> 

                  <div class="row">
                     <div class="col-md-6">
                        <label>User ID</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="User ID"></asp:TextBox>

                         </div>                        
                     </div>
             
                 </div> 
                

              

                         
                 <div class="row">
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Issue" OnClick="Button1_Click" />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-primary btn-block btn-lg" ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-danger btn-block btn-lg" ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                     </div>
                 </div> 
                 



             </div>

         </div>

         <a href="homepage.aspx"><< HomePage</a><br />

        </div>
        <div class="col-md-6">
            <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <center>
                            <img src="imgs/generic_banner_Ind.png" width="100"  height="100" />
                         </center>
                          
                     </div>
                 </div>
                 <div class="row">
                     <div class="col">
                         <center>
                             <h4>Passenger Booking</h4>
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
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tmsdatabaseDBConnectionString2 %>" SelectCommand="SELECT * FROM [bookings]"></asp:SqlDataSource>
                         <asp:GridView class="table table-striped table-bordered table-dark"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BID" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="BID" HeaderText="BID" ReadOnly="True" SortExpression="BID" />
                                 <asp:BoundField DataField="sid" HeaderText="sid" SortExpression="sid" />
                                 <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
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
