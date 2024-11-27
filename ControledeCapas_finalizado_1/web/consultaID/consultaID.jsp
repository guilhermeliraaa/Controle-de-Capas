<%-- 
    Document   : consultaLista
    Created on : 30 de out. de 2024, 21:45:24
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Capas"%>
<%@page import="model.dao.CapasDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Capas por ID</title>
    
    <!-- CSS para melhorar o visual -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .header img {
            max-width: 250px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        table {
            width: 60%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 30px;
        }

        .button:hover {
            background-color: #45a049;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="header">
        <img src='../imagens/logo.trabalho.jpg' alt='Logo'/>
        <h1>Consulta de Capas por ID</h1>
    </div>

    <%
        //Entrada/Receber
        int id = Integer.parseInt(request.getParameter("id"));
            
        // Instância e atrib de valor
        Capas capa = new Capas();
        capa.setId(id);
        
        //Select
        CapasDAO capaDAO = new CapasDAO();
        if(capaDAO.consCapaid(capa) != null){
    %>

    
    <table>
        <tr>
            <th>ID</th>
            <td><%= capa.getId() %></td>
        </tr>
        <tr>
            <th>Código</th>
            <td><%= capa.getCodigo() %></td>
        </tr>
        <tr>
            <th>Tamanho</th>
            <td><%= capa.getTamanho() %></td>
        </tr>
        <tr>
            <th>Formato</th>
            <td><%= capa.getFormato() %></td>
        </tr>
        <tr>
            <th>Cor</th>
            <td><%= capa.getCor() %></td>
        </tr>
    </table>

    <%
        } else {
            out.println("<div class='center'><p><strong>ID não encontrado!</strong></p></div>");
        }
    %>

    <!-- Botão Voltar -->
    <div class="center">
        <a href="../index.html">
            <button class="button">Voltar à Tela Inicial</button>
        </a>
    </div>

</body>
</html>