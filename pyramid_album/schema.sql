create table if not exists pyramids (
    name char(100) not null,
    image char(255) not null
);

insert or ignore into pyramids(name, image)
values
('Etemenanki', 'https://upload.wikimedia.org/wikipedia/commons/7/74/%D0%A0%D0%BE%D0%B7%D0%BA%D0%BE%D0%BF%D0%BA%D0%B8_%D0%95%D1%82%D0%B5%D0%BC%D0%B0%D0%BD%D0%B0%D0%BD%D0%BA%D0%B8.jpg'),
('Khufu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/600px-Kheops-Pyramid.jpg'),
('Hellinikon','https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Pyramide_von_Hellinikon.jpg/558px-Pyramide_von_Hellinikon.jpg'),
('Güímar','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/G%C3%BC%C3%ADmar_BW_3.JPG/400px-G%C3%BC%C3%ADmar_BW_3.JPG'),
('Tomb of the General', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Kevsunblush2.JPG/440px-Kevsunblush2.JPG'),
('Chichen Itza', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Piramide_Chichen-Itza_-_panoramio_%282%29.jpg/520px-Piramide_Chichen-Itza_-_panoramio_%282%29.jpg'),
('Edzna','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/15-07-14-Edzna-Campeche-Mexico-RalfR-WMA_0700-edit.jpg/440px-15-07-14-Edzna-Campeche-Mexico-RalfR-WMA_0700-edit.jpg'),
('Temple of Quetzalcoatl','https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Teotihuac%C3%A1n%2C_M%C3%A9xico%2C_2013-10-13%2C_DD_80.JPG/600px-Teotihuac%C3%A1n%2C_M%C3%A9xico%2C_2013-10-13%2C_DD_80.JPG'),
('Pyramid of Cestius','https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Pyramid_of_cestius.jpg/440px-Pyramid_of_cestius.jpg'),
('Gopuram','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Big_Temple-Temple.jpg/472px-Big_Temple-Temple.jpg'),
('Meroë','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/NubianMeroePyramids30sep2005%282%29.jpg/500px-NubianMeroePyramids30sep2005%282%29.jpg');