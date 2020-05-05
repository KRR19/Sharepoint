<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSiteProperties.aspx.cs" Inherits="JavaScript.Layouts.JavaScript.UpdateSiteProperties" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/SP.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/SP.js"></script>
    <script type="text/javascript">
        function updateProperties() {
            var context = SP.ClientContext.get_current();
            this.web = context.get_web();

            this.web.set_title("New title");
            this.web.set_description("New desc");
            this.web.update();

            context.load(this.web, 'Title', 'Description');

            context.executeQueryAsync(Function.createDelegate(this, this.onSeccess), Function.createDelegate(this, this.onFailure));
        }
        function onSeccess(sender, args) {
            alert('Title: ' + this.web.get_title() + 'Description: ' + this.web.get_description());
        }

        function onFailure(sender, args) {
            alert("Faild: " + args.get_message() + '\n' + args.get_stackTrace());
        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <input type="button" value="Update site properties" onclick="updateProperties()" />
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
