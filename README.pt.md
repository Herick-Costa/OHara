# O'Hara Information Gathering

## Descrição

O projeto O'Hara é uma sequência de scripts em Bash desenvolvida para a fase de Information Gathering em vários ambientes. Ele visa facilitar a coleta de informações relevantes, fornecendo resultados de busca e verificação de informações por meio de várias fontes.

## Instalação

1. Clone este repositório em sua máquina local.
2. Certifique-se de ter o Bash instalado em seu sistema.
3. Execute o arquivo com privilégios de execução.

## business.sh

Este script em Bash é voltado para a fase de Information Gathering no contexto de negócios. Ele coleta informações relevantes realizando buscas no Google, verificando o LinkedIn, Pastebin, Trello e escaneando e-mails em busca de possíveis vazamentos. O script solicita ao usuário que abra os resultados da busca em um navegador para investigação adicional.

Para usar o script, forneça dois argumentos: o comando do navegador e o alvo (./business.sh firefox site.com). O script executará as buscas especificadas e exibirá os resultados.

## infra.sh

Este script em Bash é voltado para a fase de Information Gathering de infraestrutura. Ele exibe informações sobre o alvo fornecido, como endereço IP, detalhes de Whois, pesquisa em BGP, Shodan.io, Censys.io e tentativas de transferência de zona DNS. Além disso, o código inclui uma pesquisa de brute force DNS, tanto direta quanto reversa, pesquisas no VirusTotal, DNSDumpster e SecurityTrails, e também pesquisa por vulnerabilidades de subdomínios.

O objetivo deste código é auxiliar na obtenção de informações relevantes durante a fase de Information Gathering. Ele fornece uma variedade de recursos para pesquisar e verificar informações em várias fontes disponíveis.

Observação: Algumas partes do código estão comentadas e requerem configuração específica para funcionar corretamente, como a personalização do padrão de erro de DNS, seleção de wordlist para brute force DNS e outras configurações específicas do caso de uso.

## web.sh

Este script em Bash é voltado para a fase de Information Gathering em páginas web. Ele realiza várias tarefas, como obter o conteúdo do arquivo "robots.txt" e "sitemap.xml", analisar o código fonte da página, identificar os métodos aceitos e exibir os cabeçalhos da resposta do servidor. Além disso, o script realiza um brute force de arquivos e diretórios.

## Aviso Legal

Estes scripts destinam-se apenas a fins educacionais e éticos. O uso indevido deste script em qualquer atividade ilegal é estritamente proibido. O autor não se responsabiliza por qualquer uso indevido ou ilegal deste script.

## Contribuição

Sinta-se à vontade para contribuir com melhorias, correções de bugs ou adicionar novos recursos ao script. Basta enviar um pull request neste repositório.
