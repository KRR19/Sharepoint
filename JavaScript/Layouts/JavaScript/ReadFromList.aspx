<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadFromList.aspx.cs" Inherits="JavaScript.Layouts.JavaScript.ReadFromList" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <script type="text/javascript">
        function readRecords() {
            var context = SP.ClientContext.get_current();
            var trainersList = context.get_web().get_lists().getByTitle("ITAcademyTainerss");

            var calmQuery = new SP.CamlQuery();
            calmQuery.set_viewXml('<View><Query><Where><BeginsWith><FieldRef Name=\'Title\'/><Value Type=\'Text\'>A<\Value></BeginsWith></Where></Query></View>');
            this.allTrainers = trainersList.getItems(calmQuery);

            context.load(allTrainers);
            context.executeQueryAsync(Function.createDelegate(this, this.onSuccess), Function.createDelegate(this, this.onFailure));
        }
        function onSuccess(sender, args) {
            var ul = document.getElementById("allTrainers");

            var str = '';
            var trainersListItemEnumerator = allTrainers.getEnumerator();
            while (trainersListItemEnumerator.moveNext()) {
                var oListItem = trainersListItemEnumerator.get_current();
                str = 'ID: ' + oListItem.get_id() + 'Title: ' + oListItem.get_item('Title');
                var element = document.createElement("li");
                element.innerText = str;
                ul.appendChild(element);
            }
        }
        function onFailure(sender, args) {
            alert("Faild: " + args.get_message() + '\n' + args.get_stackTrace());
        }
    </script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <input type="button" value="Get trainers list" onclick="readRecords()" />
    <ul id="allTrainers"></ul>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
