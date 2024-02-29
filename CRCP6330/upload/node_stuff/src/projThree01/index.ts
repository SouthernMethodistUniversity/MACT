// import * as THREE from 'three';
import { AmbientLight, BasicShadowMap, BoxGeometry, Color, DefaultLoadingManager, DirectionalLight, Mesh, MeshBasicMaterial, MeshPhongMaterial, PCFSoftShadowMap, PerspectiveCamera, PlaneGeometry, Scene, WebGLRenderer } from 'three'
import { randFloat } from 'three/src/math/MathUtils';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'


const scene = new Scene();
const camera = new PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

const renderer = new WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);

renderer.shadowMap.enabled = true;
renderer.shadowMap.type = PCFSoftShadowMap;


const controls = new OrbitControls(camera, renderer.domElement);
controls.autoRotateSpeed = 1;

document.body.appendChild(renderer.domElement);

// GROUND PLANE
const myColor = new Color(.6, .6, .6); // neutralized
const groundGeom = new PlaneGeometry(20000, 20000, 1, 1);
const groundMat = new MeshPhongMaterial({
    color: myColor,
    specular: new Color(randFloat(.85, 1), randFloat(.85, 1), randFloat(.85, 1)),
    wireframe: false,
    transparent: true,
    opacity: .75,
    shininess: randFloat(2.8, 5.3)
});
const groundMesh = new Mesh(groundGeom, groundMat);

groundMesh.translateY(-5.2);
groundMesh.rotateX(-Math.PI / 2);
groundMesh.receiveShadow = true;
scene.add(groundMesh);

const geometry = new BoxGeometry(1, 1, 1);
const material = new MeshPhongMaterial({ color: 0xCCCCCC });

const cube = new Mesh(geometry, material);
cube.castShadow = true;
scene.add(cube);
camera.position.z = randFloat(2, 8);

// add ambient lighting
const ambientTexturesLight = new AmbientLight(new Color(randFloat(.8, .8), randFloat(.8, .8), randFloat(.8, .8)), randFloat(.4, .8));
scene.add(ambientTexturesLight);

// add directional lighting
const col1 = new Color(randFloat(.4, 1), randFloat(.4, 1), randFloat(.4, 1));
const intensity1 = randFloat(.9, 1);
const light1 = new DirectionalLight(col1, intensity1);
light1.position.set(-90, 350, 240);
light1.castShadow = true;
scene.add(light1);

const col2 = new Color(randFloat(.4, 1), randFloat(.4, 1), randFloat(.4, 1));
const intensity = randFloat(.9, 1);
const light = new DirectionalLight(col2, intensity);
light.position.set(90, 350, 240);
light.castShadow = true;
scene.add(light);


function animate() {
    requestAnimationFrame(animate);
    controls.update();
    controls.autoRotate = true;


    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;

    renderer.render(scene, camera);
}

animate();
