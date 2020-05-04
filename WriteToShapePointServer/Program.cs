using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace WriteToShapePointServer
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;
            context.Load(web);
            context.ExecuteQuery();

            Console.WriteLine($"Old Title: {web.Title}");
            web.Title = "Sharepoint Developer";

            web.Update();
            context.ExecuteQuery();
            Console.WriteLine($"New Title: {web.Title}");
            Console.ReadKey();
        }
    }
}
