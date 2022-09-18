function onUpdatePost()
  setProperty('timeBarBG.visible', false)

  setProperty('timeBar.x', 445)
  setProperty('timeBar.scale.x', 3.275)
  setProperty('timeBar.y', 710)
  setObjectCamera('timeBar', 'other')

  setTextSize('timeTxt', 20)
  setTextBorder('timeTxt', 1, '000000')
  setTextAlignment('timeTxt', 'left')
  setProperty('timeTxt.x', 10)
  setProperty('timeTxt.y', 685)
  setObjectCamera('timeTxt', 'other')

  setProperty('timeBar.color', getColorFromHex('FF0000'))
end