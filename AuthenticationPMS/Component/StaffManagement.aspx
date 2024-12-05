<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="AuthenticationPMS.Component.StaffManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
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
                                <asp:Button ID="btnEdit" runat="server" CommandName="EditDoctor" CssClass="btn btn-info btn-sm"  CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
