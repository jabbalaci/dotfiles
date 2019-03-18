import os

import sublime
import sublime_plugin


class CopyFilePathCommand(sublime_plugin.WindowCommand):
    def run(self):
        view = sublime.active_window().active_view()
        full_path = view.file_name()
        text = full_path
        sublime.set_clipboard(text)
        self.window.status_message("Copied to clipboard: {0}".format(text))
        print("#", text)


class CopyFileNameCommand(sublime_plugin.WindowCommand):
    def run(self):
        view = sublime.active_window().active_view()
        full_path = view.file_name()
        dpath, fname = os.path.split(full_path)
        # base_name, ext = os.path.splitext(fname)
        text = fname
        sublime.set_clipboard(text)
        self.window.status_message("Copied to clipboard: {0}".format(text))
        print("#", text)


class CopyDirPathCommand(sublime_plugin.WindowCommand):
    def run(self):
        view = sublime.active_window().active_view()
        full_path = view.file_name()
        dpath, fname = os.path.split(full_path)
        text = dpath
        sublime.set_clipboard(text)
        self.window.status_message("Copied to clipboard: {0}".format(text))
        print("#", text)


class CopyDirNameCommand(sublime_plugin.WindowCommand):
    def run(self):
        view = sublime.active_window().active_view()
        full_path = view.file_name()
        dpath, fname = os.path.split(full_path)
        dpath, dname = os.path.split(dpath)
        text = dname
        sublime.set_clipboard(text)
        self.window.status_message("Copied to clipboard: {0}".format(text))
        print("#", text)
