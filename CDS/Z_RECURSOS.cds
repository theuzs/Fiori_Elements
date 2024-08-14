@AbapCatalog.sqlViewName: 'ZRECURSOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Horas Recursos'
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.compositionRoot: true
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.writeActivePersistence: 'zagghcmrecurso'
@OData.publish: true
@Metadata.allowExtensions: true

define view Z_RECURSOS
  as select from zagghcmrecurso
{
      @UI.lineItem: [{ position: 10 }]
      @EndUserText.label: 'Código do Recurso'
  key cod_recurso,

      @UI.lineItem: [{ position: 20 }]
      @EndUserText.label: 'Nome do Recurso'
      nome_recurso,

      @UI.lineItem: [{ position: 30 }]
      @EndUserText.label: 'Cargo do Recurso'
      cargo_recurso,

      @UI.lineItem: [{ position: 40 }]
      @EndUserText.label: 'Ativo'
      ativo,

      @UI.lineItem: [{ position: 50 }]
      @EndUserText.label: 'Senha'
      senha,

      @UI.lineItem: [{ position: 60 }]
      @EndUserText.label: 'Email'
      email,

      @UI.lineItem: [{ position: 70 }]
      @EndUserText.label: 'Telefone'
      telefone,

      @UI.lineItem: [{ position: 80 }]
      @EndUserText.label: 'Endereço'
      endereco,

      @UI.lineItem: [{ position: 90 }]
      @EndUserText.label: 'Bairro'
      bairro,

      @UI.lineItem: [{ position: 100 }]
      @EndUserText.label: 'Cidade'
      cidade,

      @UI.lineItem: [{ position: 110 }]
      @EndUserText.label: 'UF'
      uf,

      @UI.lineItem: [{ position: 120 }]
      @EndUserText.label: 'CEP'
      cep,

      @UI.lineItem: [{ position: 130 }]
      @EndUserText.label: 'Data de Nascimento'
      data_nascimento,

      @UI.lineItem: [{ position: 140 }]
      @EndUserText.label: 'Data de Admissão'
      data_admissao,

      @UI.lineItem: [{ position: 150 }]
      @EndUserText.label: 'Data de Início'
      data_inicio,

      @UI.lineItem: [{ position: 160 }]
      @EndUserText.label: 'Data de Fim'
      data_fim
}
