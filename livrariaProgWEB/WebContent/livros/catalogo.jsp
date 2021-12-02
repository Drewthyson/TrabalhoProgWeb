<%@ include file="/cabecalho.jsp" %>
			<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
			   <jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
			</jsp:useBean>
			<c:if test="${not empty param.Add}">
			<c:set var="idL" value="${param.Add}"/>
			<jsp:setProperty name="livrariaBean" property="idLivro" value="${idL}" />
			<c:set var="livroAdicionado" value="${livrariaBean.livro}" />
			<h3>
			   <font color="#402110" size="+2">Você adicionou o livro <em>${livroAdicionado.titulo}</em> ao seu carrinho de compras.</font>
			</h3>
			</c:if>	
			<c:choose>
		    <c:when test="${sessionScope.cart.numeroItens > 0}">
		       <c:url var="url" value="/livros/mostrarCarrinho">
		          <c:param name="limpar" value="0"/>
		          <c:param name="remover" value="0"/>
		       </c:url>
		       <p>
		         <a href="${url}"><img class="carrinho" title="Ver Carrinho" src="../images/carrinho.png"></a>
		          <c:url var="url" value="/livros/comprar" />
		           <a href="${url}"><img class="carrinho" title="Finalizar Compras" src="../images/recibo.png"></a>
		        </p>
		    </c:when>
		    <c:otherwise>
		         Seu carrinho de compras está vazio.
		    </c:otherwise>
			</c:choose>
			<br>
			<br>
			<h3>Livros disponíveis para compra:</h3>
			<div class="livros">
			 <table summary="layout">
			    <c:forEach var="livro" begin="0" items="${livrariaBean.livros}">
			    <th>
				<tr>
			      <c:set var="idLivro" value="${livro.idLivro}" />
			      <td bgcolor="#733917">
			        <c:url var="url" value="/livros/detalhesLivro" >
			           <c:param name="idLivro" value="${idLivro}"/>
			        </c:url>
			        <a href="${url}"><strong>${livro.titulo}</strong></a>
			      </td>
			         <td bgcolor="#F2E3B6" rowspan=2>
			         <fmt:formatNumber value="${livro.preco}" type="currency"/>
			         </td>
			         <td bgcolor="#A66F3F" rowspan=2>
			            <c:url var="url" value="/livros/catalogo" >
			               <c:param name="Add" value="${idLivro}"/>
			               </c:url>
			               <a href="${url}"><img class="carrinho" title="adicionar livro ao carrinho" src="../images/comprar.png"></a>
			         </td>
				</tr>
			   <tr>
			     <td bgcolor="#A66F3F">
			          <em class="autores">${livro.autores}</em>
			     </td>
			     <th>
			   </tr>
			  </c:forEach>
			 </table>
			</div>
<%@ include file="/rodape.jsp" %>