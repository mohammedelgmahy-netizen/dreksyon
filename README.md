# برنامج «دركسيون» لمعرض الفردي على GitHub Pages و Supabase

## 1) Supabase (مرة واحدة)
1. ادخل [supabase.com](https://supabase.com) واعمل مشروع جديد (New project).
2. من القائمة اختر **SQL Editor** ← **New query**، والصق محتوى ملف `supabase-setup.sql` كله، واضغط **Run**.
3. من **Authentication ← Users** اضغط **Add user ← Create new user**، واكتب إيميلك وكلمة سر، وفعّل **Auto Confirm User**.
4. من **Authentication ← Sign In / Providers ← Email** اقفل **Allow new users to sign up**، حتى لا يعمل أحد غيرك حسابًا.
5. من **Project Settings ← API** انسخ **Project URL** و **anon public key**.

## 2) GitHub Pages
1. اعمل مستودع جديد على GitHub، وارفع فيه ملف `index.html`.
2. من **Settings ← Pages** اختر **Deploy from a branch** والفرع **main**، واحفظ.
3. بعد دقيقة يظهر رابط البرنامج، مثل `https://اسمك.github.io/اسم-المستودع/`.

## 3) الربط
1. افتح رابط البرنامج، وادخل **الإعدادات ← الربط بـ Supabase**.
2. الصق Project URL و anon key واضغط **ربط**، ثم سجّل الدخول بالإيميل وكلمة السر.

## 4) نقل بياناتك من نسخة Claude
1. في نسخة Claude: **الإعدادات ← تنزيل نسخة احتياطية**.
2. في نسخة GitHub بعد تسجيل الدخول: **الإعدادات ← استرجاع نسخة احتياطية** واختر الملف.

ملاحظة: مفتاح anon يظهر داخل المتصفح وهذا طبيعي، والحماية هي تسجيل الدخول وقفل التسجيل الجديد (الخطوة 1-4). لا تضع أبدًا مفتاح service_role في البرنامج.
