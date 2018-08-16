require 'rails_helper'

RSpec.describe "signin/index", type: :view do
  it 'renders signin page' do
    render

    expect(rendered).to match(/Signin With Google/)
  end
end
