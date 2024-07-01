<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedulemanagement.aspx.cs" Inherits="tms.schedulemanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                             <h4>Schedule</h4>
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
                        <label>Schedule ID</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Schedule ID"></asp:TextBox>
                         
                         
                            <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click"   />
                         </div>
                             </div>
                         
                     </div>

                     <div class="col-md-4">
                        <label>From City</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="From City" ></asp:TextBox>

                         </div>
                         
                     </div>
   

                 
                     <div class="col-md-5">
                        <label>To City</label>
                         <div class="form-group">
                             <div class="input-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="To City"></asp:TextBox>
                         </div>
                         </div>                        
                     </div>
                     </div>
           
                 
                 <div class="row">
                     <div class="col-md-5">
                        <label>Duration</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Duration" ></asp:TextBox>

                         </div>
                         </div>
                       
                      
                <div class="col-md-5">
                        <label>Price</label>
                      <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Price" ></asp:TextBox>

                         </div>
                         
                     </div>
            

                 </div>

                 <div class="row">
                     <div class="col-md-4">
                        <label>Departure Time</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Departure Time" ></asp:TextBox>

                         </div>
                         </div>
                        
                      
                <div class="col-md-4">
                     <div class="form-group">
                        <label>Arival Time</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Arrival Time" ></asp:TextBox>

                         </div>
                         
                     </div>
                       <div class="col-md-4">
                        <label>Date</label>
                         <div class="form-group">
                             <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Date" Textmode="Date" ></asp:TextBox>

                         </div>
                         </div>

                 </div>



                  <div class="row">
                   <div class="col-3">
                         <asp:Button type="button" class="btn btn-success btn-block btn-lg" ID="Button1" runat="server"  Text="Add" OnClick="Button1_Click"   />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-primary btn-block btn-lg" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click"  />
                     </div>
                     <div class="col-3">
                         <asp:Button type="button" class="btn btn-danger btn-block btn-lg" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click"  />
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
                             <h4>Schedule</h4>
                             
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tmsdatabaseDBConnectionString2 %>" SelectCommand="SELECT * FROM [schedule]"></asp:SqlDataSource>
                         <asp:GridView class="table table-striped table-bordered table-dark"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SID" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <asp:BoundField DataField="SID" HeaderText="SID" ReadOnly="True" SortExpression="SID" />
                                 <asp:BoundField DataField="Fromcity" HeaderText="Fromcity" SortExpression="Fromcity" />
                                 <asp:BoundField DataField="Tocity" HeaderText="Tocity" SortExpression="Tocity" />
                                 <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                 <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                 <asp:BoundField DataField="Departuretime" HeaderText="Departuretime" SortExpression="Departuretime" />
                                 <asp:BoundField DataField="Arrivaltime" HeaderText="Arrivaltime" SortExpression="Arrivaltime" />
                                 <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                             </Columns>
                            
                         </asp:GridView>


                     </div>
                 </div> 

                  <div class="row">
                   
                 </div> 

                  


         
             </div>
         </div>
        </div>


        </div>
</asp:Content>
