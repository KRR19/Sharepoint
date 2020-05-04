using Microsoft.SharePoint.Client;
using System;

namespace CreateASite
{
    class Program
    {
        static void Main(string[] args)
        {
            string url = "http://win-k1qikcue0no:85/";
            string destription = "Create this site CSOM approch";
            int languge = 1033;
            string title = "NewSite";
            string SiteURL = "NewSite";
            bool sitePremissions = false;
            string siteTemplate = "STS#0";

            ClientContext context = new ClientContext(url);
            Web web = context.Web;

            WebCreationInformation webCreationInformation = new WebCreationInformation();
            webCreationInformation.Description = destription;
            webCreationInformation.Language = languge;
            webCreationInformation.Title = title;
            webCreationInformation.Url = SiteURL;
            webCreationInformation.UseSamePermissionsAsParentSite = sitePremissions;
            webCreationInformation.WebTemplate = siteTemplate;

            Web newWeb = web.Webs.Add(webCreationInformation);
            context.Load(newWeb, w => w.Title, w => w.Description);

            context.ExecuteQuery();
            Console.WriteLine($"Title {newWeb.Title}; Description: {newWeb.Description}");
            Console.ReadKey();
        }
    }
}
