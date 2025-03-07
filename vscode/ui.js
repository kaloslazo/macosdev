// vscode ui enhancements
const enhanceUI = {
    init() {
        this.setupObserver();
        this.applyEnhancements();

        // reapply when theme changes
        window.addEventListener('vscode-theme-changed', () => {
            setTimeout(() => this.applyEnhancements(), 100);
        });
    },

    setupObserver() {
        const observer = new MutationObserver(() => {
            this.handleSuggestWidgetLayout();
            this.improveWidgetPositioning();
        });

        observer.observe(document, {
            childList: true,
            subtree: true
        });
    },

    applyEnhancements() {
        this.handleSuggestWidgetLayout();
        this.improveWidgetPositioning();
        this.addSubtleTransitions();
    },

    handleSuggestWidgetLayout() {
        // adjust suggest widget margins
        const container = document.querySelector('.suggest-details-container');
        const widget = Array.from(document.querySelectorAll('.suggest-widget'))
            .find(el => el.style.display === "block");

        if (!container) return;

        container.style.margin = '0px';

        if (widget) {
            const containerRect = container.getBoundingClientRect();
            const widgetRect = widget.getBoundingClientRect();

            if (widgetRect.y < containerRect.y && widgetRect.left === containerRect.left) {
                container.style.marginTop = '6px';
            } else if (widgetRect.x > containerRect.x) {
                container.style.marginLeft = '-6px';
            } else {
                container.style.marginLeft = '6px';
            }
        }
    },

    improveWidgetPositioning() {
        // ensure widgets don't overlap awkwardly
        const widgets = document.querySelectorAll('.editor-widget');
        widgets.forEach(widget => {
            if (!widget.classList.contains('positioned') && widget.style.display !== 'none') {
                widget.classList.add('positioned');

                // ensure widgets don't go off-screen
                const rect = widget.getBoundingClientRect();
                if (rect.right > window.innerWidth) {
                    widget.style.left = `${window.innerWidth - rect.width - 20}px`;
                }
                if (rect.bottom > window.innerHeight) {
                    widget.style.top = `${window.innerHeight - rect.height - 20}px`;
                }
            }
        });
    },

    addSubtleTransitions() {
        // add smooth transitions to interactive elements
        const elements = document.querySelectorAll('.monaco-list-row, .action-item, .monaco-button, .tab');
        elements.forEach(el => {
            if (!el.classList.contains('with-transition')) {
                el.classList.add('with-transition');
                el.style.transition = 'background-color 0.15s ease';
            }
        });
    }
};

// initialize when dom is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => enhanceUI.init());
} else {
    enhanceUI.init();
}

// improve tree animation
setInterval(() => {
    const treeItems = document.querySelectorAll('.monaco-tl-twistie');
    treeItems.forEach(item => {
        if (!item.style.transition) {
            item.style.transition = 'transform 0.15s ease';
        }
    });
}, 1000);