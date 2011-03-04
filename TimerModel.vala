/*
 * vtime -- A simple GTK+ stopwatch/timer.
 * Copyright (C) 2011 Lewis Gunsch
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

using GLib;

class TimerModel : GLib.Object {

	/** Possible states of this TimerModel */
	public enum TimerState {
		PAUSED,
		STOPPED,
		RUNNING
	}

	/** Interval period to update the time */
	protected const uint TIMEOUT_INTERVAL = 1000;

	/** Internal timer to monitor elapsed time between timeouts */
	protected Timer timer;

	/** Event source id for the internal timeout event */
	protected uint event_source_id;

	/* Signal to notify when the timer has been updated */
	public signal void time_change();

	public ulong days { get; protected set; default = 0; }

	public ulong hours { get; protected set; default = 0; }

	public ulong minutes { get; protected set; default = 0; }

	public ulong seconds { get; protected set; default = 0; }

	public ulong milliseconds { get; protected set; default = 0; }

	public TimerState timer_state { get; protected set; default =
															TimerState.STOPPED; }

	construct {
		this.timer = new Timer();
		stdout.printf("Created a new timer.\n");
	}

	~TimerModel() {
		this.timer = null;
		/* must check is destroyed first */
		Source.(this.event_source_id);
		/* TODO: should I return false in the event callback? */
	}

	/**
	 * Internal callback function to update the timer by adding the elapsed time to
	 * the appropriate metrics and signal a time change with time_change(). This will
	 * only be called again by the timeout if true is returned.
	 */
	protected bool timer_timeout() {
		stdout.printf("Timer timedout!\n");
		return true;
	}

	public void start() {
		/* This should call our timer_timeout method approximately every 1000
		 * milliseconds so our time can be updated.
		 */
		this.event_source_id = Timeout.add(TIMEOUT_INTERVAL, this.timer_timeout);

		stdout.printf("Timer started.\nEvent source ID is: %u.\n",
					  this.event_source_id);
	}

	public void stop() {
		stdout.printf("Timer stopped.\n");
		Source.remove(this.event_source_id);
	}

	public void pause() {
		stdout.printf("Timer paused.\n");

	}

	public static int main(string [] argv) {
		var timer = new TimerModel();
		timer.start();
		new MainLoop().run();
		return 0;
	}
}