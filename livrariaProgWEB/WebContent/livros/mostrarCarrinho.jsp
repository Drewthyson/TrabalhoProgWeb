<%@ include file="/cabecalho.jsp" %>
<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
   <jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
</jsp:useBean>
<c:if test="${param.limpar == 'limpar'}">
   <font color="#402110" size="+2">
      <strong>O carrinho de compras foi esvaziado!</strong><br> <br>
   </font>
</c:if>
<c:if test="${param.remover != '0' && param.remover != null}">
   <c:set var="id" value="${param.remover}"/>
   <jsp:setProperty name="livrariaBean" property="idLivro" value="${id}" />
   <c:set var="livroRemovido" value="${livrariaBean.livro}" />
   <font color="#402110" size="+2">O seguinte livro foi removido do carrinho:
      <em>${livroRemovido.titulo}</em>.

      <br> <br>
   </font>
</c:if>
<c:if test="${sessionScope.cart.numeroItens > 0}">
   <font size="+2">Quantidade de itens do carrinho: ${sessionScope.cart.numeroItens}
   <c:if test="${sessionScope.cart.numeroItens == 1}">
      livro.
   </c:if>
   <c:if test="${sessionScope.cart.numeroItens > 1}">
      livros.
   </c:if>
   </font><br>
<table summary="layout">
   <tr>
       <th align=left colspan="3">Quantidade</th>
       <th align=left>Título</th>
       <th align=left>Preço</th>
   </tr>
   <c:forEach var="itemCompra" items="${sessionScope.cart.itens}">
       <c:set var="livro" value="${itemCompra.item}" />
       <tr>
           <td bgcolor="#A66F3F">
               <c:url var="url" value="/livros/mostrarCarrinho" >
                   <c:param name="alterar" value="${livro.idLivro}" />
                   <c:param name="quantidade" value="1" />
                   <c:param name="remover" value="0" />
               </c:url>
               <a href="${url}" style="text-decoration: none;">[+]</a>
           </td>
           <td bgcolor="#A66F3F">
               <c:url var="url" value="/livros/mostrarCarrinho" >
                   <c:param name="alterar" value="${livro.idLivro}" />
                   <c:param name="quantidade" value="-1" />
                   <c:param name="remover" value="0" />
               </c:url>
               <a href="${url}" style="text-decoration: none;">[-]</a>
           </td>
           <td style="text-align: center;" bgcolor="#F2E3B6">${itemCompra.quantidade}</td>
           <td bgcolor="#A66F3F">
               <c:url var="url" value="/livros/detalhesLivro" >
               <c:param name="idLivro" value="${livro.idLivro}"/>
               <c:param name="Clear" value="0"/></c:url>
               <strong><a href="${url}">${livro.titulo}</a></strong>
           </td>
           <td bgcolor="#F2E3B6" align="right">
               <fmt:formatNumber value="${livro.preco}" type="currency"/>
           </td>
           <td bgcolor="#A66F3F">
               <c:url var="url" value="/livros/mostrarCarrinho" >
               <c:param name="remover" value="${livro.idLivro}"/></c:url><strong><a href="${url}"><img class="carrinho" title="remover" src="../images/Remover.png"></a></strong>
           </td>
       </tr>
   </c:forEach>
   <tr>
       <td colspan="5" bgcolor="#F2E3B6"><br></td>
   </tr>
   <tr>
       <td colspan="2" align="right" bgcolor="#F2E3B6">Subtotal</td>
       <td bgcolor="#A66F3F" align="right">
           <fmt:formatNumber value="${sessionScope.cart.total}" type="currency"/>
       </td>
       <td><br></td>
   </tr>
</table>
<p> <p>
<c:url var="url" value="/livros/catalogo" >
   <c:param name="Add" value="" />
</c:url>
<strong>
   <a href="${url}">Continuar comprando</a>
       <c:url var="url" value="/livros/comprar" />
           <a href="${url}">Finalizar compra</a>
           <c:url var="url" value="/livros/mostrarCarrinho">
           <c:param name="limpar" value="limpar"/>
           <c:param name="remover" value="0"/>
       </c:url>
   <a href="${url}">Esvaziar carrinho</a>
</strong>
</c:if>
<c:if test="${sessionScope.cart.numeroItens <= 0}">
<font size="+2">Carrinho vazio</font>
<br> <br>
<c:url var="url" value="/livros/catalogo" >
   <c:param name="Add" value="" />
</c:url>
<strong><a href="${url}">Ver catálogo</a></strong>
</c:if>
<%@ include file="/rodape.jsp" %>
