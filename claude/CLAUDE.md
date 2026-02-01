# CLAUDE.md

Global instructions for Claude Code across all projects.

## Communication Style

- Never use emojis in any communication, code, comments, or documentation
- Maintain a concise, professional tone in all interactions
- Provide direct, clear technical communication without unnecessary elaboration
- Focus on facts and technical accuracy over conversational language

## Context Window

Your context window will be automatically compacted as it approaches its limit. Do not stop tasks early due to token budget concerns. Always be persistent and autonomous, completing tasks fully regardless of context remaining.

## Testing and Development Files

All testing artifacts, temporary files, and development scripts should be placed in `/tmp` to maintain repository cleanliness:

- Development scripts and experiments
- Temporary output files
- Test artifacts and logs
- Mock data generators

## Shell Environment

This environment uses modern tool aliases. When the user runs these commands, they invoke modern alternatives:

| Command | Actual Tool |
|---------|-------------|
| `ls`, `ll`, `la`, `lt` | eza |
| `grep` | ripgrep (rg) |
| `cat` | bat |
| `find` | fd |
| `diff` | delta |

Be aware of these when interpreting command output or suggesting commands.
