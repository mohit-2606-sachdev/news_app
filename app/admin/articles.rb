ActiveAdmin.register Article do
  actions :index, :edit, :update, :destroy, :show
  permit_params :title, :subtopic, :content , :category_id , images: []

  index do
    selectable_column
    id_column
    column :title
    column :subtopic
    column :content
    column :category do |article|
      article.category.name if article.category
    end
    column :editor do |article|
      article.user.name if article.user
    end
    column :images do |article|
      article.images.map { |image| content_tag(:div, image_tag(url_for(image), width: '50px'), style: 'margin-bottom: 2px;') }.join.html_safe
    end    
    actions

  end

  filter :title
  filter :subtopic

  form do |f|
    f.inputs do
      f.input :title
      f.input :subtopic
      f.input :content
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  
end
