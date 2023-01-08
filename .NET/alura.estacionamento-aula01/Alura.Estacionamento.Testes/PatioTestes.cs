using Alura.Estacionamento.Alura.Estacionamento.Modelos;
using Alura.Estacionamento.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Reflection;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using Xunit.Abstractions;

namespace Alura.Estacionamento.Testes
{
    public class PatioTestes:IDisposable
    {
        private Patio estacionamento;
        private Veiculo veiculo;
        public ITestOutputHelper SaidaConsoleTeste;
        public PatioTestes(ITestOutputHelper _saidaConsoleTeste)
        {
            SaidaConsoleTeste = _saidaConsoleTeste;
            SaidaConsoleTeste.WriteLine("Construtor invocado");
            veiculo = new Veiculo();
            estacionamento = new Patio();
        }
        [Fact]
        public void ValidaFaturamentoDoEstacionamentoComUmVeiculo()
        {
            //Arrange
            //Patio estacionamento = new Patio();
            //var veiculo = new Veiculo();
            veiculo.Proprietario = "Guilherme Marcelino";
            veiculo.Tipo = TipoVeiculo.Automovel;
            veiculo.Cor = "Prata";
            veiculo.Modelo = "Kadett";
            veiculo.Placa = "asd-9999";
            estacionamento.RegistrarEntradaVeiculo(veiculo);
            estacionamento.RegistrarSaidaVeiculo(veiculo.Placa);
            //Act
            double faturamento = estacionamento.TotalFaturado();
            //Assert
            Assert.Equal(2.0, faturamento);
        }

        [Theory]
        [InlineData("Guilherme Marcelino","ASD-1498","Preto","Gol")]
        [InlineData("Gustavo Marcelino", "POL-8242", "Cinza", "Fusca")]
        [InlineData("Tania Marcelino", "GDR-6524", "Azul", "Opala")]
        [InlineData("Augusta Marcelino", "GDR-0101", "Azul", "Corsa")]
        public void ValidaFaturamentoDoEstacionamentoComVariosVeiculos(string proprietario,string placa, string cor, string modelo)
        {
            //Arrange
            //Patio estacionamento = new Patio();
            //var veiculo = new Veiculo();
            veiculo.Proprietario = proprietario;
            veiculo.Cor = cor;
            veiculo.Modelo = modelo;
            veiculo.Placa = placa;
            estacionamento.RegistrarEntradaVeiculo(veiculo);
            estacionamento.RegistrarSaidaVeiculo(veiculo.Placa);
            //Act
            double faturamento = estacionamento.TotalFaturado();
            //Assert
            Assert.Equal(2.0, faturamento);
        }

        [Theory]
        [InlineData("Guilherme Marcelino", "ASD-1498", "Preto", "Gol")]
        [InlineData("Gustavo Marcelino", "POL-8242", "Cinza", "Fusca")]
        [InlineData("Tania Marcelino", "GDR-6524", "Azul", "Opala")]
        [InlineData("Augusta Marcelino", "GDR-0101", "Azul", "Corsa")]
        public void LocalizaVeiculoNoPatioComBaseNaPlaca(string proprietario, string placa, string cor, string modelo)
        {
            //Arrange
            //Patio estacionamento = new Patio();
            //var veiculo = new Veiculo();
            veiculo.Proprietario = proprietario;
            veiculo.Cor = cor;
            veiculo.Modelo = modelo;
            veiculo.Placa = placa;
            estacionamento.RegistrarEntradaVeiculo(veiculo);
            //Act
            var consultado = estacionamento.PesquisaVeiculo(placa);
            //Assert
            Assert.Equal(placa, consultado.Placa);
        }
        [Fact]
        public void AlterarDadosVeiculoDoProprioVeiculo()
        {
            //Patio estacionamento = new Patio();
            //var veiculo = new Veiculo();
            veiculo.Proprietario = "Guilherme Marcelino";
            veiculo.Cor = "Preto";
            veiculo.Modelo = "Gol";
            veiculo.Placa = "ASD-1498";
            estacionamento.RegistrarEntradaVeiculo(veiculo);

            var veiculoAlterado = new Veiculo();
            veiculoAlterado.Proprietario = "Guilherme Marcelino";
            veiculoAlterado.Cor = "Verde";//alterado
            veiculoAlterado.Modelo = "Gol";
            veiculoAlterado.Placa = "ASD-1498";

            //Act
            Veiculo alterado = estacionamento.AlterarDadosVeiculo(veiculoAlterado);

            //Assert
            Assert.Equal(alterado.Cor, veiculoAlterado.Cor);
        }

        public void Dispose()
        {
            SaidaConsoleTeste.WriteLine("Dispose invocado.");
        }
    }
}
