ActiveAdmin.register LayoutAcabamento do

    menu parent: "Confecção", label:"Acabamentos"


         controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
 
    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end
    
end
