class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: 'Kitten was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to kitten_path, notice: 'Kitten was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    kitten = Kitten.find(params[:id])
    kitten.destroy

    redirect_to root_path, notice: "Kitten deleted, how could you do that ;("
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end