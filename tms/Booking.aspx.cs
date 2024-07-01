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
    public partial class Booking : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //book button
        protected void Button4_Click(object sender, EventArgs e)
        {
            
            if (Checkifbookingexist())
            {
                Response.Write("<script>alert('Already booking exist with this ID. Please enter new id');</script>");
            }
            else
            {
                book();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from schedule where SID='" + TextBox3.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox4.Text = dr.GetValue(1).ToString();
                        TextBox2.Text = dr.GetValue(2).ToString();
                        TextBox7.Text = dr.GetValue(3).ToString();

                        TextBox8.Text = dr.GetValue(4).ToString();
                        TextBox5.Text = dr.GetValue(5).ToString();
                        TextBox6.Text = dr.GetValue(6).ToString();
                        TextBox1.Text = dr.GetValue(7).ToString();


                    }

                }
                else
                {

                    Response.Write("<script>alert('Invalid Credentials');</script>");


                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }
        void book()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into bookings(BID,sid,userid) values(@BID,@sid,@userid)", con);
                cmd.Parameters.AddWithValue("@BID", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@sid", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@userid", TextBox10.Text.Trim());
                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Booking is added successfully');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

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

                SqlCommand cmd = new SqlCommand("Select * from bookings where BID='" + TextBox9.Text.Trim() + "';", con);
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            deletebooking();
        }

        void deletebooking()
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

                    SqlCommand cmd = new SqlCommand("DELETE from bookings WHERE userid IN (Select userid from userlogin) and BID='" + TextBox9.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Booking Deleted Successfully');</script>");
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
                Response.Write("<script>alert('Invalid Schudele ID');</script>");
            }
        }



        void clearForm()
        {
            TextBox2.Text = "";
            TextBox1.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox10.Text = "";
            TextBox9.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from bookings where BID='" + TextBox9.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox3.Text = dr.GetValue(1).ToString();
                        TextBox10.Text = dr.GetValue(2).ToString();

                    }

                }
                else
                {

                    Response.Write("<script>alert('Invalid Credentials');</script>");


                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}