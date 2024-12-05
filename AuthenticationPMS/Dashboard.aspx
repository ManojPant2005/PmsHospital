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
</head>
<body>

    <style>
        
#sidebar-wrapper {
    width: 250px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    transition: none;
}

.list-group-item {
    padding: 15px 20px;
    margin-bottom: 10px;
}

    .list-group-item.active {
        background-color: #007bff !important;
        border-color: #007bff !important;
    }

.navbar-text {
    margin-left: auto;
}

.card-deck {
    display: flex;
    gap: 1rem;
    justify-content: space-between;
}

.card {
    width: 30%;
}
    </style>
    <form id="form1" runat="server">
        <div class="d-flex" id="wrapper">
            <div class="bg-dark text-white" id="sidebar-wrapper">
                <div class="sidebar-heading text-center">
                    <img src="Content/Images/intro.png" alt="Hospital Logo" class="img-fluid" width="300" />
                    <h4 style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">WELCOME IN PMS</h4>
                </div>
                <div class="list-group list-group-flush">
                    <a href="Dashboard.aspx" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                    <a href="Component/PatientManagement.aspx" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-user-injured"></i> Patient Management
                    </a>
                    <a href="Component/StaffManagement.aspx" class="list-group-item list-group-item-action bg-dark text-white">
                        <i class="fas fa-users"></i> Staff Management
                    </a>
                </div>
            </div>

            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <span class="navbar-text ms-auto">
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger" />
                        </span>
                    </div>
                </nav>

                <div class="container mt-4">
                    <h1>Welcome to the Dashboard</h1>
                    <p class="lead">Here you can manage hospital operations efficiently. Use the sidebar to navigate through different sections.</p>

                    <div class="card-deck">
                        <!-- Total Patients Card -->
                        <div class="card text-white bg-primary mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Total Patients</h5>
                                <p class="card-text" id="totalPatients"><%= totalPatients %></p>
                            </div>
                        </div>

                        <!-- Total Doctors Card -->
                        <div class="card text-white bg-success mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Total Doctors</h5>
                                <p class="card-text" id="totalDoctors"><%= totalDoctors %></p>
                            </div>
                        </div>

                        <!-- Active Users Card -->
                        <div class="card text-white bg-warning mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Active Users</h5>
                                <p class="card-text" id="activeUsers"><%= activeUsers %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
