using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationPMS
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public int totalPatients = 0;
        public int totalDoctors = 0;
        public int activeUsers = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            FetchDashboardData();
        }

        private void FetchDashboardData()
        {
            string connectionString = "Server=MP\\SQLEXPRESS;Database=HospitalDB;Trusted_Connection=True;TrustServerCertificate=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Patients", conn))
                {
                    totalPatients = (int)cmd.ExecuteScalar();
                }

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Doctors", conn))
                {
                    totalDoctors = (int)cmd.ExecuteScalar();
                }

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users",  conn))
                {
                    activeUsers = (int)cmd.ExecuteScalar();
                }
            }
        }
        protected void RedirectToPatientManagement(object sender, EventArgs e)
        {
            Response.Redirect("~/Component/PatientManagement.aspx");
        }

        protected void RedirectToStaffManagement(object sender, EventArgs e)
        {
            Response.Redirect("~/Component/StaffManagement.aspx");
        }

        protected void RedirectToActiveUsers(object sender, EventArgs e)
        {
            string userRole = Session["UserRole"]?.ToString();
            if (userRole == "Admin")
            {
                Response.Redirect("~/Component/ActiveUsers.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Only Admin can view this.');", true);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}