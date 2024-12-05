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
    public partial class EditPatient : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string patientID = Request.QueryString["PatientID"];
                if (!string.IsNullOrEmpty(patientID))
                {
                    GetPatientDetails(patientID);
                }
                else
                {
                    Response.Redirect("PatientManagement.aspx");
                }
            }
        }

        private void GetPatientDetails(string patientID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT PatientID, Name, Age, Gender, AdmissionDate FROM Patients WHERE PatientID = @PatientID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PatientID", patientID);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtPatientID.Text = reader["PatientID"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtAge.Text = reader["Age"].ToString();
                        txtGender.Text = reader["Gender"].ToString();
                        txtAdmissionDate.Text = reader["AdmissionDate"].ToString();
                    }
                    else
                    {
                        Response.Redirect("PatientManagement.aspx");
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
            string patientID = txtPatientID.Text;
            string name = txtName.Text;
            string age = txtAge.Text;
            string gender = txtGender.Text;
            string admissionDate = txtAdmissionDate.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Patients SET Name = @Name, Age = @Age, Gender = @Gender, AdmissionDate = @AdmissionDate WHERE PatientID = @PatientID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PatientID", patientID);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@AdmissionDate", admissionDate);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("PatientManagement.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }
    }
}