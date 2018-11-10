require 'test_helper'

class InstitucioncatalogosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institucioncatalogo = institucioncatalogos(:one)
  end

  test "should get index" do
    get institucioncatalogos_url
    assert_response :success
  end

  test "should get new" do
    get new_institucioncatalogo_url
    assert_response :success
  end

  test "should create institucioncatalogo" do
    assert_difference('Institucioncatalogo.count') do
      post institucioncatalogos_url, params: { institucioncatalogo: { catalogo: @institucioncatalogo.catalogo, institucion: @institucioncatalogo.institucion } }
    end

    assert_redirected_to institucioncatalogo_url(Institucioncatalogo.last)
  end

  test "should show institucioncatalogo" do
    get institucioncatalogo_url(@institucioncatalogo)
    assert_response :success
  end

  test "should get edit" do
    get edit_institucioncatalogo_url(@institucioncatalogo)
    assert_response :success
  end

  test "should update institucioncatalogo" do
    patch institucioncatalogo_url(@institucioncatalogo), params: { institucioncatalogo: { catalogo: @institucioncatalogo.catalogo, institucion: @institucioncatalogo.institucion } }
    assert_redirected_to institucioncatalogo_url(@institucioncatalogo)
  end

  test "should destroy institucioncatalogo" do
    assert_difference('Institucioncatalogo.count', -1) do
      delete institucioncatalogo_url(@institucioncatalogo)
    end

    assert_redirected_to institucioncatalogos_url
  end
end
