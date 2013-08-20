---
layout: post
title:  "Artificial Intelligence"
date:   2013-08-20 12:45:00
categories: [notes, artificial intelligence]
---

Unfortunately, I spent the first 30 minutes of this class building this site. But since it's up now, I'll start taking notes.

## 2.3 The Nature of Environments

__Task environments__ are essentially the "problems" to which rational agents are the "solutions."

### Properties of task environments

__Fully observable__ vs. __partially observable__:<br>
 If an agent's sensors give it access to the complete state of the environment at each point in time, then we say that the task environment is fully observable. A task environment is effectively fully observable if the sensors detect all aspects that are _relevant_ to the choice of action; relevance, in turn, depends on the performance measure.

 __Single agent__ vs. __multiagent__:<br>
Very simple. An agent solving a crossword puzzle by itself is clearly in a single-agent environment, wheras an agent playing chess is in a two-agent environment.

__Deterministic__ vs. __stochastic__:<br>
If the next state of the environment is completely determined by the current state and the action executed by the agent, then we say the environment is deterministic; otherwise it is stochastic.

__Episodic__ vs. __sequential__:<br>
In an episodic task environment, the agent's experience is divided into atomic episodes. In each episode, the agent receives a percept and then performs a single action. Crucially, the next episode does not depend on the actions taken in previous episodes.

__Static__ vs. __dynamic__:<br>
If the environment can change while an agent is deliberation, then we say the environment is dynamic for that agent; otherwise, it is static.

__Discrete__ vs. __continuous__:<br>

__Known__ vs. __unknown__:<br>

<p align="center">
  <img src="/img/ai-5.png">
</p>