<%-- 
    Document   : pesquisa
    Created on : 30 de out. de 2024, 19:42:37
    Author     : alunocmc
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
        <title>JSP Page</title>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Capa</title>
    <style>
      
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('images/cadastro.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<%
    // Variáveis para capturar os dados
    String codigoParam = request.getParameter("codigo");
    String formatoParam = request.getParameter("formato");
    String corParam = request.getParameter("cor");
    String tamanhoParam = request.getParameter("tamanho");

    // Verifica se os dados foram recebidos
    if (codigoParam != null && formatoParam != null && corParam != null) {
        // Criação do objeto Capas e instância do DAO
        int codigo = Integer.parseInt(codigoParam);
        String formato = formatoParam;
        String cor = corParam;
        int tamanho = (tamanhoParam != null && !tamanhoParam.isEmpty()) ? Integer.parseInt(tamanhoParam) : 0;

        Capas capa = new Capas();
        capa.setCodigo(codigo);
        capa.setFormato(formato);
        capa.setCor(cor);
        capa.setTamanho(tamanho);

        // Processar a inserção no banco de dados
        CapasDAO capaDAO = new CapasDAO();
        boolean sucesso = capaDAO.insCapas(capa);

        if (sucesso) {
            // Se inserção for bem-sucedida, redireciona para a tela de sucesso
            response.sendRedirect("sucesso.jsp");
        } else {
            out.println("<p style='color:red;'>Erro ao cadastrar capa.</p>");
        }
    }
%>

<div class="form-container">
    <h1>Cadastro de Capa</h1>
    <form method="post">
        <label for="codigo">Código:</label>
        <input type="number" id="codigo" name="codigo" required>
        
        <label for="formato">Formato:</label>
        <input type="text" id="formato" name="formato" required>

        <label for="cor">Cor:</label>
        <input type="text" id="cor" name="cor" required>
        
        <label for="tamanho">Tamanho:</label>
        <input type="number" id="tamanho" name="tamanho">

        <button type="submit">Cadastrar Capa</button>
    </form>
</div>

</body>
</html>
