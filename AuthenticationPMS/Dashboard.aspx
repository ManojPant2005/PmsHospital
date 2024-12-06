<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AuthenticationPMS.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard - Hospital Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="~/Content/styles.css" rel="stylesheet" />
    <link href="Dashboard.aspx.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Dashboard.aspx">
                    <img src="Content/Images/intro.png" alt="Logo" width="30" height="30" class="d-inline-block align-top" />
                    PMS Dashboard
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="Dashboard.aspx">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Component/PatientManagement.aspx">
                                <i class="fas fa-user-injured"></i> Patient Management
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Component/StaffManagement.aspx">
                                <i class="fas fa-users"></i> Staff Management
                            </a>
                        </li>
                    </ul>
                    <span class="navbar-text ms-auto">
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger" />
                    </span>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h1>Welcome to the Dashboard</h1>
            <p class="lead">Here you can manage hospital operations efficiently. Use the topbar to navigate through different sections.</p>

        <div class="card-deck" style="height : 200px;" >
          <asp:LinkButton ID="btnTotalPatients" runat="server" OnClick="RedirectToPatientManagement" CssClass="card text-white no-underline bg-primary mb-3">
            <div class="card-body justify-content-center">
            <h5 class="card-title">Total Patients</h5>
            <p class="card-text"><%= totalPatients %></p>
        </div>
    </asp:LinkButton>
    <asp:LinkButton ID="btnTotalDoctors" runat="server" OnClick="RedirectToStaffManagement" CssClass="card text-white no-underline bg-success mb-3">
        <div class="card-body">
            <h5 class="card-title">Total Doctors</h5>
            <p class="card-text"><%= totalDoctors %></p>
        </div>
    </asp:LinkButton>
    <asp:LinkButton ID="btnActiveUsers" runat="server" OnClick="RedirectToActiveUsers" CssClass="card text-white no-underline bg-warning mb-3">
        <div class="card-body">
            <h5 class="card-title" style="text-decoration:none;">Active Users</h5>
            <p class="card-text" style="text-decoration:none;"><%= activeUsers %></p>
        </div>
    </asp:LinkButton>
</div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
