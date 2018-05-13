<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TesteGrid.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ShowFooter="True" AutoGenerateColumns="False" ID="GridView1" OnRowDataBound="GridView1_OnRowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Perfil") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlPerfil" runat="server">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Mes") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlMes" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("Ano") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAno" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("CDI12m") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCDI12m" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval ("CDI24m") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCDI24m" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>


                    <%--<asp:BoundField HeaderText="Perfil" DataField="Perfil" runat="server" />--%>
                    <%--<asp:BoundField HeaderText="Mes" DataField="Mes" runat="server" />--%>
                    <%--<asp:BoundField HeaderText="Ano" DataField="Ano" runat="server" />--%>
                    <%--<asp:BoundField HeaderText="CDI 12m" DataField="CDI12m" runat="server" />--%>
                    <%--<asp:BoundField HeaderText="CDI 24m" DataField="CDI24m" runat="server" />--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Editar" ID="lnkEditar" OnClick="lnkEditar_OnClick" />
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Right" />
                        <FooterTemplate>
                            <asp:Button ID="ButtonAdd" runat="server"  Text="Add New Row" OnClick="ButtonAdd_OnClick" />
                        </FooterTemplate>
                    </asp:TemplateField>


                   <%-- <asp:TemplateField HeaderText="Perfil">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlPerfil" runat="server"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mes">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlMes" runat="server"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ano">
                        <ItemTemplate>
                            <asp:TextBox ID="txtAno" runat="server" Text='<%# Eval("Ano") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CDI 12m">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCDI24m" runat="server" Text='<%# Eval("CDI24m") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CDI 12m">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCDI12m" runat="server" Text='<%# Eval("CDI12m") %>'></asp:TextBox>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Right" />
                        <FooterTemplate>
                            <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_OnClick" />
                        </FooterTemplate>
                    </asp:TemplateField>--%>

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
