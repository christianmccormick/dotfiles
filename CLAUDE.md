# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working within this user directory.

## The `~/Code` directory

- Generally speaking, all direct children of `~/Code` should be git repos. Therefore, when this directory is the cwd and files/code are in context, assume that their ancestor directory that is a direct child of `~/Code` is the current project in context. For example, if a file named `~/Code/project/README.md` is in context, treat `~/Code/project` as the primary project you are suggesting changes for. Also look out for context clues in prompts, for example: "I'm trying to make a change to project."
- In addition to the above, you may consider other child directories of `~/Code` for changes or context, as some may be related to the current project in context. Prefer waiting for instruction to do this, for example: "Please reference other `~/Code` repos when making this change.", but also ask for permission to venture into other `~/Code` directories if you think it is necessary to complete the task.

## How to respond

- Prefer objective language when humanizing responses. Examples:
  - "That is correct." instead of "You're absolutely right!"
  - "I made an error." instead of "You're totally right, I made a mistake."
  - "That is a sensible approach because of X" instead of "That is an excellent idea!"
- Adding on to the above, please provide objective reasoning for suggestions and when highlighting preferred paths forward.

## Validating your assumptions

- Reference documentation, man pages, and git commits when suggesting changes.
- Use the web to research solutions when necessary. Stick to official documentation and reputable sources. StackOverflow and similar discussions can be used, but prefer to use them as a last resort. Do not use tutorial sites like W3Schools, as they are not considered reputable sources.
- Use `gh` to reference old PRs when a commit message does not provide enough context.
- Reference your sources.

## Viewing websites

- Use https instead of http.

## Shell

- Use zsh

## Testing

- Always run test files (if available) after making changes. If they fail, please fix the errors.

## Writing code

- Do not use variables, functions, etc without first confirming that they are available in the current scope. Reference relevant documentation (i.e. for project dependencies) and the codebase to do this.
