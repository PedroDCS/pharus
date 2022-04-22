import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/company_model.dart';
import '../../../data/models/news_model.dart';
import '../../../data/models/notify_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/school_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/repositories/set_news_repository.dart';
import '../../../data/repositories/set_notify_repository.dart';
import '../../../data/repositories/set_projects_repository.dart';
import '../../../data/repositories/set_rankings_repository.dart';
import '../../../data/repositories/set_users_repository.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/enums/notify_type_enum.dart';
import '../../../domain/enums/user_type_enum.dart';

class SplashController {
  void navigationToNextPage() {
    Modular.to.navigate('/auth/');
  }

  void mockarInformacoes() async {
    final _newsRepository = SetNewsRepository();
    final _notifyRepository = SetNotifyRepository();
    final _usersRepository = SetUsersRepository();
    final _projectsRepository = SetProjectsRepository();
    final _rankingsRepository = SetRankingsRepository();
    await _newsRepository.setNews(
      NewsModel(
        news: [
          'O UNICEF lança, esta semana, a segunda edição do Tamo Junto UNICEF (#tmjUNICEF), programa de voluntariado digital voltado a adolescentes e jovens de 16 a 24 anos.',
          'O programa Dev the Devs, que oferece capacitação gratuita na área de tecnologia para jovens, será lançado nesta quinta-feira (16), a partir das 11h com transmissão pelo YouTube da PUCRS e do Banco Regional de Desenvolvimento do Extremo Sul (BRDE).',
        ],
        newsLink: [
          'https://www.unicef.org/brazil/comunicados-de-imprensa/unicef-lanca-segunda-edicao-do-tmjunicef-programa-de-voluntariado-digital',
          'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2021/09/16/programa-que-oferece-formacao-gratuita-para-jovens-e-lancado-no-rs.ghtml',
        ],
      ),
    );
    await _notifyRepository.setNotify([
      NotifyModel(
        notify: "O projeto 1 termina em 8 dias!",
        type: NotifyType.WARNING,
      ),
      NotifyModel(
        notify: "O projeto ”Introdução a Robótica” te deu uma medalha!",
        type: NotifyType.MEDAL,
      ),
      NotifyModel(
        notify: "Conheça a nova empresa parceira",
        type: NotifyType.GENERIC,
      ),
    ]);

    await _usersRepository.setStudents([
      StudentModel(
        name: "Antonia Ferreira",
        email: "antonia.ferreira@gmail.com",
        password: "Eemcsas12!",
        city: 'Lavras, MG',
        type: userTypeEnum.STUDENT,
        birthDate: DateTime.parse("2002-06-18"),
        gender: "F",
        registration: "132456741",
        shift: "night",
        schoolYear: "9º Ano",
        schoolName: "Escola estadual João da Silva",
        schoolId: "maria.helena.diretora@gmail.com",
        studentClass: "Turma A",
        avatar: 'assets/avatar/Property 1=Avatar_01.png',
        avatarCircle: 'assets/avatar/Property 1=1.png',
        projectsIDs: [],
        rankingsIDs: ['1'],
      )
    ]);

    await _usersRepository.setCompanies([
      CompanyModel(
        avatarUrl: "companyAvatar2",
        administeredby: "Pharus LMTD.",
        position: "CEO",
        city: "Belo Horizonte, MG",
        name: "Osklen",
        email: "osklen@pharus.com",
        password: "Eemcsas12!",
        type: userTypeEnum.COMPANY,
      ),
      CompanyModel(
        avatarUrl: "companyAvatar2",
        administeredby: "Pharus LMTD.",
        position: "CEO",
        city: "Belo Horizonte, MG",
        name: "Dupe",
        email: "dupe@pharus.com",
        password: "Eemcsas12!",
        type: userTypeEnum.COMPANY,
      ),
      CompanyModel(
        avatarUrl: "companyAvatar2",
        administeredby: "Pharus LMTD.",
        position: "CEO",
        city: "Belo Horizonte, MG",
        name: "Empresa Pharus",
        email: "empresa@pharus.com",
        password: "Eemcsas12!",
        type: userTypeEnum.COMPANY,
      ),
      CompanyModel(
        avatarUrl: "companyAvatar",
        administeredby: "Guilherme Almeida Neto",
        position: "CEO",
        city: "Belo Horizonte, MG",
        name: "Guilherme Almeida Neto",
        email: "guilherme.neto@empresa.com.br",
        password: "Eemcsas12!",
        type: userTypeEnum.COMPANY,
      )
    ]);

    await _usersRepository.setSchools([
      SchoolModel(
        avatarUrl: "escolaAvatar",
        administeredby: "Maria Helena Vilela",
        position: "Diretora",
        city: "Lavras, MG",
        name: "Escola estadual João da Silva",
        email: "maria.helena.diretora@gmail.com",
        password: "Eemcsas12!",
        type: userTypeEnum.SCHOOL,
      )
    ]);

    await _projectsRepository.setProjects([
      ProjectModel(
        name: "Algoritmo no seu dia 1ª Edição",
        companyID: "empresa@pharus.com",
        description:
            "Um algoritmo é um conjunto finito de diretrizes que descrevem como executar uma tarefa.  Isso significa que até mesmo algo tão simples quanto uma receita ou uma lista de direções para a casa podem ser entendidos como um algoritmo.",
        startDate: DateTime(2022, 05, 02),
        endDate: DateTime(2022, 05, 20),
        mentor: "Savio Costa",
        numStudents: 20,
        score: 25,
        rules:
            'Tarefa 01 – Entrega 04/05/2022, com mínimo de 10 inteirações.\nTarefa 02 – Entrega 09/05/2022, com mínimo de 15 inteirações.\nTarefa 03 – Entrega 11/05/2022, utilizar os conhecimentos do material e do minicurso para o desenho do fluxo do algoritmo.\n Tarefa 04 – Entrega 16/05/2022, considerar no mínimo 30 inteirações e informar o nome do amigo. O algoritmo deverá ter a visão de futuro de ambos.\n',
        urlParter:
            "https://ioasys.com.br/static/og-image-7578fe3bd736621f7d9d987908812ee0.jpg",
        taskList: [
          TaskEntity(
            name: "Tarefa 1",
            isComplete: false,
            description:
                "Escrever um algoritmo sobre a sua organização para ida para a escola. O fim do algoritmo deverá ser com a “Entrada na sala de aula”. Anexar a tarefa 01 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 2",
            isComplete: false,
            description:
                "Escrever um algoritmo sobre a sua rotina após o fim da aula.  Anexar a tarefa 02 no aplicativo pharus.",
          ),
          TaskEntity(
            name: "Tarefa 3",
            isComplete: false,
            description:
                "Desenhar um algoritmo sobre o final de semanal. Término será considerado como domingo às 20:00 h. Anexar tarefa 03 no aplicativo pharus.  ",
          ),
          TaskEntity(
            name: "Tarefa 4",
            isComplete: false,
            description:
                "Escrever um algoritmo com um amigo de turma sobre a rotina de parceria de amizade. Considera juntamente uma visão de futuro. Anexar tarefa 04 no aplicativo pharus. ",
          ),
        ],
        projectId: 0,
        students: [],
        finished: false,
      ),
      ProjectModel(
        projectId: 1,
        finished: false,
        students: [''],
        name: "Rabisco em arte.",
        companyID: "empresa@pharus.com",
        description:
            "Design- Um Disciplina que visa a criação de objetos, ambientes, obras gráficas, e ao mesmo tempo funcionais, estéticos e conformes aos imperativos de uma produção industrial.\nÉ uma atividade responsável pelo planejamento, criação e desenvolvimento de produtos e serviços. É um processo que busca soluções criativas e inovadoras para atender características dos produtos, necessidades do cliente e da empresa de forma sintonizada com as demandas e oportunidades do mercado.",
        startDate: DateTime(2022, 06, 06),
        endDate: DateTime(2022, 06, 30),
        mentor: "Jess",
        numStudents: 30,
        rules:
            'Tarefa 01 – Entrega 10/06/2022, considerar como uma folha A4.\nTarefa 02 – Entrega 17/06/2022, utilizar ferramenta informada no minicurso, salvar o arquivo com nome do aluno, e tamanho até 1600px a 1900px de largura e sua altura pode variar entre 800 e 1200 pixels\nTarefa 03 – Entrega 22/06/2022, utilizar os conhecimentos do material e do minicurso para o desenho do fluxo do algoritmo. \nTarefa 04 – Entrega 28/06/2022, considerar no mínimo 30 inteirações e informar o nome do amigo. O algoritmo deverá ter a visão de futuro de ambos. \n',
        urlParter:
            "https://ioasys.com.br/static/og-image-7578fe3bd736621f7d9d987908812ee0.jpg",
        taskList: [
          TaskEntity(
            name: "Tarefa 1",
            isComplete: false,
            description:
                "Utilizando os conhecimentos do minicurso de Algoritmo, rascunhe o processo de sua saída para a Escola, e acrescente como a transformação digital entrou neste fluxo. Anexar a tarefa 01 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 2",
            isComplete: false,
            description:
                "Converse com seus responsáveis familiares, e entenda como a transformação digital faz parte de suas vidas. Relate em quais áreas a transformação digital foi mais impactante.  Anexar a tarefa 02 no aplicativo pharus.",
          ),
          TaskEntity(
            name: "Tarefa 3",
            isComplete: false,
            description:
                "Imagine um futuro, e uma inovação para uma transformação digital, em uma área qualquer que possa desejar. Como base no minicurso de design, faça um rascunho do que será essa inovação. Anexar tarefa 03 no aplicativo pharus.  ",
          ),
          TaskEntity(
            name: "Tarefa 4",
            isComplete: false,
            description:
                "Sabendo sobre o negócio da empresa parceira Localiza, rascunhe o que poderá ser a Transformação Digital, em alguma área da empesa. Anexar tarefa 04 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 5",
            isComplete: false,
            description:
                "Com um amigo de equipe, aponte se em sua Escola houve Transformação Digital, e projete o que considera como a inovação digital poderia auxiliar a Escola. Anexar tarefa 04 no aplicativo pharus.",
          ),
        ],
      ),
      ProjectModel(
        projectId: 2,
        students: ['antonia.ferreira@gmail.com'],
        finished: false,
        name: "Transformação Digital e Você!",
        companyID: "guilherme.neto@empresa.com.br",
        description:
            "Transformação Digital - é uma mudança de mentalidade que as empresas passam com o objetivo de se tornarem mais modernas e acompanharem os avanços tecnológicos que não param de surgir.\nNão há pessoa no mundo que não tenha sido impactada por esse processo, e com as empresas, é a mesma coisa. \nO termo é muito usado no mundo corporativo quando o assunto são as exigências de uma nova realidade, na qual a tecnologia avança mais rápido que nunca.",
        startDate: DateTime(2022, 08, 08),
        endDate: DateTime(2022, 08, 28),
        mentor: "Mariana",
        numStudents: 30,
        rules:
            'Tarefa 01 – Entrega 15/08/2022, considerar no mínimo 20 inteirações.\nTarefa 02 – Entrega 19/08/2022, poderá ser feito em um editor de texto, e salvo no formato pdf. \nTarefa 03 – Entrega 25/08/2022, utilize a ferramenta do minicurso de Design, atividade de conhecimento livre.  \nTarefa 04 – Entrega 27/08/2022, formato livre, poderá ser texto, ou em linhas de algoritmo, ou em design. \nTarefa 05 – Entrega 29/08/2022 - formato livre, poderá ser texto, ou em linhas de algoritmo, ou em design.',
        urlParter:
            "https://logodownload.org/wp-content/uploads/2019/10/alpargatas-logo-1.png",
        taskList: [
          TaskEntity(
            name: "Tarefa 1",
            isComplete: false,
            description:
                "Utilizando os conhecimentos do minicurso de Algoritmo, rascunhe o processo de sua saída para a Escola, e acrescente como a transformação digital entrou neste fluxo. Anexar a tarefa 01 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 2",
            isComplete: false,
            description:
                "Converse com seus responsáveis familiares, e entenda como a transformação digital faz parte de suas vidas. Relate em quais áreas a transformação digital foi mais impactante.  Anexar a tarefa 02 no aplicativo pharus.",
          ),
          TaskEntity(
            name: "Tarefa 3",
            isComplete: false,
            description:
                "Imagine um futuro, e uma inovação para uma transformação digital, em uma área qualquer que possa desejar. Como base no minicurso de design, faça um rascunho do que será essa inovação. Anexar tarefa 03 no aplicativo pharus.  ",
          ),
          TaskEntity(
            name: "Tarefa 4",
            isComplete: false,
            description:
                "Sabendo sobre o negócio da empresa parceira Localiza, rascunhe o que poderá ser a Transformação Digital, em alguma área da empesa. Anexar tarefa 04 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 5",
            isComplete: false,
            description:
                "Com um amigo de equipe, aponte se em sua Escola houve Transformação Digital, e projete o que considera como a inovação digital poderia auxiliar a Escola. Anexar tarefa 04 no aplicativo pharus.",
          ),
        ],
      ),
      ProjectModel(
        name: "Criando moda!",
        description:
            "Descrição Design - uma maneira ou costume mais predominante em um determinado grupo em um determinado momento. É uma palavra muito usada para designar uma forma de se vestir que é comum para muitos ou apreciada por muitas pessoas.",
        startDate: DateTime(2022, 09, 05),
        endDate: DateTime(2022, 09, 23),
        mentor: "Ricardo Almeida",
        numStudents: 20,
        rules:
            'Tarefa 1 - Faça uma dissertação sobre como observa a moda em seu ambiente escola. Poderá escrever até 500 palavras, e encaminhar fotos com referências da moda em sua escola.\nTarefa 2 - Converse com algum familiar e entenda a moda de quando ele ou ela foi adolescente. Faça 04 desenhos com a moda da adolescência de seu familiar. Coloque no início do desenho ano referencial da moda.\nTarefa 3 - Imagine um futuro de 30 anos a frente, e desenhe a moda como poderá estar. Crie em uma ferramenta de design. Faça 03 desenhos completos, incluindo o tipo de caçado que poderá ser usado.\nTarefa 4 - Com dias quentes durante o verão, desenhe calçados que possam ser confortáveis para ir a escola. Use a imaginação para cores, e que poderia ser usado. Faça 04 modelos em uma ferramenta de design.',
        urlParter: 'http://www.smocal.com.br/marcas/ef926b5b03.png',
        taskList: [
          TaskEntity(
            name: " Moda do Momento",
            isComplete: false,
            description:
                'Faça uma dissertação sobre como observa a moda em seu ambiente escola. Poderá escrever até 500 palavras, e encaminhar fotos com referências da moda em sua escola.',
          ),
          TaskEntity(
              name: "Moda na Família",
              isComplete: false,
              description:
                  " Converse com algum familiar e entenda a moda de quando ele ou ela foi adolescente. Faça 04 desenhos com a moda da adolescência de seu familiar. Coloque no início do desenho ano referencial da moda."),
          TaskEntity(
              name: "Rascunho Inovação",
              isComplete: false,
              description:
                  "Imagine um futuro de 30 anos a frente, e desenhe a moda como poderá estar. Crie em uma ferramenta de design. Faça 03 desenhos completos, incluindo o tipo de caçado que poderá ser usado."),
          TaskEntity(
              name: "Moda Verão Escolar",
              isComplete: false,
              description:
                  "Com dias quentes durante o verão, desenhe calçados que possam ser confortáveis para ir a escola. Use a imaginação para cores, e que poderia ser usado. Faça 04 modelos em uma ferramenta de design.")
        ],
        companyID: "dupe@pharus.com",
        students: [],
        finished: false,
        projectId: 4,
      ),
      ProjectModel(
        name: "Startup Go!",
        description:
            "Uma startup é uma empresa que tem o objetivo de crescer de maneira agressiva. As startups costumam oferecer produtos ou serviços inovadores, visando solucionar uma dor ou trazendo inovação incremental a mercadorias que já existem. Quase sempre, as startups baseiam o seu modelo de negócio em tecnologia digital, mas isso não é uma regra.",
        startDate: DateTime(2022, 10, 03),
        endDate: DateTime(2022, 10, 28),
        mentor: "Sávio Costa",
        numStudents: 30,
        rules:
            'Tarefa 1 - Forme um grupo de 04 amigos da escola para executar esta tarefa. Com base no aprendizado sobre o que é uma startup, reúnam-se para descobrir um possível nicho do ambiente escolar ou externo que possa ser um possível produto de uma startup. Para esta entrega, Façam: Descreva o problema a ser atuado / Como chegaram na conclusão do tema a ser trabalhado / Coloquem um nome para a startup. \nTarefa 2 - Conhecendo o problema que escolheram, para tarefa escolha um nome este produto. Defina o que será este produto. Façam uma dissertação explicando como o produto irá ser importante para o problema escolhido. Descreva qual será o publico que o produto irá atender\nTarefa 3 - Com uma ferramenta de design criem uma logomarca para o produto escolhido, e um slogan (slogan é uma frase criada para gerar no consumidor uma associação mental a uma marca, favorecendo que se lembre dela facilmente.)\nTarefa 4 - Definido o produto na tarefa 02, agora é hora de desenhar um protótipo (é o termo usado para se referir ao que foi criado pela primeira vez, servindo de modelo ou molde para futuras produções.) desta inovação. Com seus amigos de grupo, escolham uma ferramenta adequada para que possam rascunhar o produto. Façam ao menos 03 referenciais do produto',
        urlParter:
            'https://ioasys.com.br/static/og-image-7578fe3bd736621f7d9d987908812ee0.jpg',
        taskList: [
          TaskEntity(
              name: 'Aprendendo a empreender',
              isComplete: false,
              description:
                  'Forme um grupo de 04 amigos da escola para executar esta tarefa. Com base no aprendizado sobre o que é uma startup, reúnam-se para descobrir um possível nicho do ambiente escolar ou externo que possa ser um possível produto de uma startup. Para esta entrega, Façam: Descreva o problema a ser atuado / Como chegaram na conclusão do tema a ser trabalhado / Coloquem um nome para a startup. '),
          TaskEntity(
              name: 'Desbravando o produto.',
              isComplete: false,
              description:
                  'Conhecendo o problema que escolheram, para tarefa escolha um nome este produto. Defina o que será este produto. Façam uma dissertação explicando como o produto irá ser importante para o problema escolhido. Descreva qual será o publico que o produto irá atender'),
          TaskEntity(
              name: 'Design em ação...',
              isComplete: false,
              description:
                  'Com uma ferramenta de design criem uma logomarca para o produto escolhido, e um slogan (slogan é uma frase criada para gerar no consumidor uma associação mental a uma marca, favorecendo que se lembre dela facilmente.). '),
          TaskEntity(
              name: 'Hora do show!',
              isComplete: false,
              description:
                  'Definido o produto na tarefa 02, agora é hora de desenhar um protótipo (é o termo usado para se referir ao que foi criado pela primeira vez, servindo de modelo ou molde para futuras produções.) desta inovação. Com seus amigos de grupo, escolham uma ferramenta adequada para que possam rascunhar o produto. Façam ao menos 03 referenciais do produto'),
        ],
        companyID: 'guilherme.neto@empresa.com.br',
        students: [],
        finished: false,
        projectId: 5,
      ),
      ProjectModel(
        name: 'Sustentabilidade Hipster',
        description:
            'Sustentabilidade - é a capacidade de cumprir com as necessidades do presente sem comprometer as mesma das gerações futuras. O conceito de sustentabilidade é composto por três pilares: econômico, ambiental e social.',
        startDate: DateTime(2022, 11, 07),
        endDate: DateTime(2022, 11, 30),
        mentor: 'Oskar Metsavaht',
        numStudents: 20,
        rules:
            'Tarefa 1 - Atividade será em equipe de 04 pessoas. Conhecendo os tipos de materiais para reciclagem, monte um trabalho de divulgação sobre como separar os materiais, e divulgue na escola. Utilize material que possam ser reciclados. Inovem!!!\nTarefa 2 - Esta atividade será individual. Com seu responsável familiar, monte em casa repositórios para a coleta de materiais para o direcionamento correto do lixo residencial. Faça etiquetas para os locais de depósito dos lixos. Ah! use produto reciclado para o deposito do lixo para reciclagem.\nTarefa 3 - Esta tarefa será em grupo com acompanhamento de um responsável escolar. Inicialmente desenvolva material explicativo de como organizar o lixo para reciclagem. Crie um cronograma para que possam visitar residências da região escolar promovendo o conhecimento da reciclagem. Encaminhe os registros no app ! ',
        urlParter:
            'https://i.pinimg.com/600x315/ab/21/69/ab2169bd537cf3c877cc25821a3e26b3.jpg',
        taskList: [
          TaskEntity(
              name: 'Sustentabilidade na prática!',
              isComplete: false,
              description:
                  'Atividade será em equipe de 04 pessoas. Conhecendo os tipos de materiais para reciclagem, monte um trabalho de divulgação sobre como separar os materiais, e divulgue na escola. Utilize material que possam ser reciclados. Inovem!!!'),
          TaskEntity(
              name: 'Família na onda da sustentabilidade!',
              isComplete: false,
              description:
                  ' Esta atividade será individual. Com seu responsável familiar, monte em casa repositórios para a coleta de materiais para o direcionamento correto do lixo residencial. Faça etiquetas para os locais de depósito dos lixos. Ah! use produto reciclado para o deposito do lixo para reciclagem.'),
          TaskEntity(
              name: 'Ação na Comunidade',
              isComplete: false,
              description:
                  'Esta tarefa será em grupo com acompanhamento de um responsável escolar. Inicialmente desenvolva material explicativo de como organizar o lixo para reciclagem. Crie um cronograma para que possam visitar residências da região escolar promovendo o conhecimento da reciclagem. Encaminhe os registros no app ! '),
        ],
        companyID: 'osklen@pharus.com',
        students: [],
        finished: false,
        projectId: 6,
      ),
      ProjectModel(
        name: 'Memória em ação!',
        description:
            'Projeto Social - Projetos sociais são trabalhos desenvolvidos sem fins lucrativos que visam o desenvolvimento social, econômico e cultural de uma comunidade ou grupo.',
        startDate: DateTime(2022, 12, 05),
        endDate: DateTime(2022, 12, 16),
        mentor: 'Rafael Felício',
        numStudents: 25,
        rules:
            'Tarefa 1 - Atividade individual. Para esta tarefa você deverá escolher uma peça de roupa ou calçado que não usa a um bom tempo, e está em boa conservação para que possa ser utilizado outra pessoa. Faça uma dissertação sobre o que esta peça lhe traz de memória, não limite para o texto. Encaminhe no APP!\nTarefa 2 - Junte a dissertação criada mais a peça escolhida. A tarefa será o mentor da escola irá acompanhar uma reunião para que todos possam realizar a passagem da peça para um colega de turma, e livremente ler sua dissertação.\n Tarefa 3 -  Atividade será individual. Observe sua comunidade, sua escola todo o ambiente por onde tenha sua vivência diária. Imagine como poderia ser útil para este ambiente. Crie um Projeto Social com base em suas observações, siga a seguinte lista: O ambiente que será beneficiado / Nome do Projeto Social / O problema observado / Como será o projeto social. Anexo o documento no APP. ',
        urlParter:
            'https://logodownload.org/wp-content/uploads/2015/03/havaianas-logo-1-1.png',
        taskList: [
          TaskEntity(
              name: 'Desapegando! ',
              isComplete: false,
              description:
                  'Atividade individual. Para esta tarefa você deverá escolher uma peça de roupa ou calçado que não usa a um bom tempo, e está em boa conservação para que possa ser utilizado outra pessoa. Faça uma dissertação sobre o que esta peça lhe traz de memória, não limite para o texto. Encaminhe no APP!'),
          TaskEntity(
              name: 'Amigos de Escola!',
              isComplete: false,
              description:
                  'Junte a dissertação criada mais a peça escolhida. A tarefa será o mentor da escola irá acompanhar uma reunião para que todos possam realizar a passagem da peça para um colega de turma, e livremente ler sua dissertação. '),
          TaskEntity(
              name: 'Imaginação no Social!',
              isComplete: false,
              description:
                  'Atividade será individual. Observe sua comunidade, sua escola todo o ambiente por onde tenha sua vivência diária. Imagine como poderia ser útil para este ambiente. Crie um Projeto Social com base em suas observações, siga a seguinte lista: O ambiente que será beneficiado / Nome do Projeto Social / O problema observado / Como será o projeto social. Anexo o documento no APP. ')
        ],
        companyID: 'empresa@pharus.com',
        students: [],
        finished: false,
        projectId: 7,
      )
    ]);

    await _rankingsRepository.setRankings([
      ProjectModel(
        name: "Algoritmo no seu dia 1ª Edição",
        companyID: "empresa@pharus.com",
        description:
            "Um algoritmo é um conjunto finito de diretrizes que descrevem como executar uma tarefa.  Isso significa que até mesmo algo tão simples quanto uma receita ou uma lista de direções para a casa podem ser entendidos como um algoritmo.",
        startDate: DateTime(2022, 03, 02),
        endDate: DateTime(2022, 03, 20),
        mentor: "Savio Costa",
        numStudents: 20,
        rules:
            'Tarefa 01 – Entrega 04/05/2022, com mínimo de 10 inteirações.\nTarefa 02 – Entrega 09/05/2022, com mínimo de 15 inteirações.\nTarefa 03 – Entrega 11/05/2022, utilizar os conhecimentos do material e do minicurso para o desenho do fluxo do algoritmo.\n Tarefa 04 – Entrega 16/05/2022, considerar no mínimo 30 inteirações e informar o nome do amigo. O algoritmo deverá ter a visão de futuro de ambos.\n',
        urlParter:
            "https://ioasys.com.br/static/og-image-7578fe3bd736621f7d9d987908812ee0.jpg",
        taskList: [
          TaskEntity(
            name: "Tarefa 1",
            isComplete: false,
            description:
                "Escrever um algoritmo sobre a sua organização para ida para a escola. O fim do algoritmo deverá ser com a “Entrada na sala de aula”. Anexar a tarefa 01 no aplicativo pharus. ",
          ),
          TaskEntity(
            name: "Tarefa 2",
            isComplete: false,
            description:
                "Escrever um algoritmo sobre a sua rotina após o fim da aula.  Anexar a tarefa 02 no aplicativo pharus.",
          ),
          TaskEntity(
            name: "Tarefa 3",
            isComplete: false,
            description:
                "Desenhar um algoritmo sobre o final de semanal. Término será considerado como domingo às 20:00 h. Anexar tarefa 03 no aplicativo pharus.  ",
          ),
          TaskEntity(
            name: "Tarefa 4",
            isComplete: false,
            description:
                "Escrever um algoritmo com um amigo de turma sobre a rotina de parceria de amizade. Considera juntamente uma visão de futuro. Anexar tarefa 04 no aplicativo pharus. ",
          ),
        ],
        projectId: 0,
        students: [],
        finished: true,
        medal: 'first',
        mentorComment:
            'Parabéns pelo esforço e trabalho, a escola João da Silva orgulha-se de ter um aluno como você.\nAcreditamos que terá um futuro brilhante! ',
        ranking: 1,
      )
    ]);
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 2);
    await Hive.initFlutter();
    mockarInformacoes();
    await Firebase.initializeApp();
    return Timer(_duration, navigationToNextPage);
  }
}
