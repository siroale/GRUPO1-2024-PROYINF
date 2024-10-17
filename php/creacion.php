<!DOCTYPE html>

<head>

    <link rel="stylesheet" href="../css/style.css">

</head>

<body>

    <?php       
    session_start();
    include "includes/dbinc.php";
   
    if (isset($_SESSION['user_name'])) {
        $nombreUsuario = $_SESSION['user_name'];
    } else {
        $nombreUsuario = 'Invitado';
    } 
    ?>

    <button id="openModalBtn" class="upload-button">
            <span class="btn__icon">
                <svg stroke-linejoin="round" stroke-linecap="round" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path fill="none" d="M0 0h24v24H0z" stroke="none"></path>
                    <path d="M7 18a4.6 4.4 0 0 1 0 -9a5 4.5 0 0 1 11 2h1a3.5 3.5 0 0 1 0 7h-1"></path>
                    <path d="M9 15l3 -3l3 3"></path>
                    <path d="M12 12l0 9"></path>
                </svg>
            </span>
            <span class="btn__text">Upload</span>
    </button>

    <!-- Un boton chanta de logout -->
    <div class="navbar-text">
        <?php echo "Hola, $nombreUsuario"; ?> <!-- Muestra el nombre del usuario -->
    </div>
    <div class="ml-auto">
        <form action="includes/logout.php" method="POST"> <!-- El formulario para hacer logout -->
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>

    <!-- Boton que descarga mockup de pdf -->
    <div id="generacion">
    <form action="descargar.php" method="post">
        <input type="submit" name="submit" value="Generar pdf">
    </form>
    </div>

    <div id="uploadModal" class="modal">
        <div class="modal-header">
            <div class="modal-logo">
                <span class="logo-circle">
                    <svg
                    xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink"
                    width="25"
                    height="25"
                    viewBox="0 0 512 419.116"
                    >
                    <defs>
                        <clipPath id="clip-folder-new">
                        <rect width="512" height="419.116"></rect>
                        </clipPath>
                    </defs>
                    <g id="folder-new" clip-path="url(#clip-folder-new)">
                        <path
                        id="Union_1"
                        data-name="Union 1"
                        d="M16.991,419.116A16.989,16.989,0,0,1,0,402.125V16.991A16.989,16.989,0,0,1,16.991,0H146.124a17,17,0,0,1,10.342,3.513L227.217,57.77H437.805A16.989,16.989,0,0,1,454.8,74.761v53.244h40.213A16.992,16.992,0,0,1,511.6,148.657L454.966,405.222a17,17,0,0,1-16.6,13.332H410.053v.562ZM63.06,384.573H424.722L473.86,161.988H112.2Z"
                        fill="var(--c-action-primary)"
                        stroke=""
                        stroke-width="1"
                        ></path>
                    </g>
                    </svg>
                </span>
            </div>
            <p class="modal-title">Subir Archivo</p>
            <button id="closeModalBtn" class="btn-close">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24">
                    <path fill="none" d="M0 0h24v24H0V0z"></path>
                    <path
                    d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"
                    fill="var(--c-text-secondary)"
                    ></path>
                </svg>
            </button>
        </div>
        <form action="upload.php" method="post" enctype="multipart/form-data">
            <div class="modal-body">

                <div class="card-file">
                    <label class="input_label">Nombre Archivo</label>
                    <input class="input_field" type="text" name="nombre" required>
                </div>

                <div class="card-file">
                    <label class="input_label">Descripcion</label>
                    <input class="input_field" type="text" name="descripcion" required>
                </div>

                <p class="modal-description">Adjunta un archivo debajo</p>
                <button id="uploadArea" class="upload-area">
                    <input type="file" id="fileInput" name="file" style="display: none;" required>
                    <span class="upload-area-icon">
                        <svg
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        width="35"
                        height="35"
                        viewBox="0 0 340.531 419.116"
                        >
                        <g id="files-new" clip-path="url(#clip-files-new)">
                            <path
                            id="Union_2"
                            data-name="Union 2"
                            d="M-2904.708-8.885A39.292,39.292,0,0,1-2944-48.177V-388.708A39.292,39.292,0,0,1-2904.708-428h209.558a13.1,13.1,0,0,1,9.3,3.8l78.584,78.584a13.1,13.1,0,0,1,3.8,9.3V-48.177a39.292,39.292,0,0,1-39.292,39.292Zm-13.1-379.823V-48.177a13.1,13.1,0,0,0,13.1,13.1h261.947a13.1,13.1,0,0,0,13.1-13.1V-323.221h-52.39a26.2,26.2,0,0,1-26.194-26.195v-52.39h-196.46A13.1,13.1,0,0,0-2917.805-388.708Zm146.5,241.621a14.269,14.269,0,0,1-7.883-12.758v-19.113h-68.841c-7.869,0-7.87-47.619,0-47.619h68.842v-18.8a14.271,14.271,0,0,1,7.882-12.758,14.239,14.239,0,0,1,14.925,1.354l57.019,42.764c.242.185.328.485.555.671a13.9,13.9,0,0,1,2.751,3.292,14.57,14.57,0,0,1,.984,1.454,14.114,14.114,0,0,1,1.411,5.987,14.006,14.006,0,0,1-1.411,5.973,14.653,14.653,0,0,1-.984,1.468,13.9,13.9,0,0,1-2.751,3.293c-.228.2-.313.485-.555.671l-57.019,42.764a14.26,14.26,0,0,1-8.558,2.847A14.326,14.326,0,0,1-2771.3-147.087Z"
                            transform="translate(2944 428)"
                            fill="var(--c-action-primary)"
                            ></path>
                        </g>
                        </svg>
                    </span>
                    <span class="upload-area-title">Drag file(s) here to upload.</span>
                    <span class="upload-area-description">
                        Alternatively, you can select a file by <br /><strong
                        >clicking here</strong
                        >
                    </span>
                </button>
                <div id="uploadDone" style="display: none;">Subido!</div>
            </div>
            <div class="modal-footer">
                <button class="btn-primary">Upload File</button>
            </div>
        </form>
    </div>
    


    <!-- Scripts para controlar el modal -->
    <script>
        // Obtener elementos del DOM
        var modal = document.getElementById("uploadModal");
        var openModalBtn = document.getElementById("openModalBtn");
        var closeModalBtn = document.getElementById("closeModalBtn");

        // Abrir el modal al hacer clic en el botón "Upload"
        openModalBtn.onclick = function() {
            modal.style.display = "block";
        }

        // Cerrar el modal al hacer clic en el botón de cerrar
        closeModalBtn.onclick = function() {
            modal.style.display = "none";
        }

        // Cerrar el modal si el usuario hace clic fuera del contenido del modal
        window.onclick = function(event) {
            if (event.target != modal && event.target != upload-button) {
                modal.style.display = "none";
            }
        }

        uploadArea.onclick = function() {
            fileInput.click();
        }

        // Funcionalidad Drag & Drop
        uploadArea.addEventListener('dragover', (event) => {
            event.preventDefault();
            uploadArea.classList.add('drag-over');  // Resaltar el área
        });

        uploadArea.addEventListener('dragleave', () => {
            uploadArea.classList.remove('drag-over');  // Quitar el resaltado
        });

        uploadArea.addEventListener('drop', (event) => {
            event.preventDefault();
            uploadArea.classList.remove('drag-over');  // Quitar el resaltado

            // Obtener los archivos arrastrados
            const files = event.dataTransfer.files;

            // Asignar el archivo arrastrado al input de archivo
            fileInput.files = files;

            uploadArea.style.display = 'none';

            uploadDone.style.display = 'block';
        });
    </script>

</body>