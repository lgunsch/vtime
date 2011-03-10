/*
 * vtime -- A simple GTK+ stopwatch/timer.
 * Copyright (C) 2011 Lewis Gunsch <lgunsch@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

using Gtk;

class MainWindow : Window {

	public MainWindow() {
		this.title = "VTime";
		this.position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);

		set_default_size(800, 600);

		this.configureMenu();
	}

	public void configureMenu() {
		
		var menu_bar = new MenuBar();
		
		/* File menu */
		var file_menu = new Menu();
		var quit = new MenuItem.with_mnemonic("_Quit");
		quit.activate.connect(main_quit);
		file_menu.append(quit);
		
		var file_launcher = new MenuItem.with_mnemonic("_File");
		file_launcher.set_submenu(file_menu);
		menu_bar.append(file_launcher);
		
		/* Edit menu */
		var edit_menu = new Menu();
		var font = new MenuItem.with_label("Font");
		edit_menu.append(font);

		var edit_launcher = new MenuItem.with_mnemonic("_Edit");
		edit_launcher.set_submenu(edit_menu);
		menu_bar.append(edit_launcher);

		/* Timer menu */
		var timer_menu = new Menu();
		var start = new MenuItem.with_mnemonic("_Start");
		timer_menu.append(start);
		var pause = new MenuItem.with_mnemonic("_Pause");
		timer_menu.append(pause);
		var stop = new MenuItem.with_mnemonic("S_top");
		timer_menu.append(stop);

		var timer_launcher = new MenuItem.with_mnemonic("_Timer");
		timer_launcher.set_submenu(timer_menu);
		menu_bar.append(timer_launcher);

		/* Help menu */
		var help_menu = new Menu();
		var license = new MenuItem.with_mnemonic("_License");
		help_menu.append(license);
		var about = new MenuItem.with_mnemonic("_About");
		help_menu.append(about);

		var help_launcher = new MenuItem.with_mnemonic("_Help");
		help_launcher.set_submenu(help_menu);
		menu_bar.append(help_launcher);

		this.add(menu_bar);
	}
}

public static int main(string [] argv) {
	Gtk.init(ref argv);

	var window = new MainWindow();
	window.show_all();

	Gtk.main();
	return 0;
}