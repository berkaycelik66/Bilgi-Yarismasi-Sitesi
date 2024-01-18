using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Channels;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class yarisma : System.Web.UI.Page
    {
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        static List<Question> questionBatch;
        static int currentQuestionIndex;
        static int puan = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YarismaK"]!= null)
            {
                if (!IsPostBack)
                {
                    if (questionBatch != null)
                    {
                        questionBatch.Clear();
                        currentQuestionIndex = questionBatch.Count();

                    }
                    puan = 0;
                    Button5.Visible = false;
                    LoadQuestionBatch();
                    InitializeQuestion();
                }
                Button1.BackColor = default(Color);
                Button2.BackColor = default(Color);
                Button3.BackColor = default(Color);
                Button4.BackColor = default(Color);
                if (Session["RemainingTime"].ToString() == "0")
                {
                    HyperLink hyperLink = new HyperLink();
                    hyperLink.NavigateUrl = "yarismaya-basla.aspx";
                    hyperLink.Text = "Tekrar Başla";
                    Label5.Controls.Add(hyperLink);
                }
            }
            else
            {
                Response.Redirect("yarismaya-basla.aspx");
            }
            
        }
        private void LoadQuestionBatch()
        {
            string category = Session["YarismaK"].ToString();
            Session["ctgkayit"] = category;
            Session["YarismaK"] = "";
            object user = Session["username"];
            object task = Session["task"];
            object uname = new object();
            if (task != null && task.ToString() == "admin")
            {
                uname = user + "@admin";
            }
            else if (task !=null)
            {
                uname = user;
            }
            baglan.Open();

            SqlCommand cmd;
            if (category == "")
            {
                Response.Redirect("yarismaya-basla.aspx");
            }
            if (category == "Genel")
            {
                if (user != null)
                {
                    cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE state='True' AND NOT (sender = '" + uname + "') ORDER BY NEWID()", baglan);
                }
                else
                {
                    cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE state='True' ORDER BY NEWID()", baglan);
                }

            }
            else
            {
                if (user != null)
                {
                    cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE category='" + category + "' AND state='True' AND NOT (sender = '" + uname + "') ORDER BY NEWID()", baglan);
                }
                else
                {
                    cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE category='" + category + "' AND state='True' ORDER BY NEWID()", baglan);
                }
            }

            SqlDataReader dr = cmd.ExecuteReader();

            questionBatch = new List<Question>();

            while (dr.Read())
            {
                Question question = new Question
                {
                    Id = Convert.ToInt32(dr["id"]),
                    QuestionText = dr["question"].ToString(),
                    TrueAnswer = dr["true_answer"].ToString(),
                    FalseAnswer1 = dr["false_answer1"].ToString(),
                    FalseAnswer2 = dr["false_answer2"].ToString(),
                    FalseAnswer3 = dr["false_answer3"].ToString(),
                    Sender = dr["sender"].ToString()
                };

                questionBatch.Add(question);
            }

            dr.Close();
            baglan.Close();
        }
        private void InitializeQuestion()
        {
            Session["RemainingTime"] = 16;
            UpdateTimer.Enabled = true;
            Label4.Text = "";
            Label2.Text = puan.ToString(); 

            if (currentQuestionIndex < questionBatch.Count)
            {
                switch (currentQuestionIndex)
                {
                    case 0:
                        Soru1.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 1:
                        Soru2.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 2:
                        Soru3.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 3:
                        Soru1.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 4:
                        Soru2.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 5:
                        Soru3.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 6:
                        Soru1.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 7:
                        Soru2.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 8:
                        Soru3.BackColor = System.Drawing.Color.Yellow;
                        break;
                    case 9:
                        Soru3.BackColor = System.Drawing.Color.Yellow;
                        break;
                }
                Question currentQuestion = questionBatch[currentQuestionIndex];

                Label3.Text = currentQuestion.QuestionText;

                // Store correct answer in session variable
                Session["CorrectAnswer"] = currentQuestion.TrueAnswer;

                // Shuffle and display answer options
                List<string> answerOptions = new List<string>
                {
                    currentQuestion.TrueAnswer,
                    currentQuestion.FalseAnswer1,
                    currentQuestion.FalseAnswer2,
                    currentQuestion.FalseAnswer3
                };

                ShuffleList(answerOptions);

                Button1.Text = answerOptions[0];
                Button2.Text = answerOptions[1];
                Button3.Text = answerOptions[2];
                Button4.Text = answerOptions[3];
                Button5.Visible = false;

                if (!currentQuestion.Sender.Contains("@admin"))
                {
                    Label4.Text = "Gönderen: "+ currentQuestion.Sender;
                }
            }
            else
            {
                // The user has completed all questions in the batch
                UpdateTimer.Enabled = false;
                Label3.Text = "Tebrikler! Bütün Soruları Tamamladınız.";
                if (puan != 0 && Session["username"] != null)
                {
                    Button6.Visible = true;
                    DateTime now = DateTime.Now;

                    // ClickInfo nesnesini oluştur ve tarih bilgisini at
                    ClickInfo clickInfo = new ClickInfo
                    {
                        ClickDateTime = now
                    };

                    // Bilgileri sessiona at
                    Session["ClickInfo"] = clickInfo;
                }
                Button1.Visible = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                HyperLink hyperLink = new HyperLink();
                hyperLink.NavigateUrl = "yarismaya-basla.aspx";
                hyperLink.Text = "Tekrar Başla";
                Label5.Controls.Add(hyperLink);
                questionBatch.Clear();
                currentQuestionIndex = questionBatch.Count();
            }
        }

        /*Butonları Rastgele Şıklara Atıyor.*/
        private void ShuffleList<T>(List<T> list)
        {
            Random random = new Random();
            int n = list.Count;

            while (n > 1)
            {
                n--;
                int k = random.Next(n + 1);
                T value = list[k];
                list[k] = list[n];
                list[n] = value;
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string selectedAnswer = clickedButton.Text;
            string correctAnswer = Session["CorrectAnswer"].ToString();
            Button beforeAnswer = GetCorrectButton();

            if (string.Equals(selectedAnswer, correctAnswer, StringComparison.OrdinalIgnoreCase))
            {
                // User selected the correct answer, move to the next question
                UpdateTimer.Enabled = false;
                clickedButton.BackColor = System.Drawing.Color.ForestGreen;
                currentQuestionIndex++;
                Button5.Visible = true;
                int remainingTimepoint = Convert.ToInt32(Session["RemainingTime"]);
                puan += 10 + remainingTimepoint;
                Label2.Text = puan.ToString();
                Button1.OnClientClick = "return false";
                Button2.OnClientClick = "return false";
                Button3.OnClientClick = "return false";
                Button4.OnClientClick = "return false";
                
            }
            else
            {
                beforeAnswer.BackColor = Color.ForestGreen;
                clickedButton.BackColor = System.Drawing.Color.Red;
                UpdateTimer.Enabled = false;
                // Add logic for incorrect answer if needed
                Label3.Text = "Yanlış Cevap Verdiniz. Yarışma Sonlanmıştır.";
                if (puan != 0 && Session["username"] != null)
                {
                    Button6.Visible = true;
                    DateTime now = DateTime.Now;

                    // ClickInfo nesnesini oluştur ve tarih bilgisini at
                    ClickInfo clickInfo = new ClickInfo
                    {
                        ClickDateTime = now
                    };

                    // Bilgileri sessiona at
                    Session["ClickInfo"] = clickInfo;
                }
                Button1.OnClientClick = "return false";
                Button2.OnClientClick = "return false";
                Button3.OnClientClick = "return false";
                Button4.OnClientClick = "return false";
                switch (currentQuestionIndex)
                {
                    case 0:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 1:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 2:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 3:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 4:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 5:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 6:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 7:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 8:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 9:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                }
                questionBatch.Clear();
                currentQuestionIndex = questionBatch.Count();
                HyperLink hyperLink = new HyperLink();
                hyperLink.NavigateUrl = "yarismaya-basla.aspx";
                hyperLink.Text = "Tekrar Başla";
                Label5.Controls.Add(hyperLink);    
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Button1.OnClientClick = "return true";
            Button2.OnClientClick = "return true";
            Button3.OnClientClick = "return true";
            Button4.OnClientClick = "return true";
            switch (currentQuestionIndex - 1)
            {
                case 0:
                    Soru1.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 1:
                    Soru2.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 2:
                    Soru3.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 3:
                    Soru1.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 4:
                    Soru2.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 5:
                    Soru3.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 6:
                    Soru1.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 7:
                    Soru2.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 8:
                    Soru3.BackColor = System.Drawing.Color.ForestGreen;
                    break;
                case 9:
                    Soru1.BackColor = System.Drawing.Color.ForestGreen;
                    break;
            }
            InitializeQuestion();     
        }

        private Button GetCorrectButton()
        {
            // Determine which button has the correct answer
            if (string.Equals(Button1.Text, Session["correctAnswer"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                return Button1;
            }
            else if (string.Equals(Button2.Text, Session["correctAnswer"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                return Button2;
            }
            else if (string.Equals(Button3.Text, Session["correctAnswer"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                return Button3;
            }
            else if (string.Equals(Button4.Text, Session["correctAnswer"].ToString(), StringComparison.OrdinalIgnoreCase))
            {
                return Button4;
            }

            return null; // Return null if no correct button is found
        }
        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            int remainingTime = Convert.ToInt32(Session["RemainingTime"]);

            if (remainingTime > 0)
            {
                remainingTime--;
                Session["RemainingTime"] = remainingTime;
                Label1.Text = remainingTime.ToString(); // Geriye doğru sayımı Label'a yaz
                TimedPanel.Update();
            }
            else if (remainingTime == 0)
            {
                Label3.Text = "Süre Bitti. Yarışma Sonlanmıştır.";
                switch (currentQuestionIndex)
                {
                    case 0:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 1:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 2:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 3:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 4:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 5:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 6:
                        Soru1.BackColor = System.Drawing.Color.Red;
                        break;
                    case 7:
                        Soru2.BackColor = System.Drawing.Color.Red;
                        break;
                    case 8:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                    case 9:
                        Soru3.BackColor = System.Drawing.Color.Red;
                        break;
                }
                if (puan != 0 && Session["username"] != null)
                {
                    Button6.Visible = true;
                    DateTime now = DateTime.Now;

                    // ClickInfo nesnesini oluştur ve tarih bilgisini at
                    ClickInfo clickInfo = new ClickInfo
                    {
                        ClickDateTime = now
                    };

                    // Bilgileri sessiona at
                    Session["ClickInfo"] = clickInfo;
                }
                Button1.Visible = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                questionBatch.Clear();
                currentQuestionIndex = questionBatch.Count();
                UpdateTimer.Enabled = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "PostbackScript", "setTimeout(function(){ __doPostBack('', ''); }, 0);", true);
                
            }
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            // ClickInfo nesnesini Session'dan al
            ClickInfo clickInfo = (ClickInfo)Session["ClickInfo"];

            // Kullanıcı adı, puan ve kategori bilgilerini al
            string user = Session["username"].ToString();
             // GetPuan fonksiyonunu sizin puan bilgisini nasıl aldığınıza göre uyarlayın
            string category = Session["ctgkayit"].ToString();

            // SQL sorgusunu parametre kullanarak oluştur
            string query = "INSERT INTO pointsList (username, points, dates, category) VALUES (@Username, @Points, @Dates, @Category)";

            // SqlCommand ve SqlConnection nesnelerini kullan
            using (SqlCommand cmd = new SqlCommand(query, baglan))
            {
                // Parametreleri ekleyerek SQL sorgusunu güvenli hale getir
                cmd.Parameters.AddWithValue("@Username", user);
                cmd.Parameters.AddWithValue("@Points", puan);
                cmd.Parameters.AddWithValue("@Dates", clickInfo.ClickDateTime);
                cmd.Parameters.AddWithValue("@Category", category);

                // Bağlantıyı aç ve sorguyu çalıştır
                baglan.Open();
                cmd.ExecuteNonQuery();
                baglan.Close(); 
            }
            Response.Redirect("kullanici.aspx?uname=" + user);
        }

    }
    public class ClickInfo
    {
        public DateTime ClickDateTime { get; set; }
    }
    public class Question
    {
        public int Id { get; set; }
        public string QuestionText { get; set; }
        public string TrueAnswer { get; set; }
        public string FalseAnswer1 { get; set; }
        public string FalseAnswer2 { get; set; }
        public string FalseAnswer3 { get; set; }

        public string Sender { get; set;}
    }
}