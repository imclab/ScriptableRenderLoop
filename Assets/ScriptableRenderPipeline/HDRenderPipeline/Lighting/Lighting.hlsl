#ifndef UNITY_LIGHTING_INCLUDED
#define UNITY_LIGHTING_INCLUDED

#include "ShaderLibrary/CommonLighting.hlsl"
#include "ShaderLibrary/CommonShadow.hlsl"
#include "ShaderLibrary/Sampling.hlsl"
#include "ShaderLibrary/AreaLighting.hlsl"
#include "ShaderLibrary/ImageBasedLighting.hlsl"

// The light loop (or lighting architecture) is in charge to:
// - Define light list
// - Define the light loop
// - Setup the constant/data
// - Do the reflection hierarchy
// - Provide sampling function for shadowmap, ies, cookie and reflection (depends on the specific use with the light loops like index array or atlas or single and texture format (cubemap/latlong))

#define HAS_LIGHTLOOP // Allow to not define LightLoop related function in Material.hlsl

#include "HDRenderPipeline/Lighting/LightDefinition.cs.hlsl"
#include "HDRenderPipeline/Lighting/LightUtilities.hlsl"

#if defined(LIGHTLOOP_SINGLE_PASS) || defined(LIGHTLOOP_TILE_PASS)
#include "HDRenderPipeline/Lighting/TilePass/TilePass.hlsl"
#endif

// Shadow use samling function define in header above and must be include before Material.hlsl
#include "HDRenderPipeline/Shadow/Shadow.hlsl"
#include "HDRenderPipeline/Material/Material.hlsl"

// LightLoop use evaluation BSDF function for light type define in Material.hlsl
#if defined(LIGHTLOOP_SINGLE_PASS) || defined(LIGHTLOOP_TILE_PASS)
#include "HDRenderPipeline/Lighting/TilePass/TilePassLoop.hlsl"
#endif


#endif // UNITY_LIGHTING_INCLUDED