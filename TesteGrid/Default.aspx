<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TesteGrid.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:GridView
                runat="server"
                ShowFooter="True" ShowHeader="true"
                AutoGenerateColumns="False"
                ID="GridView1"
                OnRowDataBound="GridView1_OnRowDataBound"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating" CssClass="table table-striped table-bordered table-hover table-condensed">
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Perfil" CssClass="text-center text-capitalize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Perfil") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control">
                                <asp:ListItem>Selecione</asp:ListItem>
                                <asp:ListItem>Conservador</asp:ListItem>
                                <asp:ListItem>Moderado</asp:ListItem>
                                <asp:ListItem>Agressivo</asp:ListItem>
                                <asp:ListItem>Dinâmico</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Mês" CssClass="text-center text-capitalize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Mes") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMes" runat="server" CssClass="form-control">
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlMes" runat="server" CssClass="form-control" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Ano" CssClass="text-center text-capitalize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Ano") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtAno" Text='<%# Eval("Ano")%>' CssClass="form-control" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAno" runat="server" CssClass="form-control" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="CDI 12" CssClass="text-center text-capitalize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("CDI12m") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCDI12m" Text='<%# Eval("CDI12m")%>' CssClass="form-control" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCDI12m" runat="server" CssClass="form-control" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="CDI 24" CssClass="text-center text-capitalize"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("CDI24m") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCDI24m" Text='<%# Eval("CDI24m")%>' CssClass="form-control" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCDI24m" runat="server" CssClass="form-control" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderStyle-BackColor="Orange" ItemStyle-CssClass="text-center" ItemStyle-Width="50px" ShowEditButton="True" ValidationGroup="Edit" />

                    <asp:TemplateField ItemStyle-Width="50px">
                        <HeaderStyle BackColor="Orange" CssClass="text-center" ForeColor="White" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server"
                                OnClientClick="return confirm('Are you sure you want to delete this row?')"
                                Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Insere" ValidationGroup="Insert" CssClass="btn btn-warning btn-sm" OnClick="ButtonAdd_OnClick" />
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Button runat="server" ID="btnImportar" Text="Importar" OnClick="btnImportar_OnClick" />
            <asp:Button runat="server" ID="btnEditar" Text="Editar" OnClick="btnEditar_OnClick" />
        </div>
    </form>
</body>
</html>
