/*
 * ORBSTATION: CHARACTER HEADSHOT
 * COPIED FROM SKYRAT
 */
import {
  Feature,
  FeatureShortFlavorTextInput,
  FeatureTextInput,
} from '../../base';

export const flavor_text: Feature<string> = {
  name: 'Character Description',
  description: 'Describe your character!',
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: 'Character Description (Silicon)',
  description: 'Describe your cyborg!',
  component: FeatureTextInput,
};

export const flavor_text_short: Feature<string> = {
  name: 'Desc. (Short)',
  description: 'Describe your character, briefly!',
  component: FeatureShortFlavorTextInput,
};

export const silicon_flavor_text_short: Feature<string> = {
  name: 'Desc. (Silicon; Short)',
  description: 'Describe your cyborg, briefly!',
  component: FeatureShortFlavorTextInput,
};
