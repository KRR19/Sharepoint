using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace LoadSelectiveProperties
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;

            context.Load(web, w => w.Title, w => w.Description);
            context.ExecuteQuery();
            Console.WriteLine($"Title: {web.Title}, Description: {web.Description}");
            Console.ReadKey();
        }
    }
}
