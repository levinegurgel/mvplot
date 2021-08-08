# mvplot

### Installation
Informe as partições 1, 2 e 3 no cabeçalho do script.

partition1="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition1/";

partition2="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition2/";

partition3="$HOME/Desktop/Trabalho/EcoHack/mvplot/partition3/";

informe o diretório para registrar o log
log="$HOME/Desktop/Trabalho/EcoHack/mvplot/mvplot.log";

informe o tipo de arquivo
fileType="plot"

Atribuir permissão de execução para o arquivo
```sh
  chmod 775 mvplot.sh
```

## Usage
para rodar apenas uma vez o script
```sh
  ./mvplot.sh
```

para deixar rodando execute (sendo -n a frequência em segundos que o arquivo será executado)
```sh
  watch -n 10 ./mvplot.sh
```
