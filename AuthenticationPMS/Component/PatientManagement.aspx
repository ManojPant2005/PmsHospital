<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientManagement.aspx.cs" Inherits="AuthenticationPMS.Component.PatientManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>
                <i class="fas fa-user-md"></i> Patient Management
                <a href="https://localhost:44308/Dashboard" class="btn btn-link" style="font-size: 20px; color: #007bff; text-decoration: none; margin-left: 10px;">
                    <i class="fas fa-arrow-left"></i>
                </a>
            </h2>

            <div class="text-end mb-3">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPatientModal">
                    + Add New Patient
                </button>
            </div>

<div class="form-container">
    <div style="overflow-x: auto; width: 100%;">
        <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" 
                      CssClass="table table-striped table-bordered table-hover"
                      OnRowCommand="gvPatients_RowCommand" AllowPaging="True" PageSize="5" 
                      OnPageIndexChanging="gvPatients_PageIndexChanging"
                      Width="100%">
            <Columns>
                <asp:BoundField DataField="PatientID" HeaderText="Patient ID" SortExpression="PatientID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="AdmissionDate" HeaderText="Admission Date" SortExpression="AdmissionDate" DataFormatString="{0:MM/dd/yyyy}" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="EditPatient" 
                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' 
                                    Text="Edit" CssClass="btn btn-info btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
<div class="modal fade" id="addPatientModal" tabindex="-1" aria-labelledby="addPatientModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPatientModalLabel">Add New Patient</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="txtName">Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAge">Age</label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlGender">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                            <div class="form-group">
    <label for="txtAdmissionDate">Admission Date</label>
    <input type="date" id="txtAdmissionDate" runat="server" class="form-control" />
</div>
            </div>

            <div class="modal-footer">
                <asp:Button ID="btnAddPatient" runat="server" Text="Add Patient" CssClass="btn btn-success" OnClick="btnAddPatient_Click" />
            </div>
        </div>
    </div>
</div>


        </div>
    </form>
</body>
</html>

<style>
    .form-container {
    max-width: 1200px; 
    margin: auto; 
}
</style>