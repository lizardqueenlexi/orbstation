import { multiline } from 'common/string';
import { Antagonist, Category } from '../base';

const WizardJourneyman: Antagonist = {
  key: 'wizardjourneyman',
  name: 'Wizard (Journeyman)',
  description: [
    multiline`
      A wizard freshly graduated from apprenticeship and looking to earn the
      respect of their peers by annoying the hell out of the inhabitants of
      Space Station 13.
	  `,

    multiline`
		  Draft spells and equipment from a limited pool and then cause chaos on
      the station. Choose between pursuing traditional objectives, completing
      a series of rituals, or creating disorder in your own special way.
	  `,
  ],
  category: Category.Midround,
};

export default WizardJourneyman;
