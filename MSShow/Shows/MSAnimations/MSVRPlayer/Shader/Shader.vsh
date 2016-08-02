//
//  Shader.vsh
//
//  Created by mr.scorpion on 11/8/15.
//  Copyright © 2015 mr.scorpion. All rights reserved.
//

attribute vec4 position;
attribute vec2 texCoord;

varying vec2 v_textureCoordinate;

uniform mat4 modelViewProjectionMatrix;

void main() {
  v_textureCoordinate = texCoord;
  gl_Position = modelViewProjectionMatrix * position;
}
