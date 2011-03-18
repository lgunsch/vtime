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

	protected MenuBar menu_bar;
	protected Label time_label;
	protected const string default_font = "Courier";
	protected const int default_size = 62;
	protected const Pango.Weight default_weight = Pango.Weight.NORMAL;

	public MainWindow() {
		this.title = "VTime";
		this.position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);

		set_default_size(800, 600);

		this.configure_menu();
		this.configure_time_label();

		var vbox = new VBox(false, 0);
		vbox.pack_start(menu_bar, false, false, 0);
		vbox.pack_end(time_label, true, true, 0);
		this.add(vbox);
	}

	protected void configure_time_label() {
		time_label = new Label("00:00:00:00");

		var attr_list = new Pango.AttrList();

		var font = new Pango.FontDescription();
        font.set_family(default_font);
        font.set_size((int)(default_size * Pango.SCALE));
		font.set_weight(default_weight);
		attr_list.insert(new Pango.AttrFontDesc(font));

		time_label.set_attributes(attr_list);
	}

	protected void configure_menu() {
		menu_bar = new MenuBar();

		/* File menu */
		var file_menu = new Menu();
		var quit = new MenuItem.with_mnemonic("_Quit");
		quit.activate.connect(main_quit);
		file_menu.append(quit);

		/* File menu launcher */
		var file_launcher = new MenuItem.with_mnemonic("_File");
		file_launcher.set_submenu(file_menu);
		menu_bar.append(file_launcher);

		/* Edit menu */
		var edit_menu = new Menu();
		var font = new MenuItem.with_label("Font");
		font.activate.connect(show_font_chooser);
		edit_menu.append(font);

		/* Edit menu launcher */
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

		/* Timer menu launcher */
		var timer_launcher = new MenuItem.with_mnemonic("_Timer");
		timer_launcher.set_submenu(timer_menu);
		menu_bar.append(timer_launcher);

		/* Help menu */
		var help_menu = new Menu();
		var license = new MenuItem.with_mnemonic("_License");
		license.activate.connect(show_license);
		help_menu.append(license);
		var about = new MenuItem.with_mnemonic("_About");
		about.activate.connect(show_about);
		help_menu.append(about);

		/* Help menu launcher */
		var help_launcher = new MenuItem.with_mnemonic("_Help");
		help_launcher.set_submenu(help_menu);
		menu_bar.append(help_launcher);
	}

	public void show_font_chooser() {
		stdout.printf("Font chooser clicked!\n");
	}

	public void show_about() {
		stdout.printf("About clicked!\n");
	}

	public void show_license() {
		stdout.printf("License clicked!\n");
	}
}

public static int main(string [] argv) {
	Gtk.init(ref argv);

	var window = new MainWindow();
	window.show_all();

	Gtk.main();
	return 0;
}