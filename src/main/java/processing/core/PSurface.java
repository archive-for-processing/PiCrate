/* -*- mode: java; c-basic-offset: 2; indent-tabs-mode: nil -*- */

 /*
  Part of the Processing project - http://processing.org

  Copyright (c) 2014-15 The Processing Foundation

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation, version 2.1.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
 */
package processing.core;

/**
 *
 * @author Martin Prout
 */
public interface PSurface {

  /**
   * Minimum dimensions for the window holding an applet.
   */
  int MIN_WINDOW_WIDTH = 128;

  /**
   *
   */
  int MIN_WINDOW_HEIGHT = 128;

  // renderer that doesn't draw to the screen
  /**
   *
   * @param sketch
   */
  void initOffscreen(PApplet sketch);

  // considering removal in favor of separate Component classes for appropriate renderers
  // (i.e. for Java2D or a generic Image surface, but not PDF, debatable for GL or FX)
  //Component initComponent(PApplet sketch);
  //Frame initFrame(PApplet sketch, Color backgroundColor,
//  void initFrame(PApplet sketch, int backgroundColor,
//                        int deviceIndex, boolean fullScreen, boolean spanDisplays);
  /**
   *
   * @param sketch
   */
  void initFrame(PApplet sketch);

  /**
   * Get the native window object associated with this drawing surface. For
   * Java2D, this will be an AWT Frame object. For OpenGL, the window. The data
   * returned here is subject to the whims of the renderer, and using this
   * method means you're willing to deal with underlying implementation changes
   * and that you won't throw a fit like a toddler if your code breaks sometime
   * in the future.
   *
   * @return
   */
  Object getNative();

  //
  // Just call these on an AWT Frame object stored in PApplet.
  // Silly, but prevents a lot of rewrite and extra methods for little benefit.
  // However, maybe prevents us from having to document the 'frame' variable?
  /**
   * Set the window (and dock, or whatever necessary) title.
   *
   * @param title
   */
  void setTitle(String title);

  /**
   * Show or hide the window.
   *
   * @param visible
   */
  void setVisible(boolean visible);

  /**
   * Set true if we want to resize things (default is not resizable)
   *
   * @param resizable
   */
  void setResizable(boolean resizable);

  /**
   * Dumb name, but inherited from Frame and no better ideas.
   *
   * @param always
   */
  void setAlwaysOnTop(boolean always);

  /**
   *
   * @param icon
   */
  void setIcon(PImage icon);

  //
//  void placeWindow(int[] location);
  /**
   *
   * @param location
   * @param editorLocation
   */
  void placeWindow(int[] location, int[] editorLocation);

  //void placeFullScreen(boolean hideStop);
  /**
   *
   * @param stopColor
   */
  void placePresent(int stopColor);

  // Sketch is running from the PDE, set up messaging back to the PDE
  /**
   *
   */
  void setupExternalMessages();

  //
  // sets displayWidth/Height inside PApplet
  //void checkDisplaySize();
  /**
   *
   * @param x
   * @param y
   */
  void setLocation(int x, int y);

  /**
   *
   * @param width
   * @param height
   */
  void setSize(int width, int height);

//  /**
//   * Called by {@link PApplet#createGraphics} to initialize the
//   * {@link PGraphics#image} object with an image that's compatible with this
//   * drawing surface/display/hardware.
//   * @param gr PGraphics object whose image will be set
//   * @param wide
//   * @param high
//   */
  // create pixel buffer (pulled out for offscreen graphics)
  //void initImage(PGraphics gr, int wide, int high);
  // create pixel buffer, called from allocate() to produce a compatible image for rendering efficiently
//  void initImage(PGraphics gr);
  //Component getComponent();
//  /**
//   * Sometimes smoothing must be set at the drawing surface level
//   * not just inside the renderer itself.
//   */
//  void setSmooth(int level);
  /**
   *
   * @param fps
   */
  void setFrameRate(float fps);

//  // called on the first frame so that the now-visible drawing surface can
//  // receive key and mouse events
//  void requestFocus();
//  // finish rendering to the screen (called by PApplet)
//  void blit();
  //
  /**
   *
   * @param kind
   */
  void setCursor(int kind);

  /**
   *
   * @param image
   * @param hotspotX
   * @param hotspotY
   */
  void setCursor(PImage image, int hotspotX, int hotspotY);

  /**
   *
   */
  void showCursor();

  /**
   *
   */
  void hideCursor();

  //
  /**
   * Start the animation thread
   */
  void startThread();

  /**
   * On the next trip through the animation thread, things should go sleepy-bye.
   * Does not pause the thread immediately because that needs to happen on the
   * animation thread itself, so fires on the next trip through draw().
   */
  void pauseThread();

  /**
   *
   */
  void resumeThread();

  /**
   * Stop the animation thread (set it null)
   *
   * @return false if already stopped
   */
  boolean stopThread();

  /**
   *
   * @return
   */
  boolean isStopped();
}
