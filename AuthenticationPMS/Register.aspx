<%@ Page Title="Register" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="AuthenticationPMS.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <h2><i class="fas fa-user-plus"></i> Register</h2>
        
        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username"></asp:TextBox>
        </div>
                    <asp:RequiredFieldValidator 
                ID="rfvUsername" 
                runat="server" 
                ControlToValidate="txtUsername" 
                ErrorMessage="Username is required." 
                ForeColor="Red" 
                Display="Dynamic" />

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password"></asp:TextBox>
        </div>
                    <asp:RequiredFieldValidator 
                ID="rfvPassword" 
                runat="server" 
                ControlToValidate="txtPassword" 
                ErrorMessage="Password is required." 
                ForeColor="Red" 
                Display="Dynamic" />

        <div class="mb-3">
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                <asp:ListItem Text="Select Role" Value="" />
                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                <asp:ListItem Text="Nurse" Value="Nurse"></asp:ListItem>
            </asp:DropDownList>
        </div>
                    <asp:RequiredFieldValidator 
                ID="rfvRole" 
                runat="server" 
                ControlToValidate="ddlRole" 
                InitialValue="" 
                ErrorMessage="Role selection is required." 
                ForeColor="Red" 
                Display="Dynamic" />

        <div class="mb-3">
            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login" CssClass="text-info no-underline">Already have an account? Login here.</asp:HyperLink>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-2"></asp:Label>
    </div>
</asp:Content>
