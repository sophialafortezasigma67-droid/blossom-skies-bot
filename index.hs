const { Client, GatewayIntentBits, Partials } = require('discord.js');

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.GuildMembers
  ],
  partials: [Partials.Channel]
});const { Client, GatewayIntentBits, REST, Routes, SlashCommandBuilder } = require('discord.js');

const client = new Client({
  intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMembers]
});

// 🌸 Slash command setup
const commands = [
  new SlashCommandBuilder()
    .setName('hi')
    .setDescription('Say hi to the bot'),

  new SlashCommandBuilder()
    .setName('ping')
    .setDescription('Check bot latency')
].map(cmd => cmd.toJSON());

const rest = new REST({ version: '10' }).setToken(process.env.TOKEN);

client.once('ready', async () => {
  console.log(`🌸 Logged in as ${client.user.tag}`);

  await rest.put(
    Routes.applicationCommands(client.user.id),
    { body: commands }
  );
});

client.on('interactionCreate', async interaction => {
  if (!interaction.isChatInputCommand()) return;

  if (interaction.commandName === 'hi') {
    await interaction.reply('🌸 hello!! welcome to Blossom Skies ✨');
  }

  if (interaction.commandName === 'ping') {
    await interaction.reply('🌙 Pong!');
  }
});

client.login(process.env.TOKEN);
