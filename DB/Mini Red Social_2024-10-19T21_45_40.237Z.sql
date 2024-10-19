CREATE TABLE IF NOT EXISTS "users" (
	"id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR NOT NULL,
	"email" VARCHAR NOT NULL UNIQUE,
	"password" VARCHAR NOT NULL,
	"avatar" VARCHAR,
	PRIMARY KEY("id"),
	FOREIGN KEY ("id") REFERENCES "posts"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("id") REFERENCES "post_likes"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("id") REFERENCES "post_comments"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "posts" (
	"id" INTEGER NOT NULL UNIQUE,
	"body" TEXT,
	"image_url" VARCHAR,
	"post_date" DATE NOT NULL,
	"user_id" INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY ("id") REFERENCES "post_likes"("post_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("id") REFERENCES "post_comments"("post_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "post_likes" (
	"id" INTEGER NOT NULL UNIQUE,
	"post_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "post_comments" (
	"id" INTEGER NOT NULL UNIQUE,
	"body" TEXT NOT NULL,
	"post_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL,
	"comment_date" DATE NOT NULL,
	PRIMARY KEY("id")
);
