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
    public partial class adminSchedule : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //go button
        protected void Button2_Click(object sender, EventArgs e)
        {
            getuserid();
        }
        //delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            deleteuserid();
        }

        void deleteuserid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from usersignup WHERE userid='" + TextBox3.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
         }

void clearForm()
{
       TextBox3.Text = "";
    TextBox4.Text = "";
    TextBox7.Text = "";
    TextBox8.Text = "";
    TextBox1.Text = "";
    TextBox5.Text = "";
    TextBox6.Text = "";
    TextBox11.Text = "";
}





        void getuserid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from usersignup where userid='" + TextBox3.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox4.Text = dr.GetValue(1).ToString();
                        TextBox7.Text = dr.GetValue(2).ToString();
                        TextBox8.Text = dr.GetValue(3).ToString();
                        TextBox1.Text = dr.GetValue(4).ToString();
                        TextBox5.Text = dr.GetValue(5).ToString();
                        TextBox6.Text = dr.GetValue(6).ToString();
                        TextBox11.Text = dr.GetValue(7).ToString();
                       // TextBox4.Text = dr.GetValue(8).ToString();



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