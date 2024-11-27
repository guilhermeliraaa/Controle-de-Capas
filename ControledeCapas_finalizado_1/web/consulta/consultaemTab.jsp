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
        <title>Consulta de Capas</title>
        
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
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
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
                margin-top: 20px;
            }

            .button:hover {
                background-color: #45a049;
            }

            .header {
                text-align: center;
                margin-bottom: 30px;
            }

            .header img {
                max-width: 200px;
                height: auto;
            }
        </style>
    </head>
    <body>

        <div class="header">
            <img src='../imagens/logo.trabalho.jpg' alt='Logo'/>
            <h1>Consulta de Capas - Registros</h1>
        </div>

        <% 
            // Select "Lista"
            CapasDAO capaDAO = new CapasDAO();
            List<Capas> lista = capaDAO.consCapaLista();
            int n_reg = lista.size();
        %>

        <table>
            <thead>
                <tr>
                    <th>Registro</th>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Formato</th>
                    <th>Tamanho</th>
                    <th>Cor</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < lista.size(); i++) { %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= lista.get(i).getId() %></td>
                        <td><%= lista.get(i).getCodigo() %></td>
                        <td><%= lista.get(i).getFormato() %></td>
                        <td><%= lista.get(i).getTamanho() %></td>
                        <td><%= lista.get(i).getCor() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <div>
            <p><b>Total de Registros: </b><%= n_reg %></p>
     
        </div>

        <!-- Botão Voltar -->
        <div style="text-align: center;">
            <a href="../index.html">
                <button class="button">Voltar à Tela Inicial</button>
            </a>
        </div>

    </body>
</html>