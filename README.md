## Aplicação Banco de Dados de Filmes

# Criação de classes do modelo com frezzed

`dart run build_runner build`

# Api Web Local

Para executar a aplicação é necessário rodar um json-server utilizando um banco de dados de filmes.
https://github.com/prust/wikipedia-movie-data/blob/master/movies-2020s.json

Instale o json-server e utilize o seguinte comando:

```bash
json-server --host 0.0.0.0 --port 3000 movies-2020s.json
```

# Adaptado por Bruno Jamelli, com base no [link repositório base](https://github.com/taniro/flutter_repository_clean)