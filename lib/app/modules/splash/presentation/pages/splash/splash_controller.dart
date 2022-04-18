import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../data/models/company_model.dart';
import '../../../../../data/models/news_model.dart';
import '../../../../../data/models/notify_model.dart';
import '../../../../../data/models/project_model.dart';
import '../../../../../data/models/school_model.dart';
import '../../../../../data/models/student_model.dart';
import '../../../../../domain/entities/task_entity.dart';
import '../../../../../domain/enums/notify_type_enum.dart';
import '../../../../../domain/enums/user_type_enum.dart';

class SplashController {
  void navigationToNextPage() {
    Modular.to.navigate('/auth/');
  }

  void mockarInformacoes() async {
    var hiveUsersBox = await Hive.openBox("users");
    await hiveUsersBox.clear();
    if (!hiveUsersBox.containsKey("antonia.ferreira@gmail.com")) {
      await hiveUsersBox.put(
        "antonia.ferreira@gmail.com",
        StudentModel(
          name: "Antonia Ferreita",
          email: "antonia.ferreira@gmail.com",
          password: "password",
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
        ).toJson(),
      );
    }
    if (!hiveUsersBox.containsKey("maria.helena.diretora@gmail.com")) {
      await hiveUsersBox.put(
        "maria.helena.diretora@gmail.com",
        SchoolModel(
          avatarUrl: "escolaAvatar",
          administeredby: "Maria Helena Vilela",
          position: "Diretora",
          city: "Lavras, MG",
          name: "Escola estadual João da Silva",
          email: "maria.helena.diretora@gmail.com",
          password: "password",
          type: userTypeEnum.SCHOOL,
        ).toJson(),
      );
    }
    if (!hiveUsersBox.containsKey("guilherme.neto@empresa.com.br")) {
      await hiveUsersBox.put(
        "guilherme.neto@empresa.com.br",
        CompanyModel(
          avatarUrl: "companyAvatar",
          administeredby: "Guilherme Almeida Neto",
          position: "CEO",
          city: "Belo Horizonte, MG",
          name: "Guilherme Almeida Neto",
          email: "guilherme.neto@empresa.com.br",
          password: "password",
          type: userTypeEnum.COMPANY,
        ).toJson(),
      );
    }
    if (!hiveUsersBox.containsKey("empresa@pharus.com")) {
      await hiveUsersBox.put(
        "empresa@pharus.com",
        CompanyModel(
          avatarUrl: "companyAvatar2",
          administeredby: "Pharus LMTD.",
          position: "CEO",
          city: "Belo Horizonte, MG",
          name: "Empresa Pharus",
          email: "empresa@pharus.com",
          password: "password",
          type: userTypeEnum.COMPANY,
        ).toJson(),
      );
    }

    hiveUsersBox.close();

    /*
    await hiveUsersBox.put(
      "escola@pharus.com",
      UserEntity(
        name: "Escola Pharus",
        email: "escola@pharus.com",
        password: "password",
        type: userTypeEnum.SCHOOL,
      ),
    );
    await hiveUsersBox.put(
      "empresa@pharus.com",
      UserEntity(
        name: "Empresa Pharus",
        email: "empresa@pharus.com",
        password: "password",
        type: userTypeEnum.COMPANY,
      ),
    );
    await hiveUsersBox.put(
      "estudante@pharus.com",
      UserEntity(
        name: "Estudante Pharus",
        email: "estudante@pharus.com",
        password: "password",
        type: userTypeEnum.STUDENT,
      ),
    );
*/

    var hiveProjectBox = await Hive.openBox("projects");
    await hiveProjectBox.clear();
    if (hiveProjectBox.isEmpty) {
      await hiveProjectBox.addAll(
        [
          ProjectModel(
            name: "Algoritmo no seu dia.2",
            companyID: "empresa2@pharus.com",
            description:
                "Um algoritmo é um conjunto finito de diretrizes que descrevem como executar uma tarefa.  Isso significa que até mesmo algo tão simples quanto uma receita ou uma lista de direções para a casa podem ser entendidos como um algoritmo.",
            startDate: DateTime(2022, 05, 02),
            endDate: DateTime(2022, 05, 20),
            mentor: "Savio Costa",
            numStudents: 20,
            score: 25,
            rules:
                'Tarefa 01 – Entrega 04/05/2022, com mínimo de 10 inteirações.\nTarefa 02 – Entrega 09/05/2022, com mínimo de 15 inteirações.\nTarefa 03 – Entrega 11/05/2022, utilizar os conhecimentos do material e do minicurso para o desenho do fluxo do algoritmo.\n Tarefa 04 – Entrega 16/05/2022, considerar no mínimo 30 inteirações e informar o nome do amigo. O algoritmo deverá ter a visão de futuro de ambos.\n',
            urlParter: "https://nerdin.com.br/img/empresa/1798.png",
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
          ).toJson(),
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
            urlParter: "https://nerdin.com.br/img/empresa/1798.png",
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
          ).toJson(),
          ProjectModel(
            projectId: 2,
            students: ['antonia.ferreira@gmail.com'],
            finished: false,
            name: "Transformação Digital e Você!",
            companyID: "empresa@pharus.com",
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
          ).toJson(),
        ],
      );
    }
    hiveProjectBox.close();

    var hiveNewstBox = await Hive.openBox("news");
    await hiveNewstBox.put(
      "news",
      NewsModel(
        news: [
          'O UNICEF lança, esta semana, a segunda edição do Tamo Junto UNICEF (#tmjUNICEF), programa de voluntariado digital voltado a adolescentes e jovens de 16 a 24 anos.',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. ',
        ],
      ).toJson(),
    );
    hiveNewstBox.close();

    var hiveNotifyBox = await Hive.openBox("notify");
    await hiveNotifyBox.clear();
    await hiveNotifyBox.addAll(
      [
        NotifyModel(
          notify: "O projeto 1 termina em 8 dias!",
          type: NotifyType.WARNING,
        ).toJson(),
        NotifyModel(
          notify: "O projeto ”Introdução a Robótica” te deu uma medalha!",
          type: NotifyType.MEDAL,
        ).toJson(),
        NotifyModel(
          notify: "Conheça a nova empresa parceira",
          type: NotifyType.GENERIC,
        ).toJson(),
      ],
    );
    hiveNotifyBox.close();
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 2);
    await Hive.initFlutter();
    mockarInformacoes();
    await Firebase.initializeApp();
    return Timer(_duration, navigationToNextPage);
  }
}
