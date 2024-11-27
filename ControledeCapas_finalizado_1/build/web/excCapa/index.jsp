<%-- 
    Document   : index
    Created on : 20 de nov. de 2024, 21:48:19
    Author     : lir4
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Capas"%>
<%@page import="model.dao.CapasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir Capa</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('imagens/imagem.delete.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h1 {
            font-size: 2em;
            margin-bottom: 20px;
            color: #f8f9fa;
        }

        label {
            font-size: 1.1em;
            margin-bottom: 10px;
            display: block;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1.1em;
            background-color: #f7f7f7;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #dc3545;
            color: white;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #c82333;
        }

        .message {
            font-size: 1.2em;
            margin-top: 20px;
        }

        .success {
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }

        .back-btn {
            margin-top: 20px;
        }

        .back-btn a {
            color: #007bff;
            font-size: 1.1em;
            text-decoration: none;
        }

        .back-btn a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Exclusão de Capa</h1>
        
        <form name="frmcapa" method="post" action="excluir.jsp">
            <label for="exCapaId">Digite o ID da Capa para Exclusão:</label>
            <input type="number" id="id" name="id" required>

            <button type="submit">Excluir Capa</button>
        </form>

        <%
            // Lógica de Exclusão
            String message = "";
            if (request.getMethod().equalsIgnoreCase("POST")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Capas capa = new Capas();
                capa.setId(id);
                CapasDAO capaDAO = new CapasDAO();
                
                if (capaDAO.exCapaId(capa)) {
                    message = "<p class='message success'>Capa excluída com sucesso!</p>";
                } else {
                    message = "<p class='message error'>Erro ao excluir a capa! Tente novamente.</p>";
                }
            }
            out.println(message);
        %>

        <div class="back-btn">
            <a href="../index.html">Voltar para a Página Inicial</a>
        </div>
    </div>
</body>
</html>
