package usecases

import (
	"back-end/repository"
	"io"
	"os"
)

type ClienteUseCases struct {
	repository repository.ClienteRepository
}

func NewClienteUseCases(repo repository.ClienteRepository) ClienteUseCases {
	return ClienteUseCases{
		repository: repo,
	}
}

func (usecase ClienteUseCases) GetClienteBloqueadoById(telefoneCliente string) error {
	err := usecase.repository.GetClienteBloqueadoById(telefoneCliente)
	if err != nil {
		return err
	}
	return nil
}

func (usecase ClienteUseCases) SetClienteBloqueado(idCliente string) error {
	err := usecase.repository.SetClienteBloqueado(idCliente)
	if err != nil {
		return err
	}
	return nil
}

func (usecase ClienteUseCases) DeleteClienteBloqueadoByID(idCliente string) error {
	err := usecase.repository.DeleteClienteBloqueadoByID(idCliente)
	if err != nil {
		return err
	}
	return nil
}

func (usecase ClienteUseCases) ArmazenaImagem(caminho, telefone, nomeArquivo string) error {
	//arbir o arquivo
	file, err := os.Open(caminho)
	if err != nil {
		return err
	}
	defer file.Close()

	//criar o diretorio
	caminhoNovoDir := "/var/www/html/clientes/agentes-testes/uploads/"+telefone
	err = os.MkdirAll(caminhoNovoDir, 0755)
	if err != nil {
		return err
	}

	//criar o arquivo
	caminhoNovoArquivo := caminhoNovoDir + "/" + nomeArquivo
	novoArquivo, err := os.Create(caminhoNovoArquivo)
	if err != nil {
		return err
	}

	//copiar a imagem para o arquivo
	_, err = io.Copy(novoArquivo, file)
	if err != nil {
		return err
	}
	return nil
}
