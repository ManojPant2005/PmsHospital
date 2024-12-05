<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientManagement.aspx.cs" Inherits="AuthenticationPMS.Component.PatientManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
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

            <div class="form-container mt-4">
                <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" 
                            OnRowCommand="gvPatients_RowCommand" AllowPaging="True" PageSize="5" 
                            OnPageIndexChanging="gvPatients_PageIndexChanging">
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

            <div class="text-center mt-3">
                <asp:Label ID="lblPageInfo" runat="server" CssClass="text-muted"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
