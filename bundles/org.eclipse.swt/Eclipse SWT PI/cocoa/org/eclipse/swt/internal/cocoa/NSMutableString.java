/*******************************************************************************
 * Copyright (c) 2000, 2019 IBM Corporation and others.
 *
 * This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License 2.0
 * which accompanies this distribution, and is available at
 * https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    IBM Corporation - initial API and implementation
 *******************************************************************************/
package org.eclipse.swt.internal.cocoa;

public class NSMutableString extends NSString {

public NSMutableString() {
	super();
}

public NSMutableString(long /*int*/ id) {
	super(id);
}

public NSMutableString(id id) {
	super(id);
}

public void appendString(NSString aString) {
	OS.objc_msgSend(this.id, OS.sel_appendString_, aString != null ? aString.id : 0);
}

public void replaceCharactersInRange(NSRange range, NSString aString) {
	OS.objc_msgSend(this.id, OS.sel_replaceCharactersInRange_withString_, range, aString != null ? aString.id : 0);
}

public void setString(NSString aString) {
	OS.objc_msgSend(this.id, OS.sel_setString_, aString != null ? aString.id : 0);
}

public static NSString string() {
	long /*int*/ result = OS.objc_msgSend(OS.class_NSMutableString, OS.sel_string);
	return result != 0 ? new NSString(result) : null;
}

public static NSString stringWithCharacters(char[] characters, long /*int*/ length) {
	long /*int*/ result = OS.objc_msgSend(OS.class_NSMutableString, OS.sel_stringWithCharacters_length_, characters, length);
	return result != 0 ? new NSMutableString(result) : null;
}

public static NSString stringWithUTF8String(long /*int*/ nullTerminatedCString) {
	long /*int*/ result = OS.objc_msgSend(OS.class_NSMutableString, OS.sel_stringWithUTF8String_, nullTerminatedCString);
	return result != 0 ? new NSString(result) : null;
}

}
