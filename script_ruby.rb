#importa as bibliotecas que serao utilizadas para este script
require "rubygems"
require "watir-webdriver"
require 'net/http' 



class CH
  # Este metodo ocorre sempre que a classe e inicializada pelo comando "CH.new"
  def initialize

    http = Net::HTTP.new(@host, @port)
    http.read_timeout = 5000

    # Configura e inicializa o navegador Firefox
    Watir::always_locate = false
    @b = Watir::Browser.new :firefox

    # Abre a pagina no navegador
    @b.goto 'http://milano.bakecaincontrii.com/be/main.php?page=gestione_annunci_mb'

    # localiza o objeto "input" da pagina cujo id e "tabela:j_idt33_filter" (Livro) e preenche com o valor "Isaias"
    @b.text_field(:name => 'usernamemb').set 'info@dolcerelax.com'

    # Aguarda 2 segundos para o filtro ser processado
    sleep(2)

    # localiza o objeto "input" da pagina cujo id e "tabela:j_idt36_filter" (Capitulo) e preenche com o valor "51"
    @b.text_field(:name => 'passwordmb').set 'maxitaly'

    # Aguarda 2 segundos para o filtro ser processado
    # sleep(2)

    # Localiza e clica no objeto "a:href" cujo texto e "3" (pagina 3)
    @b.button(:value => 'ACCESSO').click
    
    # Aguarda 2 segundos para o filtro ser processado
    # sleep(2)

    @b.link(:text => 'Pubblica un nuovo annuncio').click
    
    @b.button(:value => 'Ho più di 18 anni. Accetta e ENTRA').click

    @b.select_list(:id => 'categoriapub').select 'donna cerca donna'
    

    # Localiza a tabela (table) na pagina cujo indice e "0" (a unica tabela que existe na pagina - tabela dos versiculos)
    # tabela = @b.table(:index,0)

    # Armazena o valor da terceira linha e terceira coluna na variavel "versiculo" (Isaias 51:12)
    # versiculo = tabela[2][2].text

    # Chama o metodo "gravarArquivo" e passa o versiculo como argumento
    # gravarArquivo versiculo

    # Imprime a palavra "fim" no console
    puts "fim"

    # Fecha o navegador Firefox
    # @b.close

  end

  # Metodo responsavel por salvar o versiculo em um arquivo
  def gravarArquivo versiculo

    # caminho e nome do arquivo onde sera salvo o versiculo da biblia
    caminho = "C:\\projetos_ruby\\robo_ruby\\versiculo.csv"

    # inicializa o controlador de arquivo
    @handle = File.new(caminho,"w+")

    # Insere o versiculo no arquivo
    @handle.puts(versiculo)

    # Fecha o arquivo
    @handle.close

  end

end

# chama a classe "CH"
CH.new