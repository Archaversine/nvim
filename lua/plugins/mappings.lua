return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader><Tab>n"] = { "<cmd>enew<cr>", desc = "New Tab" },
          ["<Leader><Tab>d"] = { function() require("astrocore.buffer").close() end, desc = "Close Current Tab" },

          ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader><Tab>"] = { desc = "Tabs" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          -- File explorer (neotree)
          ["<C-f>"] = { ":Neotree toggle<cr>", desc = "Toggle Neotree" },

          -- Idris keybinds
          ["<Leader>i"] = { desc = "Idris2 "},

          ["<Leader>ic"] = { function() require("idris2.code_action").case_split()        end , desc = "Case Split" },
          ["<Leader>il"] = { function() require("idris2.code_action").make_lemma()        end , desc = "Make Lemma" },
          ["<Leader>ia"] = { function() require("idris2.code_action").add_clause()        end , desc = "Add Clause" },
          ["<Leader>ie"] = { function() require("idris2.code_action").expr_search()       end , desc = "Expr Search" },
          ["<Leader>id"] = { function() require("idris2.code_action").generate_def()      end , desc = "Generate Definition" },
          ["<Leader>ii"] = { function() require("idris2.code_action").intro()             end , desc = "Intro" },
          ["<Leader>iw"] = { function() require("idris2.code_action").make_with()         end , desc = "Make With" },
          ["<Leader>is"] = { function() require("idris2.code_action").make_case()         end , desc = "Make Case" },
          ["<Leader>ih"] = { function() require("idris2.code_action").expr_search_hints() end , desc = "Expr Search Hints" },
          ["<Leader>in"] = { function() require("idris2.browse").browse()                 end , desc = "Browse Namespace" },
          ["<Leader>ir"] = { function() require("idris2.repl").evaluate()                 end , desc = "Evaluate Expression" },
        }, 
        t = {
          -- setting a mapping to false will disable it 
          -- ["<esc>"] = false,
        }, 
      },
    },
  },
}
