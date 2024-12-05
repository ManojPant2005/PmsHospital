<%@ Page Title="Login" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AuthenticationPMS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <h2><i class="fas fa-sign-in-alt"></i> Login</h2>
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
            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register" CssClass="text-info no-underline">No account? Please register here.</asp:HyperLink>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-2"></asp:Label>
    </div>
</asp:Content>
