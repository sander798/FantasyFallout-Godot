extends Panel

var messageIndex = 0
var speakerList: Array[String]
var messageList: Array[String]

func _ready() -> void:
	self.visible = false
	get_node("/root/Play/%Player").playerInteracted.connect(_playerInteracted)

func startDialogue(speakerList: Array[String], messageList: Array[String]) -> void:
	%Speaker.text = speakerList[0]
	%Dialogue.text = messageList[0]
	messageIndex = 0
	self.speakerList.assign(speakerList)
	self.messageList.assign(messageList)
	self.visible = true
	
	if Global.debugMode:
			print("Showing message ", messageIndex + 1, " of ", messageList.size())

func showNextMessage() -> bool:
	if messageIndex < messageList.size() - 1:
		messageIndex += 1
		%Speaker.text = speakerList[messageIndex]
		%Dialogue.text = messageList[messageIndex] 
		
		if Global.debugMode:
			print("Showing message ", messageIndex + 1, " of ", messageList.size())
	
	return false

func _playerInteracted() -> void:
	if self.visible and !showNextMessage():
		self.visible = false
		
		if Global.debugMode:
			print("Hiding dialogue panel")
