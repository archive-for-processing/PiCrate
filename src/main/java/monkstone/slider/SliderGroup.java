/* 
 * Copyright (c) 2016-20 Martin Prout
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
package monkstone.slider;

import java.util.ArrayList;
import java.util.List;
import processing.core.PApplet;

/**
 *
 * @author Martin Prout
 */
public class SliderGroup {

    int count = 0;
    List<Slider> sliders;
    PApplet applet;
    boolean vertical;

    /**
     *
     * @param outer
     */
    public SliderGroup(final PApplet outer) {
        applet = outer;
        sliders = new ArrayList<>();
        vertical = false;
    }

    /**
     *
     */
    public void vertical() {
        vertical = true;
    }

    /**
     *
     * @param beginRange
     * @param endRange
     * @param initial
     */
    public void addSlider(float beginRange, float endRange, float initial) {
        if (vertical) {
            sliders.add(new SimpleVerticalSlider(applet, beginRange, endRange, initial, count));
        } else {
            sliders.add(new SimpleHorizontalSlider(applet, beginRange, endRange, initial, count));
        }
        count = sliders.size();
    }

    /**
     *
     * @param count
     * @return
     */
    public float readValue(int count) {
        return sliders.get(count).readValue();
    }

}
