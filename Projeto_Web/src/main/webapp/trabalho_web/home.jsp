<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href = "style.css">
    <title>Crie seu curriculo Online</title>
</head>

<body>
    <div class="main">
        <div class = "logo">
                <img src = "Imagens/logo.png">
        </div>

        <div class="caixaDeEntrada">
            <div class="contato">
                <form id="formuName" method="POST" action="submit.php">
                    <div>
                        <p>Nome:</p>
                        <input type="text" maxlength= "60" name="nome" id="nome" placeholder="Ex.: João Pinheiro Silva">
                    </div>

                    <div>
                        <p>E-mail:</p>
                        <input type="text" maxlength= "60" name="email" id="email" placeholder="Ex.: Joaopinheiro@sempregmail.com">
                    </div>

                    <div>
                        <p>Telefone:</p>
                        <input type="text" maxlength= "60" name="telefone" id="telefone" placeholder="Ex.: (61)940028922">
                    </div>
                </form>
            </div>


            <div class="info">
                    <form id="formuIntro" method="POST" action="submit.php">

                        <div>
                            <p>Experiências:</p>
                            <textarea name="experiencia" maxlength= "425" id="experiencia" cols="30" rows="10" placeholder="Insira suas experiências"></textarea>
                        </div>

                        <div>
                            <p>Formação acadêmica:</p>
                            <textarea name="educacao" maxlength= "425" id="educacao" cols="30" rows="10" placeholder="Insira sua formação academica"></textarea>
                        </div>

                        <div>
                            <p>Extras:</p>
                            <textarea name="adcional" maxlength= "425" id="adcional" cols="30" rows="10" placeholder="Insira seu conteúdo Extra como certificados, cursos..."></textarea>
                        </div>
                    </form>
            </div>

            <button type="button" onclick="myFunction()"><img src="Imagens/enviar.png"></button>
        </div>

        <div class="caixaDeSaida">

            <div class="contatoS">
                <h3 class="curriculo">Currículo</h3>
                <div class="caixaDeSaida1">
                    <p class="form-contatos-nome">Nome:</p>
                    <p id="resultadoNome"></p>
                </div>

                <div class="caixaDeSaida2">
                    <p class="form-contatos-email">Email:</p>
                    <p id="resultadoEmail"></p>
                </div>

                <div class="caixaDeSaida3">
                    <p class="form-contatos-tel">Telefone:</p>
                    <p id="resultadoTel"></p>
                </div>
            </div>

                <div class="caixaDeSaida5">
                    <p class="form-infos-vive">Experência: </p>
                    <p id="resultadoExp"></p>
                </div>

                <div class="caixaDeSaida6">
                    <p class="form-infos-edu">Educação: </p>
                    <p id="resultadoEduc"></p>
                </div>

                <div class="caixaDeSaida7">
                    <p class="form-infos-adc">Mais: </p>
                    <p id="resultadoAdc"></p>
                </div>
            </div>
        </div>    
    </div>
</body>
    <script type="text/javascript">
        function myFunction() { 
          document.getElementById("resultadoNome").innerHTML = document.getElementById("nome").value;
          document.getElementById("resultadoEmail").innerHTML = document.getElementById("email").value;
          document.getElementById("resultadoTel").innerHTML = document.getElementById("telefone").value;
          document.getElementById("resultadoExp").innerHTML = document.getElementById("experiencia").value;
          document.getElementById("resultadoEduc").innerHTML = document.getElementById("educacao").value;
          document.getElementById("resultadoAdc").innerHTML = document.getElementById("adcional").value;
        }
    </script>

</html>