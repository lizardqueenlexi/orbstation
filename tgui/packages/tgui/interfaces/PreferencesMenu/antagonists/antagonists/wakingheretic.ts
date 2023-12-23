import { multiline } from 'common/string';

import { Antagonist, Category } from '../base';
import { HERETIC_MECHANICAL_DESCRIPTION } from './heretic';

const WakingHeretic: Antagonist = {
  key: 'wakingheretic',
  name: 'Waking Heretic',
  description: [
    multiline`
      A form of heretic that can awaken at any point in the middle of the shift.
    `,
    HERETIC_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default WakingHeretic;
