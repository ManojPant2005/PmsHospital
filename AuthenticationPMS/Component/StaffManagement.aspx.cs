using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationPMS.Component
{
    public partial class StaffManagement : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDoctorsGridView();
            }
        }

        private void BindDoctorsGridView()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT DoctorID, Name, Specialization FROM Doctors";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                try
                {
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        gvDoctors.DataSource = dt;
                        gvDoctors.DataBind();
                    }
                    else
                    {
                        Response.Write("No data found in Doctors table.");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }

        protected void gvDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDoctor")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvDoctors.Rows[index];
                string doctorID = gvDoctors.DataKeys[row.RowIndex].Value.ToString();

                Response.Redirect("~/Component/EditDoctor.aspx?DoctorID=" + doctorID);
            }
        }

        protected void gvDoctors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDoctors.PageIndex = e.NewPageIndex;
            BindDoctorsGridView();
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            string name = txtDoctorName.Text;
            string specialization = txtSpecialization.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("USP_AddDoctor", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Specialization", specialization);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    BindDoctorsGridView();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "HideModal", "$('#addDoctorModal').modal('hide');", true);
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }
    }
}
