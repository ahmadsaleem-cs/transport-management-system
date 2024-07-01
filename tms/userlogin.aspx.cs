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
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from usersignup where userid='" + TextBox1.Text.Trim() + "' and password='" + TextBox2.Text.Trim() + "'", con);
 
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["fullname"] = dr.GetValue(1).ToString();
                        Session["role"] = "user";
                       
                    }
                    con.Close();
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into userlogin(userid,password) values(@userid,@password)", con);
                    cmd2.Parameters.AddWithValue("@userid", TextBox1.Text.Trim());
                    cmd2.Parameters.AddWithValue("@password", TextBox2.Text.Trim());
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("homepage.aspx");
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