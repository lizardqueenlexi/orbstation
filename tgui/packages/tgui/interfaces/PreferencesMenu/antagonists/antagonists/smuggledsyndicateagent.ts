import { multiline } from 'common/string';

import { Antagonist, Category } from '../base';

export const AGENT_MECHANICAL_DESCRIPTION = multiline`
      A better-equipped traitor sent in without the luxury of a cover identity.
      Make your way from your pod to the station, infiltrate, and complete your
      mission. You start with a number of extra tools, including a free uplink
      implant, 25 extra TC, and some useful disguise devices. Be careful, your
      presence alone is suspicious!
   `;

const SmuggledSyndicateAgent: Antagonist = {
  key: 'smuggledsyndicateagent',
  name: 'Smuggled Syndicate Agent',
  description: [
    multiline`
      Usually, the Syndicate likes to worm its way inside the crew of its
      enemies' stations. Betray and destroy them from within. Sometimes, though,
      a different approach is needed. That's when they send an expert.
    `,
    AGENT_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default SmuggledSyndicateAgent;
