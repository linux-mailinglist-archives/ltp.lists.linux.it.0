Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A43E4130
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 09:55:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 750A03C66C3
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 09:55:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E79883C2244
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 09:55:51 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D273360046D
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 09:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628495749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpdYdgGNa1Sc04RYbEXXvayGa46pUf7MMeOQRJsI2LQ=;
 b=X8J73twfiomUF1YnAZk2bEvwAMfVXgyX+kt3k6YuHhKyiAE7inlTGD32SPB8u3y1KkHKeB
 08+KtlX9PGwxsvpHWchvSEWdWbLItJvt4Whb4xrnWvccanAHS+a3aT2zbglRjcYWO8SR4e
 Q4mdMN01SIW+wZQ45/SuxTadmyHd1eU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-tTtv5gImNtCoFRjUKk0ohg-1; Mon, 09 Aug 2021 03:55:47 -0400
X-MC-Unique: tTtv5gImNtCoFRjUKk0ohg-1
Received: by mail-yb1-f197.google.com with SMTP id
 203-20020a250bd40000b02905933fff7091so8899889ybl.16
 for <ltp@lists.linux.it>; Mon, 09 Aug 2021 00:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpdYdgGNa1Sc04RYbEXXvayGa46pUf7MMeOQRJsI2LQ=;
 b=IGIwPIdZlIkCuTqyW7dLF4Aep/quxIC149PTJErGeidO9LoFU6fMuDTioJe2GoMV3t
 hLvLw69MCGbL7Vj5p/Yt9OYxZNClpzHnGwAGi3uKz74hEo7n4ZTicuDzrLy7Zi8PkN+j
 Ouotrc3v5Wx3Th/UhtlZmBwxZbsA75O62RxMlYxH9H/Gpts9tveswNsLZG2mg8s6eQ9f
 Hyi8KduPbz/RYs56hQzb7f4EaBpF7gNt06qDcguvv1Wu9Jkj49q57BWStKwdwpmVpsci
 DZi5kksXhCHxmX3sIZcCAZwkHBLCB2yvziGIZVq0I/op31keEoz0I6sCe7dV+tRdTVx6
 ijVA==
X-Gm-Message-State: AOAM533YcGOMrcqi9GuzabjNmEkk/mPUKeeo3FlwtpU9z8f7P5PiAn18
 yB/uO46TrZuQDpLvPr4StlkPA+5J8L8x3PXz23x2obmwHT78OEib/IKJEBr7kVsRXsFlCD08mSz
 uWfvZN9yrq+Owvm4eQqydeYhLTlU=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr29797177ybc.86.1628495747312; 
 Mon, 09 Aug 2021 00:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6bzqUupv/sQO1a4x8rgWQQAQ9mwFkmf/u4nmE5W6aWZK43zyAWIuPSz8POU+6EgtRwV8ZfPMI39qChT+b7Yg=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr29797167ybc.86.1628495747111; 
 Mon, 09 Aug 2021 00:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
 <20210806164730.51040-2-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20210806164730.51040-2-aleksei.kodanev@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Aug 2021 15:55:35 +0800
Message-ID: <CAEemH2fe6U3cQa7bgQ=7yLx7H8Zw43mbAqzYJY9ZM_XARgsH5w@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 01/16] lib/tst_sched: add ltp
 sys/libc_sched_*() wrappers
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1572983040=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1572983040==
Content-Type: multipart/alternative; boundary="00000000000086768905c91bb630"

