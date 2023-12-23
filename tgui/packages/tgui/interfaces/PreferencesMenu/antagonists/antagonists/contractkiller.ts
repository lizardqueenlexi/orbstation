import { multiline } from 'common/string';
import { Antagonist, Category } from '../base';

const ContractKiller: Antagonist = {
  key: 'contractkiller',
  name: 'Contract Killer',
  description: [
    multiline`
      Plain and simple, you're here to kill someone. Gather intel, kill
      your target, and get home to get your pay.
    `,

    multiline`
		  Contract Killers are a minor antagonist tasked to kill a single person.
      Spend long enough near them first, and you can pick one of three random
      kits to help. Avoid collateral damage.
	  `,
  ],
  category: Category.Midround,
};

export default ContractKiller;
