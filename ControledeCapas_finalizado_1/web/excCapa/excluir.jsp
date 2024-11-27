<%-- 
    Document   : excluir
    Created on : 20 de nov. de 2024, 20:07:18
    Author     : lir4
--%>

<%@page import="model.Capas"%>
<%@page import="model.dao.CapasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusão de Registro</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('images/excluido.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            text-align: center;
        }
        h1 {
            font-size: 2em;
            color: #f8f9fa;
        }
        p {
            font-size: 1.2em;
            margin: 20px 0;
        }
        .message {
            font-size: 1.3em;
            font-weight: bold;
            color: #f0ad4e;
        }
        .success {
            color: #28a745;
        }
        .error {
            color: #dc3545;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn:active {
            background-color: #004085;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Entrada/Receber ID
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atribuição de valor
            Capas capa = new Capas();
            capa.setId(id);
            
            // Seleção e exclusão
            CapasDAO capaDAO = new CapasDAO();
            boolean isDeleted = capaDAO.exCapaId(capa);
        %>

        <h1>Exclusão de Registro</h1>

        <% if (isDeleted) { %>
            <p class="message success">Registro excluído com sucesso!</p>
        <% } else { %>
            <p class="message error">Erro! O registro não foi excluído.</p>
        <% } %>

        <!-- Botão de Retorno -->
        <a href="../index.html" class="btn">Voltar para a Página Inicial</a>
    </div>
</body>
</html>
