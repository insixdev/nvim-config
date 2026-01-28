
return {
  lazy = false,
  "NTBBloodbath/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()

    vim.api.nvim_set_keymap(
      "n",
      "<leader>r",
      "<cmd>Rest run<cr>",
      { noremap = true, silent = true }
    )
    require("rest-nvim").setup({
      response = {
        function(response)
          vim.notify(response.body)
            local ok, json = pcall(vim.json.decode, response.body)
            response.body = vim.inspect(json)
            return response
        end,
      },
      result = {
        show_http_info = true,
        show_headers = true,
        format = true,      -- <- esto formatea el JSON si puede
        formatters = {
          json = "jq .",    -- <- usa jq para formatear
        },
        result_split_in_planes = true,
      },
    })
  end
}
