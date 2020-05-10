CREATE TABLE `users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE `books` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `available` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE `purchases` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `amount` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_PURCHASE_HAS_USER_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_PURCHASE_HAS_USER`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `purchased_books` (
  `purchase_id` BIGINT UNSIGNED NOT NULL,
  `book_id` BIGINT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  INDEX `FK_PURCHASED_BOOKS_HAS_PURCHASE_idx` (`purchase_id` ASC) VISIBLE,
  INDEX `FK_PURCHASED_BOOKS_HAS_BOOK_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `FK_PURCHASED_BOOKS_HAS_PURCHASE`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PURCHASED_BOOKS_HAS_BOOK`
    FOREIGN KEY (`book_id`)
    REFERENCES `books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
