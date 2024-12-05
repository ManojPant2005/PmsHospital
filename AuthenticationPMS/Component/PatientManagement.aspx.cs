using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationPMS.Component
{
    public partial class PatientManagement : System.Web.UI.Page
    {
        private const int PageSize = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPatientGrid(0);
            }
        }

        private void BindPatientGrid(int pageIndex)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("USP_GetPatients", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPatients.DataSource = dt;
                gvPatients.PageIndex = pageIndex; 
                gvPatients.DataBind();
            }
        }

        protected void gvPatients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPatient")
            {
                int index = Convert.ToInt32(e.CommandArgument); 
                GridViewRow row = gvPatients.Rows[index];
                string patientID = gvPatients.DataKeys[row.RowIndex].Value.ToString();

                Response.Redirect("/Component/EditPatient.aspx?PatientID=" + patientID);
            }
        }

        protected void gvPatients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindPatientGrid(e.NewPageIndex);
        }
    }
}
