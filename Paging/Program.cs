using Microsoft.SharePoint.Client;
using System;

namespace Paging
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;
            List list = web.Lists.GetByTitle("sdkjflasdkjf");
            context.ExecuteQuery();
            //for(int i=0; i<65;i++)
            //{
            //    ListItem listItem = list.AddItem(new ListItemCreationInformation());
            //    listItem["Title"] = $"Iten{i}";
            //    listItem.Update();
            //}
            //context.ExecuteQuery(); 
            ListItemCollectionPosition licp = null;
            CamlQuery query = new CamlQuery();
            query.ViewXml = "<View><ViewFields><FieldRef Name='Title'/></ViewFields><RowLimit>10</RowLimit></View>";

            while (true)
            {
                query.ListItemCollectionPosition = licp;
                ListItemCollection lic = list.GetItems(query);

                context.Load(lic);
                context.ExecuteQuery();

                licp = lic.ListItemCollectionPosition;
                if (licp == null)
                {
                    Console.WriteLine("End");
                    break;
                }

                foreach(ListItem listItem in lic)
                {
                    Console.WriteLine(listItem["Title"]);
                }
                if (licp == null)
                    break;
                else
                {
                    Console.WriteLine($"PageId: {licp.PagingInfo}");
                    Console.WriteLine( "---------------------------------");
                    Console.ReadKey();
                }
            }

            Console.ReadKey();
        }
    }
}
