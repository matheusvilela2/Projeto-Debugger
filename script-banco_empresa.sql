create table endereco (
    idendereco int identity (1,1),
    logradouro varchar (50) not null,
    bairro varchar (30) not null,
    complemento int not null,
    numero int not null,
    cep int not null,
    cidade varchar (30) not null,
    estado varchar (30) not null

    constraint PK_idendereco primary key nonclustered (idendereco)
);

create table contato (
    idcontato int identity(1,1),
    email  varchar(45) not null,
    telefone int not null,
    celular int not null,

    constraint PK_idcontato primary key nonclustered (idcontato)
);

create table empresa (
    idempresa int identity(1,1),
    nmempresa varchar (50) not null,
    CNPJ int not null,
    representante varchar (50),
    usrCont int not null,
    usrEnd int not null,

    constraint PK_idempresa primary key (idempresa),
    constraint FK_usrCont foreign key (usrCont) references contato(idcontato),
    constraint FK_usrEnd foreign key (usrEnd) references endereco(idendereco)
);

