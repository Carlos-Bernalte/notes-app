
module CollectionsHelper
    def find_collections(user_id)
        collections = []
        collections = Collection.where(user_id: user_id.to_i)
    end

    def belong_to_collection(collection_id,note_id)
        CollectionNote.where(collection_id: collection_id, note_id: note_id)
    end

    def find_collection_notes(collection_id)
        CollectionNote.where(collection_id: collection_id)
    end
end