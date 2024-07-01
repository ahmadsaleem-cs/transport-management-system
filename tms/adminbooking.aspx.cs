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
    
    public partial class adminbooking : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //issue
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into bookings(BID,sid,userid) values(@BID,@sid,@userid)", con);
                cmd.Parameters.AddWithValue("@BID", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@sid", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@userid", TextBox2.Text.Trim());
                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Booking is Successfully issued');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //Update
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Checkifbookingexist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Update bookings set sid=@sid, userid=@userid where driverid='" + TextBox3.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@sid", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@userid", TextBox2.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearForm();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Update is done successfully');</script>");


                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Booking ID');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Checkifbookingexist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from bookings WHERE BID='" + TextBox3.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Booking is Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid booking ID');</script>");
            }
        }
        void clearForm()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox2.Text = "";
                    }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("Select * from bookings where BID='" + TextBox3.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TextBox4.Text = dr.GetValue(1).ToString();
                    TextBox2.Text = dr.GetValue(2).ToString();
                   


                }

            }
            else
            {

                Response.Write("<script>alert('Invalid Credentials');</script>");


            }
        }
        bool Checkifbookingexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from bookings where BID='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {

                    return false;
                }

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

    }
}