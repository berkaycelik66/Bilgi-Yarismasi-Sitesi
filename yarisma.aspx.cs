using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YarismaSitesi
{
    public partial class yarisma : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-USOAJ0L\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");
        //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-GP90RBV\\SQLEXPRESS;Initial Catalog=yarisma;Integrated Security=True");

        static List<Question> questionBatch;
        static int currentQuestionIndex;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button5.Visible = false;
                LoadQuestionBatch();
                InitializeQuestion();
            }
            Button1.BackColor = default(Color);
            Button2.BackColor = default(Color);
            Button3.BackColor = default(Color);
            Button4.BackColor = default(Color);
        }
        private void LoadQuestionBatch()
        {
            string category = Request.QueryString["k"];
            baglan.Open();

            SqlCommand cmd;
            if (category == null)
            {
                cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE state='True' ORDER BY NEWID()", baglan);
            }
            else
            {
                cmd = new SqlCommand("SELECT TOP 3 * FROM questions WHERE category='" + category + "' AND state='True' ORDER BY NEWID()", baglan);
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
            Label4.Text = "";

            if (currentQuestionIndex < questionBatch.Count)
            {
                
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
                Label3.Text = "Congratulations! You have completed all questions.";
                Button1.Visible = false;
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
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
                clickedButton.BackColor = System.Drawing.Color.ForestGreen;
                currentQuestionIndex++;
                Button5.Visible = true;
            }
            else
            {
                beforeAnswer.BackColor = Color.ForestGreen;
                clickedButton.BackColor = System.Drawing.Color.Red;
                
                // Add logic for incorrect answer if needed
                Label3.Text = "Yanlış Cevap Verdiniz. Yarışma Sonlanmıştır.";
                Button1.OnClientClick = "return false";
                Button2.OnClientClick = "return false";
                Button3.OnClientClick = "return false";
                Button4.OnClientClick = "return false";
                questionBatch.Clear();
                currentQuestionIndex = questionBatch.Count();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
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