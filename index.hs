const { Client, GatewayIntentBits } = require('discord.js');

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMembers,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent
  ]
});

client.once('ready', () => {
  console.log(`🌸 Logged in as ${client.user.tag}`);
});

client.on('guildMemberAdd', member => {
  const channel = member.guild.systemChannel;
  if (!channel) return;

  channel.send(
    `🌸 Welcome to Blossom Skies, ${member}!  
We’re so happy you’re here ✨`
  );
});

client.on('messageCreate', message => {
  if (message.author.bot) return;

  if (message.content.toLowerCase() === 'hi') {
    message.reply('🌸 hello!! welcome to Blossom Skies ✨');
  }
});

client.login(process.env.TOKEN);
