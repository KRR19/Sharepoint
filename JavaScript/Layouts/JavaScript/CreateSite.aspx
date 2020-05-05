<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateSite.aspx.cs" Inherits="JavaScript.Layouts.JavaScript.CreateSite" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <script type="text/javascript">
        function createTeamSite() {
            var description = 'New child site';
            var language = 1033;
            var title = 'New child site';
            var url = 'Newchildsite';
            var premissions = true;
            var template = 'STS#0';

            var context = SP.ClientContext.get_current();
            this.web = context.get_web();

            var wci = new SP.WebCreationInformation();
            wci.set_description(description);
            wci.set_language(language);
            wci.set_title(title);
            wci.set_url(url);
            wci.set_useSamePermissionsAsParentSite(premissions);
            wci.set_webTemplate(template);

            this.newWeb = this.web.get_webs().add(wci);

            context.load(this.newWeb, 'Title', 'Description');
            context.executeQueryAsync(Function.createDelegate(this, this.onSuccess), Function.createDelegate(this, this.onFailure));
        }

        function onSuccess(sender, args) {
            alert('Title: ' + this.newWeb.get_title() + 'Description: ' + this.newWeb.get_discription());
        }
        function onFailure(sender, args) {
            alert("Faild: " + args.get_message() + '\n' + args.get_stackTrace());
        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <input type="button" value="Create a new team site" onclick="createTeamSite()" />
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
