import requests
import json

# URL da API REST
url = 'https://jsonplaceholder.typicode.com/posts'

# Fazer a requisição GET para a API
response = requests.get(url)

# Verificar se a requisição foi bem-sucedida
if response.status_code == 200:
    # Obter os dados JSON da resposta
    dados = response.json()
    
    # Nome do arquivo onde os dados serão armazenados
    arquivo = 'dados.json'
    
    # Armazenar os dados em um arquivo local
    with open(arquivo, 'w') as f:
        json.dump(dados, f, indent=4)
    
    print(f'Dados armazenados em {arquivo}')
else:
    print(f'Falha na requisição: {response.status_code}')