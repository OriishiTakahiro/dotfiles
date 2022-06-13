#!/bin/sh

# Krew plugins list
install_plugins=(
  "ctx"
  "ns"
  "rbac-lookup"
  "stern"
  "spy"
  "deprecations"
  "tree"
)

for plugin in ${install_plugins[@]}
do
  kubectl krew install $plugin
done
