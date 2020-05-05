using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace CreateListOfSubSites
{
    class Program
    {
        private static string ParentSiteUrl = "http://win-k1qikcue0no:85/";
        static void Main(string[] args)
        {
            GetListOfSubSites(ParentSiteUrl);
            Console.ReadKey();
        }

        private static void GetListOfSubSites(string url)
        {
            try
            {
                ClientContext context = new ClientContext(url);
                Web web = context.Web;
                context.Load(web, w => w.Webs, w => w.Title);
                context.ExecuteQuery();
                foreach (Web childWeb in web.Webs)
                {
                    string childWebPathUrl = ParentSiteUrl + childWeb.ServerRelativeUrl;
                    GetListOfSubSites(childWebPathUrl);
                    Console.WriteLine(childWebPathUrl);
                    Console.WriteLine(childWeb.Title);
                    Console.WriteLine("--------------------------");
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
