import { useBackend } from '../backend';
import { Box, Button, LabeledList, Section } from '../components';
import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';
import { Window } from '../layouts';

const DISEASE_THEASHOLD_LIST = [
  'Positive',
  'Harmless',
  'Minor',
  'Medium',
  'Harmful',
  'Dangerous',
  'BIOHAZARD',
];

export const ScannerGate = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={400} height={300}>
      <Window.Content scrollable>
        <InterfaceLockNoticeBox
          onLockedStatusChange={() => act('toggle_lock')}
        />
        {!data.locked && <ScannerGateControl />}
      </Window.Content>
    </Window>
  );
};

const SCANNER_GATE_ROUTES = {
  Off: {
    title: 'Scanner Mode: Off',
    component: () => ScannerGateOff,
  },
  Wanted: {
    title: 'Scanner Mode: Wanted',
    component: () => ScannerGateWanted,
  },
  Guns: {
    title: 'Scanner Mode: Guns',
    component: () => ScannerGateGuns,
  },
  Mindshield: {
    title: 'Scanner Mode: Mindshield',
    component: () => ScannerGateMindshield,
  },
  Disease: {
    title: 'Scanner Mode: Disease',
    component: () => ScannerGateDisease,
  },
  Species: {
    title: 'Scanner Mode: Zombie',
    component: () => ScannerGateZombie,
  },
};

const ScannerGateControl = (props, context) => {
  const { act, data } = useBackend(context);
  const { scan_mode } = data;
  const route = SCANNER_GATE_ROUTES[scan_mode] || SCANNER_GATE_ROUTES.off;
  const Component = route.component();
  return (
    <Section
      title={route.title}
      buttons={
        scan_mode !== 'Off' && (
          <Button
            icon="arrow-left"
            content="back"
            onClick={() => act('set_mode', { new_mode: 'Off' })}
          />
        )
      }>
      <Component />
    </Section>
  );
};

const ScannerGateOff = (props, context) => {
  const { act } = useBackend(context);
  return (
    <>
      <Box mb={2}>Select a scanning mode below.</Box>
      <Box>
        <Button
          content="Wanted"
          onClick={() => act('set_mode', { new_mode: 'Wanted' })}
        />
        <Button
          content="Guns"
          onClick={() => act('set_mode', { new_mode: 'Guns' })}
        />
        <Button
          content="Mindshield"
          onClick={() => act('set_mode', { new_mode: 'Mindshield' })}
        />
        <Button
          content="Disease"
          onClick={() => act('set_mode', { new_mode: 'Disease' })}
        />
        <Button
          content="Zombie"
          onClick={() => act('set_mode', { new_mode: 'Zombie' })}
        />
      </Box>
    </>
  );
};

const ScannerGateWanted = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} any
        warrants for their arrest.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateGuns = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} any
        guns.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateMindshield = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} a
        mindshield.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateDisease = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse, disease_threshold } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned {reverse ? 'does not have' : 'has'} a
        disease equal or worse than {disease_threshold}.
      </Box>
      <Box mb={2}>
        {DISEASE_THEASHOLD_LIST.map((threshold) => (
          <Button.Checkbox
            key={threshold}
            checked={threshold === disease_threshold}
            content={threshold}
            onClick={() =>
              act('set_disease_threshold', {
                new_threshold: threshold,
              })
            }
          />
        ))}
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateZombie = (props, context) => {
  const { data } = useBackend(context);
  const { reverse } = data;
  return (
    <>
      <Box mb={2}>
        Trigger if the person scanned is {reverse ? 'not' : ''} a zombie. All
        zombie types will be detected, including dormant zombies.
      </Box>
      <ScannerGateMode />
    </>
  );
};

const ScannerGateMode = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse } = data;
  return (
    <LabeledList>
      <LabeledList.Item label="Scanning Mode">
        <Button
          content={reverse ? 'Inverted' : 'Default'}
          icon={reverse ? 'random' : 'long-arrow-alt-right'}
          onClick={() => act('toggle_reverse')}
          color={reverse ? 'bad' : 'good'}
        />
      </LabeledList.Item>
    </LabeledList>
  );
};
