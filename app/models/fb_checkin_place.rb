# coding: utf-8

FACEBOOK_URL = "https://www.facebook.com/"

class FbCheckinPlace
  include ActiveModel::Conversion

  attr_accessor :id
  attr_accessor :name
  attr_accessor :category
  attr_accessor :state
  attr_accessor :country
  attr_accessor :city
  attr_accessor :street
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :link
  attr_accessor :message

 def persisted? ; false ; end

  #initialize Facebook graph search after filter
  def initialize(graph)
    @graph = graph
  end

  def search(search)
    ret = Array.new

    #facebookからチェックインプレイスを検索
    graphLists = @graph.search(search, {:type => "place"})
    graphLists.each do |gl|
      #countryがjapanのものだけを対象
      #if gl['location']['country'] == "Japan" then
        fbCheckinPlace = FbCheckinPlace.new(@graph)
        fbCheckinPlace.id = gl['id']
        fbCheckinPlace.name = gl['name']
        fbCheckinPlace.category = gl['category']
        fbCheckinPlace.country = gl['location']['country']
        fbCheckinPlace.state = gl['location']['state']
        fbCheckinPlace.city = gl['location']['city']
        fbCheckinPlace.street = gl['location']['street']
			  fbCheckinPlace.latitude = gl['location']['latitude']
        fbCheckinPlace.longitude = gl['location']['longitude']
        fbCheckinPlace.link = "#{FACEBOOK_URL}#{gl['id']}"
        #Rails.logger.debug("FbCheckinPlace:search #{gl}")
        ret.push fbCheckinPlace
      #end
    end
    return ret
  end

  def search_by_fbid(id)
    Rails.logger.debug("search_by_fbid:id = #{id}")
    ret = Array.new

 		gl = @graph.get_object("/#{id}")
    fbCheckinPlace = FbCheckinPlace.new(@graph)
    fbCheckinPlace.id = gl['id']
    fbCheckinPlace.name = gl['name']
    fbCheckinPlace.category = gl['category']
    fbCheckinPlace.country = gl['location']['country']
    fbCheckinPlace.state = gl['location']['state']
    fbCheckinPlace.city = gl['location']['city']
    fbCheckinPlace.street = gl['location']['street']
		fbCheckinPlace.latitude = gl['location']['latitude']
    fbCheckinPlace.longitude = gl['location']['longitude']
    fbCheckinPlace.link = "#{FACEBOOK_URL}#{gl['id']}"
    #Rails.logger.debug("FbCheckinPlace:search_by_fbid #{gl}")    
    ret.push fbCheckinPlace

    return ret
  end


  #チェックイン処理
  #idとmessageはパラメータで渡せるようにする。
  #ex. FbCheckinPlace.checkin(:id=123, :message="mes")
  #ex. FbCheckinPlace.checkin(:message="mes")  use id in instance
  def checkin(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value) rescue nil
    end

    raise "Not set id" if @id.nil?

		@graph.put_connections('me','checkins',{ 
			'name' => @name,
			'place' => @id, 
			'message' => @message,
			'application' => 'CheckPass', 
			'coordinates' => "{\"latitude\":#{@latitude},\"longitude\":#{@longitude} }"
		})

  end

  #Wallへの書き込み
  def writeWall(checkin_item)
    begin
      #ウォール書き込み
f=Facebook::BASE_URL + checkin_item.wall_picture.url.to_s
Rails.logger.debug("url=#{f}")
      @graph.put_wall_post(checkin_item.wall_message,{
        "name" => checkin_item.wall_name,
        "link" => checkin_item.wall_link,
        "caption" => checkin_item.wall_caption,
        "description" => checkin_item.wall_description,
        "picture" => Facebook::BASE_URL + checkin_item.wall_picture.url.to_s
      })
    rescue => e
      #エラー処理
      Rails.logger.error("writeWall エラー:#{e.message}")
      raise
    end
  end
end    
