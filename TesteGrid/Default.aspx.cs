using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TesteGrid.Model;
using TesteGrid.Repositories;

namespace TesteGrid
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Init();
            }
        }

       
        private void Init()
        {
            ICarteiraRepositorio repo = new ICarteiraRepositorio();

            DataSet ds = new DataSet();
            ds = repo.GetCarteiras();

            DataTable dt = ds.Tables[0];

            //dt.Columns.AddRange(
            //    new DataColumn[5]
            //    {
            //        new DataColumn("Perfil", typeof(string)),
            //        new DataColumn("Mes", typeof(int)),
            //        new DataColumn("Ano", typeof(int)),
            //        new DataColumn("CDI12m", typeof(double)),
            //        new DataColumn("CDI24m", typeof(double)),
            //    });

            //foreach (DataRow row in dt.Rows)
            //{
            //    DataRow newRow = dt.NewRow();
            //    newRow["Perfil"] = row.;
            //    newRow["Mes"] = 0;
            //    newRow["Ano"] = 0;
            //    newRow["CDI12m"] = 0;
            //    newRow["CDI24m"] = 0;

            //    dt.Rows.Add(newRow);
            //}



            ViewState["CurrentTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void ddlPerfil_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                var ddl = e.Row.FindControl("ddlPerfil") as DropDownList;
                if (ddl != null)
                {
                    ddl.DataSource = new List<string>() { "Selecione", "Conservador", "Moderado", "Agressivo", "Dinâmico" };
                    ddl.DataBind();
                }

                var ddlMes = e.Row.FindControl("ddlMes") as DropDownList;
                if (ddlMes != null)
                {
                    ddlMes.DataSource = new List<int> { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
                    ddlMes.DataBind();
                }


            }
        }

        protected void ButtonAdd_OnClick(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((sender as Button).NamingContainer);

            DropDownList ddl1 = (DropDownList)row.FindControl("ddlPerfil");
            DropDownList ddl2 = (DropDownList)row.FindControl("ddlMes");
            TextBox textboxAno = (TextBox)row.FindControl("txtAno");
            TextBox textboxCDI12m = (TextBox)row.FindControl("txtCDI12m");
            TextBox textboxCDI24m = (TextBox)row.FindControl("txtCDI24m");

            Carteira carteira = new Carteira()
            {
                Perfil = ddl1.SelectedItem.Text,
                Mes = Convert.ToInt16(ddl2.SelectedItem.Text),
                Ano = Convert.ToInt16(textboxAno.Text),
                CDI12m = Convert.ToDouble(textboxCDI12m.Text),
                CDI24m = Convert.ToDouble(textboxCDI24m.Text)
            };

            ddl1.SelectedIndex = 0;
            ddl2.SelectedIndex = 0;
            textboxAno.Text = String.Empty;
            textboxCDI12m.Text = String.Empty;
            textboxCDI24m.Text = String.Empty;

            ICarteiraRepositorio repo = new ICarteiraRepositorio();
            repo.SaveCarteira(carteira);
            Init();


        }

        private void AddNewRow()

        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    dtCurrentTable.Rows.Add(drCurrentRow);

                    ViewState["CurrentTable"] = dtCurrentTable;

                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {
                        DropDownList ddl1 = (DropDownList)GridView1.Rows[i].Cells[0].FindControl("ddlPerfil");
                        DropDownList ddl2 = (DropDownList)GridView1.Rows[i].Cells[1].FindControl("ddlMes");
                        TextBox textboxAno = (TextBox)GridView1.Rows[i].Cells[2].FindControl("txtAno");
                        TextBox textboxCDI12m = (TextBox)GridView1.Rows[i].Cells[3].FindControl("txtCDI12m");
                        TextBox textboxCDI24m = (TextBox)GridView1.Rows[i].Cells[4].FindControl("txtCDI24m");


                        dtCurrentTable.Rows[i]["Perfil"] = ddl1.SelectedItem.Text;
                        dtCurrentTable.Rows[i]["Mes"] = ddl2.SelectedItem.Text;
                        dtCurrentTable.Rows[i]["Ano"] = textboxAno.Text;
                        dtCurrentTable.Rows[i]["CDI12m"] = textboxCDI12m.Text;
                        dtCurrentTable.Rows[i]["CDI24m"] = textboxCDI24m.Text;
                    }
                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            SetPreviousData();
        }

        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DropDownList ddl1 = (DropDownList)GridView1.Rows[i].Cells[0].FindControl("ddlPerfil");
                        DropDownList ddl2 = (DropDownList)GridView1.Rows[i].Cells[1].FindControl("ddlMes");
                        TextBox textboxAno = (TextBox)GridView1.Rows[i].Cells[2].FindControl("txtAno");
                        TextBox textboxCDI12m = (TextBox)GridView1.Rows[i].Cells[3].FindControl("txtCDI12m");
                        TextBox textboxCDI24m = (TextBox)GridView1.Rows[i].Cells[4].FindControl("txtCDI24m");

                        ddl1.SelectedValue = dt.Rows[i]["Perfil"].ToString();
                        ddl1.SelectedValue = dt.Rows[i]["Mes"].ToString();
                        textboxAno.Text = dt.Rows[i]["Ano"].ToString();
                        textboxCDI12m.Text = dt.Rows[i]["CDI12m"].ToString();
                        textboxCDI24m.Text = dt.Rows[i]["CDI24m"].ToString();

                        rowIndex++;
                    }
                }
            }
        }

        protected void btnImportar_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void btnEditar_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void lnkEditar_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Init();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Init();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string perfil = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlPerfil")).SelectedValue;
            int mes = Convert.ToInt16(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlMes")).SelectedValue);
            int ano = Convert.ToInt16(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAno")).Text);
            double cdi12m = Convert.ToDouble(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCDI12m")).Text);
            double cdi24m = Convert.ToDouble(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCDI24m")).Text);

            //TODO Update registro no banco

            //TODO BIND na gridview
        }
    }
}