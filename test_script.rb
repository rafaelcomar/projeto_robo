#importa as bibliotecas que serao utilizadas para este script
require "rubygems"
require "watir-webdriver"
require 'net/http' 



class CH
  # Este metodo ocorre sempre que a classe e inicializada pelo comando "CH.new"
  def initialize

    http = Net::HTTP.new(@host, @port)
    http.read_timeout = 9000000

    # Configura e inicializa o navegador Firefox
    Watir::always_locate = false

   puts "inside hooks in before"
    # profile = Selenium::WebDriver::Chrome::Profile.new
    # profile['download.prompt_for_download'] = false
    # profile['download.default_directory'] = "C:/projetos_ruby/chromedriver.exe"
    chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"browsers","chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    @b = Watir::Browser.new :chrome
    # @b = Watir::Browser.new :firefox

    # Abre a pagina no navegador
    @b.goto 'http://milano.bakecaincontrii.com/be/main.php?page=gestione_annunci_mb'

    # localiza o objeto "input" da pagina cujo id e "tabela:j_idt33_filter" (Livro) e preenche com o valor "Isaias"
    @b.text_field(:name => 'usernamemb').set 'franc5555@hotmail.it'

    # Aguarda 2 segundos para o filtro ser processado
    # sleep(2)

    # localiza o objeto "input" da pagina cujo id e "tabela:j_idt36_filter" (Capitulo) e preenche com o valor "51"
    @b.text_field(:name => 'passwordmb').set 'vivere'

    # Aguarda 2 segundos para o filtro ser processado
    # sleep(2)

    # Localiza e clica no objeto "a:href" cujo texto e "3" (pagina 3)
    @b.button(:value => 'ACCESSO').click
    
    # Aguarda 2 segundos para o filtro ser processado
    # sleep(2)

     @b.link(:text => 'TITOLO').click

    @b.button(:value => 'GESTIONE IMMAGINI').click
    sleep(2)
    @b.image(:id => 'img1').click

    # @b.input(:id => 'x_src').to_subtype.set("0")
    # @b.input(:id => 'y_src').to_subtype.set("23")
    # @b.input(:id => 'w_src').to_subtype.set("450")
    # @b.input(:id => 'h_src').to_subtype.set("323.7410071942446")

    # @b.hidden(id: 'x_src').set '0'
    # @b.hidden(id: 'y_src').set '23'
    # @b.hidden(id: 'w_src').set '450'
    # @b.hidden(id: 'h_src').set '323.7410071942446'

    # @b.execute_script("document.getElementById('x_src').value = 0;")
    # @b.execute_script("document.getElementById('y_src').value = 23;")
    # @b.execute_script("document.getElementById('w_src').value = 450;")
    # @b.execute_script("document.getElementById('h_src').value = 323.7410071942446;")



    @b.button(:name => 'continua').click   





    


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