--00000000000086768905c91bb630
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Sat, Aug 7, 2021 at 12:48 AM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> The new wrappers allow to test libc and syscall variants. This is needed
> because libc implementation can differ from calling syscall directly.
> For example, musl libc implementation returns ENOSYS for some sched_*()
> functions due to commit 1e21e78bf7a5 ("add support for thread scheduling
> (POSIX TPS option)").
>
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
>  include/tst_sched.h | 70 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 include/tst_sched.h
>
> diff --git a/include/tst_sched.h b/include/tst_sched.h
> new file mode 100644
> index 000000000..a5dc767b3
> --- /dev/null
> +++ b/include/tst_sched.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2021, BELLSOFT. All rights reserved.
> + */
> +
> +#ifndef TST_SCHED_H_
> +#define TST_SCHED_H_
> +
> +#include <sched.h>
> +
> +#include "lapi/syscalls.h"
> +
> +struct sched_variants {
> +       char *desc;
> +
> +       int (*sched_setparam)(pid_t pid, const struct sched_param *param);
> +       int (*sched_getparam)(pid_t pid, struct sched_param *param);
> +       int (*sched_setscheduler)(pid_t pid, int policy, const struct
> sched_param *param);
> +       int (*sched_getscheduler)(pid_t pid);
> +};
>

The whole patchset looks tidy and correctly, but I'm thinking maybe
we can define the varints[] unified here instead of stating them in each
test case again and again?

I.e.

--- a/include/tst_sched.h
+++ b/include/tst_sched.h
@@ -10,15 +10,6 @@

 #include "lapi/syscalls.h"

-struct sched_variants {
-       char *desc;
-
-       int (*sched_setparam)(pid_t pid, const struct sched_param *param);
-       int (*sched_getparam)(pid_t pid, struct sched_param *param);
-       int (*sched_setscheduler)(pid_t pid, int policy, const struct
sched_param *param);
-       int (*sched_getscheduler)(pid_t pid);
-};
-
 #define _TST_LIBC_SCHED_SCALL(SCALL, ...)({ \
        int tst_ret = SCALL(__VA_ARGS__); \
        if (tst_ret == -1 && errno == ENOSYS) { \
@@ -67,4 +58,24 @@ static inline int libc_sched_getscheduler(pid_t pid)
        return _TST_LIBC_SCHED_SCALL(sched_getscheduler, pid);
 }

+struct sched_variants {
+       char *desc;
+
+       int (*sched_setparam)(pid_t pid, const struct sched_param *param);
+       int (*sched_getparam)(pid_t pid, struct sched_param *param);
+       int (*sched_setscheduler)(pid_t pid, int policy, const struct
sched_param *param);
+       int (*sched_getscheduler)(pid_t pid);
+} variants[] = {
+       { .sched_setparam = libc_sched_setparam,
+         .sched_getparam = libc_sched_getparam,
+         .sched_setscheduler = libc_sched_setscheduler,
+         .desc = "libc"
+       },
+       { .sched_setparam = sys_sched_setparam,
+         .sched_getparam = sys_sched_getparam,
+         .sched_setscheduler = sys_sched_setscheduler,
+         .desc = "syscall"
+       },
+};
+
 #endif /* TST_SCHED_H_ */

-- 
Regards,
Li Wang

--00000000000086768905c91bb630
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexey,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Aug 7, 2021 at 12:48 AM Alexey Kodane=
v &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-s=
w.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The new wrappers allow to test libc and syscall variants. This is need=
ed<br>
because libc implementation can differ from calling syscall directly.<br>
For example, musl libc implementation returns ENOSYS for some sched_*()<br>
functions due to commit 1e21e78bf7a5 (&quot;add support for thread scheduli=
ng<br>
(POSIX TPS option)&quot;).<br>
<br>
Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw=
.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt;<br>
---<br>
=C2=A0include/tst_sched.h | 70 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 70 insertions(+)<br>
=C2=A0create mode 100644 include/tst_sched.h<br>
<br>
diff --git a/include/tst_sched.h b/include/tst_sched.h<br>
new file mode 100644<br>
index 000000000..a5dc767b3<br>
--- /dev/null<br>
+++ b/include/tst_sched.h<br>
@@ -0,0 +1,70 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+/*<br>
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.<br>
+ */<br>
+<br>
+#ifndef TST_SCHED_H_<br>
+#define TST_SCHED_H_<br>
+<br>
+#include &lt;sched.h&gt;<br>
+<br>
+#include &quot;lapi/syscalls.h&quot;<br>
+<br>
+struct sched_variants {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *desc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*sched_setparam)(pid_t pid, const struct s=
ched_param *param);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*sched_getparam)(pid_t pid, struct sched_p=
aram *param);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*sched_setscheduler)(pid_t pid, int policy=
, const struct sched_param *param);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*sched_getscheduler)(pid_t pid);<br>
+};<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">The whole patchset looks tidy and correctly, but I&#39=
;m thinking maybe</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">we can define the varints[] unified here instead of stating=C2=A0them in=
 each</div><div class=3D"gmail_default" style=3D"font-size:small">test case=
 again and again?</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I.e.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>-=
