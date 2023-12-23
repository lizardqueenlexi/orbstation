import { multiline } from 'common/string';

import { Antagonist, Category } from '../base';

const LatejoinKiller: Antagonist = {
  key: 'contractkillerlatejoin',
  name: 'Contract Killer (Latejoin)',
  description: [
    'A form of contract killer that can activate when joining an ongoing shift.',

    multiline`
		  Contract Killers are a minor antagonist tasked to kill a single person.
      Spend long enough near them first, and you can pick one of three random
      kits to help. Avoid collateral damage.
	  `,
  ],
  category: Category.Latejoin,
};

export default LatejoinKiller;
