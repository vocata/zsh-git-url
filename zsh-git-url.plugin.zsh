git-url() {
    usage() {
        echo "usage: git-url [url]"
        return -1
    }

    transfer_url() {
        # protocol prefix
        local _git_url_prefix_ssh="ssh://"
        local _git_url_prefix_scp="git@"
        local _git_url_prefix_http="http://"
        local _git_url_prefix_https="https://"
        local _git_url_suffix=".git"

        local origin_url=$1
        local web_url=$1

        web_url=${web_url%${_git_url_suffix}}

        # refer: https://www.git-scm.com/docs/git-clone#_git_urls
        if [[ ${web_url} == ${_git_url_prefix_ssh}* ]] {
            web_url=${web_url#${_git_url_prefix_ssh}}
            web_url=${web_url#${_git_url_prefix_scp}}
        } elif [[ ${web_url} == ${_git_url_prefix_scp}* ]] {
            web_url=${web_url#${_git_url_prefix_scp}}
            seg=(${(s/:/)web_url})
            if (($#seg != 2)) {
                echo "invalid git url: "${origin_url}
                return -1
            }
            web_url=$seg[1]"/"$seg[2]
        } elif [[ ${web_url} == ${_git_url_prefix_http}* ]] {
            web_url=${web_url#${_git_url_prefix_http}}
        } elif [[ ${web_url} == ${_git_url_prefix_https}* ]] {
            web_url=${web_url#${_git_url_prefix_https}}
        } else {
            echo "invalid git url: "${origin_url}
            return -1
        }

        web_url=${_git_url_prefix_https}${web_url}
        echo ${web_url}

        if [[ $(uname) == "Darwin" ]] {
            echo ${web_url} | pbcopy
            open ${web_url}
        }
    }

    remote_url() {
        local remote_name=$(git remote)
        if (($? != 0)) {
            echo "not a git repository"
            return -1
        } elif (($#remote_name == 0)) {
            echo "no configured remote repository"
            return -1
        }
        transfer_url $(git remote get-url ${remote_name})
    }


    if (($# > 1)) {
        usage
        return $?
    }
    if (($# == 0)) {
        remote_url
    } else {
        transfer_url $1
    }
}

