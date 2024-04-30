using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace Atlas_Cloner
{
    public partial class formPath : Form
    {
        public formPath()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void formPath_Load(object sender, EventArgs e)
        {

        }

        private void buttonPath_Click(object sender, EventArgs e)
        {
            using (FolderBrowserDialog folderBrowserDialog = new FolderBrowserDialog())
            {
                folderBrowserDialog.SelectedPath = "C:\\";
                DialogResult result = folderBrowserDialog.ShowDialog();

                if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(folderBrowserDialog.SelectedPath))
                    textPath.Text = folderBrowserDialog.SelectedPath;
            }
        }

        private void buttonRun_Click(object sender, EventArgs e)
        {
            string path = textPath.Text;
            Process.Start("atlasCloner.bat", path);
        }
    }
}
