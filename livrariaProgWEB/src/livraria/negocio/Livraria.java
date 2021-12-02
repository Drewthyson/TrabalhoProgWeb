package livraria.negocio;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import livraria.negocio.excecoes.CompraException;
import livraria.negocio.excecoes.LivroNaoEncontradoException;

public class Livraria {
   private List<Livro> estoqueLivros;

   public Livraria() {
       estoqueLivros = new ArrayList<Livro>();
       popularLivros();
   }

   private void popularLivros() {
       Livro livro = new Livro();
       livro.setIdLivro("0596005407");
       livro.setAno(2008);
       livro.setTitulo("Head First Servlets and JSP");
       livro.setDescricao("Livro sobre Servlets e JSP.");
       livro.setAutores("Bryan Basham, Kathy Sierra, Bert Bates");
       livro.setQuantidade(10);
       livro.setPreco(200.5);
       estoqueLivros.add(livro);
       livro = new Livro();
       livro.setIdLivro("9788573935721");
       livro.setAno(2007);
       livro.setTitulo("Desenvolvendo Aplica��es Web com JSP, Servlets, "
       + "JavaServer Faces, Hibernate, EJB 3 Persistence e Ajax");
       livro.setDescricao(
       "Livro sobre tecnologias usadas na programa��o Java para Web.");
       livro.setAutores("Edson Gon�alves");
       livro.setQuantidade(10);
       livro.setPreco(110.9);
       estoqueLivros.add(livro);
       livro = new Livro();
       livro.setIdLivro("05916148127");
       livro.setAno(2003);
       livro.setTitulo("O Ca�ador de Pipas");
       livro.setDescricao("Livro narra a tocante hist�ria da amizade entre Amir e Hassan, dois meninos que vivem no Afeganist�o da d�cada de 1970.");
       livro.setAutores("Khaled Hosseini");
       livro.setQuantidade(8);
       livro.setPreco(24.9);
       estoqueLivros.add(livro);
   }
   
   public List<Livro> getLivros() {
	      return Collections.unmodifiableList(estoqueLivros);
	   }
   
	   public Livro getLivro(String idLivro) throws LivroNaoEncontradoException {
	      Livro livroProcurado = null;
	      for (Livro book : estoqueLivros) {
	          if (book.getIdLivro().equals(idLivro)) {
	              livroProcurado = book;
	          }
	      }
	   
	      if (livroProcurado == null) {
	          throw new LivroNaoEncontradoException(
	          "N�o foi poss�vel encontrar o livro: " + idLivro);
	      }
	   
	      return livroProcurado;
	   }

   public void comprarLivros(CarrinhoCompras carrinho) throws CompraException {
      Collection<ItemCompra> items = carrinho.getItens();
      Iterator<ItemCompra> i = items.iterator();
      while (i.hasNext()) {
          ItemCompra item = (ItemCompra) i.next();
          Livro livro = (Livro) item.getItem();
          String id = livro.getIdLivro();
          int quantity = item.getQuantidade();
          comprarLivro(id, quantity);
      }
   }
   
   public void comprarLivro(String idLivro, int qtdComprada) throws CompraException {
          Livro livroSelecionado;
          try {
              livroSelecionado = getLivro(idLivro);
          } catch (LivroNaoEncontradoException e) {
              throw new CompraException(e.getMessage());
          }
          
          int qtdEstoque = livroSelecionado.getQuantidade();
          
          if ((qtdEstoque - qtdComprada) >= 0) {
              int novaQtd = qtdEstoque - qtdComprada;
              livroSelecionado.setQuantidade(novaQtd);
          } else {
              throw new CompraException("Livro " + idLivro
              + " sem estoque suficiente.");
          }
      }
   public void fechar() {
	          // liberaria conex�es de banco de dados, se usasse
		   }

}
