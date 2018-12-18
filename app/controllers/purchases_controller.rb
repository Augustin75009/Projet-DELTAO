class PurchasesController < ApplicationController
    def new
      @purchase = Purchase.new
      authorize @purchase
    end

    def create
      @purchase = Purchase.new
      @product = Product.find(params[:product_id])
      @purchase.product = @product
      @purchase.user = current_user
      @purchase.status = 'checking'
      # authorize @purchase
      if @purchase.save!
        redirect_to product_path(@product)
      else
        render :new
      end
      authorize @purchase
    end

    def edit
      authorize @purchase
    end

    def update
      @purchase= Purchase.find_by(product_id: params[:product_id], user_id: params[:id])
      if params[:status] == 'checking'
        @purchase.status = 'contact'
        @purchase.save
        authorize @purchase
        redirect_to myproducts_path
      elsif params[:status] == 'contact'
        @purchase.status = 'approved'
        @purchase.save
        authorize @purchase
        redirect_to myproducts_path
      elsif params[:status] == 'paid'
        @purchase.status = 'done'
        @purchase.save
        authorize @purchase
        redirect_to status_path
      end
    end

    def destroy
      @purchase = Purchase.find(params[:id])
      @purchase.destroy
      authorize @purchase
      redirect_to product_path(@product)
    end
  end
end
