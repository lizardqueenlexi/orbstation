import { multiline } from 'common/string';

import { Antagonist, Category } from '../base';

const LoneClownOperative: Antagonist = {
  key: 'loneclownoperative',
  name: 'Lone Clown Operative',
  description: [
    multiline`
      Honk! You're going in hot and all alone, Syndie Clown Style!
      Your mission, whether or not you choose to tickle it, is
      to honk Nanotrasen's most advanced research facility!
	  `,

    multiline`
    A Lone Clown Operative specializes in demoralizing the pathetic crew
    members on the station by placing their special made clown bomb beacons
    and defending them from the fools who wish to go about their day
    without a wonderful HONKing medley.
	  `,
  ],
  category: Category.Midround,
};

export default LoneClownOperative;
