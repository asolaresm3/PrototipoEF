using Capa_Diseño.Mantenimientos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Capa_Diseño
{
    public partial class Menu : Form
    {
        private int childFormNumber = 0;

        public Menu()
        {
            InitializeComponent();
        }

        private void ShowNewForm(object sender, EventArgs e)
        {
            Form childForm = new Form();
            childForm.MdiParent = this;
            childForm.Text = "Ventana " + childFormNumber++;
            childForm.Show();
        }

        private void OpenFile(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            openFileDialog.Filter = "Archivos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*";
            if (openFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = openFileDialog.FileName;
            }
        }

        private void SaveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            saveFileDialog.Filter = "Archivos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*";
            if (saveFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = saveFileDialog.FileName;
            }
        }

        private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CutToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void CopyToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void PasteToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

       

        private void CascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void TileVerticalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }

        private void TileHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void ArrangeIconsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.ArrangeIcons);
        }

        private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        bool ventanaMarca = false;
        Frm_Mantenimiento_Marca marca = new Frm_Mantenimiento_Marca();
        private void MarcasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmC = Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Frm_Mantenimiento_Marca);
            if (ventanaMarca == false || frmC == null)
            {
                if (frmC == null)
                {
                    marca = new Frm_Mantenimiento_Marca();
                }

                marca.MdiParent = this;
                marca.Show();
                Application.DoEvents();
                ventanaMarca = true;
            }
            else
            {
                marca.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }

        bool ventanaLinea = false;
        Frm_Mantenimiento_Lineas linea = new Frm_Mantenimiento_Lineas();
        private void LineasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmC = Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Frm_Mantenimiento_Lineas);
            if (ventanaLinea == false || frmC == null)
            {
                if (frmC == null)
                {
                    linea = new Frm_Mantenimiento_Lineas();
                }

                linea.MdiParent = this;
                linea.Show();
                Application.DoEvents();
                ventanaLinea = true;
            }
            else
            {
                linea.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }

        bool ventanaProducto = false;
        Frm_Mantenimiento_Productos product = new Frm_Mantenimiento_Productos();
        private void ProductosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmC = Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Frm_Mantenimiento_Productos);
            if (ventanaProducto == false || frmC == null)
            {
                if (frmC == null)
                {
                    product = new Frm_Mantenimiento_Productos();
                }

                product.MdiParent = this;
                product.Show();
                Application.DoEvents();
                ventanaProducto = true;
            }
            else
            {
                product.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }

        bool ventanaVendedores = false;
        Frm_Mantenimiento_Vendedores vend = new Frm_Mantenimiento_Vendedores();
        private void VendedoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmC = Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Frm_Mantenimiento_Vendedores);
            if (ventanaVendedores == false || frmC == null)
            {
                if (frmC == null)
                {
                    vend = new Frm_Mantenimiento_Vendedores();
                }

                vend.MdiParent = this;
                vend.Show();
                Application.DoEvents();
                ventanaVendedores = true;
            }
            else
            {
                vend.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }

        bool ventanaClientes = false;
        Frm_Mantenimiento_Clientes clt = new Frm_Mantenimiento_Clientes();
        private void ClientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmC = Application.OpenForms.Cast<Form>().FirstOrDefault(x => x is Frm_Mantenimiento_Clientes);
            if (ventanaClientes == false || frmC == null)
            {
                if (frmC == null)
                {
                    clt = new Frm_Mantenimiento_Clientes();
                }

                clt.MdiParent = this;
                clt.Show();
                Application.DoEvents();
                ventanaClientes = true;
            }
            else
            {
                clt.WindowState = System.Windows.Forms.FormWindowState.Normal;
            }
        }
    }
}
