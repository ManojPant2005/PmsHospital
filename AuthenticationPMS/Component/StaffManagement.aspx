<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="AuthenticationPMS.Component.StaffManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">

            <div class="text-end mb-3">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDoctorModal">
                    + Add New Doctor
                </button>
            </div>

            <h2>
                <i class="fas fa-user-md"></i> Staff Management
                <a href="https://localhost:44308/Dashboard" class="btn btn-link" style="font-size: 20px; color: #007bff; text-decoration: none; margin-left: 10px;">
                    <i class="fas fa-arrow-left"></i>
                </a>
            </h2>

            <div class="form-container">
                <asp:GridView ID="gvDoctors" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvDoctors_RowCommand" DataKeyNames="DoctorID" AllowPaging="True" OnPageIndexChanging="gvDoctors_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="DoctorID" HeaderText="Doctor ID" SortExpression="DoctorID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Specialization" HeaderText="Specialization" SortExpression="Specialization" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="EditDoctor" CssClass="btn btn-info btn-sm" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="modal fade" id="addDoctorModal" tabindex="-1" aria-labelledby="addDoctorModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addDoctorModalLabel">Add New Doctor</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="txtDoctorName">Name</label>
                                <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtSpecialization">Specialization</label>
                                <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" CssClass="btn btn-success" OnClick="btnAddDoctor_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
