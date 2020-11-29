set -l commands ctx delete edit edit-config exec info lint ns update

# Disable file completions for the entire command
complete -c kubie -f

complete -c kubie -n "not __fish_seen_subcommand_from $commands" -a "\
(echo '\
ctx			Spawn a shell in the given context
delete		Delete a context
edit		Edit the given context
edit-config	Edit Kubie\'s config file
exec		Execute a command inside of the given context and namespace
info		View info about the current Kubie shell
lint		Check the Kubernetes config files for issues
ns			Change the namespace for the current shell
update		Check for Kubie updates')"

complete -c kubie -n "__fish_seen_subcommand_from ctx" -a "(kubie ctx)"
complete -c kubie -n "__fish_seen_subcommand_from ctx" -s r -l recursive -d 'Enter the context by spawning a new recursive shell'
complete -c kubie -n "__fish_seen_subcommand_from ctx" -s f -l kubeconfig -d 'Specify files from which to load contexts' -F

complete -c kubie -n "__fish_seen_subcommand_from info" -a "\
(echo '\
ctx		Get the context name
depth	Get the context depth
help	Prints help
ns		Get the namespace name')"

complete -c kubie -n "__fish_seen_subcommand_from ns" -a "(kubie ns 2>/dev/null)"
complete -c kubie -n "__fish_seen_subcommand_from ns" -s r -l recursive -d 'Enter the namespace by spawning a new recursive shell'
complete -c kubie -n "__fish_seen_subcommand_from ns" -s u -l unset -d 'Unsets the namespace in the active context'

complete -c kubie -s h -l help -d 'Print a short help text and exit'
complete -c kubie -n "not __fish_seen_subcommand_from $commands" -l version -d 'Print a short version string and exit'