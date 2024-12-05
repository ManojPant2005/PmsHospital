<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPatient.aspx.cs" Inherits="AuthenticationPMS.Component.EditPatient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Patient</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Patient Details</h2>
            <asp:Label ID="lblPatientID" runat="server" Text="Patient ID" Visible="false" />
            <asp:TextBox ID="txtPatientID" runat="server" ReadOnly="true" Visible="false" CssClass="form-control" />
            
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAge">Age</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtGender">Gender</label>
                <asp:TextBox ID="txtGender" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAdmissionDate">Admission Date</label>
                <asp:TextBox ID="txtAdmissionDate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <a href="PatientManagement.aspx" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </form>
</body>
</html>