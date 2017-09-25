function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

/*
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 *
 * 
 */

var _utilsFlatten = require('../../utils/flatten');

var _utilsFlatten2 = _interopRequireDefault(_utilsFlatten);

var _constantsMarkers = require('../../constants/markers');

var _constantsMarkers2 = _interopRequireDefault(_constantsMarkers);

function printFunctionTypeParam(print, node) {
  return (0, _utilsFlatten2['default'])([print(node.name), _constantsMarkers2['default'].noBreak, node.optional ? '?:' : ':', _constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, print(node.typeAnnotation)]);
}

module.exports = printFunctionTypeParam;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9yZXByaW50LWpzL3ByaW50ZXJzL3NpbXBsZS9wcmludEZ1bmN0aW9uVHlwZVBhcmFtLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs0QkFhb0IscUJBQXFCOzs7O2dDQUNyQix5QkFBeUI7Ozs7QUFFN0MsU0FBUyxzQkFBc0IsQ0FBQyxLQUFZLEVBQUUsSUFBdUIsRUFBUztBQUM1RSxTQUFPLCtCQUFRLENBQ2IsS0FBSyxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsRUFDaEIsOEJBQVEsT0FBTyxFQUNmLElBQUksQ0FBQyxRQUFRLEdBQUcsSUFBSSxHQUFHLEdBQUcsRUFDMUIsOEJBQVEsT0FBTyxFQUNmLDhCQUFRLEtBQUssRUFDYixLQUFLLENBQUMsSUFBSSxDQUFDLGNBQWMsQ0FBQyxDQUMzQixDQUFDLENBQUM7Q0FDSjs7QUFFRCxNQUFNLENBQUMsT0FBTyxHQUFHLHNCQUFzQixDQUFDIiwiZmlsZSI6InByaW50RnVuY3Rpb25UeXBlUGFyYW0uanMiLCJzb3VyY2VzQ29udGVudCI6WyIvKlxuICogQ29weXJpZ2h0IChjKSAyMDE1LXByZXNlbnQsIEZhY2Vib29rLCBJbmMuXG4gKiBBbGwgcmlnaHRzIHJlc2VydmVkLlxuICpcbiAqIFRoaXMgc291cmNlIGNvZGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIGxpY2Vuc2UgZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBpblxuICogdGhlIHJvb3QgZGlyZWN0b3J5IG9mIHRoaXMgc291cmNlIHRyZWUuXG4gKlxuICogQGZsb3dcbiAqL1xuXG5pbXBvcnQgdHlwZSB7RnVuY3Rpb25UeXBlUGFyYW19IGZyb20gJ2FzdC10eXBlcy1mbG93JztcbmltcG9ydCB0eXBlIHtMaW5lcywgUHJpbnR9IGZyb20gJy4uLy4uL3R5cGVzL2NvbW1vbic7XG5cbmltcG9ydCBmbGF0dGVuIGZyb20gJy4uLy4uL3V0aWxzL2ZsYXR0ZW4nO1xuaW1wb3J0IG1hcmtlcnMgZnJvbSAnLi4vLi4vY29uc3RhbnRzL21hcmtlcnMnO1xuXG5mdW5jdGlvbiBwcmludEZ1bmN0aW9uVHlwZVBhcmFtKHByaW50OiBQcmludCwgbm9kZTogRnVuY3Rpb25UeXBlUGFyYW0pOiBMaW5lcyB7XG4gIHJldHVybiBmbGF0dGVuKFtcbiAgICBwcmludChub2RlLm5hbWUpLFxuICAgIG1hcmtlcnMubm9CcmVhayxcbiAgICBub2RlLm9wdGlvbmFsID8gJz86JyA6ICc6JyxcbiAgICBtYXJrZXJzLm5vQnJlYWssXG4gICAgbWFya2Vycy5zcGFjZSxcbiAgICBwcmludChub2RlLnR5cGVBbm5vdGF0aW9uKSxcbiAgXSk7XG59XG5cbm1vZHVsZS5leHBvcnRzID0gcHJpbnRGdW5jdGlvblR5cGVQYXJhbTtcbiJdfQ==