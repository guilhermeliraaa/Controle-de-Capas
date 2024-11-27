<%-- 
    Document   : alterar
    Created on : 21 de nov. de 2024, 21:33:00
    Author     : lir4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Capas" %>
<%@ page import="model.dao.CapasDAO" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alterar Capa</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 700px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #4CAF50;
            font-size: 2em;
            margin-bottom: 20px;
        }

        h3 {
            color: #333;
            font-size: 1.6em;
            margin-bottom: 30px;
        }

        label {
            font-size: 1.1em;
            margin-bottom: 10px;
            text-align: left;
            display: block;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            font-size: 1.1em;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-btn {
            margin-top: 20px;
            text-align: center;
        }

        .back-btn a {
            color: #007bff;
            font-size: 1.1em;
            text-decoration: none;
        }

        .back-btn a:hover {
            text-decoration: underline;
        }

        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
            }

            h2 {
                font-size: 1.8em;
            }

            h3 {
                font-size: 1.4em;
            }

            input[type="text"], input[type="number"], select {
                font-size: 1em;
            }

            input[type="submit"] {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>

<% 
    // Recebe o id enviado do index.htm
    int id = Integer.parseInt(request.getParameter("id"));
    
    // Instancia o DAO e busca a capa pelo id
    Capas capa = new Capas();
    capa.setId(id);  
    
    // Verifica se a capa foi encontrada
    CapasDAO capaDAO = new CapasDAO();
    if (capaDAO.consPesqRegIdent(capa) != null) {
%>
    <div class="container">
        <h2>Alterar Capa</h2>
        <h3>Dados da Capa</h3>
        <form name="frmCapa" method="post" action="updateCapa.jsp">
            <label for="id">Identificador:</label>
            <input type="text" name="id" value="<%= capa.getId() %>" readonly>
            
            <label for="codigo">Código:</label>
            <input type="number" name="codigo" value="<%= capa.getCodigo() %>" minlength="2" maxlength="10" required>

            <label for="tamanho">Tamanho:</label>
            <input type="text" name="tamanho" value="<%= capa.getTamanho() %>" required>

            <label for="formato">Formato:</label>
            <select id="formato" name="formato">
                <option value="A4" <%= capa.getFormato().equals("A4") ? "selected" : "" %>>A4</option>
                <option value="A3" <%= capa.getFormato().equals("A3") ? "selected" : "" %>>A3</option>
                <option value="A5" <%= capa.getFormato().equals("A5") ? "selected" : "" %>>A5</option>
            </select>

            <label for="cor">Cor:</label>
            <input type="text" name="cor" value="<%= capa.getCor() %>" required>
            
            <input type="submit" value="Alterar">
        </form>
    </div>

<% 
    } else {
        out.println("<h3 style='color:red;'>Registro não encontrado!</h3>");
    }
%>

    <div class="back-btn">
        <a href="../index.html">Voltar para a Página Inicial</a>
    </div>

</body>
</html>