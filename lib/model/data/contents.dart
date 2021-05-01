import 'package:flutter/material.dart';
import 'package:home_githubio/model/Certification.dart';
import 'package:home_githubio/model/Experience.dart';
import 'package:home_githubio/model/Skill.dart';

class Contents {
  static final texts = {
    'intro': 'Sou um futuro cientista da computação que além de apaixonado '
        'por desenvolver soluções que resolvem problemas especialmente '
        'para plataformas móveis, tenho uma ambição especial em construir '
        'aplicações com visual de alto nível, perfeitamente alinhados em '
        'cada pixel de modo a entregar uma experiência fluida tanto no UX '
        'Front-End como no desempenho do Back-End. Aprender coisas novas '
        'definitivamente é algo que eu amo, então, creio que a melhor forma '
        'de potencializar isso é me integrando num ambiente que me exponha a '
        'desafios, pois sou convicto de que eles possibilitam não só o '
        'desenvolvimento profissional e intelectual, mas principalmente expõem '
        'a situações que aguçam o senso de humanidade.',
    'experiences': <Experience>[
      Experience(
        title: 'IEEE (05/2018 - agora)',
        description: """

Atuo como voluntário ao Instituto dos Engenheiros Elétricos e Eletrônicos (**IEEE**). Inicialmente eu era integrante da divisão de cursos e membresias, e ajudava a produzir os editais de cursos e workshops organizados pelos alunos com o objetivo final de atrair mais estudantes. o IEEE é uma instituição mundial **sem fins lucrativos** que visa promover a integração entre os cursos através de **projetos** que estimulam a **aprendizagem** e fusão dos conhecimentos entre o pessoal dos cursos de Computação, física, automação industrial e do ensino médio integrado, sempre tendo como alvo final o **benefício à comunidade** que cerca o campus.

**:Alguns projetos desenvolvidos**

- Lab Kids(Ramo do IFB)
- Cofre inteligente
- Impressora 3d com sucata
- Ponto de entrega voluntária (PEV)
- Mosqueteiras (visa incentivar a permanência e a entrada de meninas nos cursos de exatas)
- RePlante (visa devolver pra natureza, os recursos gastos em nossas* atividades)
""",
        representations: [
          Icon(Icons.ac_unit),
        ],
      ),
      Experience(
        title: "NT Virtual (01/2019 - 06/2019)",
        description:
            """Atuei como estagiário na Nova **Técnica Virtual**. Uma empresa da região de Brasília que possui um e-commerce voltado para o mercado de materiais elétricos. Lá eu era responsável por gerenciar todo o sistema de e-commerce, garantindo que as informações sempre estivessem atualizadas, buscando maneiras de aumentar a eficiência dos processos internos com a plataforma da loja integrada entre outras atividades.
""",
        representations: [
          Icon(Icons.ac_unit),
        ],
        customHeight: 230,
      ),
      Experience(
        title: 'Projetos IEEE (01/2019 - agora)',
        description: """
        Me associei ao Capítulo de Computação (Computer Chapter), onde atuo na divisão de projetos geralmente como desenvolvedor/designer. Atualmente temos dois projetos:

**Planty** - Um aplicativo idealizado em parceria os alunos do curso de **automação industrial**, que visa **incentivar** a comunidade a cuidar da área verde de Brasília em troca de recompensas (estamos desenvolvendo um **dispositivo** especial onde pode ser armazenada **água**, e o mesmo mede o volume restante compartilhando esse dado com o app. o projeto ainda está em fase de **estudo**, e estamos buscando **parcerias**)

**LiveBus** - Este projeto visa implantar um aplicativo eficiente e com um **design amigável** que cumpra o desafio de rastrear **em tempo real** o **transporte público** do Distrito Federal. Com alguns alunos envolvidos, temos também o apoio do Akira Toyama (Engenheiro da Caixa Econômica Federal, e presidente do IEEE Centro - Norte). Optamos por desenvolver esse app usando **Flutter**, e eu estive responsável por **treinar** a equipe de desenvolvimento durante a pandemia até termos condições de iniciar o projeto.

Também contribuo periodicamente com divisão de marketing.
        """,
        representations: [
          Icon(Icons.account_circle_sharp),
          Icon(Icons.account_tree_rounded),
          Icon(Icons.wrong_location),
        ],
      ),
      Experience(
        title: "CASSI (07/2019 - 12/2020)",
        description:
            """Atuei na CASSI como estagiário na **divisão de relacionamento com participantes (DRP)**, onde basicamente sou responsável por:

- Criar ferramentas de consulta, gerência e análise para a divisão de relacionamento com participantes utilizando Excel e Access;
- Responsável por organizar e tratar todas as devoluções de cartões, reenviando os mesmos, quando possível, ou destruindo-os, caso inativos;
- Mediar algumas tarefas entre os funcionários do DRP e as demais divisões da empresa.

""",
        representations: [
          Icon(
            Icons.add_road_sharp,
          )
        ],
        customHeight: 300,
      ),
      Experience(
        title: "Brasa Hacks (02/2020)",
        description:
            """No Brasa Hacks (Organizado pela **Shawee**), idealizei junto a alguns amigos o que chamamos de **NuGasto!**, que se trata de uma feature para auxiliar os clientes do **Nubank** a organizarem suas finanças. A feature **agrupa** todos os gastos e ganhos do usuário (aqueles lançados pelo cartão de crédito e também aqueles da função débito) e traz **análises** das transações em questão. Ela permite que o usuário defina **metas financeiras** que podem ser acompanhadas através de análises automáticas da feature. Um dos principais objetivos do NuGasto! é auxiliar o usuário a visualizar e analisar todos os seus gastos e ganhos em um lugar só. Por isso, criamos uma função onde ele pode **escanear o QR Code** de notas fiscais para lançá-las automaticamente como uma despesa no banco de dados do Nubank. Além disso, o usuário teria acesso ao conteúdo do blog do Nubank diretamente no app, por onde ele ganharia pontos seja realizando **testes dinâmicos** ou ao atingir metas de controle financeiro. Toda a feature foi pensada para ser baseada nas atividades do usuário, e também gerenciada ao máximo por ele, que por sinal teria o **poder** de lançar e editar os seus gastos podendo também definir as suas próprias **metas de controle financeiro**. A nossa missão era oferecer uma experiência personalizável, e ao mesmo tempo automatizada, tornando a tomada de decisões mais embasada através de dados essenciais para o controle financeiro.
""",
        representations: [
          Icon(Icons.accessible_forward_rounded),
          Icon(Icons.add_location_alt_outlined),
          Icon(Icons.addchart_sharp),
        ],
        customHeight: 550,
      ),
      Experience(
        title: "Hacka GR1D Pocket (03/2020)",
        description:
            """Ajudei a idealizar o **SafeBot**, um projeto no Hacka Gr1D Pocket - também organizado pela Shawee. Ele se trata de um recurso que auxilia as seguradoras no processo de modernização do fluxo de trabalho dos seus corretores. A ideia era oferecer uma solução **desburocratizada**, segura e disruptiva focada em tornar o trabalho do corretor mais cômodo. Informações pessoais de clientes sempre são necessárias e por se tratarem dados sensíveis (ainda mais em tempos de LGPD), quase sempre há um processo penoso e/ou burocrático a cumprir para acessá-las. Nesse projeto, nós defendemos que para uma solução ser **segura** e tratar os dados pessoais dentro dos limites legais, ela **não precisa oferecer uma experiência burocrática**. A proposta do SafeBot é ser um local **seguro** onde o corretor possa obter dados inerentes a suas relações com os clientes, tais como:

- Sua carteira de clientes
- Ver informações como o histórico de sinistros acionados por um cliente específico E consultar dados comuns a todos os clientes (como data de nascimento, CPF etc)
- Consultar o status de algumas documentações específicas inerentes aos corretores

[Link com mais detalhes do projeto](bit.ly/3bp0d9l)""",
        representations: [
          Icon(Icons.crop_square_rounded),
        ],
        customHeight: 530,
      )
    ],
    'certifications': <Certification>[
      Certification(
        image:
            'https://images.ctfassets.net/q33z48p65a6w/1ciJXQwQjfgRWGcpyI1Oqp/21259688e6e67a17b93383bfa0e9bd0f/4._Partner_Icons_-_Udemy.png',
        title:
            'Curso de Dartlang completo do básico ao avançado (Completo de verdade)',
        credentialUrl: 'Acessar credencial',
      ),
    ],
    'skills': <Skill>[
      Skill(
        title: 'Java',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Duke_%28Java_mascot%29_waving.svg/568px-Duke_%28Java_mascot%29_waving.svg.png',
      ),
    ],
  };
}
