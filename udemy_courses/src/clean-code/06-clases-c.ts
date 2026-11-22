(() => {

    // Aplicando el principio de responsabilidad única

    type Gender = 'M'|'F';

    class Person {
        public birthdate: Date;
        public gender   : Gender;
        public name     : string;

        constructor({ name, gender, birthdate }: Person ){
            this.name      = name;
            this.gender    = gender;
            this.birthdate = birthdate;
        }
    }

    class User {
        
        public email: string;
        public role : string;
        public lastAccess: Date;

        constructor({
            email,
            role,
        }: User ) {
            this.lastAccess = new Date();
            this.email = email;
            this.role  = role;
        }

        checkCredentials() {
            return true;
        }
    }

    class Settings {

        public workingDirectory: string;
        public lastOpenFolder  : string;

        constructor({
            workingDirectory,
            lastOpenFolder
        }: Settings ) {
            this.workingDirectory = workingDirectory;
            this.lastOpenFolder   = lastOpenFolder;
        }
    }


    const userSettings = new Settings({
        lastOpenFolder: '/home',
        workingDirectory: '/usr/home',
    });

    console.log({ userSettings });
    })();
