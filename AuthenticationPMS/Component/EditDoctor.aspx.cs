using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationPMS.Component
{
    public partial class EditDoctor : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string doctorID = Request.QueryString["DoctorID"];
                if (!string.IsNullOrEmpty(doctorID))
                {
                    GetDoctorDetails(doctorID);
                }
                else
                {
                    Response.Redirect("StaffManagement.aspx"); 
                }
            }
        }

        private void GetDoctorDetails(string doctorID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT DoctorID, Name, Specialization FROM Doctors WHERE DoctorID = @DoctorID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtDoctorID.Text = reader["DoctorID"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtSpecialization.Text = reader["Specialization"].ToString();
                    }
                    else
                    {
                        Response.Redirect("StaffManagement.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string doctorID = txtDoctorID.Text;
            string name = txtName.Text;
            string specialization = txtSpecialization.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Doctors SET Name = @Name, Specialization = @Specialization WHERE DoctorID = @DoctorID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Specialization", specialization);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("StaffManagement.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }
    }
}