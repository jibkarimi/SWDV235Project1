<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "JibBussiness"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);

            // Create command 
            comm = new SqlCommand("EXEC InsertVisitor @visitor_name,@visitor_email,@visitor_phone,@SuitType,@HeardVia,@visitor_Comment", conn);
            comm.Parameters.Add("@visitor_name", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@visitor_name"].Value = name.Text;

            comm.Parameters.Add("@visitor_email", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@visitor_email"].Value = mail.Text;

            comm.Parameters.Add("@visitor_phone", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@visitor_phone"].Value = phone.Text;

            comm.Parameters.Add("@SuitType", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@SuitType"].Value = radioBtn.Text;

            comm.Parameters.Add("@HeardVia", System.Data.SqlDbType.VarChar, 50);
            comm.Parameters["@HeardVia"].Value = dropDown.Text;

            comm.Parameters.Add("@visitor_Comment", System.Data.SqlDbType.NVarChar, 200);
            comm.Parameters["@visitor_Comment"].Value = comment.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();
            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MenSuit</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/contact.js" async></script>
</head>

<body>
    <header>
        <img src="images/header.jpg" alt="headerImage">
        <nav class="navBar">
            <ul>
                <li><a href="home.html">Home</a></li>
                <li><a href="news.html">E-Newsletter</a></li>
                <li><a href="contact.aspx">Contact us</a></li>
            </ul>
        </nav>
    </header>

    <main class="main-container">

        <div class="main-bg">
            <div class="info">
                <form runat="server">

                    <br />
                    <%-- Adding asp for name --%>
                    <label for="name">Name:</label><br />
                    <asp:TextBox ID="name" runat="server" />

                    <br />
                    <%-- Adding asp for email --%>
                    <label for="email">E-mail:</label><br />
                    <asp:TextBox ID="mail" runat="server" />

                    <br />
                    <%-- Adding asp for phone --%>
                    <label for="phone">Phone:</label><br />
                    <asp:TextBox ID="phone" runat="server" /><br />

                    <br />
                    <%-- Adding asp for suitType  /  Filedset for css ID --%>
                    <fieldset id="fieldset">
                        <legend>Suit Type!</legend>
                        <asp:RadioButtonList ID="radioBtn" runat="server">
                            <asp:ListItem Text="Custom Size" Value="Custom Size" />
                            <asp:ListItem Text="Fixed Sizes" Value="Fixed Sizes" />
                        </asp:RadioButtonList>
                    </fieldset>


                    <br />
                    <%-- Adding asp for DropDown --%>
                    <label for="info">How did you hear about Us?</label>
                    <asp:DropDownList ID="dropDown" runat="server">
                        <asp:ListItem Value="">--Select Option--</asp:ListItem>
                        <asp:ListItem Text="Our Website" Value="Our Website"></asp:ListItem>
                        <asp:ListItem Text="Facebook Ads" Value="Facebook Ads"></asp:ListItem>
                        <asp:ListItem Text="Magazine" Value="Magazine"></asp:ListItem>
                        <asp:ListItem Text="Newspaper" Value="Newspaper"></asp:ListItem>
                        <asp:ListItem Text="Frinds" Value="Frinds"></asp:ListItem>
                        <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                    </asp:DropDownList><br />

                    <br />
                    <%-- Adding asp for submitButton --%>
                    <label for="comment">Enter your comments:</label><br />
                    <asp:TextBox ID="comment" runat="server" Height="150" Width="400" /><br />

                    <asp:Button ID="submitButton" runat="server"
                        Text="Submit" OnClick="submitButton_Click" /><br />
                    <br />
                    <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
                </form>
            </div>
        </div>
    </main>

    <footer>
        <br>
        Men Suit<br>
        <a href="mailto:jibkarimi@mycwi.cc">MenSuit@example.com</a><br>
        <a href="https://www.facebook.com/" target="_blank">
            <img src="images/fb.png" /></a>

        <a href="https://github.com/" target="_blank">
            <img src="images/github.png" /></a>

        <a href="https://www.linkedin.com/" target="_blank">
            <img src="images/linkedin.png" /></a>


    </footer>
</body>

</html>
