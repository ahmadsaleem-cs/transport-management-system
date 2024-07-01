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
    public partial class schedulemanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //go button
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


        bool Checkifscheduleexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from schedule where SID='" + TextBox3.Text.Trim() + "';", con);
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

        void addnewschedule()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into schedule(SID,Fromcity,Tocity,Duration,Price,Departuretime,Arrivaltime,Date) values(@SID,@Fromcity,@Tocity,@Duration,@Price,@Departuretime,@Arrivaltime,@Date)", con);
                cmd.Parameters.AddWithValue("@SID", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Fromcity", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Tocity", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", TextBox7.Text.Trim());

                cmd.Parameters.AddWithValue("@Price", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Departuretime", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Arrivaltime", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", TextBox1.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Schedule is added successfully');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateschedule()
        {
            if (Checkifscheduleexist())
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Update schedule set Fromcity=@Fromcity,Tocity=@Tocity,Duration=@Duration,Price=@Price,Departuretime=@Departuretime,Arrivaltime=@ArrivalTime,Date=@Date  where SID='" + TextBox3.Text.Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@Fromcity", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Tocity", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Duration", TextBox7.Text.Trim());

                    cmd.Parameters.AddWithValue("@Price", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@Departuretime", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@Arrivaltime", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@Date", TextBox1.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearForm();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Data is Updated successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
               
            }
            else
            {
                Response.Write("<script>alert('Invalid Driver ID');</script>");
            }
        }
        void clearForm()
        {
            TextBox2.Text="";
            TextBox1.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
        void deleteschedule()
        {

            if (Checkifscheduleexist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from schedule WHERE SID='" + TextBox3.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Schedule Deleted Successfully');</script>");
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Checkifscheduleexist())
            {
                Response.Write("<script>alert('Already Schedule exist with this ID. Please enter new id');</script>");
            }
            else
            {
                addnewschedule();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateschedule();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            deleteschedule();
        }
    }
    }
