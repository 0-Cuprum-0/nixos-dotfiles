--orequire'alpha'.setup(require'alpha.themes.theta'.config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {

" ::::    ::: :::::::::: ::::::::  :::     ::: ::::::::::: ::::    ::::  ", 
" :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:     +:+:+: :+:+:+ ", 
" :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ", 
" +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ", 
" +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+ ", 
" #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+# ", 
" ###    #### ########## ########      ###     ########### ###       ### ",


}
alpha.setup(dashboard.opts)
