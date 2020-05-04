using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.Client;

namespace CreateAListAddRecords
{
    class Program
    {
        static void Main(string[] args)
        {
            ClientContext context = new ClientContext("http://win-k1qikcue0no:85/");
            Web web = context.Web;

            ListCreationInformation listCreationInformation = new ListCreationInformation();
            listCreationInformation.Title = "ITAcademyCourses";
            listCreationInformation.TemplateType = (int) ListTemplateType.GenericList;
            listCreationInformation.Description = "IT Academy Courses";
            List list = web.Lists.Add(listCreationInformation);

            Field CourseName = list.Fields.AddFieldAsXml("<Field Type='Text' DisplayName='CourseName' />", true, AddFieldOptions.DefaultValue);
            Field TranerName = list.Fields.AddFieldAsXml("<Field Type='Text' DisplayName='TranerName' />", true, AddFieldOptions.DefaultValue);
            Field Duration = list.Fields.AddFieldAsXml("<Field Type='Number' DisplayName='Duration' />", true, AddFieldOptions.DefaultValue);

            string CategoryChoices = "<Field Type='Choice' DisplayName='Category' Name='Category' Format='Dropdown' >"
                + "<Default>WEB DEVELOPMENT</Default>"
                + "<CHOICES>"
                + " <CHOICE>WEB DEVELOPMENT</CHOICE>"
                + " <CHOICE>WEB DESIGN</CHOICE>"
                + "</CHOICES>"
                + "</Field>";

            Field choiceField = list.Fields.AddFieldAsXml(CategoryChoices, true, AddFieldOptions.DefaultValue);

            ListItemCreationInformation listItemCreationInformation = new ListItemCreationInformation();
            ListItem listItem = list.AddItem(listItemCreationInformation);
            listItem["CourseName"] = "Sharepoint 2013";
            listItem["TranerName"] = "Roman";
            listItem["Duration"] = 24;
            listItem["Category"] = "Web Development";
            listItem["Title"] = "SPS2013";
            listItem.Update();

            listItem = list.AddItem(listItemCreationInformation);
            listItem["CourseName"] = "Sharepoint 2010";
            listItem["TranerName"] = "Lesya";
            listItem["Duration"] = 27;
            listItem["Category"] = "WEB DESIGN";
            listItem["Title"] = "SPS2010";
            listItem.Update();

            context.ExecuteQuery();
            Console.ReadKey();
        }
    }
}
