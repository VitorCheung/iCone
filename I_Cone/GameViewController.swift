//
//  GameViewController.swift
//  I_Cone
//
//  Created by Vitor Cheung on 01/06/21.
//

import UIKit


class GameViewController: UIViewController {

    var simbolos: [String] = ["airplane.circle", "film", "book.circle", "checkmark.circle", "camera.circle", "cloud", "earpods", "gear", "link.circle", "text.alignleft", "volume.slash", "highlighter", "pencil", "doc", "bookmark", "text.book.closed", "folder", "command", "restart", "sleep", "wake", "network", "timelapse", "eject", "memories", "target", "location", "bell", "mappin", "return", "trash", "paperplane", "note", "square.and.pencil", "tray", "flag", "magnifyingglass", "plus.magnifyingglass", "scribble"]
    
    var respostas: [String] = ["Modo avião", "Filme", "Ler", "Certo", "Tirar Foto", "Nuvem", "Earpods", "Ajustes", "Link", "Alinhar a esquerda", "Mudo", "Marca-texto", "Lápis", "Arquivo", "Salvar", "Livro de texto", "Pasta", "Command", "Reiniciar", "Adormecer", "Despertar", "Network", "Timelapse", "Ejetar", "Memórias", "Alvo", "Localização", "Notificação", "Mapeamento", "Voltar", "Deletar", "Enviar", "Nota", "Escrever", "Caixa de entrada", "Sinalizar", "Buscar", "Zoom", "Rabiscar"]
    var contador = 0
    var pontuacao = 0
    var posicaoResposta = 0
    var permitidoMudar = false
    var permitidoResponder = true
    var resposta = ""
    
    // elementos do storyboard
    @IBOutlet weak var pontos: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var primeiraAlt: UIButton!
    @IBOutlet weak var segundaAlt: UIButton!
    @IBOutlet weak var terceiraAlt: UIButton!
    @IBOutlet weak var quartaAlt: UIButton!
    @IBOutlet weak var imagem: UIImageView!
    
    @IBOutlet weak var mudarQuestao: UIButton!
    @IBOutlet weak var feedback: UILabel!
    @IBOutlet weak var goPontos: UIButton!
    
    var botoes: [UIButton] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        feedback.textColor = .black
        botoes = [primeiraAlt, segundaAlt, terceiraAlt, quartaAlt]
        mudarQuestao.isHidden = true
        goPontos.isHidden = true
        updateQuestion()
    }


    @IBAction func changeImage(_ sender: UIButton) {
        if permitidoResponder == true {
            permitidoMudar = true
            if sender.tag == 1 {
                pontuacao += 1
                feedback.text = "✅ Resposta Correta"
            } else {
                feedback.text = "❌ Resposta errada\nAlternativa correta: \(resposta)"
            }
        }
        if contador == 9{
            goPontos.isHidden = false
        } else {
            mudarQuestao.isHidden = false
        }
        permitidoResponder = false
    }
    
    @IBAction func clickNextQuestion(_ sender: Any) {
        if permitidoMudar == true{
            updateQuestion()
            permitidoMudar = false
            permitidoResponder = true
            mudarQuestao.isHidden = true
            contador += 1
        }
    }
    
    // funcao para mudas as perguntas
    func updateQuestion(){
        feedback.text = ""
        var sorteados: [Int] = []
        if contador < 9 { //contador para ter apenas 10 perguntas
            posicaoResposta = Int.random(in: 0..<simbolos.count)
            resposta = respostas[posicaoResposta]
            imagem.image = UIImage(systemName: simbolos[posicaoResposta])

            botoes = botoes.shuffled()
            for s in 0..<botoes.count {
                if s == 0 {
                    botoes[s].tag = 1
                    botoes[s].setTitle(respostas[posicaoResposta], for: .normal)
                    respostas.remove(at: posicaoResposta)
                    simbolos.remove(at: posicaoResposta)
                } else {
                    botoes[s].tag = 0
                    var numeroSorteado = Int.random(in: 0..<simbolos.count)
                    while sorteados.contains(numeroSorteado) {
                        numeroSorteado = Int.random(in: 0..<simbolos.count)
                    }
                    sorteados.append(numeroSorteado)
                    botoes[s].setTitle(respostas[numeroSorteado], for: .normal)
                }
            }
        }
    }
    
//    @IBAction func ProximaView(_ sender: Any) {
//        let pontuacaoViewController = PontuacaoViewController()
////        pontuacaoViewController.labelPont.text = "\(pontuacao)"
////        navigationController?.pushViewController(pontuacaoViewController, animated: true)
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transicaoGamePont" {
            let pontuacaoViewController = segue.destination as? PontuacaoViewController
            pontuacaoViewController?.pontuacao=pontuacao
        }
        contador = 0
        pontuacao = 0
        posicaoResposta = 0
        permitidoMudar = false
        permitidoResponder = true
        resposta = ""
        feedback.text = ""
        mudarQuestao.isHidden = true
        goPontos.isHidden = true
        updateQuestion()
        
    }
    
}
