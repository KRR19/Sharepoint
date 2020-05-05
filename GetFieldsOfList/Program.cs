using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace GetFieldsOfList
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;
            List list = web.Lists.GetByTitle("ITAcademyCourses");

            FieldCollection fields = list.Fields;
            Field oneField = fields.GetByInternalNameOrTitle("TranerName");
            oneField.Required = true;
            oneField.Update();

            context.Load(fields);
            context.Load(oneField);
            context.ExecuteQuery();

            foreach (Field field in fields)
            {
                Console.WriteLine($"InternalName: {field.InternalName}; Title: {field.Title}");
            }
            Console.ReadKey();
        }
    }
}
