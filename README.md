# O'Hara Information Gathering
## Descrição
O projeto O'Hara é uma sequência de scripts em Bash desenvolvida para a fase de Information Gathering em vários ambientes. Ele visa facilitar a coleta de informações relevantes, fornecendo resultados de busca e verificação de informações por meio de várias fontes.

## Instalação
Clone este repositório em sua máquina local.
Certifique-se de ter o Bash instalado em seu sistema.
Execute o arquivo com privilégios de execução.

## Contribuição
Contribuições são bem-vindas!

## business.sh
Este script em Bash para a fase de Information Gathering no contexto de negócios. Ele coleta informações relevantes realizando buscas no Google, verificando o LinkedIn, Pastebin, Trello e escaneando e-mails em busca de possíveis vazamentos. O script solicita ao usuário que abra os resultados da busca em um navegador para investigação adicional.

Para usar o script, forneça dois argumentos: o comando do navegador e o alvo (./business.sh firefox site.com). O script executará as buscas especificadas e exibirá os resultados.

## infra.sh
Este script em Bash para a fase de Information Gathering de infraestrutura. Ele exibe informações sobre o alvo fornecido, como endereço IP, detalhes de Whois, pesquisa em BGP, Shodan.io, Censys.io e tentativas de transferência de zona DNS. Além disso, o código inclui uma pesquisa de brute force DNS, tanto direta quanto reversa, pesquisas no VirusTotal, DNSDumpster e SecurityTrails, e também pesquisa por vulnerabilidades de subdomínios.

O objetivo deste código é auxiliar na obtenção de informações relevantes durante a fase de Information Gathering. Ele fornece uma variedade de recursos para pesquisar e verificar informações em várias fontes disponíveis.

Observação: Algumas partes do código estão comentadas e requerem configuração específica para funcionar corretamente, como a personalização do padrão de erro de DNS, seleção de wordlist para brute force DNS e outras configurações específicas do caso de uso.
