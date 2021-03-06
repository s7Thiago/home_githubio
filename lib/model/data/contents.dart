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
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Duke_%28Java_mascot%29_waving.svg/568px-Duke_%28Java_mascot%29_waving.svg.png',
      ),
    ],
  };
}
