#!/usr/bin/env bash

unset CDPATH
shopt -s nullglob

usage="Usage: ${0##*/} [SOURCE_DIR]"

if [[ $1 == -h || $1 == --help ]]; then
    printf '%s\n' "$usage"
    exit 0
fi

if (($# > 1)); then
    printf '%s\n' "$usage" >&2
    exit 64
fi

if [[ $HOME != /* ]]; then
    printf 'Error: HOME is unset or not an absolute path\n' >&2
    exit 78
fi

src=$1
if [[ -z $src ]]; then
    src=${BASH_SOURCE[0]}
    if [[ $src == */* ]]; then
        src=${src%/*}
        src=${src:-/}
    else
        src=.
    fi
fi

if ! cd -- "$src" 2>/dev/null; then
    printf 'Error: source directory not accessible: %s\n' "$src" >&2
    exit 66
fi
src=$PWD

config_home=$XDG_CONFIG_HOME
if [[ $config_home != /* ]]; then
    config_home=$HOME/.config
fi
targets_file=$config_home/skills-install/targets

targets=()
if [[ -e $targets_file ]]; then
    if [[ ! -f $targets_file || ! -r $targets_file ]]; then
        printf 'Error: targets file is not a readable file: %s\n' "$targets_file" >&2
        exit 78
    fi
    lineno=0
    while read -r line || [[ -n $line ]]; do
        ((++lineno))
        if [[ -z $line || $line == '#'* ]]; then
            continue
        fi
        if [[ $line == '~' ]]; then
            line=$HOME
        elif [[ $line == '~/'* ]]; then
            line=$HOME/${line#'~/'}
        fi
        if [[ $line != /* ]]; then
            printf 'Error: %s:%d: target must be an absolute path: %s\n' "$targets_file" "$lineno" "$line" >&2
            exit 78
        fi
        targets+=("${line%/}")
    done <"$targets_file"
    if ((${#targets[@]} == 0)); then
        printf 'Error: no targets defined in %s\n' "$targets_file" >&2
        exit 78
    fi
else
    targets=(
        "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
        "$HOME/.gemini/skills"
        "$HOME/.gemini/antigravity-cli/skills"
        "$HOME/.gemini/config/skills"
    )
fi

skipped=0
seen=$'\n'
skill_files=()
skill_names=()
name_width=0
for file in "$src"/*/*.md; do
    if [[ ! -f $file ]]; then
        continue
    fi
    name=${file##*/}
    if [[ $name == README.md ]]; then
        continue
    fi
    name=${name%.md}
    if [[ $seen == *$'\n'"$name"$'\n'* ]]; then
        printf 'Skipping %s -> error: duplicate skill name %s\n' "${file#"$src"/}" "$name" >&2
        ((++skipped))
        continue
    fi
    seen+=$name$'\n'
    skill_files+=("$file")
    skill_names+=("$name")
    if ((${#name} > name_width)); then
        name_width=${#name}
    fi
done

count=${#skill_names[@]}
if ((count == 0)); then
    printf 'Error: no skills found in %s\n' "$src" >&2
    exit 66
fi

labels=()
target_width=0
for target in "${targets[@]}"; do
    label=$target
    if [[ $target == "$HOME" ]]; then
        label='~'
    elif [[ $target == "$HOME"/* ]]; then
        label='~'/${target#"$HOME"/}
    fi
    labels+=("$label")
    if ((${#label} > target_width)); then
        target_width=${#label}
    fi
done

src_label=$src
if [[ $src == "$HOME"/* ]]; then
    src_label='~'/${src#"$HOME"/}
fi

skill_word=skills
if ((count == 1)); then
    skill_word=skill
fi
target_word=targets
if ((${#targets[@]} == 1)); then
    target_word=target
fi
printf 'Installing %d %s from %s into %d %s\n\n' "$count" "$skill_word" "$src_label" "${#targets[@]}" "$target_word"

missing=()
for target in "${targets[@]}"; do
    for name in "${skill_names[@]}"; do
        if [[ ! -d $target/$name ]]; then
            missing+=("$target/$name")
        fi
    done
done

if ((${#missing[@]} > 0)); then
    mkdir -p -- "${missing[@]}" 2>/dev/null
fi

linked=0
unchanged=0
failed=0
for ((t = 0; t < ${#targets[@]}; t++)); do
    target=${targets[t]}
    label=${labels[t]}
    for ((i = 0; i < count; i++)); do
        name=${skill_names[i]}
        file=${skill_files[i]}
        dir=$target/$name
        link=$dir/SKILL.md
        reason=
        result=ok
        if [[ ! -d $dir ]]; then
            reason="cannot create directory, check permissions on $label"
        elif [[ -L $link && $link -ef $file ]]; then
            result='ok (unchanged)'
        elif [[ -e $link && ! -L $link ]]; then
            reason="SKILL.md is a regular file, remove it and re-run"
        else
            ln -sfn -- "$file" "$link" 2>/dev/null
            if (($? != 0)); then
                reason="cannot create symlink, check permissions on $label/$name"
            fi
        fi
        if [[ -n $reason ]]; then
            printf 'Installing %-*s skill %-*s -> error: %s\n' "$target_width" "$label" "$name_width" "$name" "$reason" >&2
            ((++failed))
        else
            printf 'Installing %-*s skill %-*s -> %s\n' "$target_width" "$label" "$name_width" "$name" "$result"
            if [[ $result == ok ]]; then
                ((++linked))
            else
                ((++unchanged))
            fi
        fi
    done
done

summary="$linked installed, $unchanged unchanged, $failed failed"
if ((skipped > 0)); then
    summary+=", $skipped skipped"
fi

if ((failed > 0 || skipped > 0)); then
    printf '\nFinished with errors: %s\n' "$summary" >&2
    exit 1
fi

printf '\nDone: %s\n' "$summary"
exit 0
