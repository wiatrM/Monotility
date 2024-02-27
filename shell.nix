{ pkgs ? import <nixpkgs> {} }:

with pkgs;
pkgs.mkShell {
  name = "dev-environment";
  buildInputs = [
    # Repo management
    git
    gitlint
    pre-commit

    # CLI tools
    zsh
    zsh-powerlevel10k
    fzf
    fzf-zsh

    # Development environment
    bazel_7
    nodejs
    nodenv
    nodePackages.eslint
    nodePackages.npm
    nodePackages.yo
    yarn
    python3
    plantuml
    bazel-buildtools
    gitlint

    # Cloud deployment
    kubectl
    kubernetes-helm
    ansible
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])
  ];

  shellHook = ''
    export ZDOTDIR=$HOME
    export nix_node=${nodejs}/bin/node
    npm install prettier
    sh ./nix/host/install.sh
    echo "Starting development enviroment..."
    chmod go-r ~/.kube/config
    pre-commit install --install-hooks
    git config commit.template .commit_template
    exec zsh -l
  '';
}
