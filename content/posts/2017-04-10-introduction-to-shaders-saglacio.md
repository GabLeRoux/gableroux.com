---
omit_header_text: true
categories:
    - presentation
date: 2017-04-10 18:30:00
featured_image: /images/introduction-to-shaders.jpg
tags:
    - presentation
    - saglacio
    - unity3d
    - shaders
    - compute-shaders
title: "Introduction to Shaders"
aliases:
    - /2017/04/10/introduction-to-shaders-saglacio/
    - /presentation/2017/04/10/introduction-to-shaders-saglacio/
---

I gave a presentation with [Jules Robichaud-Gagnon](https://github.com/jrobichaud) about [Shaders][shader] and [Compute Shaders][compute-shaders] at the [SagLacIO][saglacio]. Here are the slides.

<!--more-->

We did a small introduction to shaders, how it works from GPU -\> vector world -\> Sampling -\> raster world -\> Your eyes. We also covered how we can use the GPU to calculate physics using Compute Shaders.

## slides

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x10.gif" alt="placeholder"/>
        <iframe src="https://docs.google.com/presentation/d/1Dc-4ixLNzCusXy8nZ_XSFk4l-CuCbSHmNgBa2IRIEaw/embed?start=false&loop=false" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </div>
</div>

## demo

<div class="responsive-iframe-wrapper">
    <div class="responsive-iframe">
        <img class="ratio" src="/images/layout/placeholder_16x9.gif" alt="placeholder"/>
        <iframe src="https://www.youtube.com/embed/Cs6IpltBAWo?ecver=1" frameborder="0" allowfullscreen></iframe>
    </div>
</div>

## Cool links

* [Nice tutorial about Shaders on Tutsplus][tutsplus-tutorial]
* [ShaderToy][shadertoy], an awesome shader web playground
* [Shader Forge Unity package][shaderforge] to build shaders using a visual editor
* <span data-proofer-ignore>[UBER Standard Shader Ultra Unity Package][uber]</span> for some great ready to use shaders
* [GPU Accelerated Voxel Solver][gpu-accelerated-voxel-physics-solver] amazing Compute Shader demo with Unity Metal support
* [Unity3d Mirror script][unity3d-mirror] which is not a shader, but does reflect some of the shaders

## Screenshots and photos

### [GPU Accelerated Voxel Solver][gpu-accelerated-voxel-physics-solver] example
![00jknight GPU voxel explosion compute shaders gif](https://media.giphy.com/media/xUA7aOGKYaEtILpD68/giphy.gif)

### Shaders POM example
![Shaders-pom-example](/images/shaders/shaders-pom-example.jpg)

### Jules, me and a cube
![Jules, me and a cube](/images/shaders/jules-and-gabriel-at-the-saglacio.jpg)

### Jules, me and a cube on a mac, credits [@LeBodro][@LeBodro]
![Jules, me and a cube on a mac](/images/shaders/jules-and-gabriel-at-the-saglacio-on-mac.jpg)

[unity3d-mirror]: http://wiki.unity3d.com/index.php/MirrorReflection4
[uber]: https://www.assetstore.unity3d.com/en/#!/content/39959
[shader-forge]: http://acegikmo.com/shaderforge/
[tutsplus-tutorial]: https://gamedevelopment.tutsplus.com/tutorials/a-beginners-guide-to-coding-graphics-shaders--cms-23313
[shadertoy]: https://www.shadertoy.com/
[gpu-accelerated-voxel-physics-solver]: http://www.00jknight.com/blog/gpu-accelerated-voxel-physics-solver
[@leBodro]: https://twitter.com/LeBodro
[saglacio]: http://saglac.io
[compute-shaders]: https://docs.unity3d.com/Manual/ComputeShaders.html
[shader]: https://en.wikipedia.org/wiki/Shader
