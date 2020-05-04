using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace DeleteRecordsOfAList
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;
            List list = web.Lists.GetByTitle("DepartmentWing");
            ListItemCollection listItems = list.GetItems(new CamlQuery());
            context.Load(listItems);
            context.ExecuteQuery();
            foreach(ListItem listItem in listItems)
            {
                listItem.DeleteObject();
            }
            context.ExecuteQuery();
            Console.ReadKey();
        }
    }
}
