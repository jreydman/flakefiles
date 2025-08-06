[
  {
    key = "<Leader>w";
    mode = "n";
    silent = true;
    action = ":write<CR>";
  }

  {
    key = "<Leader>q";
    mode = "n";
    silent = true;
    action = ":quit<CR>";
  }

  {
    key = "<Leader>bd";
    mode = "n";
    silent = true;
    action = ":lua Snacks.bufdelete()<CR>";
  }

  {
    key = "<Leader>e";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.explorer()<CR>";
  }

  {
    key = "<Leader>fp";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.pickers()<CR>";
  }

  {
    key = "<Leader>fd";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.diagnostics_buffer()<CR>";
  }

  {
    key = "<Leader>ff";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.files()<CR>";
  }

  {
    key = "<Leader>fb";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.buffers()<CR>";
  }

  {
    key = "<Leader>fg";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.grep()<CR>";
  }

  {
    key = "<Leader>fh";
    mode = "n";
    silent = true;
    action = ":lua Snacks.picker.help()<CR>";
  }
]
