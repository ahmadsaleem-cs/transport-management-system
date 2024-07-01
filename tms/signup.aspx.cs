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
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (checkMemberExists())
            {
                Response.Write("<script>alert('User already exist with this user ID, please enter other ID');</script>");
            }
            else
            {
                signUpNewMember();

            }

        }

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from usersignup where userid='" + TextBox9.Text.Trim() + "';", con);
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
        void signUpNewMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into usersignup(userid,fullname,dateofbirth,contactnumber,emailid,province,city,address,password) values(@userid,@fullname,@dateofbirth,@contactnumber,@emailid,@province,@city,@address,@password)", con);
                cmd.Parameters.AddWithValue("@userid", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@fullname", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dateofbirth", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contactnumber", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@emailid", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@province", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox10.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Signup Successful. Now use user login to login');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}