require "test_helper"

class CollectionNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_note = collection_notes(:one)
  end

  test "should get index" do
    get collection_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_collection_note_url
    assert_response :success
  end

  test "should create collection_note" do
    assert_difference("CollectionNote.count") do
      post collection_notes_url, params: { collection_note: { collection_id: @collection_note.collection_id, note_id: @collection_note.note_id } }
    end

    assert_redirected_to collection_note_url(CollectionNote.last)
  end

  test "should show collection_note" do
    get collection_note_url(@collection_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_collection_note_url(@collection_note)
    assert_response :success
  end

  test "should update collection_note" do
    patch collection_note_url(@collection_note), params: { collection_note: { collection_id: @collection_note.collection_id, note_id: @collection_note.note_id } }
    assert_redirected_to collection_note_url(@collection_note)
  end

  test "should destroy collection_note" do
    assert_difference("CollectionNote.count", -1) do
      delete collection_note_url(@collection_note)
    end

    assert_redirected_to collection_notes_url
  end
end
