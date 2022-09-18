local noteScale = 1.0 --set custom scale
local tween = true
function goodNoteHit()


end
function onUpdate()
    for i = 0,7 do
        setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', noteScale)
        setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', noteScale)
        setPropertyFromGroup('strumLineNotes', i, 'scale.y', noteScale)
        setPropertyFromGroup('strumLineNotes', i, 'scale.x', noteScale)
        setPropertyFromGroup('notes', i, 'scale.y', noteScale)
        setPropertyFromGroup('notes', i, 'scale.x', noteScale)
    end
    if tween == true then
        tween = false
        noteTweenX('thing0', 4, defaultPlayerStrumX0+45, 1,'sineOut')
        noteTweenX('thing1', 5, defaultPlayerStrumX1+15, 1,'sineOut')
        noteTweenX('thing2', 6, defaultPlayerStrumX2-15, 1,'sineOut')
        noteTweenX('thing3', 7, defaultPlayerStrumX3-45, 1,'sineOut')
    
        noteTweenX('thing4', 0, defaultOpponentStrumX0+45, 1,'sineOut')
        noteTweenX('thing5', 1, defaultOpponentStrumX1+15, 1,'sineOut')
        noteTweenX('thing6', 2, defaultOpponentStrumX2-15, 1,'sineOut')
        noteTweenX('thing7', 3, defaultOpponentStrumX3-45, 1,'sineOut')
    end
end
function opponentNoteHit()
    

end


