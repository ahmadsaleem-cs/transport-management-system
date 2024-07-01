<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewschedule.aspx.cs" Inherits="tms.viewschedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="css/AboutusSheet.css" rel="stylesheet" />
     <div class="about-section">
  <h1>Schedule List</h1>
  <p>TMS has been very recognized for its efficient services</p>
  <p>This below schedule will be followed.</p>
</div>


    <div class="row" style="padding:50px 50px 50px 300px">
       <div class="col-md-30" id="driver">
         <div class="card" style="background-color:#E0E0E0">
             <div class="card-body">
                 <div class="row">
                     <div class="col-5"
                         <centre>
                         <h3>View Schedule</h3>
                            </centre>

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
                 </div>
             </div>
           </div>
        </div>

</asp:Content>
