import sublime_plugin


class OpenPythonReplCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command('repl_open', {
            "cmd": ["python3", "-i", "-u"],
            "cwd": "$file_path",
            "encoding": "utf8",
            "extend_env": {"PYTHONIOENCODING": "utf-8"},
            "external_id": "python",
            "syntax": "Packages/Python/Python.tmLanguage",
            "type": "subprocess"
        })
