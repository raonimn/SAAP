// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://webservicesro/service/rastro/Rastro.wsdl
//  >Import : http://webservicesro/service/rastro/Rastro.wsdl>0
//  >Import : http://webservicesro/service/rastro/Rastro_schema1.xsd
// Encoding : UTF-8
// Version  : 1.0
// (18/03/2016 11:37:54 - - $Rev: 76228 $)
// ************************************************************************ //

unit Rastro2;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]

  sroxml               = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  rastro               = class;                 { "http://resource.webservice.correios.com.br/"[GblElm] }
  objeto2              = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  objeto               = class;                 { "http://resource.webservice.correios.com.br/"[GblElm] }
  enderecoMobile       = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  destinos             = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  objetoPostal         = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  listaEntregaExterna  = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  eventos              = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  evento               = class;                 { "http://resource.webservice.correios.com.br/"[GblElm] }
  destino              = class;                 { "http://resource.webservice.correios.com.br/"[GblElm] }
  registroUnidades     = class;                 { "http://resource.webservice.correios.com.br/"[GblCplx] }
  endereco             = class;                 { "http://resource.webservice.correios.com.br/"[GblElm] }

  Array_Of_destino = array of destino;          { "http://resource.webservice.correios.com.br/"[GblUbnd] }
  Array_Of_objetoPostal = array of objetoPostal;   { "http://resource.webservice.correios.com.br/"[GblUbnd] }
  Array_Of_evento = array of evento;            { "http://resource.webservice.correios.com.br/"[GblUbnd] }
  Array_Of_string = array of string;            { "http://www.w3.org/2001/XMLSchema"[GblUbnd] }
  Array_Of_objeto = array of objeto;            { "http://resource.webservice.correios.com.br/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : sroxml, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  sroxml = class(TRemotable)
  private
    Fversao: string;
    Fversao_Specified: boolean;
    Fqtd: string;
    Fqtd_Specified: boolean;
    FTipoPesquisa: string;
    FTipoPesquisa_Specified: boolean;
    FTipoResultado: string;
    FTipoResultado_Specified: boolean;
    Fobjeto: Array_Of_objeto;
    Fobjeto_Specified: boolean;
    procedure Setversao(Index: Integer; const Astring: string);
    function  versao_Specified(Index: Integer): boolean;
    procedure Setqtd(Index: Integer; const Astring: string);
    function  qtd_Specified(Index: Integer): boolean;
    procedure SetTipoPesquisa(Index: Integer; const Astring: string);
    function  TipoPesquisa_Specified(Index: Integer): boolean;
    procedure SetTipoResultado(Index: Integer; const Astring: string);
    function  TipoResultado_Specified(Index: Integer): boolean;
    procedure Setobjeto(Index: Integer; const AArray_Of_objeto: Array_Of_objeto);
    function  objeto_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property versao:        string           Index (IS_OPTN or IS_UNQL) read Fversao write Setversao stored versao_Specified;
    property qtd:           string           Index (IS_OPTN or IS_UNQL) read Fqtd write Setqtd stored qtd_Specified;
    property TipoPesquisa:  string           Index (IS_OPTN or IS_UNQL) read FTipoPesquisa write SetTipoPesquisa stored TipoPesquisa_Specified;
    property TipoResultado: string           Index (IS_OPTN or IS_UNQL) read FTipoResultado write SetTipoResultado stored TipoResultado_Specified;
    property objeto:        Array_Of_objeto  Index (IS_OPTN or IS_UNBD or IS_REF) read Fobjeto write Setobjeto stored objeto_Specified;
  end;



  // ************************************************************************ //
  // XML       : rastro, global, <element>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  rastro = class(sroxml)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : objeto, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  objeto2 = class(TRemotable)
  private
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fsigla: string;
    Fsigla_Specified: boolean;
    Fnome: string;
    Fnome_Specified: boolean;
    Fcategoria: string;
    Fcategoria_Specified: boolean;
    Ferro: string;
    Ferro_Specified: boolean;
    Fevento: Array_Of_evento;
    Fevento_Specified: boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setsigla(Index: Integer; const Astring: string);
    function  sigla_Specified(Index: Integer): boolean;
    procedure Setnome(Index: Integer; const Astring: string);
    function  nome_Specified(Index: Integer): boolean;
    procedure Setcategoria(Index: Integer; const Astring: string);
    function  categoria_Specified(Index: Integer): boolean;
    procedure Seterro(Index: Integer; const Astring: string);
    function  erro_Specified(Index: Integer): boolean;
    procedure Setevento(Index: Integer; const AArray_Of_evento: Array_Of_evento);
    function  evento_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property numero:    string           Index (IS_OPTN or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property sigla:     string           Index (IS_OPTN or IS_UNQL) read Fsigla write Setsigla stored sigla_Specified;
    property nome:      string           Index (IS_OPTN or IS_UNQL) read Fnome write Setnome stored nome_Specified;
    property categoria: string           Index (IS_OPTN or IS_UNQL) read Fcategoria write Setcategoria stored categoria_Specified;
    property erro:      string           Index (IS_OPTN or IS_UNQL) read Ferro write Seterro stored erro_Specified;
    property evento:    Array_Of_evento  Index (IS_OPTN or IS_UNBD or IS_REF) read Fevento write Setevento stored evento_Specified;
  end;



  // ************************************************************************ //
  // XML       : objeto, global, <element>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  objeto = class(objeto2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : enderecoMobile, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  enderecoMobile = class(TRemotable)
  private
    Fcodigo: string;
    Fcodigo_Specified: boolean;
    Fcep: string;
    Fcep_Specified: boolean;
    Flogradouro: string;
    Flogradouro_Specified: boolean;
    Fcomplemento: string;
    Fcomplemento_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Flocalidade: string;
    Flocalidade_Specified: boolean;
    Fuf: string;
    Fuf_Specified: boolean;
    Fbairro: string;
    Fbairro_Specified: boolean;
    Flatitude: string;
    Flatitude_Specified: boolean;
    Flongitude: string;
    Flongitude_Specified: boolean;
    Fcelular: string;
    Fcelular_Specified: boolean;
    procedure Setcodigo(Index: Integer; const Astring: string);
    function  codigo_Specified(Index: Integer): boolean;
    procedure Setcep(Index: Integer; const Astring: string);
    function  cep_Specified(Index: Integer): boolean;
    procedure Setlogradouro(Index: Integer; const Astring: string);
    function  logradouro_Specified(Index: Integer): boolean;
    procedure Setcomplemento(Index: Integer; const Astring: string);
    function  complemento_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setlocalidade(Index: Integer; const Astring: string);
    function  localidade_Specified(Index: Integer): boolean;
    procedure Setuf(Index: Integer; const Astring: string);
    function  uf_Specified(Index: Integer): boolean;
    procedure Setbairro(Index: Integer; const Astring: string);
    function  bairro_Specified(Index: Integer): boolean;
    procedure Setlatitude(Index: Integer; const Astring: string);
    function  latitude_Specified(Index: Integer): boolean;
    procedure Setlongitude(Index: Integer; const Astring: string);
    function  longitude_Specified(Index: Integer): boolean;
    procedure Setcelular(Index: Integer; const Astring: string);
    function  celular_Specified(Index: Integer): boolean;
  published
    property codigo:      string  Index (IS_OPTN or IS_UNQL) read Fcodigo write Setcodigo stored codigo_Specified;
    property cep:         string  Index (IS_OPTN or IS_UNQL) read Fcep write Setcep stored cep_Specified;
    property logradouro:  string  Index (IS_OPTN or IS_UNQL) read Flogradouro write Setlogradouro stored logradouro_Specified;
    property complemento: string  Index (IS_OPTN or IS_UNQL) read Fcomplemento write Setcomplemento stored complemento_Specified;
    property numero:      string  Index (IS_OPTN or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property localidade:  string  Index (IS_OPTN or IS_UNQL) read Flocalidade write Setlocalidade stored localidade_Specified;
    property uf:          string  Index (IS_OPTN or IS_UNQL) read Fuf write Setuf stored uf_Specified;
    property bairro:      string  Index (IS_OPTN or IS_UNQL) read Fbairro write Setbairro stored bairro_Specified;
    property latitude:    string  Index (IS_OPTN or IS_UNQL) read Flatitude write Setlatitude stored latitude_Specified;
    property longitude:   string  Index (IS_OPTN or IS_UNQL) read Flongitude write Setlongitude stored longitude_Specified;
    property celular:     string  Index (IS_OPTN or IS_UNQL) read Fcelular write Setcelular stored celular_Specified;
  end;



  // ************************************************************************ //
  // XML       : destinos, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  destinos = class(TRemotable)
  private
    Flocal_: string;
    Flocal__Specified: boolean;
    Fcodigo: string;
    Fcodigo_Specified: boolean;
    Fcidade: string;
    Fcidade_Specified: boolean;
    Fbairro: string;
    Fbairro_Specified: boolean;
    Fuf: string;
    Fuf_Specified: boolean;
    procedure Setlocal_(Index: Integer; const Astring: string);
    function  local__Specified(Index: Integer): boolean;
    procedure Setcodigo(Index: Integer; const Astring: string);
    function  codigo_Specified(Index: Integer): boolean;
    procedure Setcidade(Index: Integer; const Astring: string);
    function  cidade_Specified(Index: Integer): boolean;
    procedure Setbairro(Index: Integer; const Astring: string);
    function  bairro_Specified(Index: Integer): boolean;
    procedure Setuf(Index: Integer; const Astring: string);
    function  uf_Specified(Index: Integer): boolean;
  published
    property local_: string  Index (IS_OPTN or IS_UNQL) read Flocal_ write Setlocal_ stored local__Specified;
    property codigo: string  Index (IS_OPTN or IS_UNQL) read Fcodigo write Setcodigo stored codigo_Specified;
    property cidade: string  Index (IS_OPTN or IS_UNQL) read Fcidade write Setcidade stored cidade_Specified;
    property bairro: string  Index (IS_OPTN or IS_UNQL) read Fbairro write Setbairro stored bairro_Specified;
    property uf:     string  Index (IS_OPTN or IS_UNQL) read Fuf write Setuf stored uf_Specified;
  end;



  // ************************************************************************ //
  // XML       : objetoPostal, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  objetoPostal = class(TRemotable)
  private
    Fagrupamento: string;
    Fagrupamento_Specified: boolean;
    FavisoRecebimento: string;
    FavisoRecebimento_Specified: boolean;
    FdevolucaoDocumento: string;
    FdevolucaoDocumento_Specified: boolean;
    FdevolucaoObjeto: string;
    FdevolucaoObjeto_Specified: boolean;
    FmaoPropria: string;
    FmaoPropria_Specified: boolean;
    FnumeroObjeto: string;
    FnumeroObjeto_Specified: boolean;
    procedure Setagrupamento(Index: Integer; const Astring: string);
    function  agrupamento_Specified(Index: Integer): boolean;
    procedure SetavisoRecebimento(Index: Integer; const Astring: string);
    function  avisoRecebimento_Specified(Index: Integer): boolean;
    procedure SetdevolucaoDocumento(Index: Integer; const Astring: string);
    function  devolucaoDocumento_Specified(Index: Integer): boolean;
    procedure SetdevolucaoObjeto(Index: Integer; const Astring: string);
    function  devolucaoObjeto_Specified(Index: Integer): boolean;
    procedure SetmaoPropria(Index: Integer; const Astring: string);
    function  maoPropria_Specified(Index: Integer): boolean;
    procedure SetnumeroObjeto(Index: Integer; const Astring: string);
    function  numeroObjeto_Specified(Index: Integer): boolean;
  published
    property agrupamento:        string  Index (IS_OPTN or IS_UNQL) read Fagrupamento write Setagrupamento stored agrupamento_Specified;
    property avisoRecebimento:   string  Index (IS_OPTN or IS_UNQL) read FavisoRecebimento write SetavisoRecebimento stored avisoRecebimento_Specified;
    property devolucaoDocumento: string  Index (IS_OPTN or IS_UNQL) read FdevolucaoDocumento write SetdevolucaoDocumento stored devolucaoDocumento_Specified;
    property devolucaoObjeto:    string  Index (IS_OPTN or IS_UNQL) read FdevolucaoObjeto write SetdevolucaoObjeto stored devolucaoObjeto_Specified;
    property maoPropria:         string  Index (IS_OPTN or IS_UNQL) read FmaoPropria write SetmaoPropria stored maoPropria_Specified;
    property numeroObjeto:       string  Index (IS_OPTN or IS_UNQL) read FnumeroObjeto write SetnumeroObjeto stored numeroObjeto_Specified;
  end;



  // ************************************************************************ //
  // XML       : listaEntregaExterna, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  listaEntregaExterna = class(TRemotable)
  private
    Fcarteiro: string;
    Fcarteiro_Specified: boolean;
    Fdata: TXSDateTime;
    Fdata_Specified: boolean;
    Fdistrito: string;
    Fdistrito_Specified: boolean;
    Festacao: string;
    Festacao_Specified: boolean;
    Fid: string;
    Fid_Specified: boolean;
    Floec: string;
    Floec_Specified: boolean;
    FnomeCarteiro: string;
    FnomeCarteiro_Specified: boolean;
    FnomeUnidade: string;
    FnomeUnidade_Specified: boolean;
    Fobjetos: Array_Of_objetoPostal;
    Fobjetos_Specified: boolean;
    Funidade: string;
    Funidade_Specified: boolean;
    procedure Setcarteiro(Index: Integer; const Astring: string);
    function  carteiro_Specified(Index: Integer): boolean;
    procedure Setdata(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  data_Specified(Index: Integer): boolean;
    procedure Setdistrito(Index: Integer; const Astring: string);
    function  distrito_Specified(Index: Integer): boolean;
    procedure Setestacao(Index: Integer; const Astring: string);
    function  estacao_Specified(Index: Integer): boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Setloec(Index: Integer; const Astring: string);
    function  loec_Specified(Index: Integer): boolean;
    procedure SetnomeCarteiro(Index: Integer; const Astring: string);
    function  nomeCarteiro_Specified(Index: Integer): boolean;
    procedure SetnomeUnidade(Index: Integer; const Astring: string);
    function  nomeUnidade_Specified(Index: Integer): boolean;
    procedure Setobjetos(Index: Integer; const AArray_Of_objetoPostal: Array_Of_objetoPostal);
    function  objetos_Specified(Index: Integer): boolean;
    procedure Setunidade(Index: Integer; const Astring: string);
    function  unidade_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property carteiro:     string                 Index (IS_OPTN or IS_UNQL) read Fcarteiro write Setcarteiro stored carteiro_Specified;
    property data:         TXSDateTime            Index (IS_OPTN or IS_UNQL) read Fdata write Setdata stored data_Specified;
    property distrito:     string                 Index (IS_OPTN or IS_UNQL) read Fdistrito write Setdistrito stored distrito_Specified;
    property estacao:      string                 Index (IS_OPTN or IS_UNQL) read Festacao write Setestacao stored estacao_Specified;
    property id:           string                 Index (IS_OPTN or IS_UNQL) read Fid write Setid stored id_Specified;
    property loec:         string                 Index (IS_OPTN or IS_UNQL) read Floec write Setloec stored loec_Specified;
    property nomeCarteiro: string                 Index (IS_OPTN or IS_UNQL) read FnomeCarteiro write SetnomeCarteiro stored nomeCarteiro_Specified;
    property nomeUnidade:  string                 Index (IS_OPTN or IS_UNQL) read FnomeUnidade write SetnomeUnidade stored nomeUnidade_Specified;
    property objetos:      Array_Of_objetoPostal  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fobjetos write Setobjetos stored objetos_Specified;
    property unidade:      string                 Index (IS_OPTN or IS_UNQL) read Funidade write Setunidade stored unidade_Specified;
  end;

  UnidadesSROResponse = array of registroUnidades;   { "http://resource.webservice.correios.com.br/"[Lit][GblCplx] }


  // ************************************************************************ //
  // XML       : eventos, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  eventos = class(TRemotable)
  private
    Ftipo: string;
    Ftipo_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fdata: string;
    Fdata_Specified: boolean;
    Fhora: string;
    Fhora_Specified: boolean;
    Fdescricao: string;
    Fdescricao_Specified: boolean;
    Fdetalhe: string;
    Fdetalhe_Specified: boolean;
    Frecebedor: string;
    Frecebedor_Specified: boolean;
    Fdocumento: string;
    Fdocumento_Specified: boolean;
    Fcomentario: string;
    Fcomentario_Specified: boolean;
    Flocal_: string;
    Flocal__Specified: boolean;
    Fcodigo: string;
    Fcodigo_Specified: boolean;
    Fcidade: string;
    Fcidade_Specified: boolean;
    Fuf: string;
    Fuf_Specified: boolean;
    Fsto: string;
    Fsto_Specified: boolean;
    Famazoncode: string;
    Famazoncode_Specified: boolean;
    Famazontimezone: string;
    Famazontimezone_Specified: boolean;
    Fdestino: Array_Of_destino;
    Fdestino_Specified: boolean;
    Fendereco: endereco;
    Fendereco_Specified: boolean;
    procedure Settipo(Index: Integer; const Astring: string);
    function  tipo_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setdata(Index: Integer; const Astring: string);
    function  data_Specified(Index: Integer): boolean;
    procedure Sethora(Index: Integer; const Astring: string);
    function  hora_Specified(Index: Integer): boolean;
    procedure Setdescricao(Index: Integer; const Astring: string);
    function  descricao_Specified(Index: Integer): boolean;
    procedure Setdetalhe(Index: Integer; const Astring: string);
    function  detalhe_Specified(Index: Integer): boolean;
    procedure Setrecebedor(Index: Integer; const Astring: string);
    function  recebedor_Specified(Index: Integer): boolean;
    procedure Setdocumento(Index: Integer; const Astring: string);
    function  documento_Specified(Index: Integer): boolean;
    procedure Setcomentario(Index: Integer; const Astring: string);
    function  comentario_Specified(Index: Integer): boolean;
    procedure Setlocal_(Index: Integer; const Astring: string);
    function  local__Specified(Index: Integer): boolean;
    procedure Setcodigo(Index: Integer; const Astring: string);
    function  codigo_Specified(Index: Integer): boolean;
    procedure Setcidade(Index: Integer; const Astring: string);
    function  cidade_Specified(Index: Integer): boolean;
    procedure Setuf(Index: Integer; const Astring: string);
    function  uf_Specified(Index: Integer): boolean;
    procedure Setsto(Index: Integer; const Astring: string);
    function  sto_Specified(Index: Integer): boolean;
    procedure Setamazoncode(Index: Integer; const Astring: string);
    function  amazoncode_Specified(Index: Integer): boolean;
    procedure Setamazontimezone(Index: Integer; const Astring: string);
    function  amazontimezone_Specified(Index: Integer): boolean;
    procedure Setdestino(Index: Integer; const AArray_Of_destino: Array_Of_destino);
    function  destino_Specified(Index: Integer): boolean;
    procedure Setendereco(Index: Integer; const Aendereco: endereco);
    function  endereco_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property tipo:           string            Index (IS_OPTN or IS_UNQL) read Ftipo write Settipo stored tipo_Specified;
    property status:         string            Index (IS_OPTN or IS_UNQL) read Fstatus write Setstatus stored status_Specified;
    property data:           string            Index (IS_OPTN or IS_UNQL) read Fdata write Setdata stored data_Specified;
    property hora:           string            Index (IS_OPTN or IS_UNQL) read Fhora write Sethora stored hora_Specified;
    property descricao:      string            Index (IS_OPTN or IS_UNQL) read Fdescricao write Setdescricao stored descricao_Specified;
    property detalhe:        string            Index (IS_OPTN or IS_UNQL) read Fdetalhe write Setdetalhe stored detalhe_Specified;
    property recebedor:      string            Index (IS_OPTN or IS_UNQL) read Frecebedor write Setrecebedor stored recebedor_Specified;
    property documento:      string            Index (IS_OPTN or IS_UNQL) read Fdocumento write Setdocumento stored documento_Specified;
    property comentario:     string            Index (IS_OPTN or IS_UNQL) read Fcomentario write Setcomentario stored comentario_Specified;
    property local_:         string            Index (IS_OPTN or IS_UNQL) read Flocal_ write Setlocal_ stored local__Specified;
    property codigo:         string            Index (IS_OPTN or IS_UNQL) read Fcodigo write Setcodigo stored codigo_Specified;
    property cidade:         string            Index (IS_OPTN or IS_UNQL) read Fcidade write Setcidade stored cidade_Specified;
    property uf:             string            Index (IS_OPTN or IS_UNQL) read Fuf write Setuf stored uf_Specified;
    property sto:            string            Index (IS_OPTN or IS_UNQL) read Fsto write Setsto stored sto_Specified;
    property amazoncode:     string            Index (IS_OPTN or IS_UNQL) read Famazoncode write Setamazoncode stored amazoncode_Specified;
    property amazontimezone: string            Index (IS_OPTN or IS_UNQL) read Famazontimezone write Setamazontimezone stored amazontimezone_Specified;
    property destino:        Array_Of_destino  Index (IS_OPTN or IS_UNBD or IS_REF) read Fdestino write Setdestino stored destino_Specified;
    property endereco:       endereco          Index (IS_OPTN or IS_REF) read Fendereco write Setendereco stored endereco_Specified;
  end;



  // ************************************************************************ //
  // XML       : evento, global, <element>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  evento = class(eventos)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : destino, global, <element>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  destino = class(destinos)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : registroUnidades, global, <complexType>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  registroUnidades = class(TRemotable)
  private
    FcodigoDR: string;
    FcodigoDR_Specified: boolean;
    FcodigoMCU: string;
    FcodigoMCU_Specified: boolean;
    FcodigoSRO: string;
    FcodigoSRO_Specified: boolean;
    FnomeUnidade: string;
    FnomeUnidade_Specified: boolean;
    FsiglaDR: string;
    FsiglaDR_Specified: boolean;
    FsiglaTipoUnidade: string;
    FsiglaTipoUnidade_Specified: boolean;
    FtipoUnidade: string;
    FtipoUnidade_Specified: boolean;
    procedure SetcodigoDR(Index: Integer; const Astring: string);
    function  codigoDR_Specified(Index: Integer): boolean;
    procedure SetcodigoMCU(Index: Integer; const Astring: string);
    function  codigoMCU_Specified(Index: Integer): boolean;
    procedure SetcodigoSRO(Index: Integer; const Astring: string);
    function  codigoSRO_Specified(Index: Integer): boolean;
    procedure SetnomeUnidade(Index: Integer; const Astring: string);
    function  nomeUnidade_Specified(Index: Integer): boolean;
    procedure SetsiglaDR(Index: Integer; const Astring: string);
    function  siglaDR_Specified(Index: Integer): boolean;
    procedure SetsiglaTipoUnidade(Index: Integer; const Astring: string);
    function  siglaTipoUnidade_Specified(Index: Integer): boolean;
    procedure SettipoUnidade(Index: Integer; const Astring: string);
    function  tipoUnidade_Specified(Index: Integer): boolean;
  published
    property codigoDR:         string  Index (IS_OPTN or IS_UNQL) read FcodigoDR write SetcodigoDR stored codigoDR_Specified;
    property codigoMCU:        string  Index (IS_OPTN or IS_UNQL) read FcodigoMCU write SetcodigoMCU stored codigoMCU_Specified;
    property codigoSRO:        string  Index (IS_OPTN or IS_UNQL) read FcodigoSRO write SetcodigoSRO stored codigoSRO_Specified;
    property nomeUnidade:      string  Index (IS_OPTN or IS_UNQL) read FnomeUnidade write SetnomeUnidade stored nomeUnidade_Specified;
    property siglaDR:          string  Index (IS_OPTN or IS_UNQL) read FsiglaDR write SetsiglaDR stored siglaDR_Specified;
    property siglaTipoUnidade: string  Index (IS_OPTN or IS_UNQL) read FsiglaTipoUnidade write SetsiglaTipoUnidade stored siglaTipoUnidade_Specified;
    property tipoUnidade:      string  Index (IS_OPTN or IS_UNQL) read FtipoUnidade write SettipoUnidade stored tipoUnidade_Specified;
  end;



  // ************************************************************************ //
  // XML       : endereco, global, <element>
  // Namespace : http://resource.webservice.correios.com.br/
  // ************************************************************************ //
  endereco = class(enderecoMobile)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://resource.webservice.correios.com.br/
  // soapAction: %operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : ServicePortBinding
  // service   : rastro
  // port      : ServicePort
  // URL       : http://webservicesro:80/service/rastro
  // ************************************************************************ //
  Service = interface(IInvokable)
  ['{68AB455C-7E44-C2F9-A05D-FCD043C94BC0}']
    function  buscaEventos(const usuario: string; const senha: string; const tipo: string; const resultado: string; const lingua: string; const objetos: string
                           ): sroxml; stdcall;
    function  buscaEventosLista(const usuario: string; const senha: string; const tipo: string; const resultado: string; const lingua: string; const objetos: Array_Of_string
                                ): sroxml; stdcall;
    function  RastroJson(const usuario: string; const senha: string; const tipo: string; const resultado: string; const lingua: string; const objetos: string
                         ): string; stdcall;
    function  ListaEntregaExterna(const loec: string): listaEntregaExterna; stdcall;
    function  UnidadesSRO(const codigoSRO: string): UnidadesSROResponse; stdcall;
  end;

function GetService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Service;


implementation
  uses System.SysUtils;

function GetService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Service;
const
  defWSDL = 'http://webservicesro/service/rastro/Rastro.wsdl';
  defURL  = 'http://webservicesro:80/service/rastro';
  defSvc  = 'rastro';
  defPrt  = 'ServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as Service);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor sroxml.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fobjeto)-1 do
    System.SysUtils.FreeAndNil(Fobjeto[I]);
  System.SetLength(Fobjeto, 0);
  inherited Destroy;
end;

procedure sroxml.Setversao(Index: Integer; const Astring: string);
begin
  Fversao := Astring;
  Fversao_Specified := True;
end;

function sroxml.versao_Specified(Index: Integer): boolean;
begin
  Result := Fversao_Specified;
end;

procedure sroxml.Setqtd(Index: Integer; const Astring: string);
begin
  Fqtd := Astring;
  Fqtd_Specified := True;
end;

function sroxml.qtd_Specified(Index: Integer): boolean;
begin
  Result := Fqtd_Specified;
end;

procedure sroxml.SetTipoPesquisa(Index: Integer; const Astring: string);
begin
  FTipoPesquisa := Astring;
  FTipoPesquisa_Specified := True;
end;

function sroxml.TipoPesquisa_Specified(Index: Integer): boolean;
begin
  Result := FTipoPesquisa_Specified;
end;

procedure sroxml.SetTipoResultado(Index: Integer; const Astring: string);
begin
  FTipoResultado := Astring;
  FTipoResultado_Specified := True;
end;

function sroxml.TipoResultado_Specified(Index: Integer): boolean;
begin
  Result := FTipoResultado_Specified;
end;

procedure sroxml.Setobjeto(Index: Integer; const AArray_Of_objeto: Array_Of_objeto);
begin
  Fobjeto := AArray_Of_objeto;
  Fobjeto_Specified := True;
end;

function sroxml.objeto_Specified(Index: Integer): boolean;
begin
  Result := Fobjeto_Specified;
end;

destructor objeto2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fevento)-1 do
    System.SysUtils.FreeAndNil(Fevento[I]);
  System.SetLength(Fevento, 0);
  inherited Destroy;
end;

procedure objeto2.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function objeto2.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure objeto2.Setsigla(Index: Integer; const Astring: string);
begin
  Fsigla := Astring;
  Fsigla_Specified := True;
end;

function objeto2.sigla_Specified(Index: Integer): boolean;
begin
  Result := Fsigla_Specified;
end;

procedure objeto2.Setnome(Index: Integer; const Astring: string);
begin
  Fnome := Astring;
  Fnome_Specified := True;
end;

function objeto2.nome_Specified(Index: Integer): boolean;
begin
  Result := Fnome_Specified;
end;

procedure objeto2.Setcategoria(Index: Integer; const Astring: string);
begin
  Fcategoria := Astring;
  Fcategoria_Specified := True;
end;

function objeto2.categoria_Specified(Index: Integer): boolean;
begin
  Result := Fcategoria_Specified;
end;

procedure objeto2.Seterro(Index: Integer; const Astring: string);
begin
  Ferro := Astring;
  Ferro_Specified := True;
end;

function objeto2.erro_Specified(Index: Integer): boolean;
begin
  Result := Ferro_Specified;
end;

procedure objeto2.Setevento(Index: Integer; const AArray_Of_evento: Array_Of_evento);
begin
  Fevento := AArray_Of_evento;
  Fevento_Specified := True;
end;

function objeto2.evento_Specified(Index: Integer): boolean;
begin
  Result := Fevento_Specified;
end;

procedure enderecoMobile.Setcodigo(Index: Integer; const Astring: string);
begin
  Fcodigo := Astring;
  Fcodigo_Specified := True;
end;

function enderecoMobile.codigo_Specified(Index: Integer): boolean;
begin
  Result := Fcodigo_Specified;
end;

procedure enderecoMobile.Setcep(Index: Integer; const Astring: string);
begin
  Fcep := Astring;
  Fcep_Specified := True;
end;

function enderecoMobile.cep_Specified(Index: Integer): boolean;
begin
  Result := Fcep_Specified;
end;

procedure enderecoMobile.Setlogradouro(Index: Integer; const Astring: string);
begin
  Flogradouro := Astring;
  Flogradouro_Specified := True;
end;

function enderecoMobile.logradouro_Specified(Index: Integer): boolean;
begin
  Result := Flogradouro_Specified;
end;

procedure enderecoMobile.Setcomplemento(Index: Integer; const Astring: string);
begin
  Fcomplemento := Astring;
  Fcomplemento_Specified := True;
end;

function enderecoMobile.complemento_Specified(Index: Integer): boolean;
begin
  Result := Fcomplemento_Specified;
end;

procedure enderecoMobile.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function enderecoMobile.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure enderecoMobile.Setlocalidade(Index: Integer; const Astring: string);
begin
  Flocalidade := Astring;
  Flocalidade_Specified := True;
end;

function enderecoMobile.localidade_Specified(Index: Integer): boolean;
begin
  Result := Flocalidade_Specified;
end;

procedure enderecoMobile.Setuf(Index: Integer; const Astring: string);
begin
  Fuf := Astring;
  Fuf_Specified := True;
end;

function enderecoMobile.uf_Specified(Index: Integer): boolean;
begin
  Result := Fuf_Specified;
end;

procedure enderecoMobile.Setbairro(Index: Integer; const Astring: string);
begin
  Fbairro := Astring;
  Fbairro_Specified := True;
end;

function enderecoMobile.bairro_Specified(Index: Integer): boolean;
begin
  Result := Fbairro_Specified;
end;

procedure enderecoMobile.Setlatitude(Index: Integer; const Astring: string);
begin
  Flatitude := Astring;
  Flatitude_Specified := True;
end;

function enderecoMobile.latitude_Specified(Index: Integer): boolean;
begin
  Result := Flatitude_Specified;
end;

procedure enderecoMobile.Setlongitude(Index: Integer; const Astring: string);
begin
  Flongitude := Astring;
  Flongitude_Specified := True;
end;

function enderecoMobile.longitude_Specified(Index: Integer): boolean;
begin
  Result := Flongitude_Specified;
end;

procedure enderecoMobile.Setcelular(Index: Integer; const Astring: string);
begin
  Fcelular := Astring;
  Fcelular_Specified := True;
end;

function enderecoMobile.celular_Specified(Index: Integer): boolean;
begin
  Result := Fcelular_Specified;
end;

procedure destinos.Setlocal_(Index: Integer; const Astring: string);
begin
  Flocal_ := Astring;
  Flocal__Specified := True;
end;

function destinos.local__Specified(Index: Integer): boolean;
begin
  Result := Flocal__Specified;
end;

procedure destinos.Setcodigo(Index: Integer; const Astring: string);
begin
  Fcodigo := Astring;
  Fcodigo_Specified := True;
end;

function destinos.codigo_Specified(Index: Integer): boolean;
begin
  Result := Fcodigo_Specified;
end;

procedure destinos.Setcidade(Index: Integer; const Astring: string);
begin
  Fcidade := Astring;
  Fcidade_Specified := True;
end;

function destinos.cidade_Specified(Index: Integer): boolean;
begin
  Result := Fcidade_Specified;
end;

procedure destinos.Setbairro(Index: Integer; const Astring: string);
begin
  Fbairro := Astring;
  Fbairro_Specified := True;
end;

function destinos.bairro_Specified(Index: Integer): boolean;
begin
  Result := Fbairro_Specified;
end;

procedure destinos.Setuf(Index: Integer; const Astring: string);
begin
  Fuf := Astring;
  Fuf_Specified := True;
end;

function destinos.uf_Specified(Index: Integer): boolean;
begin
  Result := Fuf_Specified;
end;

procedure objetoPostal.Setagrupamento(Index: Integer; const Astring: string);
begin
  Fagrupamento := Astring;
  Fagrupamento_Specified := True;
end;

function objetoPostal.agrupamento_Specified(Index: Integer): boolean;
begin
  Result := Fagrupamento_Specified;
end;

procedure objetoPostal.SetavisoRecebimento(Index: Integer; const Astring: string);
begin
  FavisoRecebimento := Astring;
  FavisoRecebimento_Specified := True;
end;

function objetoPostal.avisoRecebimento_Specified(Index: Integer): boolean;
begin
  Result := FavisoRecebimento_Specified;
end;

procedure objetoPostal.SetdevolucaoDocumento(Index: Integer; const Astring: string);
begin
  FdevolucaoDocumento := Astring;
  FdevolucaoDocumento_Specified := True;
end;

function objetoPostal.devolucaoDocumento_Specified(Index: Integer): boolean;
begin
  Result := FdevolucaoDocumento_Specified;
end;

procedure objetoPostal.SetdevolucaoObjeto(Index: Integer; const Astring: string);
begin
  FdevolucaoObjeto := Astring;
  FdevolucaoObjeto_Specified := True;
end;

function objetoPostal.devolucaoObjeto_Specified(Index: Integer): boolean;
begin
  Result := FdevolucaoObjeto_Specified;
end;

procedure objetoPostal.SetmaoPropria(Index: Integer; const Astring: string);
begin
  FmaoPropria := Astring;
  FmaoPropria_Specified := True;
end;

function objetoPostal.maoPropria_Specified(Index: Integer): boolean;
begin
  Result := FmaoPropria_Specified;
end;

procedure objetoPostal.SetnumeroObjeto(Index: Integer; const Astring: string);
begin
  FnumeroObjeto := Astring;
  FnumeroObjeto_Specified := True;
end;

function objetoPostal.numeroObjeto_Specified(Index: Integer): boolean;
begin
  Result := FnumeroObjeto_Specified;
end;

destructor listaEntregaExterna.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fobjetos)-1 do
    System.SysUtils.FreeAndNil(Fobjetos[I]);
  System.SetLength(Fobjetos, 0);
  System.SysUtils.FreeAndNil(Fdata);
  inherited Destroy;
end;

procedure listaEntregaExterna.Setcarteiro(Index: Integer; const Astring: string);
begin
  Fcarteiro := Astring;
  Fcarteiro_Specified := True;
end;

function listaEntregaExterna.carteiro_Specified(Index: Integer): boolean;
begin
  Result := Fcarteiro_Specified;
end;

procedure listaEntregaExterna.Setdata(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  Fdata := ATXSDateTime;
  Fdata_Specified := True;
end;

function listaEntregaExterna.data_Specified(Index: Integer): boolean;
begin
  Result := Fdata_Specified;
end;

procedure listaEntregaExterna.Setdistrito(Index: Integer; const Astring: string);
begin
  Fdistrito := Astring;
  Fdistrito_Specified := True;
end;

function listaEntregaExterna.distrito_Specified(Index: Integer): boolean;
begin
  Result := Fdistrito_Specified;
end;

procedure listaEntregaExterna.Setestacao(Index: Integer; const Astring: string);
begin
  Festacao := Astring;
  Festacao_Specified := True;
end;

function listaEntregaExterna.estacao_Specified(Index: Integer): boolean;
begin
  Result := Festacao_Specified;
end;

procedure listaEntregaExterna.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function listaEntregaExterna.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure listaEntregaExterna.Setloec(Index: Integer; const Astring: string);
begin
  Floec := Astring;
  Floec_Specified := True;
end;

function listaEntregaExterna.loec_Specified(Index: Integer): boolean;
begin
  Result := Floec_Specified;
end;

procedure listaEntregaExterna.SetnomeCarteiro(Index: Integer; const Astring: string);
begin
  FnomeCarteiro := Astring;
  FnomeCarteiro_Specified := True;
end;

function listaEntregaExterna.nomeCarteiro_Specified(Index: Integer): boolean;
begin
  Result := FnomeCarteiro_Specified;
end;

procedure listaEntregaExterna.SetnomeUnidade(Index: Integer; const Astring: string);
begin
  FnomeUnidade := Astring;
  FnomeUnidade_Specified := True;
end;

function listaEntregaExterna.nomeUnidade_Specified(Index: Integer): boolean;
begin
  Result := FnomeUnidade_Specified;
end;

procedure listaEntregaExterna.Setobjetos(Index: Integer; const AArray_Of_objetoPostal: Array_Of_objetoPostal);
begin
  Fobjetos := AArray_Of_objetoPostal;
  Fobjetos_Specified := True;
end;

function listaEntregaExterna.objetos_Specified(Index: Integer): boolean;
begin
  Result := Fobjetos_Specified;
end;

procedure listaEntregaExterna.Setunidade(Index: Integer; const Astring: string);
begin
  Funidade := Astring;
  Funidade_Specified := True;
end;

function listaEntregaExterna.unidade_Specified(Index: Integer): boolean;
begin
  Result := Funidade_Specified;
end;

destructor eventos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fdestino)-1 do
    System.SysUtils.FreeAndNil(Fdestino[I]);
  System.SetLength(Fdestino, 0);
  System.SysUtils.FreeAndNil(Fendereco);
  inherited Destroy;
end;

procedure eventos.Settipo(Index: Integer; const Astring: string);
begin
  Ftipo := Astring;
  Ftipo_Specified := True;
end;

function eventos.tipo_Specified(Index: Integer): boolean;
begin
  Result := Ftipo_Specified;
end;

procedure eventos.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function eventos.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure eventos.Setdata(Index: Integer; const Astring: string);
begin
  Fdata := Astring;
  Fdata_Specified := True;
end;

function eventos.data_Specified(Index: Integer): boolean;
begin
  Result := Fdata_Specified;
end;

procedure eventos.Sethora(Index: Integer; const Astring: string);
begin
  Fhora := Astring;
  Fhora_Specified := True;
end;

function eventos.hora_Specified(Index: Integer): boolean;
begin
  Result := Fhora_Specified;
end;

procedure eventos.Setdescricao(Index: Integer; const Astring: string);
begin
  Fdescricao := Astring;
  Fdescricao_Specified := True;
end;

function eventos.descricao_Specified(Index: Integer): boolean;
begin
  Result := Fdescricao_Specified;
end;

procedure eventos.Setdetalhe(Index: Integer; const Astring: string);
begin
  Fdetalhe := Astring;
  Fdetalhe_Specified := True;
end;

function eventos.detalhe_Specified(Index: Integer): boolean;
begin
  Result := Fdetalhe_Specified;
end;

procedure eventos.Setrecebedor(Index: Integer; const Astring: string);
begin
  Frecebedor := Astring;
  Frecebedor_Specified := True;
end;

function eventos.recebedor_Specified(Index: Integer): boolean;
begin
  Result := Frecebedor_Specified;
end;

procedure eventos.Setdocumento(Index: Integer; const Astring: string);
begin
  Fdocumento := Astring;
  Fdocumento_Specified := True;
end;

function eventos.documento_Specified(Index: Integer): boolean;
begin
  Result := Fdocumento_Specified;
end;

procedure eventos.Setcomentario(Index: Integer; const Astring: string);
begin
  Fcomentario := Astring;
  Fcomentario_Specified := True;
end;

function eventos.comentario_Specified(Index: Integer): boolean;
begin
  Result := Fcomentario_Specified;
end;

procedure eventos.Setlocal_(Index: Integer; const Astring: string);
begin
  Flocal_ := Astring;
  Flocal__Specified := True;
end;

function eventos.local__Specified(Index: Integer): boolean;
begin
  Result := Flocal__Specified;
end;

procedure eventos.Setcodigo(Index: Integer; const Astring: string);
begin
  Fcodigo := Astring;
  Fcodigo_Specified := True;
end;

function eventos.codigo_Specified(Index: Integer): boolean;
begin
  Result := Fcodigo_Specified;
end;

procedure eventos.Setcidade(Index: Integer; const Astring: string);
begin
  Fcidade := Astring;
  Fcidade_Specified := True;
end;

function eventos.cidade_Specified(Index: Integer): boolean;
begin
  Result := Fcidade_Specified;
end;

procedure eventos.Setuf(Index: Integer; const Astring: string);
begin
  Fuf := Astring;
  Fuf_Specified := True;
end;

function eventos.uf_Specified(Index: Integer): boolean;
begin
  Result := Fuf_Specified;
end;

procedure eventos.Setsto(Index: Integer; const Astring: string);
begin
  Fsto := Astring;
  Fsto_Specified := True;
end;

function eventos.sto_Specified(Index: Integer): boolean;
begin
  Result := Fsto_Specified;
end;

procedure eventos.Setamazoncode(Index: Integer; const Astring: string);
begin
  Famazoncode := Astring;
  Famazoncode_Specified := True;
end;

function eventos.amazoncode_Specified(Index: Integer): boolean;
begin
  Result := Famazoncode_Specified;
end;

procedure eventos.Setamazontimezone(Index: Integer; const Astring: string);
begin
  Famazontimezone := Astring;
  Famazontimezone_Specified := True;
end;

function eventos.amazontimezone_Specified(Index: Integer): boolean;
begin
  Result := Famazontimezone_Specified;
end;

procedure eventos.Setdestino(Index: Integer; const AArray_Of_destino: Array_Of_destino);
begin
  Fdestino := AArray_Of_destino;
  Fdestino_Specified := True;
end;

function eventos.destino_Specified(Index: Integer): boolean;
begin
  Result := Fdestino_Specified;
end;

procedure eventos.Setendereco(Index: Integer; const Aendereco: endereco);
begin
  Fendereco := Aendereco;
  Fendereco_Specified := True;
end;

function eventos.endereco_Specified(Index: Integer): boolean;
begin
  Result := Fendereco_Specified;
end;

procedure registroUnidades.SetcodigoDR(Index: Integer; const Astring: string);
begin
  FcodigoDR := Astring;
  FcodigoDR_Specified := True;
end;

function registroUnidades.codigoDR_Specified(Index: Integer): boolean;
begin
  Result := FcodigoDR_Specified;
end;

procedure registroUnidades.SetcodigoMCU(Index: Integer; const Astring: string);
begin
  FcodigoMCU := Astring;
  FcodigoMCU_Specified := True;
end;

function registroUnidades.codigoMCU_Specified(Index: Integer): boolean;
begin
  Result := FcodigoMCU_Specified;
end;

procedure registroUnidades.SetcodigoSRO(Index: Integer; const Astring: string);
begin
  FcodigoSRO := Astring;
  FcodigoSRO_Specified := True;
end;

function registroUnidades.codigoSRO_Specified(Index: Integer): boolean;
begin
  Result := FcodigoSRO_Specified;
end;

procedure registroUnidades.SetnomeUnidade(Index: Integer; const Astring: string);
begin
  FnomeUnidade := Astring;
  FnomeUnidade_Specified := True;
end;

function registroUnidades.nomeUnidade_Specified(Index: Integer): boolean;
begin
  Result := FnomeUnidade_Specified;
end;

procedure registroUnidades.SetsiglaDR(Index: Integer; const Astring: string);
begin
  FsiglaDR := Astring;
  FsiglaDR_Specified := True;
end;

function registroUnidades.siglaDR_Specified(Index: Integer): boolean;
begin
  Result := FsiglaDR_Specified;
end;

procedure registroUnidades.SetsiglaTipoUnidade(Index: Integer; const Astring: string);
begin
  FsiglaTipoUnidade := Astring;
  FsiglaTipoUnidade_Specified := True;
end;

function registroUnidades.siglaTipoUnidade_Specified(Index: Integer): boolean;
begin
  Result := FsiglaTipoUnidade_Specified;
end;

procedure registroUnidades.SettipoUnidade(Index: Integer; const Astring: string);
begin
  FtipoUnidade := Astring;
  FtipoUnidade_Specified := True;
end;

function registroUnidades.tipoUnidade_Specified(Index: Integer): boolean;
begin
  Result := FtipoUnidade_Specified;
end;

initialization
  { Service }
  InvRegistry.RegisterInterface(TypeInfo(Service), 'http://resource.webservice.correios.com.br/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Service), '%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(Service), ioDocument);
  { Service.buscaEventos }
  InvRegistry.RegisterMethodInfo(TypeInfo(Service), 'buscaEventos', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'usuario', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'senha', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'tipo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'resultado', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'lingua', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'objetos', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventos', 'return', '',
                                '', IS_UNQL);
  { Service.buscaEventosLista }
  InvRegistry.RegisterMethodInfo(TypeInfo(Service), 'buscaEventosLista', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'usuario', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'senha', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'tipo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'resultado', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'lingua', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'objetos', '',
                                '', IS_UNBD or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'buscaEventosLista', 'return', '',
                                '', IS_UNQL);
  { Service.RastroJson }
  InvRegistry.RegisterMethodInfo(TypeInfo(Service), 'RastroJson', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'usuario', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'senha', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'tipo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'resultado', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'lingua', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'objetos', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'RastroJson', 'return', '',
                                '', IS_UNQL);
  { Service.ListaEntregaExterna }
  InvRegistry.RegisterMethodInfo(TypeInfo(Service), 'ListaEntregaExterna', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'ListaEntregaExterna', 'loec', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'ListaEntregaExterna', 'return', '',
                                '', IS_UNQL);
  { Service.UnidadesSRO }
  InvRegistry.RegisterMethodInfo(TypeInfo(Service), 'UnidadesSRO', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNBD or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'UnidadesSRO', 'codigoSRO', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(Service), 'UnidadesSRO', 'return', '',
                                '[ArrayItemName="return"]', IS_UNBD or IS_UNQL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_destino), 'http://resource.webservice.correios.com.br/', 'Array_Of_destino');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_objetoPostal), 'http://resource.webservice.correios.com.br/', 'Array_Of_objetoPostal');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_evento), 'http://resource.webservice.correios.com.br/', 'Array_Of_evento');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_string), 'http://www.w3.org/2001/XMLSchema', 'Array_Of_string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_objeto), 'http://resource.webservice.correios.com.br/', 'Array_Of_objeto');
  RemClassRegistry.RegisterXSClass(sroxml, 'http://resource.webservice.correios.com.br/', 'sroxml');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(sroxml), 'objeto', '[Namespace="http://resource.webservice.correios.com.br/"]');
  RemClassRegistry.RegisterXSClass(rastro, 'http://resource.webservice.correios.com.br/', 'rastro');
  RemClassRegistry.RegisterXSClass(objeto2, 'http://resource.webservice.correios.com.br/', 'objeto2', 'objeto');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(objeto2), 'evento', '[Namespace="http://resource.webservice.correios.com.br/"]');
  RemClassRegistry.RegisterXSClass(objeto, 'http://resource.webservice.correios.com.br/', 'objeto');
  RemClassRegistry.RegisterXSClass(enderecoMobile, 'http://resource.webservice.correios.com.br/', 'enderecoMobile');
  RemClassRegistry.RegisterXSClass(destinos, 'http://resource.webservice.correios.com.br/', 'destinos');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(destinos), 'local_', '[ExtName="local"]');
  RemClassRegistry.RegisterXSClass(objetoPostal, 'http://resource.webservice.correios.com.br/', 'objetoPostal');
  RemClassRegistry.RegisterXSClass(listaEntregaExterna, 'http://resource.webservice.correios.com.br/', 'listaEntregaExterna');
  RemClassRegistry.RegisterXSInfo(TypeInfo(UnidadesSROResponse), 'http://resource.webservice.correios.com.br/', 'UnidadesSROResponse');
  RemClassRegistry.RegisterXSClass(eventos, 'http://resource.webservice.correios.com.br/', 'eventos');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(eventos), 'local_', '[ExtName="local"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(eventos), 'destino', '[Namespace="http://resource.webservice.correios.com.br/"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(eventos), 'endereco', '[Namespace="http://resource.webservice.correios.com.br/"]');
  RemClassRegistry.RegisterXSClass(evento, 'http://resource.webservice.correios.com.br/', 'evento');
  RemClassRegistry.RegisterXSClass(destino, 'http://resource.webservice.correios.com.br/', 'destino');
  RemClassRegistry.RegisterXSClass(registroUnidades, 'http://resource.webservice.correios.com.br/', 'registroUnidades');
  RemClassRegistry.RegisterXSClass(endereco, 'http://resource.webservice.correios.com.br/', 'endereco');

end.