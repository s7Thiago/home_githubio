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
        title: 'De 2018 até atualmente',
        description:
            'Atuo como voluntário ao Instituto dos Engenheiros Elétricos e Eletrônicos (IEEE).   Inicialmente eu era integrante da divisão de cursos e membresias, e ajudava a produzir os editais de cursos e workshops organizados pelos alunos com o objetivo final de atrair mais estudantes. o IEEE é uma instituição mundial sem fins lucrativos que visa promover a integração entre os cursos através de projetos que estimulam a aprendizagem e fusão dos conhecimentos entre o pessoal dos cursos de Computação, física, automação industrial e do ensino médio integrado, sempre tendo como alvo final o benefício à comunidade que cerca o campus.'
            'Alguns projetos desenvolvidos: '
            'Lab Kids(Ramo do IFB)'
            'Cofre inteligente*'
            'Impressora 3d com sucata*'
            'Ponto de entrega voluntária (PEV)*'
            'Mosqueteiras (visa incentivar a permanência e a entrada de meninas nos*'
            'cursos de exatas)'
            'RePlante (visa devolver pra natureza, os recursos gastos em nossas* atividades)',
        representations: [
          Icon(Icons.ac_unit),
          Icon(Icons.add_chart),
          Icon(Icons.all_inbox_sharp),
        ],
      ),
    ],
    'certifications': <Certification>[
      Certification(
        image:
            'https://images.ctfassets.net/q33z48p65a6w/1ciJXQwQjfgRWGcpyI1Oqp/21259688e6e67a17b93383bfa0e9bd0f/4._Partner_Icons_-_Udemy.png',
        title:
            'Curso de Dartlang completo do básico ao avançado (Completo de verdade)',
        credentialUrl: 'Acessar credencial',
      )
    ],
    'skills': <Skill>[
      Skill(
        title: 'Java',
        imageUrl:
            'data:image/png;base64,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',
      )
    ],
  };
}
