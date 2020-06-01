-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 01 2020 г., 10:57
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schedule`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_classroom`
--

CREATE TABLE `dautov_classroom` (
  `classroom_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_day`
--

CREATE TABLE `dautov_day` (
  `day_id` tinyint NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_day`
--

INSERT INTO `dautov_day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_gender`
--

CREATE TABLE `dautov_gender` (
  `gender_id` tinyint NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_gender`
--

INSERT INTO `dautov_gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_gruppa`
--

CREATE TABLE `dautov_gruppa` (
  `gruppa_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `special_id` int NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_lesson_num`
--

CREATE TABLE `dautov_lesson_num` (
  `lesson_num_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `time_lesson` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_lesson_num`
--

INSERT INTO `dautov_lesson_num` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_lesson_plan`
--

CREATE TABLE `dautov_lesson_plan` (
  `lesson_plan_id` int NOT NULL,
  `gruppa_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_otdel`
--

CREATE TABLE `dautov_otdel` (
  `otdel_id` smallint NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_otdel`
--

INSERT INTO `dautov_otdel` (`otdel_id`, `name`, `active`) VALUES
(1, 'Программирование', 1),
(2, 'Общеобразовательные дисциплины', 1),
(3, 'Строительство', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_role`
--

CREATE TABLE `dautov_role` (
  `role_id` tinyint NOT NULL,
  `sys_name` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_role`
--

INSERT INTO `dautov_role` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_schedule`
--

CREATE TABLE `dautov_schedule` (
  `schedule_id` int NOT NULL,
  `lesson_plan_id` int NOT NULL,
  `day_id` tinyint NOT NULL,
  `lesson_num_id` int NOT NULL,
  `classroom_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_special`
--

CREATE TABLE `dautov_special` (
  `special_id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `otdel_id` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dautov_special`
--

INSERT INTO `dautov_special` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'Информационные системы', 1, 1),
(2, 'Нефтегазовое дело', 2, 1),
(3, 'Строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'Электроснабжение', 3, 1),
(5, 'Вычислительная техника и программное обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_student`
--

CREATE TABLE `dautov_student` (
  `user_id` bigint NOT NULL,
  `gruppa_id` int NOT NULL,
  `num_zach` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_subject`
--

CREATE TABLE `dautov_subject` (
  `subject_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `otdel_id` smallint NOT NULL,
  `hours` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_teacher`
--

CREATE TABLE `dautov_teacher` (
  `user_id` bigint NOT NULL,
  `otdel_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dautov_user`
--

CREATE TABLE `dautov_user` (
  `user_id` bigint NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `gender_id` tinyint NOT NULL,
  `birthday` date DEFAULT NULL,
  `role_id` tinyint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dautov_classroom`
--
ALTER TABLE `dautov_classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `dautov_day`
--
ALTER TABLE `dautov_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `dautov_gender`
--
ALTER TABLE `dautov_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `dautov_gruppa`
--
ALTER TABLE `dautov_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `dautov_lesson_num`
--
ALTER TABLE `dautov_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `dautov_lesson_plan`
--
ALTER TABLE `dautov_lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `gruppa_id` (`gruppa_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `dautov_otdel`
--
ALTER TABLE `dautov_otdel`
  ADD PRIMARY KEY (`otdel_id`) USING BTREE;

--
-- Индексы таблицы `dautov_role`
--
ALTER TABLE `dautov_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `dautov_schedule`
--
ALTER TABLE `dautov_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `lesson_num_id` (`lesson_num_id`),
  ADD KEY `lesson_plan_id` (`lesson_plan_id`);

--
-- Индексы таблицы `dautov_special`
--
ALTER TABLE `dautov_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `dautov_student`
--
ALTER TABLE `dautov_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `dautov_subject`
--
ALTER TABLE `dautov_subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `dautov_teacher`
--
ALTER TABLE `dautov_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `dautov_user`
--
ALTER TABLE `dautov_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dautov_gruppa`
--
ALTER TABLE `dautov_gruppa`
  ADD CONSTRAINT `dautov_gruppa_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `dautov_special` (`special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_lesson_plan`
--
ALTER TABLE `dautov_lesson_plan`
  ADD CONSTRAINT `dautov_lesson_plan_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `dautov_gruppa` (`gruppa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_lesson_plan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `dautov_teacher` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_lesson_plan_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `dautov_subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_schedule`
--
ALTER TABLE `dautov_schedule`
  ADD CONSTRAINT `dautov_schedule_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `dautov_classroom` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_schedule_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `dautov_day` (`day_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_schedule_ibfk_3` FOREIGN KEY (`lesson_num_id`) REFERENCES `dautov_lesson_num` (`lesson_num_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_schedule_ibfk_4` FOREIGN KEY (`lesson_plan_id`) REFERENCES `dautov_lesson_plan` (`lesson_plan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_special`
--
ALTER TABLE `dautov_special`
  ADD CONSTRAINT `dautov_special_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `dautov_otdel` (`otdel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_student`
--
ALTER TABLE `dautov_student`
  ADD CONSTRAINT `dautov_student_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `dautov_gruppa` (`gruppa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_subject`
--
ALTER TABLE `dautov_subject`
  ADD CONSTRAINT `dautov_subject_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `dautov_otdel` (`otdel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_teacher`
--
ALTER TABLE `dautov_teacher`
  ADD CONSTRAINT `dautov_teacher_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `dautov_otdel` (`otdel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `dautov_user`
--
ALTER TABLE `dautov_user`
  ADD CONSTRAINT `dautov_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dautov_student` (`user_id`),
  ADD CONSTRAINT `dautov_user_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `dautov_teacher` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dautov_user_ibfk_5` FOREIGN KEY (`role_id`) REFERENCES `dautov_role` (`role_id`),
  ADD CONSTRAINT `dautov_user_ibfk_6` FOREIGN KEY (`gender_id`) REFERENCES `dautov_gender` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
