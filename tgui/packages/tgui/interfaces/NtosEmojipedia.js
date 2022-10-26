import { useBackend, useLocalState } from '../backend';
import { Box, Section, Table } from '../components';
import { NtosWindow } from '../layouts';

export const NtosEmojipedia = (props, context) => {
  const { act, data } = useBackend(context);
  const [searchTerm, setSearchTerm] = useLocalState(context, 'search', '');
  const { emoji_list } = data;

  return (
    <NtosWindow width={600} height={800}>
      <NtosWindow.Content scrollable>
        <Section textAlign="center">
          <span style={italics}>EmojiPedia 2.0 - All You Could Ever Need!</span>
        </Section>
        {emoji_list.map((emoji) => (
          <Section key={emoji.name}>
            <Box
              as="img"
              m={0}
              src={`data:image/jpeg;base64,${emoji.icon64}`}
              height="100%"
              style={{
                '-ms-interpolation-mode': 'nearest-neighbor',
              }}
            />
            {emoji.name}
          </Section>
        ))}
      </NtosWindow.Content>
    </NtosWindow>
  );
};
