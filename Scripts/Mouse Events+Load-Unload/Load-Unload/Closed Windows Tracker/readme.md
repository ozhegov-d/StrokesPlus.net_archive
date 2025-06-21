#### The script tracks windows closed (by any method) through periodically scanning the list of active windows in the system and allows quick restoration through a menu.

Keep in mind that the code was written in a hurry, is chaotic, and some things might not work.  
Also, not all closed windows may appear in the menu because it uses sp.AllApplications();, and, for example, Telegram is not included in it.
