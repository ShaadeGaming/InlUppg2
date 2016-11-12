using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Inlamningsuppgift2
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            int counter = 0;
            int tal = 0;

            do
            {
                Console.WriteLine("Type 1 to insert a customer \nType 2 to insert a product  " +
                    "\nType 3 to update product price at a specific product \nType 4 to view ContactNameChangedTrigger");
                try
                {
                    tal = int.Parse(Console.ReadLine());
                    counter++;
                }
                catch
                {
                    Console.WriteLine("You must type a number in order to continue");
                    Console.WriteLine("");
                }
            }
            while (counter == 0);
            counter = 0;

            if (tal == 1)
            {
                do
                {
                    try
                    {
                        Console.WriteLine("Enter your Customer ID:");
                        string customerID = Console.ReadLine().ToString().ToUpperInvariant();
                        Console.WriteLine("Enter your Company name:");
                        string companyName = Console.ReadLine();
                        Console.WriteLine("Enter your Contact name:");
                        string contactName = Console.ReadLine();
                        Console.WriteLine("Enter your Phone number:");
                        int phoneNumber = int.Parse(Console.ReadLine());
                        string cns = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                        SqlConnection cn = new SqlConnection(cns);
                        cn.Open();
                        SqlCommand cmd = cn.CreateCommand();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "InsertCustomers";
                        cmd.Parameters.AddWithValue("@CustomerID", customerID);
                        cmd.Parameters.AddWithValue("@CompanyName", companyName);
                        cmd.Parameters.AddWithValue("@ContactName", contactName);
                        cmd.Parameters.AddWithValue("@Phone", phoneNumber);
                        cmd.ExecuteNonQuery();
                        //contactid ska vara en string exempel ALFKI eller 100
                        cn.Close();
                        Console.WriteLine("Customer " + companyName + " was created with the ID: " + customerID);
                        counter++;
                    }
                    catch
                    {
                        Console.WriteLine("One of the fields where in a incorrect format,");
                        Console.WriteLine("please enter the information again");
                        Console.WriteLine("");
                    }
                }
                while (counter == 0);
            }
            else if (tal == 2)
            {
                do
                {
                    try
                    {
                        Console.WriteLine("Enter your Product name:");
                        string productName = Console.ReadLine();
                        Console.WriteLine("Enter the Price :");
                       double unitPrice = double.Parse(Console.ReadLine());
                        
                       
                        string cns = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                        SqlConnection cn = new SqlConnection(cns);
                        cn.Open();
                        SqlCommand cmd = cn.CreateCommand();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "InsertProduct";
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@UnitPrice", unitPrice);
                        cmd.ExecuteNonQuery();
                        cn.Close();
                        Console.WriteLine("Product " + productName + " was created and costs: " + unitPrice);
                        counter++;
                    }
                    catch
                    {
                        Console.WriteLine("One of the fields where in a incorrect format,");
                        Console.WriteLine("please enter the information again");
                        Console.WriteLine("");
                    }
                }
                while (counter == 0);
            }
            else if (tal == 3)
            {
                SqlConnection connection = new SqlConnection(@"Server=(localdb)\MSSQLLocalDB;Database=NORTHWND;Trusted_Connection=Yes"); 
                SqlCommand command = connection.CreateCommand();
                
                    command.CommandText = "Select ProductID, ProductName from Products";
                    connection.Open();
                    
                
                try
                {
                    Console.WriteLine(" ");
                    Console.WriteLine("Type the ID of the product you want to edit");
                    int selectedID = int.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the new price: ");
                    int price = int.Parse(Console.ReadLine());
                    string cns = ConfigurationManager.ConnectionStrings["conString"].ConnectionString ;
                    SqlConnection cn = new SqlConnection(cns);
                    cn.Open();
                    SqlCommand cmd = cn.CreateCommand();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "UpdateProductPrice";
                    cmd.Parameters.AddWithValue("@ProductID", selectedID);
                    cmd.Parameters.AddWithValue("@UnitPrice", price);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    counter++;
                }
                catch
                {
                    Console.WriteLine("One of the fields where in a incorrect format, please enter the information again");
                    Console.WriteLine("");
                }
            }
            else if (tal == 4)
            {
                using (SqlConnection connection = new SqlConnection(@"Server=(localdb)\MSSQLLocalDB;Database=NORTHWND;Trusted_Connection=Yes"))
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Select * from CustomerChanges";

                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine("ID: " + reader.GetString(0) + "    Old contact name: " + reader.GetString(1) +
                                "|   New contact name: " + reader.GetString(2));
                        }
                        Console.WriteLine("");
                        Console.WriteLine("Press any key to exit");
                    }
                    connection.Close();
                }
                Console.ReadKey();
            }
            else
            {
                Console.WriteLine("That's not a valid command");
            }
        }
    }
}