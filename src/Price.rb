require 'httpclient'
require 'resolv'
require 'json'
require 'yaml'
require './src/PriceInfo'

class Price

  #JSON形式で出力されたときの階層別に変数定義しておく。拾わないものは定義不要。

  #ルートパラメータ
  @@GET_STATS_DATA = "GET_STATS_DATA"
  #統計データの情報
  @@STATISTICAL_DATA = "STATISTICAL_DATA"

  #帳票情報
  @@TABLE_INF = "TABLE_INF"
  #大分類
  @@STATISTICS_NAME = "STATISTICS_NAME"
  #帳票名
  @@TITLE = "TITLE"
  #調査サイクル
  @@CYCLE = "CYCLE"
  #最終更新日
  @@UPDATED_DATE = "UPDATED_DATE"

  #クラス情報
  @@CLASS_INF = "CLASS_INF"
  @@CLASS_OBJ = "CLASS_OBJ"

  #データ情報
  @@DATA_INF = "DATA_INF"
  @@VALUE = "VALUE"

  #valueの中身
  @@TIME = "@time"

  #コンストラクタ
  def initialize()
  end

  #メイン処理メソッド
  def doProcess()
    #API取得先URLの読み込み
    url = YAML.load_file('./conf/config.yml')["url"]
    #e-Statから取得したアプリケーションIDの読み込み
    appId = YAML.load_file('./conf/config.yml')["appId"]
    #統計表IDの読み込み
    statsDataId = YAML.load_file('./conf/config.yml')["statsDataId"]
    #銘柄(H27年基準)の読み込み
    cdCat01 = YAML.load_file('./conf/config.yml')["cdCat01"]
    #標準地域コードの読み込み
    cdArea = YAML.load_file('./conf/config.yml')["cdArea"]
    return analysisPrice(connectionAPI(url, appId, statsDataId, cdCat01, cdArea))
  end

  #API接続部
  def connectionAPI(url, appId, statsDataId, cdCat01, cdArea)
    #http接続クライアントの生成
    client = HTTPClient.new
    #クエリの設定
    query = {
      'appId' => appId,
      'statsDataId' => statsDataId,
      'cdCat01' => cdCat01,
      'cdArea' => cdArea
    }
    #APIリクエスト
    res = client.get(url, query)
    #ハッシュ化して返却
    return JSON.parse(res.body)
  end

  #connectionAPIで出力されたハッシュを解析
  def analysisPrice(hash)
    info = PriceInfo.new

    #出力したい情報をdigメソッドで掘り出す
    info.statistics_name=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@TABLE_INF, @@STATISTICS_NAME)))
    info.title=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@TABLE_INF, @@TITLE)))
    info.cycle=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@TABLE_INF, @@CYCLE)))
    info.updated_date=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@TABLE_INF, @@UPDATED_DATE)))
    info.class_obj=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@CLASS_INF, @@CLASS_OBJ)))
    info.value=(convertNil(hash.dig(@@GET_STATS_DATA, @@STATISTICAL_DATA, @@DATA_INF, @@VALUE)))
    return info
  end

  #nil判定、nilの場合は「-」を返却
  def convertNil(value)
    return value == nil ? "-" : value
  end
end
