<%@ include file="/cabecalho.jsp" %>
			<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
	      		<jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
			</jsp:useBean>
			<c:if test="${!empty param.idLivro}">
			<c:set var="id" value="${param.idLivro}"/>
			<jsp:setProperty name="livrariaBean" property="idLivro" value="${id}" />
			<c:set var="livro" value="${livrariaBean.livro}" />
			<h2>${livro.titulo}</h2>
			Autoria de  <em> ${livro.autores}</em>
			(${livro.ano})<br>   <br>
			<h4>Descrição</h4>
			<blockquote>${livro.descricao}</blockquote>
			<h4>Preço: <fmt:formatNumber value="${livro.preco}" type="currency"/></h4>
			<c:url var="url" value="/livros/catalogo" >
			   <c:param name="Add" value="${id}" />
			</c:url>
			   <p><strong><a href="${url}"><img class="carrinho" title="adicionar livro ao carrinho" src="../images/comprar.png"></a></strong>   
			</c:if>
			<c:url var="url" value="/livros/catalogo" >
			<c:param name="Add" value="" />
			</c:url>
			<p><strong><a href="${url}">Continuar comprando</a></strong></p>
<%@ include file="/rodape.jsp" %>