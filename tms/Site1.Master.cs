using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace tms
{
    public partial class Site1 : MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["role"].Equals(""))
                {
                    LinkButton4.Visible = true;
                    LinkButton1.Visible = true;
                    LinkButton7.Visible = true;
                    LinkButton5.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton2.Visible = false; //driver
                    LinkButton8.Visible = false;  //bookings
                    LinkButton6.Visible = false;   //schedule
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;

                }
                else if(Session["role"].Equals("user"))
                {
                    LinkButton4.Visible = true;
                    LinkButton1.Visible = false; //login button
                    LinkButton7.Visible = false;  //admin button
                    LinkButton5.Visible = true; //hello user
                    LinkButton3.Visible = true;   //logout
                    LinkButton2.Visible = false; //driver
                    LinkButton8.Visible = true;  //bookings
                    LinkButton6.Visible = false;   //schedule
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;

                    LinkButton5.Text = "Hello " + Session["username"].ToString();


                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton4.Visible = false;
                    LinkButton1.Visible = false; //login button
                    LinkButton7.Visible = false;  //admin button
                    LinkButton2.Visible = true; //driver
                    LinkButton8.Visible = false;  //bookings
                    LinkButton6.Visible = true;   //schedule

                    LinkButton5.Visible = true;
                    LinkButton3.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;



                    LinkButton5.Text = "Hello Admin";


                }


            }
            catch(Exception ex)
            {

            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }
        
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("admindriver.aspx");
        }
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking.aspx");
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminUserManage.aspx");
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewschedule.aspx");
        }
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("schedulemanagement.aspx");
        }
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbooking.aspx");
        }
            protected void LinkButton3_Click(object sender, EventArgs e)
        {
            delete();
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            LinkButton4.Visible = true;
            LinkButton1.Visible = true;
            LinkButton7.Visible = true;
            LinkButton5.Visible = false;
            LinkButton3.Visible = false;
            LinkButton2.Visible = false; //driver
            LinkButton8.Visible = false;  //bookings
            LinkButton6.Visible = false;   //schedule
            LinkButton10.Visible = false;
            LinkButton9.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        void delete()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd2 = new SqlCommand("delete from userlogin", con);
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            catch(Exception ex)
            {

            }
        }
    }
}