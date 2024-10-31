-- Attaches to every FileType mode
-- require 'colorizer'.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
  'css';
  'typescript';
  html = {
    mode = 'foreground';
  }
}

-- Exclude some filetypes from highlighting by using `!`
-- require 'colorizer'.setup {
--   '*'; -- Highlight all files, but customize some others.
--   '!vim'; -- Exclude vim from highlighting.
--   -- Exclusion Only makes sense if '*' is specified!
-- }
