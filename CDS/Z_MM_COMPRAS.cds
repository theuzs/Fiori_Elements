@AbapCatalog.sqlViewName: 'ZMMCOMPRAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true

@OData.publish: true

@ObjectModel.compositionRoot: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório de SAP MM Compras'

define view Z_MM_COMPRAS
  as select from    ekko
    inner join      ekpo        on ekko.ebeln = ekpo.ebeln
    left outer join nsdm_v_mseg on  ekko.ebeln = nsdm_v_mseg.ebeln
                                and ekpo.ebelp = nsdm_v_mseg.ebelp
    left outer join eban        on  ekpo.banfn = eban.banfn
                                and ekpo.bnfpo = eban.bnfpo
                                and ekpo.werks = eban.werks
                                and ekpo.matnr = eban.matnr
  association [0..*] to Z_MM_EKBE as _Ekbe on _Ekbe.Ebeln = ekko.ebeln
{
       @UI.lineItem: [{ position: 60 }]
       @EndUserText.label: 'Item da Ordem'
  key  ekpo.ebelp as Item_Ordem,

       @UI.lineItem: [{ position: 80 }]
       @UI.selectionField: [{ position: 10 }]
       @Consumption.valueHelpDefinition: [{ entity:{name: 'Z_MM_EKKO_EBAN', element: 'werks' } }]
       @EndUserText.label: 'Centro'
  key  ekpo.werks as werks,

       @UI.lineItem: [{ position: 90 }]
       @UI.selectionField: [{ position: 20 }]
       @EndUserText.label: 'Material'
  key  ekpo.matnr as matnr,

  key  nsdm_v_mseg.mblnr as Doc_Material,
  key  nsdm_v_mseg.zeile as Item_Doc_Material,
  key  eban.banfn as Requisicao,
  key  eban.bnfpo as Item_Req,


       @UI.lineItem: [{ position: 10 }]
       @EndUserText.label: 'Ordem de Compra'
  key  ekko.ebeln as Ordem,

       @UI.lineItem: [{ position: 20 }]
       @EndUserText.label: 'Data da Ordem'
       ekko.bedat as bedat,

       @UI.hidden: true
       @EndUserText.label: 'Fornecedor'
       ekko.lifnr as lifnr,

       @UI.lineItem: [{ position: 40 }]
       @EndUserText.label: 'Tipo de documento'
       eban.bsart as BSART,

       @UI.lineItem: [{ position: 50 }]
       @EndUserText.label: 'Montante'
       concat_with_space(cast(nsdm_v_mseg.dmbtr as abap.char(15)), nsdm_v_mseg.waers, 1) as total,

       @UI.lineItem: [{ position: 70 }]
       @EndUserText.label: 'Texto Breve'
       eban.txz01 as TXZ01,

       @UI.lineItem: [{ position: 100 }]
       @EndUserText.label: 'Quantidade'
       nsdm_v_mseg.menge,

       @UI.lineItem: [{ position: 110 }]
       @EndUserText.label: 'Unidade Básica'
       nsdm_v_mseg.meins,

       @UI.lineItem: [{ position: 120 }]
       @EndUserText.label: 'Requisição de Compra'
       ekpo.banfn as banfn,

       @UI.lineItem: [{ position: 130 }]
       @EndUserText.label: 'Posição da Requisição'
       ekpo.bnfpo as bnfpo,

       @UI.lineItem: [{ position: 140 }]
       @EndUserText.label: 'Estado Requisição'
       case eban.frgzu
       when 'N'   then 'Bloqueado'
       when 'no'  then 'Bloqueado'
       when ' '   then 'Bloqueado'
       when 'yes' then 'Liberado'
       when 'X'   then 'Liberado'
       else 'Bloqueado'
       end as liberado,

       @UI.lineItem: [{ position: 160 }]
       @EndUserText.label: 'Número da Entrada de Mercadorias'
       nsdm_v_mseg.mblnr as mblnr,

       @UI.lineItem: [{ position: 170 }]
       @EndUserText.label: 'Data da Entrada de Mercadorias'
       nsdm_v_mseg.cpudt_mkpf as cpudt_mkpf,

       @UI.lineItem: [{ position: 180 }]
       @EndUserText.label: 'Quantidade Recebida'
       nsdm_v_mseg.menge as menge_mseg,

       @UI.lineItem: [{ position: 190 }]
       @EndUserText.label: 'Data da Solicitação'
       eban.badat as badat,

       @UI.lineItem: [{ position: 200 }]
       @EndUserText.label: 'Solicitante'
       eban.afnam as afnam,

       @UI.lineItem: [{ position: 210 }]
       @EndUserText.label: 'Quantidade Solicitada'
       eban.menge as menge_eban,

       @UI.hidden: true
       case ekpo.elikz
       when 'N'   then 1
       when 'no'  then 1
       when ' '   then 1
       when 'yes' then 3
       when 'X'   then 3
       else 0
       end as Criticality,

       @UI.hidden: true
       case eban.frgzu
       when 'N'   then 1
       when 'no'  then 1
       when ' '   then 1
       when 'yes' then 3
       when 'X'   then 3
       else 0
       end as Criticality_libe,
       _Ekbe
}
where 
      ekpo.banfn is not null
  and ekpo.banfn <> ''
  and ekpo.matnr <> ''
  and ekpo.werks <> ''
  and nsdm_v_mseg.mblnr <> '';
