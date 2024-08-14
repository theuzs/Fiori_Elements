@Metadata.layer: #CORE
@UI.headerInfo: {
    typeName: 'Ordem de Compra',
    typeNamePlural: 'Ordem de Compras',
    typeImageUrl: 'sap-icon://product',
    title: { type: #STANDARD, value: 'Requisicao' },
    description: { type: #STANDARD, value: 'Item_Req' }
}
annotate view Z_MM_COMPRAS with
{
  @UI.facet: [
      {
          id: 'idGeneralInformation',
          type: #COLLECTION,
          label: 'Informações Gerais',
          position: 10
      },
      {
          type: #IDENTIFICATION_REFERENCE,
          label: 'Detalhes da Requisição',
          parentId: 'idGeneralInformation',
          id: 'idIdentification'
      },
      {
          id: 'idItensCompra',
          purpose: #STANDARD,
          type: #LINEITEM_REFERENCE,
          label: 'Itens',
          position: 20,
          targetElement: '_Ekbe'
      }
  ]


  @UI.dataPoint: { title: 'Requisição',
   description: '{Teste}',
  targetValue: 150,
  criticality: 'Criticality',
  visualization: #PROGRESS }
  Requisicao;


  @UI.dataPoint: { qualifier: 'PriceData',
   title: 'Montante',
   criticality: 'Criticality_libe',
  visualization: #PROGRESS  }
  total;

  //@Consumption.semanticObject: 'PurchaseOrder'
  //Ordem;

  @UI: {
      lineItem: [{ position: 10, importance: #HIGH }],
      identification: [{ position: 10, importance: #HIGH }]
  }
  Item_Ordem;

  @UI: { identification: [{ position: 20 }] }
  bedat;

  @UI: { identification: [{ position: 30 }] }
  lifnr;

  @UI: { identification: [{ position: 40 }] }
  BSART;

  @UI: { identification: [{ position: 50 }] }
  werks;

  @UI: { identification: [{ position: 60 }] }
  matnr;

  @UI: { identification: [{ position: 70 }] }
  TXZ01;

  @UI: { identification: [{ position: 80 }] }
  menge;

  @UI: { identification: [{ position: 90 }] }
  meins;

  @UI: { identification: [{ position: 100 }] }
  banfn;

  @UI: { identification: [{ position: 110 }] }
  bnfpo;

  @UI: { identification: [{ position: 120 }] }
  liberado;

  @UI: { identification: [{ position: 130 }] }
  mblnr;

  @UI: { identification: [{ position: 140 }] }
  cpudt_mkpf;

  @UI: { identification: [{ position: 150 }] }
  menge_mseg;

  @UI: { identification: [{ position: 160 }] }
  badat;

  @UI: { identification: [{ position: 170 }] }
  afnam;

  @UI: { identification: [{ position: 180 }] }
  menge_eban;

  @UI.hidden: true
  Criticality;

  @UI: {
      lineItem: [
          {
              position: 70,
              value: 'liberado',
              criticality: 'Criticality_libe'
          }
      ]
  }
  Criticality_libe;
}