class Mp3sController < ApplicationController
  # GET /mp3s
  # GET /mp3s.xml
  def index
    @mp3s = Mp3.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mp3s }
    end
  end

  # GET /mp3s/1
  # GET /mp3s/1.xml
  def show
    @mp3 = Mp3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mp3 }
    end
  end

  # GET /mp3s/new
  # GET /mp3s/new.xml
  def new
    @mp3 = Mp3.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mp3 }
    end
  end

  # GET /mp3s/1/edit
  def edit
    @mp3 = Mp3.find(params[:id])
  end

  # POST /mp3s
  # POST /mp3s.xml
  def create
    @mp3 = Mp3.new(params[:mp3])

    respond_to do |format|
      if @mp3.save
        flash[:notice] = 'Mp3 was successfully created.'
        format.html { redirect_to(@mp3) }
        format.xml  { render :xml => @mp3, :status => :created, :location => @mp3 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mp3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mp3s/1
  # PUT /mp3s/1.xml
  def update
    @mp3 = Mp3.find(params[:id])

    respond_to do |format|
      if @mp3.update_attributes(params[:mp3])
        flash[:notice] = 'Mp3 was successfully updated.'
        format.html { redirect_to(@mp3) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mp3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mp3s/1
  # DELETE /mp3s/1.xml
  def destroy
    @mp3 = Mp3.find(params[:id])
    @mp3.destroy

    respond_to do |format|
      format.html { redirect_to(mp3s_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /mp3s/1/edit
  def new_rating
    
    @rating = Rating.new
    
    @mp3 = Mp3.find(params[:mp3_id])
    
    @rating.mp3_id = params[:mp3_id]
    
  end  
  
  def random

      conditions = ["artist_name LIKE ?", "%#{params[:artist_name]}%"] unless params[:artist_name].nil?
      
      having = ["AVG(ratings.value) >= ?", Integer(params[:rating_min]) ] unless params[:rating_min].nil?

      sort = 'RANDOM()'
      
      #select = 'mp3s.url as mp3_url, mp3s.id as mp3_id, artist_name, title, length, AVG(ratings.value) as avg_rating'

      items_per_page = 100

    #  @mp3s = Mp3.paginate(:order => sort, :conditions => conditions, :per_page => items_per_page, :page => 1)

    #SELECT url, artist_name, title, length, AVG(ratings.value) as avg_rating FROM "mp3s"   
    #INNER JOIN "ratings" ON ratings.mp3_id = mp3s.id   GROUP BY url,artist_name, title, length  HAVING AVG(rtings.value) >= '1' ORDER BY RANDOM()


    @mp3s = Mp3.find :all, :order => 'RANDOM()', 
                         :conditions => conditions,
                         :joins => :ratings,
                         :group => 'url,artist_name, title, length ',
                         :having => having
                      #   :select => select
                          
      
      #bugs = Bug.find :all, :order => 'id DESC',
      #    :conditions => ['status_id = "3" AND date_fixed > ? AND date_fixed <= ? AND product_id = ?', start_date, end_date, params[:id]]
    
  end
  
  
  
  
end
