
module CollectionsHelper
    def find_collections(user_id)
        collections = []
        collections = Collection.where(user_id: user_id.to_i)
    end
end