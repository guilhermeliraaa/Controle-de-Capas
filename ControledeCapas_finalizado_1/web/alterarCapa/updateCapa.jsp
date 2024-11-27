<%-- 
    Document   : updateCapa
    Created on : 21 de nov. de 2024, 23:25:18
    Author     : lir4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Capas"%>
<%@page import="model.dao.CapasDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
    </head>
    <body>
        <h1> Alteração</h1>
 <%
    // Entrada
    String idParam = request.getParameter("id");
    String codigoParam = request.getParameter("codigo");
    String tamanhoParam = request.getParameter("tamanho");
    String formato = request.getParameter("formato");
    String cor = request.getParameter("cor");

    // Depuração: imprimindo os parâmetros para ver o que está sendo enviado
    out.println("id: " + idParam);
    out.println("codigo: " + codigoParam);
    out.println("tamanho: " + tamanhoParam);
    out.println("formato: " + formato);
    out.println("cor: " + cor);

    if (idParam != null && codigoParam != null && tamanhoParam != null) {
        try {
            int id = Integer.parseInt(idParam);
            int codigo = Integer.parseInt(codigoParam);
            int tamanho = Integer.parseInt(tamanhoParam);

            // Instância do objeto e atribuição de dados
            Capas capa = new Capas();
            capa.setId(id);
            capa.setCodigo(codigo);
            capa.setTamanho(tamanho);
            capa.setFormato(formato);
            capa.setCor(cor);

            CapasDAO capaDAO = new CapasDAO();

            if (capaDAO.altcapa(capa)) {
                // Acesso Permitido
                out.println("Dados Alterados com sucesso!!");
                response.sendRedirect("sucesso.jsp");
            } else {
                // Acesso Negado
                out.println("Dados Não Alterados!!");
            }
        } catch (NumberFormatException e) {
            out.println("Erro: Parâmetro inválido.");
        }
    } else {
        out.println("Erro: Parâmetros ausentes.");
    }
%>
    </body>
</html>

