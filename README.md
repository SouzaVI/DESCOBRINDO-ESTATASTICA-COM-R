
# DESCOBRINDO ESTATÍSTICA COM R  

•O que você irá aprender neste projeto?

  Estudantes ao iniciarem seus estudos e necessitam avaliar estatísticamente seus trabalhos, acabam
se perdendo ou  se desesperando ao se deparar com equações e conceitos complexos.

  Caso você seja leigo na ciência estatística, recomendo o livro "Descobrindo a Estatística usando SPPS" de Andy Field,
é Fantástico na abordagem da estatística. Com uma linguagem amigável e divertida, você aprende o suficiente para
desenvolver as análises do seu trabalho!

  Com essa inspiração estou criando rotinas de análises no ambiente R, na qual, veremos desde a parte inicial quando você coleta os dados e precisa trabalhar da melhor forma possível, gerando informações estatisticamente válidas.


**1. EXPLORANDO DADOS**

  Nessa parte inicial, devemos nos preocupar se nossos dados possuem normalidade. Para o estudo ser avaliado e replicado, é necessário que esses dados sejam confiáveis. Quantos mais seus dados variarem entre si, maiores chances dos seus dados serem anormais.
 
•E o que isso implica em meu trabalho?
 
  Quando seus dados possuem distribuição anormal, todos as análises deverão ser com base em estatísticas Não - Pararamétricas. Lembre-se, a forma que você coleta, delineamento e tipo da população amostrada, interferem diretamente na forma que você avaliará seus dados! Portanto, caprichem no planejamento do seu trabalho. O ideal, antes de montar um grande planejamento, é trabalhar com um experimento piloto, para avaliar sua população amostrada, dessa maneira, você conseguirá entender melhor o comportamento da população amostrada, e com base nessa informação você deverá definir melhor os plajamento final.
 
•Como posso avaliar se meus dados se são paramétricos ou não - parametricos?
 
 1º Avalie com base histograma e boxplot, e observe se seus dados estão distribuidos normalmente;
 
 2º observe se seus dados possuem outliers;
 
 3º Faça um teste de normalidade;
 
 4º Está normal? Se sim, ótimo, seguir adiantes com análises estatísticas.
 
 5º Não esta normal? temos que normalizar, existe vários formas: remover amostras discrepantes (não recomenda-se, somente em casos com boa justificativas),  transformando (raiz, log, Ln, 1/x...) e substituíndo (não é o ideal).
 
 6º Após a correção realize novamente os passos 1,2 e 3 e verifique se normalizou.
 
 7º Os dados normalizaram? Se sim, ótimo, agora daqui adiante todas análises deverão se adotadas seus dados transformados, e sempre destacar isso!
 
 8º Não normalizou? Avalie na literatura se seus dados apresentam essa anormalidade, caso verdadeiro, você deverá usa métodos estatísticos não - paramétricos. Caso isso não se justifique, descubra o motivo dessa anormalidade.
 
 9º Avalie o erro amostral do seu trabalho e se atende ao seu trabalho, isso dependerá muito do tipo população que você esta trabalhando. Por exemplo, erro amostral em um inventário florestal de eucalipto é tolerável até 10%, ja para estudos que envolve riscos, como na medicina <1%.

**2. CORRELAÇÃO E REGRESSÃO**

  Na Segunda parte, trabalharemos com análise de correlação de Pearson (r²), para identificar se existe relação entre as duas variáveis Y e X. Trata-se de um procedimento importante para compreender o grau de interação que suas variáveis de entrada com a variável de saída Y. Não havendo essa interação, não há motivos na geração de equações estatísticas para predição da variável de saída.

  Seguindo com  a regressão, existem alguns métodos de para gerar uma equação ajustada, por exemplo: com um modelo selecionado na literatura (bastante utilizado no invetário florestal), métodos de seleção de variáveis ( Stepwise, backward e Forward), quando você pretende gerar um modelo.

1º Avalie o grau de intereção das variáveis;

2º Defina o método que você você irá gerar seu modelo estatístico;

3º Avalie seu modelo, com o R², R²aj, Syx%;

4º Caso seu modelo tenha mais de um previsor (x1,x2,x3...) avalie a significancia de cada previsor, pode acontecer em que seu método selecione variáveis sem serventia para sua equação. Isso é recorrente  quando você transforma as sua variáveis x1², 1/x1...;

5º Caso seu modelo tenho mais de um previsor, avalie os valores dos conficientes Padronizados, assim você determina qual variável teve maior peso e maior importancia na equação;

6º Caso seu modelo tenha mais de um previsor, faça um teste de multicolinearidade, sua variáveis não devem ter relação entre si, isso pode ser um problema no momento em que você avaliará os previsores individualmente;

7º Gere os gráficos de Residuos x Estimados, Normal Q-Q e Cook distance, os gráficos darão um paranorama geral do comportamento de sua equação;

8º Preze por equações que sejam replicaveis, modelos que tenham muitos previsores diferentes, acabam caindo na armadilha do super ajuste, ou seja, sua equação somente servirá pra aquele sua situação específica. O Proposito de gerar um um modelo é que outros pesquisadores tenham oportunidade de replicar e contribuir com o trabalho;

