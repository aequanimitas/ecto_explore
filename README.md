# EctoExplore

[Reference](https://hexdocs.pm/ecto/getting-started.html)

- Familiarization with the syntax and how to establish relationships in ecto
- Data modelling experiments using ecto


## Basic CRUD Operations

### Create

- ```cast``` is called inside ```changeset```, casts values into valid ecto types

```
task = Task.changeset %Task{}, %{
	name: "kicking fish", 
	date_start: ~D[2017-01-10], 
	date_end: ~D[2017-01-10], 
	time_start: ~N[2017-01-10 16:30:00], 
	time_end: ~N[2017-01-10 17: 00:00]}

Repo.insert! task

17:04:16.984 [debug] QUERY OK db=1.9ms
INSERT INTO "tasks" ("date_end","date_start","name","time_end","time_start","inserted_at","updated_at") VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING "id" [{2017, 1, 10}, {2017, 1, 10}, "
kicking fish", {{2017, 1, 10}, {17, 0, 0, 0}}, {{2017, 1, 10}, {16, 30, 0, 0}}, {{2017, 1, 11}, {9, 4, 16, 0}}, {{2017, 1, 11}, {9, 4, 16, 0}}]
```

### Updating a record
```
task = Repo.get(from(Task, preload: [:user]), 1)

```
