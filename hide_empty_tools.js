import { uiModules } from 'ui/modules';
import chrome from 'ui/chrome';
import { DevToolsRegistryProvider } from 'ui/registry/dev_tools';

export function hideEmptyDevTools(Private) {
  const hasTools = !!Private(DevToolsRegistryProvider).length;
  if (!hasTools) {
    const navLink = chrome.getNavLinkById('kibana:dev_tools');
    navLink.hidden = true;
    const navLink2 = chrome.getNavLinkById('kibana:management');
    navLink2.hidden = true;
  }
}

uiModules.get('kibana').run(hideEmptyDevTools);