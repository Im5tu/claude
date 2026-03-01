---
argument-hint: [instructions]
description: Interview user in-depth to create a detailed spec. Also use when the user says "write a spec," "feature spec," "plan a feature," "detailed requirements," "product spec," or "spec out." For prompt refinement, see reprompt.
allowed-tools: AskUserQuestion, Write
---

Follow the user instructions and interview me in detail using the AskUserQuestionTool about literally anything: technical implementation, UI & UX, concerns, tradeoffs, etc. but make sure the questions are not obvious. be very in-depth and continue interviewing me continually until it's complete. then, write the spec to a file. For each decision that's made, update a feature plan document so that we know what's already been decided incase we need to restart the process.
<instructions>$ARGUMENTS</instructions>
