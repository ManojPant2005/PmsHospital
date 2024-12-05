<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDoctor.aspx.cs" Inherits="AuthenticationPMS.Component.EditDoctor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Doctor</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Edit Doctor Details</h2>
            <asp:Label ID="lblDoctorID" runat="server" Text="Doctor ID" Visible="false" />
            <asp:TextBox ID="txtDoctorID" runat="server" ReadOnly="true" Visible="false" CssClass="form-control" />
            
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtSpecialization">Specialization</label>
                <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <a href="StaffManagement.aspx" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </form>
</body>
</html>