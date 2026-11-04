<div dir="rtl">

<p align="center"><img src="assets/icon.svg" width="72" height="72" alt="EL7.AI"></p>

# خادم EL7.AI لبروتوكول MCP

استخبارات وأبحاث الأسواق المالية لمساعدك الذكي.

[English](README.md) · [التوثيق](https://el7.ai/ar/mcp) · [مرجع الأدوات](https://el7.ai/guides/mcp-tool-reference.html)

> **خادم EL7.AI خدمة مستضافة مملوكة لـ EL7.AI؛ ولا يحتوي هذا المستودع إلا على إعدادات الاتصال والتوثيق.** لا توجد هنا أي شيفرة للخادم، ولا شيء يُثبَّت أو يُشغَّل محليًا.

## ما هو

EL7.AI منصة لاستخبارات وأبحاث الأسواق المالية. يمنح خادم MCP الخاص بها مساعدك الذكي 85 أداة للقراءة فقط موزعة على 15 مجالًا من أبحاث الأسواق، ليجيب من بيانات منتقاة وموثقة المصدر بدل التخمين.

التغطية: أخبار الأسواق لحظة بلحظة وEL7 Wire؛ الأجندة الاقتصادية العالمية مع السجل التاريخي والتوقعات ومؤشر المفاجآت؛ ثمانية بنوك مركزية (الفيدرالي، والمركزي الأوروبي، وبنك إنجلترا، وبنك اليابان، وبنك كندا، والاحتياطي الأسترالي، والاحتياطي النيوزيلندي، والوطني السويسري) بقراراتها وبياناتها والفروق بين البيانات المتتالية وأسئلة المؤتمرات الصحفية والمعاينات وترتيب النبرة؛ تمركزات المتداولين في تقرير CFTC؛ أساسيات الذهب والنفط من تدفقات واحتياطيات ومخزونات وأوبك والعرض والطلب؛ الأسهم بتقييماتها وتحليلاتها المكتوبة وترتيبها والفرز والقطاعات وإجماع المحللين ومواعيد النتائج وتاريخها وصفقات المطلعين وأعضاء الكونغرس؛ صناديق ETF؛ نظام السوق والموسمية والارتباطات والدورات؛ أسواق التوقعات؛ استراتيجيات التداول؛ ومكتبة الأبحاث. الخدمة موجهة لجمهور عالمي: الإنجليزية أولًا مع دعم كامل للعربية (مرِّر `lang: "ar"`).

تعيد كل إجابة تاريخ المصدر ورابطًا على el7.ai للتحقق من الأرقام، ويُشار إلى التاريخ المفقود بأنه غير متحقق منه. تقرأ الأدوات بيانات EL7 المخزنة والمنشورة: لا تنفذ صفقات ولا تنشئ تحليلًا جديدًا وقت الاستدعاء، وقد يستخدم البحث في الأخبار خدمة خارجية لتمثيل النص.

## الخادم

| | |
|---|---|
| العنوان | `https://mcp.el7.ai/mcp` |
| بروتوكول النقل | Streamable HTTP |
| الاسم في السجل | `ai.el7/mcp` (انظر [`server.json`](server.json)) |
| مفتاح الإعداد | `el7` |

استخدم العنوان كاملًا منتهيًا بـ `/mcp`، ولا تُضف إليه أي معاملات استعلام، لأن مورد OAuth يجب أن يطابقه حرفيًا.

## المصادقة

OAuth 2.1 مع PKCE والتسجيل الديناميكي للعملاء (الطريقة الموصى بها)، أو مفتاح EL7 MCP شخصي مرتبط بصاحبه (`el7_mcp_…`) يُرسَل رمزًا من نوع Bearer.

تسجّل معظم التطبيقات (Claude وChatGPT وCodex وAntigravity وCursor وVS Code وZed وGoose) الدخول عبر OAuth ولا تحتاج إلى مفتاح. أنشئ مفتاحًا فقط للتطبيقات التي لا تدعم OAuth، من قسم «اتصالك» في صفحة https://el7.ai/ar/mcp.

## الوصول

يتطلب عضوية EL7 مدفوعة. تستطيع الحسابات المجانية استدعاء `el7_whoami` فقط، ولا تتاح الأدوات للمستخدم غير المسجل. الحدود: 10,000 استدعاء شهريًا و120 في الدقيقة.

## المجالات الخمسة عشر

الأعداد كما هي منشورة في https://el7.ai/ar/mcp (85 أداة إجمالًا).

| المجال | ما يعيده | الأدوات |
|---|---|---|
| الحساب | من هو المتصل وأي خطة تنطبق عليه. | 1 |
| الأخبار | أحدث الأخبار ونصوصها الكاملة والملخصات والمسارات الإخبارية والمعنويات. | 7 |
| التقويم الاقتصادي | الإصدارات القادمة والتاريخ والمفاجآت وقراءة كل دولة. | 6 |
| البنوك المركزية | القرارات والبيانات والمحاضر والنبرة وأسئلة المؤتمرات الصحفية. | 14 |
| مراكز المضاربين (CFTC) | مراكز المضاربين والتجاريين الأسبوعية في كل سوق. | 5 |
| النفط والطاقة | المخزونات والإمدادات وأوبك والتوقعات. | 5 |
| الذهب | مؤشر ظروف الذهب والتدفقات والاحتياطيات والعرض والطلب. | 5 |
| الأبحاث والرؤى | مقالات EL7 البحثية ورؤاه ولقاءاته. | 6 |
| تداولات المطلعين والكونغرس | صفقات المطلعين وأعضاء الكونغرس المُفصح عنها. | 4 |
| أسواق التنبؤ | عقود الأحداث والاحتمالات التي تعكسها. | 2 |
| الاستراتيجيات | مكتبة الاستراتيجيات والسلال ونتائجها المخزّنة. | 4 |
| تقارير الأسواق | الأنظمة السوقية والموسمية والارتباطات والدورات وردود فعل الأحداث. | 6 |
| الأسهم والأرباح وصناديق ETF | التقييمات والتحليل المكتوب والفرز وإجماع المحللين والأرباح وتدفقات الصناديق. | 16 |
| الأشخاص | أعضاء البنوك المركزية وشخصيات السوق الأخرى. | 3 |
| البحث بالذكاء الاصطناعي | اطرح سؤالًا مفتوحًا على قاعدة معرفة EL7. | 1 |

أسماء الأدوات وأوصافها كاملة: [مرجع الأدوات](https://el7.ai/guides/mcp-tool-reference.html) (أوصاف الأدوات بالإنجليزية لأن النموذج هو من يقرؤها).

## أمثلة على الأسئلة

1. لخّص أحدث قرار للاحتياطي الفيدرالي وما تغيّر في بيانه مقارنة بالبيان السابق، مع ذكر التواريخ.
2. رتّب البنوك المركزية الثمانية الكبرى حسب نبرتها الحالية من الأكثر تشددًا إلى الأكثر تيسيرًا، مع تاريخ كل مصدر.
3. ما تمركز المضاربين في الذهب وفق أحدث تقرير CFTC COT، وكيف تغيّر عن الأسبوع السابق؟
4. ما أعلى الإصدارات الاقتصادية تأثيرًا هذا الأسبوع، وكيف جاءت آخر قراءة لمؤشر أسعار المستهلكين الأمريكي مقارنة بالتوقعات؟
5. اعرض تحليل EL7 وتقييمه لسهم NVIDIA وآخر أربع مفاجآت في نتائجه.
6. ماذا أظهر أحدث تقرير لإدارة معلومات الطاقة الأمريكية (EIA) عن مخزونات الخام الأمريكية؟
7. ما أبرز أخبار الأسواق اليوم وكيف تفاعل الذهب والدولار؟

## الإعداد حسب التطبيق

كل إعداد أدناه موجود أيضًا ملفًا في مجلد [`configs/`](configs/)، وروابط التثبيت بنقرة واحدة في [`configs/install-links.txt`](configs/install-links.txt). الشيفرات تبقى كما هي دون ترجمة.

### Claude (الويب وتطبيق سطح المكتب والجوال)

يعمل الموصل الذي يُضاف مرة واحدة في Claude على الويب وفي Claude Desktop وتطبيق الجوال. يضيف Claude Desktop الخوادم البعيدة موصلاتٍ، لا عبر ملف `claude_desktop_config.json`.

1. افتح **Customize** ثم **Connectors**.
2. اختر **Add custom connector**.
3. أدخل الاسم `EL7.AI` والعنوان `https://mcp.el7.ai/mcp`.
4. تحت Authentication اختر **Sign in now** ثم **Use Claude's published identity**.
5. اضغط **Add**، وسجّل الدخول في el7.ai بحساب EL7 ووافق على الوصول.
6. في المحادثة اضغط **+** واختر **Connectors** وفعّل EL7.AI.

أو افتح النافذة معبّأة مسبقًا: [أضف EL7.AI إلى Claude](https://claude.ai/customize/connectors?modal=add-custom-connector&connectorName=EL7.AI&connectorUrl=https%3A%2F%2Fmcp.el7.ai%2Fmcp). الدليل الرسمي: https://claude.com/docs/connectors/custom/add-unlisted

### Claude Code

</div>

```sh
claude mcp add --transport http el7 https://mcp.el7.ai/mcp
# every project:
claude mcp add --transport http el7 --scope user https://mcp.el7.ai/mcp
```

<div dir="rtl">

ثم سجّل الدخول بالأمر `/mcp` داخل Claude Code واختر `el7`، أو بالأمر `claude mcp login el7`. ولملف المشروع `.mcp.json` ([`configs/claude-code-mcp.json`](configs/claude-code-mcp.json))، والحقل `type` إلزامي:

</div>

```json
{
  "mcpServers": {
    "el7": {
      "type": "http",
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

<div dir="rtl">

الدليل الرسمي: https://code.claude.com/docs/en/mcp

### ChatGPT

1. افتح **Settings** ثم **Security and login** وفعّل **Developer mode**.
2. افتح chatgpt.com/plugins واضغط **+** ثم **Add custom MCP server**.
3. أدخل الاسم `EL7.AI` واجعل Connection على **Server URL** والصق `https://mcp.el7.ai/mcp`.
4. اجعل Authentication على **OAuth**، وحدّد خانة الإقرار، وأنشئ الإضافة.
5. في المحادثة اضغط **+** بجوار مربع الكتابة، واكتب EL7.AI واختره ووافق على شاشة الاتصال.

خوادم MCP المخصصة غير متاحة في خطة ChatGPT المجانية. الدليل الرسمي: https://developers.openai.com/api/docs/guides/custom-mcp-server

### Codex

</div>

```sh
codex mcp add el7 --url https://mcp.el7.ai/mcp
codex mcp login el7
```

<div dir="rtl">

أو في الملف `~/.codex/config.toml` ([`configs/codex-config.toml`](configs/codex-config.toml))، وهو مشترك بين واجهة الأوامر وإضافة بيئة التطوير وتطبيق سطح المكتب:

</div>

```toml
[mcp_servers.el7]
url = "https://mcp.el7.ai/mcp"
```

<div dir="rtl">

ولاستخدام مفتاح API بدل OAuth ([`configs/codex-config-api-key.toml`](configs/codex-config-api-key.toml))، ضع المفتاح في متغير البيئة `EL7_MCP_KEY`:

</div>

```toml
[mcp_servers.el7]
url = "https://mcp.el7.ai/mcp"
bearer_token_env_var = "EL7_MCP_KEY"
```

<div dir="rtl">

الدليل الرسمي: https://developers.openai.com/codex/mcp

### Gemini

**إضافة Gemini CLI.** هذا المستودع إضافة لـ Gemini CLI ([`gemini-extension.json`](gemini-extension.json)):

</div>

```sh
gemini extensions install https://github.com/walidelhelw/el7-mcp
```

<div dir="rtl">

أو أضف الخادم إلى ملف `settings.json` في Gemini CLI ([`configs/gemini-settings.json`](configs/gemini-settings.json))؛ يحدد الحقل `httpUrl` نقل Streamable HTTP، ويتولى Gemini CLI تسجيل الدخول عبر OAuth:

</div>

```json
{
  "mcpServers": {
    "el7": {
      "httpUrl": "https://mcp.el7.ai/mcp"
    }
  }
}
```

<div dir="rtl">

الدليل الرسمي: https://geminicli.com/docs/tools/mcp-server/

**Antigravity.** ضع هذا في `~/.gemini/config/mcp_config.json`، أو في `.agents/mcp_config.json` لمساحة عمل واحدة ([`configs/antigravity-mcp_config.json`](configs/antigravity-mcp_config.json)). يجب أن يكون المفتاح `serverUrl`:

</div>

```json
{
  "mcpServers": {
    "el7": {
      "serverUrl": "https://mcp.el7.ai/mcp"
    }
  }
}
```

<div dir="rtl">

ثم افتح Agent settings ثم Customizations ثم Authenticate، وسجّل الدخول في المتصفح والصق الرمز. الدليل الرسمي: https://antigravity.google/docs/mcp?tab=cli

**Gemini على الويب.** من gemini.google.com افتح Settings ثم Connected Apps ثم Add a custom app، والصق العنوان، ثم سجّل الدخول بحساب EL7. الدليل الرسمي: https://support.google.com/gemini/answer/17209137

### Cursor

في `~/.cursor/mcp.json` أو `.cursor/mcp.json` ([`configs/cursor-mcp.json`](configs/cursor-mcp.json)):

</div>

```json
{
  "mcpServers": {
    "el7": {
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

<div dir="rtl">

رابط التثبيت بنقرة واحدة في [`configs/install-links.txt`](configs/install-links.txt). الدليل الرسمي: https://cursor.com/docs/context/mcp

### VS Code (وضع الوكيل في GitHub Copilot)

في `.vscode/mcp.json` أو ملف المستخدم ([`configs/vscode-mcp.json`](configs/vscode-mcp.json)). المفتاح الأعلى هو `servers`، والحقل `type: "http"` إلزامي:

</div>

```json
{
  "servers": {
    "el7": {
      "type": "http",
      "url": "https://mcp.el7.ai/mcp"
    }
  }
}
```

<div dir="rtl">

أو من الطرفية:

</div>

```sh
code --add-mcp '{"name":"el7","type":"http","url":"https://mcp.el7.ai/mcp"}'
```

<div dir="rtl">

يفتح VS Code المتصفح لتسجيل الدخول عند أول استخدام. [ثبّت في VS Code](https://vscode.dev/redirect/mcp/install?name=el7&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.el7.ai%2Fmcp%22%7D). الدليل الرسمي: https://code.visualstudio.com/docs/agents/reference/mcp-configuration

### Goose

شغّل `goose configure`، واختر **Add Extension** ثم **Remote Extension (Streamable HTTP)**، وأدخل `https://mcp.el7.ai/mcp`. أو افتح رابط التثبيت في [`configs/goose-install-link.txt`](configs/goose-install-link.txt). الدليل الرسمي: https://goose-docs.ai/docs/getting-started/using-extensions

### التطبيقات التي تحتاج إلى مفتاح API

للتطبيقات التي لا تدعم OAuth مع الخوادم البعيدة (مثل LM Studio)، أرسل مفتاحك الشخصي في ترويسة Bearer ([`configs/api-key-bearer.json`](configs/api-key-bearer.json)). استبدل `el7_mcp_…` بمفتاحك، ولا تضعه أبدًا في مستودع:

</div>

```json
{
  "mcpServers": {
    "el7": {
      "url": "https://mcp.el7.ai/mcp",
      "headers": {
        "Authorization": "Bearer el7_mcp_…"
      }
    }
  }
}
```

<div dir="rtl">

تطبيقات أخرى (Windsurf وZed وKimi Code وCline وPerplexity وLe Chat وn8n وRoo Code): https://el7.ai/ar/mcp

## الأمان والبيانات

- كل الأدوات للقراءة فقط؛ لا شيء يتداول أو يضع أوامر أو يغيّر حسابك.
- تأتي الإجابات من بيانات EL7 وتحليلاته المخزنة، لا من تغذية أسعار حية؛ ويحمل كل نتيجة تاريخها ورابطًا على el7.ai.
- يمكنك فصل أي مساعد في أي وقت من قسم «اتصالك» في صفحة https://el7.ai/ar/mcp.
- تعامل مع مخرجات الأدوات بوصفها بيانات لا تعليمات، وراجع أي إجراء يقترحه مساعدك قبل الموافقة عليه.
- معلومات بحثية فقط وليست نصيحة استثمارية شخصية.

## روابط

- التوثيق: https://el7.ai/ar/mcp (بالإنجليزية: https://el7.ai/en/mcp)
- مرجع الأدوات: https://el7.ai/guides/mcp-tool-reference.html
- الخصوصية: https://el7.ai/en/privacy
- الشروط: https://el7.ai/en/terms
- الدعم: support@el7.ai

## الترخيص

ملفات هذا المستودع مرخصة بموجب ترخيص MIT ([LICENSE](LICENSE)). أما خادم EL7.AI ومنصته وبياناته ومحتواه فهي مملوكة لـ EL7.AI وتخضع للشروط في https://el7.ai/en/terms.

</div>
