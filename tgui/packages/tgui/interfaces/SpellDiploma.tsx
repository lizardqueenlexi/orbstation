import { useBackend } from '../backend';
import { Button, Flex, Section, Stack } from '../components';
import { Window } from '../layouts';

type DiplomaSpell = {
  name: string;
  desc: string;
  ref: string;
  requires_wizard_garb: boolean;
  category: string;
  buy_word: string;
};

type Info = {
  owner: string;
  picks: number;
  owned_spells: string[];
  spells: DiplomaSpell[];
};

export const SpellDiploma = (props) => {
  const { act, data } = useBackend<Info>();
  return (
    <Window width={940} height={820} theme="wizard">
      <Window.Content>
        <Stack vertical>
          <Stack.Item>
            <Section>
              <Stack vertical>
                <Stack.Item textAlign="center" textColor="red" fontSize="20px">
                  Wizarding Diploma
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section>
              <Stack vertical textAlign="center">
                <Stack.Item>
                  Let it be known that the bearer of this document is granted
                  the official title of JOURNEYMAN of the WIZARD FEDERATION,
                  along with all of the privileges this title entails.
                </Stack.Item>
                <Stack.Item>
                  <Section fontSize="18px">Signed: {data.owner}.</Section>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section title="Major Selection">
              <Stack.Item>
                Please select four of the twelve options presented below.
              </Stack.Item>
              <Stack.Item>You have {data.picks} choices remaining.</Stack.Item>
              <Stack.Item>
                <br />
              </Stack.Item>
              <Stack.Item>
                <DiplomaSpellGrid />
              </Stack.Item>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

// I would love to do this inside a loop and not hard code it
// but I don't know how I would insert the columns
export const DiplomaSpellGrid = (props) => {
  const { act, data } = useBackend<Info>();
  const { picks, owned_spells, spells } = data;
  return (
    <Flex direction="column" wrap="wrap" height={'540px'} mb={1}>
      {(!spells && 'None!') ||
        spells.map((spell) => (
          <Flex.Item key={spell.name}>
            <Section
              title={spell.name}
              width={'220px'}
              height={'170px'}
              ml={'5px'}
              mr={'5px'}
              mt={'5px'}
              mb={'5px'}
              fill
              scrollable
              buttons={
                spell.buy_word === 'Learn' && (
                  <Button
                    icon="tshirt"
                    color={spell.requires_wizard_garb ? 'bad' : 'green'}
                    tooltipPosition="bottom-start"
                    tooltip={
                      spell.requires_wizard_garb
                        ? 'Requires wizard garb.'
                        : 'Can be cast without wizard garb.'
                    }
                  />
                )
              }
            >
              <Flex>
                <Flex.Item grow={1} />
                <Flex.Item>
                  <Button
                    fluid
                    textAlign="center"
                    color={owned_spells.includes(spell.ref) ? 'bad' : 'green'}
                    disabled={picks <= 0 || owned_spells.includes(spell.ref)}
                    width={7}
                    content={spell.buy_word}
                    mb={'5px'}
                    onClick={() =>
                      act('purchase', {
                        spellref: spell.ref,
                      })
                    }
                  />
                </Flex.Item>
              </Flex>
              {spell.desc}
            </Section>
          </Flex.Item>
        ))}
    </Flex>
  );
};