-- a/include/tst_sched.h<br>+++ b/include/tst_sched.h<br>@@ -10,15 +10,6 @@=
<br>=C2=A0<br>=C2=A0#include &quot;lapi/syscalls.h&quot;<br>=C2=A0<br>-stru=
ct sched_variants {<br>- =C2=A0 =C2=A0 =C2=A0 char *desc;<br>-<br>- =C2=A0 =
=C2=A0 =C2=A0 int (*sched_setparam)(pid_t pid, const struct sched_param *pa=
ram);<br>- =C2=A0 =C2=A0 =C2=A0 int (*sched_getparam)(pid_t pid, struct sch=
ed_param *param);<br>- =C2=A0 =C2=A0 =C2=A0 int (*sched_setscheduler)(pid_t=
 pid, int policy, const struct sched_param *param);<br>- =C2=A0 =C2=A0 =C2=
=A0 int (*sched_getscheduler)(pid_t pid);<br>-};<br>-<br>=C2=A0#define _TST=
_LIBC_SCHED_SCALL(SCALL, ...)({ \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int tst_re=
t =3D SCALL(__VA_ARGS__); \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_ret =3D=
=3D -1 &amp;&amp; errno =3D=3D ENOSYS) { \<br>@@ -67,4 +58,24 @@ static inl=
ine int libc_sched_getscheduler(pid_t pid)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn _TST_LIBC_SCHED_SCALL(sched_getscheduler, pid);<br>=C2=A0}<br>=C2=A0<=
br>+struct sched_variants {<br>+ =C2=A0 =C2=A0 =C2=A0 char *desc;<br>+<br>+=
 =C2=A0 =C2=A0 =C2=A0 int (*sched_setparam)(pid_t pid, const struct sched_p=
aram *param);<br>+ =C2=A0 =C2=A0 =C2=A0 int (*sched_getparam)(pid_t pid, st=
ruct sched_param *param);<br>+ =C2=A0 =C2=A0 =C2=A0 int (*sched_setschedule=
r)(pid_t pid, int policy, const struct sched_param *param);<br>+ =C2=A0 =C2=
=A0 =C2=A0 int (*sched_getscheduler)(pid_t pid);<br>+} variants[] =3D {<br>=
+ =C2=A0 =C2=A0 =C2=A0 { .sched_setparam =3D libc_sched_setparam,<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .sched_getparam =3D libc_sched_getparam,<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .sched_setscheduler =3D libc_sched_setscheduler,<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 .desc =3D &quot;libc&quot;<br>+ =C2=A0 =C2=
=A0 =C2=A0 },<br>+ =C2=A0 =C2=A0 =C2=A0 { .sched_setparam =3D sys_sched_set=
param,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 .sched_getparam =3D sys_sched_getpa=
ram,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 .sched_setscheduler =3D sys_sched_set=
scheduler,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 .desc =3D &quot;syscall&quot;<b=
r>+ =C2=A0 =C2=A0 =C2=A0 },<br>+};<br>+<br>=C2=A0#endif /* TST_SCHED_H_ */<=
br><div class=3D"gmail_default" style=3D"font-size:small"></div></div></div=
><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000086768905c91bb630--


--===============1572983040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1572983040==--

