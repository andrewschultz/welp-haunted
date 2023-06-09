Version 1/221116 of Roads of Liches Tables by Andrew Schultz begins here.

"This lays out the major tables for Roads of Liches for easy indexing and searching."

volume stuff that may go to core

definition: a thing (called th) is fungible:
	if th is in location of player, yes;
	no;

verb-dont-print is a truth state that varies.

the spoonerism rules are a rulebook. the spoonerism rules have outcomes unavailable, not-yet, already-done, jump-reject, semi-pass and ready.

already-spoonerized is a truth state that varies.

volume saying stuff

to vcal (t - text): [verb conditional print, flag already rhymed e.g. if HEAP HEAT and then try it again]
	now already-spoonerized is true;
	if verb-dont-print is false, say "[t][line break]";

to vcp (txt - text):
	if verb-dont-print is false, say "[txt]";

volume the main tables

book very general stuff

table of general stuff
word1 (topic)	word2 (topic)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"cleared"	"woes"	--	--	false	true	false	false	--	pre-cleared-woes rule	post-cleared-woes rule

book fork 1

table of fork 1
word1 (topic)	word2 (topic)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"start"	"hopping"	--	--	false	true	true	false	Ditch Park	pre-start-hopping rule	post-start-hopping rule
"howl"	"farm"	--	--	false	true	true	false	Ditch Park	pre-howl-farm rule	post-howl-farm rule
"keep"	"dry"	--	--	false	true	true	false	Howl Farm	pre-keep-dry rule	post-keep-dry rule
"creep"	"die"	--	--	false	true	true	false	Howl Farm	pre-creep-die rule	post-creep-die rule
"say"	"farewell"	--	--	false	true	true	false	wayfair cell	pre-say-farewell rule	post-say-farewell rule	--	--

a spoonerism rule (this is the pre-cleared-woes rule):
	if sco-cleared-woes is true:
		vcal "You already cleared woes. If you try too hard, you may wind up trying too hard to convince yourself you did, and they'll come back.";
		already-done;
	ready;

this is the post-cleared-woes rule:
	now sco-cleared-woes is true;
	say "You feel a little less weird now. This may have no concrete value, but it's nice all the same.";
	ready;

a spoonerism rule (this is the pre-start-hopping rule):
	if sco-start-hopping is true:
		vcal "You're already moving. You don't want to get too agitated.";
		already-done;
	ready;

this is the post-start-hopping rule:
	say "It's good to feel you can move. You feel less helpless now.";
	now sco-start-hopping is true;

this is the pre-howl-farm rule:
	if sco-howl-farm is true:
		vcal "You already opened passage to the howl farm.";
		already-done;
	ready;

this is the post-howl-farm rule:
	say "You feel a howl farm off to the side, which is creepy, but it's not physically dangerous.";
	now howl farm is mapped west of ditch park;
	now ditch park is mapped east of howl farm;
	now sco-howl-farm is true;

a spoonerism rule (this is the pre-keep-dry rule):
	if deep cry is not fungible, unavailable;
	if sco-keep-dry is true:
		vcal "You already kept dry.";
		already-done;
	ready;

this is the post-keep-dry rule:
	say "You keep dry.";
	now sco-keep-dry is true;

a spoonerism rule (this is the pre-creep-die rule):
	if deep cry is not fungible, unavailable;
	if sco-keep-dry is false:
		vcal "You don't feel the confidence to say that. You need a middle or medium step before that.";
		already-done;
	ready;

this is the post-creep-die rule:
	now sco-creep-die is true;

a spoonerism rule (this is the pre-say-farewell rule):
	if player is not in wayfair cell, unavailable;
	ready;

this is the post-say-farewell rule:
	now sco-say-farewell is true;
	say "And just like that, you realize you shouldn't be bound by your own chains! It's time to move on. And you do.";
	move player to Ditch Park;

book fork 2

table of fork 2
word1 (topic)	word2 (topic)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"gainful"	"pardon"	--	--	false	true	true	false	Painful Garden	pre-gainful-pardon rule	post-gainful-pardon rule	--	--

a spoonerism rule (this is the pre-gainful-pardon rule):
	if player is not in Painful Garden, unavailable;
	if sco-gainful-pardon is true:
		vcal "You already found some semblance of peace here.";
		already-done;
	ready;

this is the post-gainful-pardon rule:
	now sco-gainful-pardon is true;
	say "Well, you can't expect any judge to give you a sealed document, so you work things out for yourself. Perhaps there are some things you need to make restitution for, but pain for its own sake will do no good, and you'll think of anything once you get out. If you get out. Maybe track down someone you did wrong. Here, though, not much to do.";

volume big picture stuff

the check forks rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check forks rule):
	abide by the main-spoonerism-checker rule for table of general stuff;
	abide by the main-spoonerism-checker rule for table of fork 1;
	continue the action;

volume rule reorg

the wordguess rules are a table name based rulebook.

a wordguess rule for a table name (called tn) (this is the main-spoonerism-checker rule):
	let partial-row be 0;
	let row-count be 0;
	repeat through tn:
		increment row-count;
		now verb-dont-print is true;
		process the check-rule entry;
		let rb-out be outcome of the rulebook;
		now verb-dont-print is false;
		if rb-out is unavailable outcome, next;
		let w1 be whether or not the player's command includes word1 entry;
		let w2 be whether or not the player's command includes word2 entry;
		let b1 be boolval of w1;
		let b2 be boolval of w2;
		if b1 + b2 is 0, next;
		if b1 + b2 is 1:
			now partial-row is row-count;
			continue the action;
		process the check-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is the already-done outcome, the rule succeeds;
		if rb-out is the not-yet outcome:
			let exact-cmd be true;
			[let exact-cmd be whether or not the player's command matches the text "[first-of-ors of w1 entry][if there is a w2 entry] [first-of-ors of w2 entry][end if]", case insensitively;]
			if think-cue entry is false:
				say "[line break][one of][b]NOTE[r]: this command[if exact-cmd is false] (well, an equivalent, as there were alternate solutions)[end if] will be useful later, but you aren't ready to use it, yet. You can track commands like this by typing [b]THINK[r], which will also clue you if they now work.[or](useful command[if exact-cmd is false] (or a functionally equivalent alternate solution)[end if] again saved to [b]THINK[r] for later reference.)[stopping]";
				now think-cue entry is true;
			else:
				say "[line break]Hmph. That [if exact-cmd is false](or a functionally equivalent alternate solution) [end if]still doesn't quite work! You'll figure out the how and when and where, though.";
			the rule succeeds;
		now idid entry is true;
		process the run-rule entry;
		increment the score;
		follow the notify score changes rule;
		the rule succeeds;
	if partial-row > 0, say "Hmm. You are on the right track, there.";

Roads of Liches Tables ends here.

---- DOCUMENTATION ----
