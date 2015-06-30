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

    @b.link(:text => 'Pubblica un nuovo annuncio').click
    
    @b.button(:value => 'Ho più di 18 anni. Accetta e ENTRA').click

    @b.select_list(:id => 'categoriapub').select 'donna cerca donna'
    
    @b.select_list(:id => 'cittapub').select 'Agrigento'
    
    @b.text_field(:id => 'indirizzopub').set 'rua teste'
    @b.text_field(:id => 'cappub').set '99999'
    @b.text_field(:id => 'localitapub').set 'KKKKKKKKKKK'    

    @b.text_field(:id => 'tit').set 'TITOLO'
    @b.text_field(:name => 'eta').set '34'
    @b.text_field(:name => 'contatto').set '34999999999'
    @b.textarea(:id => 'testoann').set 'TEXTO DE EXEMPLO PRO annuncio'

    @b.select_list(:id => 'emailverificate').select 'franc5555@hotmail.it'

    # @b.label(:text => 'Promuovi il mio annuncio').parent.checkbox :value => 'SITOPLIST'
    @b.checkbox(:value => 'SITOPLIST').set

    sleep(4)
    
    @b.select_list(:id => 'tipo_toplist').select 'Climb the Top 1'

    sleep(3)

    @b.select_list(:id => 'num_giorni').select '3 giorni'

    sleep(3)

    @b.select_list(:id => 'fascia_oraria').select '10:00/12:00' 

    sleep(3)

    @b.checkbox(:name => 'accettopub').set
    
    @b.button(:value => 'Continua').click

    sleep(2)

    @b.button(:value => 'Continua').click

    sleep(5)

    @b.button(:value => 'GESTIONE IMMAGINI').click

    @b.file_field(:id, "upload_id_imgannuncio_doc").set 'C:\Users\Desenvolvimento\Downloads\40440_1502511985.jpg'

    @b.button(:value => 'CARICA').click

    sleep(2)
    @b.file_field(:id, "upload_id_imgannuncio_doc").set 'C:\Users\Desenvolvimento\Downloads\11425810_1660007390881429_2557554007159987410_n.jpg'

    @b.button(:value => 'CARICA').click

    sleep(5)
    @b.button(:value => 'Fine').click

    @b.button(:value => 'GESTIONE IMMAGINI').click





    


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

  def action_1
    # something_to_the_db
    redirect_to :back
  end

end

# chama a classe "CH"
CH.new