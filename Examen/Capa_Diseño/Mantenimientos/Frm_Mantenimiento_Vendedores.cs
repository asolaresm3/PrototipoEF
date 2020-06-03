using Capa_Diseño.Consultas;
using Capa_Logica;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Capa_Diseño.Mantenimientos
{
    public partial class Frm_Mantenimiento_Vendedores : Form
    {
        Logica logic = new Logica();
        string scampo;
        public Frm_Mantenimiento_Vendedores()
        {
            InitializeComponent();
            scampo = logic.siguiente("vendedores", "codigo_vendedor");
            textBox1.Text = scampo;
            bloquearTXT();
        }

        void bloquearTXT()
        {
            TextBox[] txtBox = { textBox1, textBox2, textBox3,textBox4,textBox5 };
            for (int i = 0; i < txtBox.Length; i++)
            {
                txtBox[i].Enabled = false;
            }
            ComboBox[] comboBox = { comboBox1 };

            for (int i = 0; i < comboBox.Length; i++)
            {
                comboBox[i].Enabled = false;
            }
        }

        private int validarTXT(TextBox[] list)
        {
            for (int i = 0; i < list.Length; i++)
            {
                if (string.IsNullOrEmpty(list[i].Text))
                {
                    MessageBox.Show("Debe completar la informacion en el campo " + list[i].Name);
                    return 0;
                }
            }
            return 1;
        }

        void limpiarTXT(TextBox[] txtBox, ComboBox[] comboBo)
        {
            //Aqui se limpian los txt
            for (int i = 0; i < txtBox.Length; i++)
            {
                txtBox[i].Text = "";
            }
            //Aqui colocamos el siguiente codigo de la tabla y su llave primaria 
            scampo = logic.siguiente("vendedores", "codigo_vendedor");
            textBox1.Text = scampo;
            if (comboBox1.Text != "")
            {
                comboBox1.Text = "Activo";
            }
            else
            {
                comboBox1.Text = "Inactico";
            }
        }


        private void Btn_minimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void Btn_cerrar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void Btn_ingresar_Click(object sender, EventArgs e)
        {
            TextBox[] txtBox = { textBox1, textBox2,textBox3,textBox4,textBox5 };
            for (int i = 0; i < txtBox.Length; i++)
            {
                txtBox[i].Enabled = true;
            }
            ComboBox[] comboBox = { comboBox1 };
            for (int i = 0; i < comboBox.Length; i++)
            {
                comboBox[i].Enabled = true;
            }
        }

        private void Btn_editar_Click(object sender, EventArgs e)
        {
            ComboBox[] comboBox = { comboBox1 };
            TextBox[] txtBox = { textBox1, textBox2, textBox3,textBox4,textBox5 };

            if (validarTXT(txtBox) == 0)
                return;
            else
            {
                if (comboBox1.Text == "Activo")
                {
                    comboBox1.Text = "1";
                }
                else
                {
                    comboBox1.Text = "0";
                }
                //Aqui se declara la tabla donde se ira a modificar y en el segundoa arreglo, se debe de colocar los nombre de los campos.
                string[] valores = { "vendedores", textBox1.Text, textBox2.Text,textBox3.Text,textBox4.Text,textBox5.Text, comboBox1.Text };
                string[] campos = { "codigo_vendedor", "nombre_vendedor","direccion_vendedor","telefono_vendedor","nit_vendedor", "estado" };
                if (logic.Modificar(valores, campos) == null)
                    MessageBox.Show("Ocurrio un error al modificar los datos.");
                else
                {
                    MessageBox.Show("Datos modificados exitosamente.");
                    limpiarTXT(txtBox, comboBox);
                    bloquearTXT();
                }
            }
        }

        private void Btn_guardar_Click(object sender, EventArgs e)
        {
            TextBox[] txtBox = { textBox1, textBox2,textBox3,textBox4,textBox5 };

            ComboBox[] comboBox = { comboBox1 };

            if (validarTXT(txtBox) == 0)
                return;
            else
            {
                if (comboBox1.Text == "Activo")
                {
                    comboBox1.Text = "1";
                }
                else
                {
                    comboBox1.Text = "0";
                }

                string[] valores = { "vendedores", textBox1.Text, textBox2.Text,textBox3.Text,textBox4.Text,textBox5.Text, comboBox1.Text };
                if (logic.Insertar(valores) == null)
                    MessageBox.Show("Ocurrio un error al guardar los datos.");
                else
                {
                    MessageBox.Show("Datos guardados exitosamente.");
                    limpiarTXT(txtBox, comboBox);
                    bloquearTXT();
                }
            }
        }

        private void Btn_borrar_Click(object sender, EventArgs e)
        {
            ComboBox[] comboBox = { comboBox1 };

            TextBox[] txtBox = { textBox1, textBox2,textBox3,textBox4,textBox5 };

            string[] valores = { "vendedores", textBox1.Text, "codigo_vendedor" };
            if (logic.Eliminar(valores) == null)
                MessageBox.Show("Ocurrio un error al borrar los datos.");
            else
            {
                MessageBox.Show("Datos eliminados exitosamente.");
                limpiarTXT(txtBox, comboBox);
                bloquearTXT();
            }
        }

        private void Btn_consultar_Click(object sender, EventArgs e)
        {
            Frm_Consulta_Vendedor vende = new Frm_Consulta_Vendedor();
            vende.ShowDialog();

            if (vende.DialogResult == DialogResult.OK)
            {
                textBox1.Text = vende.Dgv_consulta.Rows[vende.Dgv_consulta.CurrentRow.Index].
                      Cells[0].Value.ToString();
                textBox2.Text = vende.Dgv_consulta.Rows[vende.Dgv_consulta.CurrentRow.Index].
                      Cells[1].Value.ToString();
                textBox3.Text = vende.Dgv_consulta.Rows[vende.Dgv_consulta.CurrentRow.Index].
                      Cells[2].Value.ToString();
                textBox4.Text = vende.Dgv_consulta.Rows[vende.Dgv_consulta.CurrentRow.Index].
                      Cells[3].Value.ToString();
                textBox5.Text = vende.Dgv_consulta.Rows[vende.Dgv_consulta.CurrentRow.Index].
                      Cells[4].Value.ToString();



            }
        }
    }
}
