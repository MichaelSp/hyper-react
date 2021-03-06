require 'spec_helper'

if ruby?
class TestController < ActionController::Base; end

RSpec.describe TestController, type: :controller do
  render_views

  describe '#render_component' do
    controller do

      layout "test_layout"

      def index
        render_component
      end

      def new
        render_component "Index", {}, layout: :explicit_layout
      end
    end

    it 'renders with the default layout' do
      get :index, no_prerender: true
      expect(response).to render_template(layout: :test_layout)
    end

    it "renders with a specified layout" do
      get :new, no_prerender: true
      expect(response).to render_template(layout: :explicit_layout)
    end
  end
end
end
