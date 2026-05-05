### 2 Daily randomly selected todos
<%*
const dv = app.plugins.plugins["dataview"]?.api;
if (!dv) {
  tR = "Dataview not available";
  return;
}

const SEARCH_TERM = "";
const RANDOM_ENTRIES = 2;
const SHOW_BACKLOG = false;
const SHOW_DONE = false;
const SHOW_CANCELLED = false;
const SHOW_STANDARD = true; // What was this again?





class MyTodoTable{
	main() {
		this.load_properties();
		this.handle_number_of_random_todos();
		if (!this.error) {
			this.pages = dv.pages('#DATAVIEWTABLE_important_but_not_urgent and !"Templates"');
			this.filter_pages();
			this.create_table_main();
		}
	}

	load_properties() {
		// this.current = dv.current();
		this.how_many_random_entries_shown = RANDOM_ENTRIES; // (this.current.how_many_random_entries_shown);
		this.show_backlog = SHOW_BACKLOG; // this.str2bool(this.current.include_backlog);
		this.show_done = SHOW_DONE; // this.str2bool(this.current.include_done);
		this.show_cancelled = SHOW_CANCELLED; // this.str2bool(this.current.include_cancelled);
		this.show_standard = SHOW_STANDARD; // !this.str2bool(this.current.only_show_selection);
		this.search_term = SEARCH_TERM; // dv.current().search_term;
	}

	str2bool(input) {
		function myError() {
			throw new Error("Invalid boolean input: " + input);
		}
		if (typeof input === "boolean") return input;
		input = String(input);
	    // if (typeof input !== "string") myError();
	    const normalized = input.trim().toLowerCase();
	    const truthy = ["true", "yes", "t", "y", "1"];
	    const falsy  = ["false", "no", "f", "n", "0"];
	    if (truthy.includes(normalized)) return true;
	    if (falsy.includes(normalized)) return false;
	    myError();
	}

	// Ensure that how_many_random_entries_shown is either a number or the string "all"
	handle_number_of_random_todos() {
		this.show_all = false;
		if (!(typeof(this.how_many_random_entries_shown) === 'number')) {
			if(this.how_many_random_entries_shown === 'all') {
				this.show_all = true;
				this.how_many_random_entries_shown = 0;
			} else {
				dv.el("p", "❌ Error: how_many_random_entries_shown parameter is neither a number, nor the string all", {
			        attr: { align: "center" },
			        cls: "dataview-error"
			    });
				this.error = true;
			}
		}
	}

	filter_pages() {
		this.pages = this.pages
		    .where(p => p.file.name.includes(this.search_term))
		    .where(p => !this.show_standard && this.show_done ? p.done == 1 : p.done != 1 || this.show_done)
		    .where(p => !this.show_standard && this.show_cancelled ? p.cancelled == 1 : p.cancelled != 1 || this.show_cancelled)
			.where(p => !this.show_standard && this.show_backlog ? p.backlog == 1 : p.backlog != 1 || this.show_backlog)
			.where(p => this.show_standard || this.show_backlog || this.show_done || this.show_cancelled)
		    .sort(p => [p.done ? 0 : 1, -(p.stars.length), p.length]);
		
		// dv.table(["File", "stars"], this.pages.map(p => [p.file.link, p.stars]));
	}

	create_table_main() {
		if (this.show_all || this.how_many_random_entries_shown === 0) {
			create_table_with_all_todos(this.pages);
		} else if (this.how_many_random_entries_shown >= 1) {
			this.select_random_todos();
			this.create_table_from_random_todos();
		} else {
			dv.el("p", "❌ Error: how_many_random_entries_shown parameter is a negative number", {
				attr: { align: "center" },
				cls: "dataview-error"
			});
			this.error = true;
		}
	}

	select_random_todos() {
        let n = Math.min(this.how_many_random_entries_shown, this.pages.length);
        const totalStars = calculate_total_stars(this.pages);
		if (this.pages.length > 0) {
            let randomPages = [];
			for (let i = 0; i < n; i++) {
                let [randomStarNumber, randomPage] = get_random_todo_weighted(this.pages, totalStars);
                randomPages.push([randomStarNumber, randomPage]);
			}
            show_random_table(randomPages, totalStars);
		} else {
			dv.el("p", "❌ No tasks found matching your search criteria!", {
		        attr: { align: "center" },
		        cls: "dataview-error"
		    });
		}
	}

	create_table_from_random_todos() {
	}
	
}

function calculate_total_stars(pages) {
    let totalStars = 0;
    for (let page of pages) {
        totalStars += page.stars.length;
    }
    return totalStars;
}

function get_random_todo_weighted(pages, totalStars) {
    const randomStarNumber = Math.floor(Math.random() * totalStars);
    let countedStars = 0;
    let randomPage = null;
    for (let page of pages) {
        const countedStarsStart = countedStars;
        countedStars = countedStars + page.stars.length;
        if (randomStarNumber < countedStars) {
            randomPage = page;
            break;
        }
    }
    return [randomStarNumber, randomPage];
}

function show_random_table(randomPages, totalStars) {
    tR += "Total stars today: " + totalStars + "\n";
    tR += "RNG chose stars " + randomPages.map(([randomStar, _]) => randomStar) + " which are " + randomPages.map(([_, p]) => p.stars.length) + " star pages respectively\n"
	tR += randomPages.map(([_, p]) => "Focused Todo for the day - " + p.stars + " " + p.file.link).join("\n") + "\n"
}

new MyTodoTable().main();
%>
### Random page in focus today
<% tp.file.include("[[Templates/random page link template]]") %>