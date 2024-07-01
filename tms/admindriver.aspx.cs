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
    public partial class admindriver : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //add button
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            if (Checkifdriverexist())
            {
                Response.Write("<script>alert('Already driver exist with this ID. Please enter new id');</script>");
            }
            else
            {
                Addnewdriver();
            }
        }


       
        //update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            updatedriver();
        }
        //delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            deletedriver();
        }
        //go button
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        //same driver id donot exist
        bool Checkifdriverexist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from driver where driverid='" + TextBox3.Text.Trim() + "';", con);
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

        void Addnewdriver()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into driver(driverid,drivername,contactnumber,vehicleno) values(@driverid,@drivername,@contactnumber,@vehicleno)", con);
                cmd.Parameters.AddWithValue("@driverid", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@drivername", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contactnumber", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@vehicleno", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Driver is added successfully');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updatedriver()
        {
            if (Checkifdriverexist())
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Update driver set drivername=@drivername, contactnumber=@contactnumber, vehicleno=@vehicleno where driverid='" +TextBox3.Text.Trim()+"'", con);
                    
                    cmd.Parameters.AddWithValue("@drivername", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@contactnumber", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@vehicleno", TextBox6.Text.Trim());

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
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from driver where driverid='" + TextBox3.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox4.Text = dr.GetValue(1).ToString();
                        TextBox5.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                   
    

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

        void deletedriver()
        {
            if (Checkifdriverexist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from driver WHERE driverid='" + TextBox3.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Driver Deleted Successfully');</script>");
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
                Response.Write("<script>alert('Invalid Driver ID');</script>");
            }

        }
        void clearForm()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }

    }
}