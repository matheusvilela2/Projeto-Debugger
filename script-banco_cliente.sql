create table contato (
    idcontato int  identity(1,1),
    email  varchar(45) not null,
    telefone int not null,
    celular int not null,

    constraint PK_idcontato primary key (idcontato)
);

create table cep (
    cep int identity (1,1),
    logradouro varchar (60),
    bairro varchar (30),
    cidade varchar (40),
    estado  varchar (30),

    constraint PK_cep primary key (cep)

);

create table usuario (
    idusuario int identity(1,1),
    nmusuario varchar(25) not null,
    senha varchar (15) not null,
    ADM bit not null,
    usrCont int not null, 

    constraint PK_idusuario primary key (idusuario),
    constraint FK_usrCont  foreign key (usrCont) references contato(idcontato),
);

create table camara (
    idcamara int identity(1,1),
    tipocerveja varchar(45) not null,
    tempMax decimal not null, 
    tempMin decimal not null,
    umiMax decimal not null,
    umiMin decimal not null,
    numero int not null,
    complemento int not null,
    endereco int not null,
    dados int,

    constraint PK_idcamara primary key (idcamara),
    constraint FK_endereco foreign key (endereco) references cep(cep),
    constraint FK_dados foreign key (dados) references dados(iddados)
);


create table dados (
    iddados int identity(1,1),
    temperatura decimal not null,
    umidade decimal not null,
    data_time datetime not null,

    constraint PK_iddados primary key (iddados),
);

create table usuario_camara (
    usuario int not null,
    camara  int not null,

    constraint FK_usuario foreign key (usuario) references usuario(idusuario),
    constraint FK_camara foreign key (camara) references camara(idcamara)
);