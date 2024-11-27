<%-- 
    Document   : sucesso
    Created on : 19 de nov. de 2024, 21:51:22
    Author     : lir4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Bem-Sucedido</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('imagens/tela.cadastro.realizado.png');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .message-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #28a745;
        }
        .btn-back {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="message-container">
    <h1>Cadastro Realizado com Sucesso!</h1>
    <p>A capa foi cadastrada corretamente no sistema.</p>
    <div class="back-btn">
        <a href="../index.html">Voltar para a Página Inicial</a>
    </div>    
    </a>
</div>
    
</body>
</html>
