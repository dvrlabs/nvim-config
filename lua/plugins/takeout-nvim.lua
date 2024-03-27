return {
    'dvrlabs/takeout.nvim',
    opts = {
        -- INFO: takeout modifies usual vim functionality...
        -- This will disable ',' normal functionality
        -- Which is going backwards on 'f' find.
        -- ';' to move forward on 'f' find still works.
        repeat_key = ',',
    },
}
