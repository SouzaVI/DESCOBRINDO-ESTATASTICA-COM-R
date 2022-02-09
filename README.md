
# DESCOBRINDO ESTATÍSTICA COM R  

•O que você irá aprender neste projeto?

Muitos estudantes quando iniciam seus estudos e precisam avaliar estatísticamente seus trabalhos, acabam
se perdendo ou  se desesperando por ver equações estatísticas e cálculos complexos.

Você que não entende 0% de estatística recomendo o livro "Descobrindo a Estatística usando SPPS" de Andy Field,
é Fantástico na abordagem da estatística. Com uma linguagem amigável e divertida, você aprende o suficiente para
desenvolver as análises do seu trabalho!

Com essa inspiração estou criando rotinas de análises no ambiente R, na qual, veremos desde a parte inicial quando você coleta os dados e precisa trabalhar da melhor forma possível, gerando informações estatisticamente válidas.


1. EXPLORANDO DADOS

Nessa parte inicial, devemos nos preocupar se nossos dados possuem normalidade. Para o estudo ser avaliado e replicado, é necessário que esses dados sejam confiáveis. Quantos mais seus dados variarem entre si, maiores chances dos seus dados serem anormais.
 
•E o que isso implica em meu trabalho?
 
Quando seus dados possuem distribuição anormal, todos as análises deverão ser com base em estatísticas Não - Pararamétricas. Lembre-se, a forma que você coleta, delineamento e tipo da população amostrada, interferem diretamente na forma que você avaliará seus dados! Portanto, caprichem no planejamento do seu trabalho. O ideal, antes de montar um grande planejamento, é trabalhar com um experimento piloto, para avaliar sua população amostrada, dessa maneira, você conseguirá entender melhor o comportamento da população amostrada, e com base nessa informação você deverá definir melhor os plajamento final.
 
•Como posso avaliar se meus dados se são paramétricos ou não - parametricos?
 
 1º Avalie com base histograma e boxplot, e observe se seus dados estão distribuidos normalmente;
 
 2º observe se seus dados possuem outliers;
 
 3º Faça um teste de normalidade;
 
 4º Está normal? Se sim, ótimo, seguir adiantes com análises estatísticas.
 
 5º Não esta normal? temos que normalizar, existe vários formas: remover amostras discrepantes (não recomenda-se, somente em casos com boa justificativas),  transformados (raiz, log, Ln, 1/x...) e substituíndo (não é o ideal).
 
 6º Após a correção realize novamente os passos 1,2 e 3 e verifique se normalizou.
 
 7º Os dados normalizaram? Se sim, ótimo, agora daqui adiante todas análises deverão se adotadas seus dados transformados, e sempre destacar isso!
 
 8º Não normalizou? Avalie na literatura se seus dados apresentam essa anormalidade, caso verdadeiro, você deverá usa métodos estatísticos não - paramétricos. Caso isso não se justifique, descubra o motivo dessa anormalidade.



