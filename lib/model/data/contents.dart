import 'package:flutter/material.dart';
import 'package:home_githubio/model/certification.dart';
import 'package:home_githubio/model/experience.dart';
import 'package:home_githubio/model/skill.dart';
import 'package:home_githubio/model/education.dart';

class Contents {
  static final pathImgSkills = 'assets/images/skills';
  static final pathImgCursos = 'assets/images/cursos';
  static final pathImgTrajetoria = 'assets/images/trajetoria';
  static final pathGithubAssets =
      'https://raw.githubusercontent.com/s7Thiago/home_githubio/master/assets/images';
  static final pathGithubAssetsTrajetoria = '$pathGithubAssets/trajetoria';
  static final defaultImageSize = 37.0;

  static final texts = {
    'intro':
        """Futuro cientista da computação que além de apaixonado por desenvolver soluções que resolvem problemas especialmente para plataformas móveis, tenho uma certa ambição por construir aplicações com visual de alto nível, perfeitamente alinhados a nível de pixel. É satisfatório entregar experiências fluidas tanto no Front-End como no Back-End. Aprender coisas novas definitivamente é algo que eu amo, então, creio que a melhor forma de potencializar isso é me integrando num ambiente que me exponha a desafios, pois sou convicto de que eles possibilitam não só o desenvolvimento profissional e intelectual, mas principalmente expõem a situações que aguçam o senso de humanidade.""",
    'experiences': <Experience>[
      Experience(
        title: 'IEEE (05/2018 - agora)',
        description: """

Sou voluntário no Instituto dos Engenheiros Elétricos e Eletrônicos (**IEEE**). Minha jornada aqui começou na divisão de cursos e membresias, onde eu ajudava a produzir os editais de cursos e workshops que seriam organizados pelos demais alunos com o objetivo final de atrair mais estudantes para as atividades da organização. o IEEE é uma instituição mundial **sem fins lucrativos** que visa promover a integração entre os cursos através de **projetos** que estimulam a **aprendizagem**, no IFB isso se dá através da fusão de conhecimentos entre os alunos dos cursos de Computação, Física, Automação Industrial e do Ensino Médio Integrado.

**Alguns projetos desenvolvidos**

- Lab Kids(Ramo do IFB)
- Cofre inteligente
- Impressora 3d com sucata
- Ponto de entrega voluntária (PEV)
- Mosqueteiras (visa incentivar a permanência e a entrada de meninas nos cursos de exatas)
- RePlante (devolver pra natureza, os recursos gastos em nossas atividades, contribuo aqui como UI designer)
- LiveBus (Rastreamento de ônibus em tempo real, sou responsável por
treinar a equipe que irá desenvolver o projeto usando **Flutter**)
""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/ieee.png',
              width: defaultImageSize),
        ],
        customHeight: 575,
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
          Image.network('$pathGithubAssetsTrajetoria/ieee_cs.png',
              width: defaultImageSize),
          Image.network('$pathGithubAssetsTrajetoria/ieee.png',
              width: defaultImageSize),
          Image.network('$pathGithubAssetsTrajetoria/ieee_ifb_cs.png',
              width: defaultImageSize),
        ],
      ),
      Experience(
        title: "Hackathon Hacka GR1D Pocket 2020",
        description:
            """O SafeBot foi mais outro projeto que participei durante o Hacka Gr1D
Pocket - também organizado pela Shawee. Trata-se de uma ferramenta que
auxilia as seguradoras no processo de modernização do fluxo de trabalho
dos seus corretores. A ideia era oferecer uma solução desburocratizada,
segura e disruptiva focada em tornar o trabalho dos corretores mais
cômodo.. Informações pessoais de clientes sempre são necessárias e por se tratarem dados sensíveis (ainda mais em tempos de LGPD), quase sempre há um processo penoso e/ou burocrático a cumprir para acessá-las. Nesse projeto, nós defendemos que para uma solução ser **segura** e tratar os dados pessoais dentro dos limites legais, ela **não precisa oferecer uma experiência burocrática**. A proposta do SafeBot é ser um local **seguro** onde o corretor possa obter dados inerentes a suas relações com os clientes, tais como:

- Sua carteira de clientes
- Ver informações como o histórico de sinistros acionados por um cliente específico E consultar dados comuns a todos os clientes (como data de nascimento, CPF etc)
- Consultar o status de algumas documentações específicas inerentes aos corretores

[Link com mais detalhes do projeto](bit.ly/3bp0d9l)""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/gr1d.png',
              width: defaultImageSize),
        ],
        customHeight: 530,
      ),
      Experience(
        title: "Hackathon Brasa Hacks 2020",
        description:
            """No Brasa Hacks (Organizado pela Shawee), Ajudei a idealizar, prototipar e
construir o MVP em Flutter do que juntamente a alguns amigos foi
batizado de NuGasto!. Se trata de uma feature que objetivava cumprir o
desafio proposto de empoderar a base de clientes do Nubank no controle
sobre as próprias finanças. A feature **agrupa** todos os gastos e ganhos do usuário (aqueles lançados pelo cartão de crédito e também aqueles da função débito) e traz **análises** das transações em questão. Ela permite que o usuário defina **metas financeiras** que podem ser acompanhadas através de análises automáticas da feature. Um dos principais objetivos do NuGasto! é auxiliar o usuário a visualizar e analisar todos os seus gastos e ganhos em um lugar só. Por isso, criamos uma função onde ele pode **escanear o QR Code** de notas fiscais para lançá-las automaticamente como uma despesa no banco de dados do Nubank. Além disso, o usuário teria acesso ao conteúdo do blog do Nubank diretamente no app, por onde ele ganharia pontos seja realizando **testes dinâmicos** ou ao atingir metas de controle financeiro. Toda a feature foi pensada para ser baseada nas atividades do usuário, e também gerenciada ao máximo por ele, que por sinal teria o **poder** de lançar e editar os seus gastos podendo também definir as suas próprias **metas de controle financeiro**. A nossa missão era oferecer uma experiência personalizável, e ao mesmo tempo automatizada, tornando a tomada de decisões mais embasada através de dados essenciais para o controle financeiro.
""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/shawee.png',
              width: defaultImageSize),
          Image.network('$pathGithubAssetsTrajetoria/nubank_old.png',
              width: defaultImageSize),
          Image.network('$pathGithubAssetsTrajetoria/brasa.png',
              width: defaultImageSize),
        ],
        customHeight: 600,
      ),
      Experience(
        title: "NT Virtual (01/2019 - 06/2019)",
        description:
            """Atuei como estagiário na Nova **Técnica Virtual**. Uma empresa da região de Brasília que possui um e-commerce voltado para o mercado de materiais elétricos. Lá eu era responsável por gerenciar todo o sistema de e-commerce, garantindo que as informações sempre estivessem atualizadas, buscando maneiras de aumentar a eficiência dos processos internos com a plataforma da loja integrada entre outras atividades.
""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/nt_virtual.png',
              width: defaultImageSize),
        ],
        customHeight: 250,
      ),
      Experience(
        title: "CASSI (07/2019 - 11/2020)",
        description:
            """Atuei na Caixa de Assistência dos Funcionários do Banco do Brasil como estagiário na **divisão de relacionamento com participantes (DRP)**, onde fui responsável por

- Criar ferramentas de consulta, gerência e análise para a divisão de relacionamento com participantes utilizando Excel Access e Java;
-  Organizar e tratar as devoluções de cartões;
- Mediar algumas tarefas entre os funcionários do DRP e as demais divisões da empresa.

""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/cassi.png',
              width: defaultImageSize),
        ],
        customHeight: 300,
      ),
      Experience(
        title: "STJ (11/2020 - Hoje)",
        description:
            """Atuo como desenvolvedor Web em um projeto da Coordenadoria de Auditoria (CAUC) onde estou tendo a oportunidade de trabalhar com tecnologias como **Angular**, **Springboot**, **Gitlab**, **Typescript**, **CI/CD**, **Rancher** e **SQL Server**. Uma verdadeira experiência *Full Stack Web*.
""",
        representations: [
          Image.network('$pathGithubAssetsTrajetoria/stj.png',
              width: defaultImageSize),
        ],
        customHeight: 200,
      ),
    ],
    'certifications': <Certification>[
      Certification(
        image: '$pathGithubAssets/cursos/udemy.png',
        title: 'Flutter - Aprendendo Tudo Sobre Design ',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/trajetoria/gr1d.png',
        title: 'HackaGr1D Pocket',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/udemy.png',
        title: 'Dartlang completo do básico ao avançado',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/trajetoria/brasa.png',
        title: 'Brasa Hacks - Desafio Nubank',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/udemy.png',
        title: 'Flutter e Dart - Curso Completo de Criação de Apps',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/dio.png',
        title: 'Trabalhando com Variáveis e Condicionais no Dart',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/udemy.png',
        title: 'Angular 5, JWT, Spring Boot,REST,Security,Data e MongoDB',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/udemy.png',
        title:
            'Java e OO, UML, JDBC, JavaFX, Spring Boot, JPA, Hibernate MySQL e MongoDB',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/dio.png',
        title: 'Trabalhando com Branches no Github',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/rocketseat.png',
        title: 'Semana OmniStack 11.0',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/ifb.png',
        title: 'ConectaIF 2019',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/dio.png',
        title: 'Introdução ao Git e ao GitHub',
        credentialUrl: 'Acessar credencial',
      ),
      Certification(
        image: '$pathGithubAssets/cursos/ifb.png',
        title: 'ConectaIF 2018',
        credentialUrl: 'Acessar credencial',
      ),
    ],
    'skills': <Skill>[
      Skill(
        title: 'Flutter',
        imageUrl: '$pathGithubAssets/skills/flutter.png',
      ),
      Skill(
        title: 'Dart',
        imageUrl: '$pathGithubAssets/skills/dart.png',
      ),
      Skill(
        title: 'Java',
        imageUrl: '$pathGithubAssets/skills/java.png',
      ),
      Skill(
        title: 'Adobe XD',
        imageUrl: '$pathGithubAssets/skills/xd.png',
      ),
      Skill(
        title: 'Adobe Illustrator',
        imageUrl: '$pathGithubAssets/skills/illustrator.png',
      ),
      Skill(
        title: 'Figma',
        imageUrl: '$pathGithubAssets/skills/figma.png',
      ),
      Skill(
        title: 'Linux',
        imageUrl: '$pathGithubAssets/skills/linux.png',
      ),
      Skill(
        title: 'Git',
        imageUrl: '$pathGithubAssets/skills/git.png',
      ),
      Skill(
        title: 'Android',
        imageUrl: '$pathGithubAssets/skills/android.png',
      ),
      Skill(
        title: 'Javascript',
        imageUrl: '$pathGithubAssets/skills/js.png',
      ),
      Skill(
        title: 'SQL',
        imageUrl: '$pathGithubAssets/skills/sql.png',
      ),
      Skill(
        title: 'Firebase',
        imageUrl: '$pathGithubAssets/skills/firebase.png',
      ),
      Skill(
        title: 'SpringBoot',
        imageUrl: '$pathGithubAssets/skills/springboot.png',
      ),
      Skill(
        title: 'NodeJs',
        imageUrl: '$pathGithubAssets/skills/node.png',
      ),
      Skill(
        title: 'Aqueduct',
        imageUrl: '$pathGithubAssets/skills/aqueduct.png',
      ),
      Skill(
        title: 'React',
        imageUrl: '$pathGithubAssets/skills/react.png',
      ),
    ],
    'education': <Education>[
      Education(
        content:
            'Instituto Federal de Educação, Ciência e Tecnologia de Brasília (IFB)- Bacharelado em Ciência da Computação',
        subContentTitle: 'Previsão de formação',
        subContentText: '12/2023',
        trailing: Image.network('$pathGithubAssets/cursos/ifb.png'),
      ),
    ],
    'projects': []
  };
}
