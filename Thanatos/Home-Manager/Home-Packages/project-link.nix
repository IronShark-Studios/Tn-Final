{ inputs, outputs, lib, config, pkgs, ... }: {

  home.file.Projects = {
    source = config.lib.file.mkOutOfStoreSymlink Archive/Projects-Active;
    target = "Projects";
  };
}
