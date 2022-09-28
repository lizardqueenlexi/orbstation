import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const ChangelingInfiltrator: Antagonist = {
  key: 'changelinginfiltrator',
  name: 'Changeling Infiltrator',
  description: [
    multiline`
      A highly intelligent alien predator that is capable of altering their
      shape to flawlessly resemble a human. Arrives in a drifting escape pod
      ejected from elsewhere, at any point in the middle of the shift.
	  `,

    multiline`
		  Changeling infiltrators must find their own way from their escape pod
      to the station without a convenient cover identity. Use your ability to
      disguise yourself, and an arsenal of biological weaponry, to satisfy the
      deep hunger which prolonged transit has left you with.
	  `,
  ],
  category: Category.Midround,
};

export default ChangelingInfiltrator;
