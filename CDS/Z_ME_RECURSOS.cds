@Metadata.layer: #CUSTOMER

@UI.headerInfo: {
    typeName: 'Recurso',
    typeNamePlural: 'Recursos',
    typeImageUrl: 'sap-icon://account',
    title: { type: #STANDARD, value: 'nome_recurso' },
    description: { type: #STANDARD, value: 'cargo_recurso' }
}
annotate view Z_RECURSOS with
{
  @UI.facet: [
      {
          id: 'idGeneralInformation',
          type: #COLLECTION,
          label: 'Informações do Recurso',
          position: 10
      },
      {
          type: #IDENTIFICATION_REFERENCE,
          label: 'Detalhes do Recurso',
          parentId: 'idGeneralInformation', 
          id: 'idIdentification'
      }
  ]

  @UI: {
      lineItem: [{ position: 10, importance: #HIGH }],
      identification: [{ position: 10, importance: #HIGH }]
  }
  cod_recurso;

  @UI.selectionField: [{ position: 10 }]
  @UI: { identification: [{ position: 20 }] }
  nome_recurso;

  @UI: { identification: [{ position: 30 }] }
  cargo_recurso;

  @UI: { identification: [{ position: 40 }] }
  ativo;

  @UI: { identification: [{ position: 50 }] }
  senha;

  @UI: { identification: [{ position: 60 }] }
  email;

  @UI: { identification: [{ position: 70 }] }
  telefone;

  @UI: { identification: [{ position: 80 }] }
  endereco;

  @UI: { identification: [{ position: 90 }] }
  bairro;

  @UI: { identification: [{ position: 100 }] }
  cidade;

  @UI: { identification: [{ position: 110 }] }
  uf;

  @UI: { identification: [{ position: 120 }] }
  cep;

  @UI: { identification: [{ position: 130 }] }
  data_nascimento;

  @UI: { identification: [{ position: 140 }] }
  data_admissao;

  @UI: { identification: [{ position: 150 }] }
  data_inicio;

  @UI: { identification: [{ position: 160 }] }
  data_fim;
}