import sublime_plugin


class SwapViewsCommand(sublime_plugin.WindowCommand):
    def run(self):
        if self.window.num_groups() == 2:
            view = self.window.active_view()
            self.window.focus_group(0)    # focus on left
            right_view = self.window.active_view_in_group(1)
            self.window.run_command('carry_file_to_pane', {"direction": "right"})
            self.window.focus_view(right_view)
            self.window.run_command('carry_file_to_pane', {"direction": "left"})
            self.window.focus_view(view)    # ???
        else:
            self.window.status_message("Warning: two groups are needed")
