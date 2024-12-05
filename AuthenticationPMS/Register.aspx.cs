using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthenticationPMS.Services;

namespace AuthenticationPMS
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = string.Empty;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string passwordHash = Utility.HashPassword(password);
                string role = ddlRole.SelectedValue;

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("USP_RegisterUser", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@Role", role);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "User registered successfully!";
                    lblMessage.CssClass = "text-success";  // Success message 
                }
            }
            else
            {
                lblMessage.Text = "Please fill out all required fields.";
                lblMessage.CssClass = "text-danger";  // Error message 
            }
        }
    }
}
