create table `contents` (
  `id`      int(10) unsigned    not null,
  `data_id` int(10)             not null,
  `title`   varchar(255)        not null,
  primary key(`id`),
) engine=InnoDB default charset=utf8;

create table `keywords` (
  `id`      bigint(20) unsigned not null,
  `data_id` bigint(20)          not null,
  `keyword` varchar(2083)       not null,
  primary key(`id`),
  index(`keyword`)
) engine=InnoDB default charset=utf8;

create table `images` (
  `id`        int(10) unsigned  not null,
  `data_id`   int(10)           not null,
  `image_url` varchar(255)      not null,
  primary key(`id`)
) engine=InnoDB default charset=utf8;
