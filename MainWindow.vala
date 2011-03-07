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
	}
}

public static int main(string [] argv) {
	Gtk.init(ref argv);

	var window = new MainWindow();
	window.show_all();

	Gtk.main();
	return 0;
}