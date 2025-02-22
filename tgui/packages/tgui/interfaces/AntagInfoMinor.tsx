import { Section, Stack } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Objective = {
  count: number;
  name: string;
  explanation: string;
  complete: BooleanLike;
  was_uncompleted: BooleanLike;
  reward: number;
};

type Info = {
  antag_name: string;
  objectives: Objective[];
};

export const AntagInfoMinor = (props) => {
  const { data } = useBackend<Info>();
  const { antag_name } = data;
  return (
    <Window width={620} height={250}>
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item textColor="red" fontSize="20px">
              You are the {antag_name}!
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout />
            </Stack.Item>
            <Stack.Item textColor="red">
              You are a minor antagonist! Avoid excessive collateral damage and
              do not escalate beyond what is necessary for your objectives.
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

const ObjectivePrintout = (props) => {
  const { data } = useBackend<Info>();
  const { objectives } = data;
  return (
    <Stack vertical>
      <Stack.Item bold>Your objectives:</Stack.Item>
      <Stack.Item>
        {(!objectives && 'None!') ||
          objectives.map((objective) => (
            <Stack.Item key={objective.count}>
              #{objective.count}: {objective.explanation}
            </Stack.Item>
          ))}
      </Stack.Item>
    </Stack>
  );
};
