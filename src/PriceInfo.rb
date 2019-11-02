class PriceInfo
  attr_accessor :get_stats_data,
    :statistical_data,
    :table_inf,
    :statistics_name,
    :title,
    :cycle,
    :updated_date,
    :data_inf,
    :value,
    :time


  #コンストラクタ
  def initialize()
  end

  #ルートパラメータ
  def get_stats_data()
    @get_stats_data
  end
  def get_stats_data=(value)
    @get_stats_data = value
  end

  #統計データの情報
  def statistical_data()
    @statistical_data
  end
  def statistical_data=(value)
    @statistical_data = value
  end

#############################

  #表データの情報
  def table_inf()
    @table_inf
  end
  def table_inf=(value)
    @table_inf = value
  end

  #大分類
  def statistics_name()
    @statistics_name
  end
  def statistics_name=(value)
    @statistics_name = value
  end

  #表のタイトル
  def title()
    @title
  end
  def title=(value)
    @title = value
  end

  #調査周期
  def cycle()
    @cycle
  end
  def cycle=(value)
    @cycle = value
  end

  #更新日時
  def updated_date()
    @updated_date
  end
  def updated_date=(value)
    @updated_date = value
  end

#############################

  #クラス情報
  def class_inf()
    @class_inf
  end
  def class_inf=(value)
    @class_inf = value
  end

  #クラスオブジェクト情報
  def class_obj()
    @class_obj
  end
  def class_obj=(value)
    @class_obj = value
  end
#############################

  #データの情報
  def data_inf()
    @data_inf
  end
  def data_inf=(value)
    @data_inf = value
  end

  #詳細データの情報
  def value()
    @value
  end
  def value=(value)
    @value = value
  end

  #調査時期の情報
  def time()
    @time
  end
  def time=(value)
    @time = value
  end

end
