Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B5230002
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 05:21:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07D873C26CE
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 05:21:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 88FDE3C0EAD
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 05:21:19 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 941DE200904
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 05:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595906476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SsaNYQeh9ik5FENDwaDtmvjdb/DQhf8MU190H4Gs14Y=;
 b=iYOCXPYsLNlJ4J4vtktUYw0MgZL6AcyHEp1Px8vRE0J00MT7WFH5o2jP7954TyMQn+XlJz
 bZoJrBvO2viWjgXUDPh0xWIDJs3oJMbzNeREPaiC5126mQ1WbRYi3AORiTKXzMIchAJOFc
 6jP2PIu93SyHZ/pzWcoIjM7PY+Hf1Sw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-F8AzeZHUP2WOQ88oxp5UxA-1; Mon, 27 Jul 2020 23:21:12 -0400
X-MC-Unique: F8AzeZHUP2WOQ88oxp5UxA-1
Received: by mail-lf1-f71.google.com with SMTP id q16so3047071lfm.2
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 20:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SsaNYQeh9ik5FENDwaDtmvjdb/DQhf8MU190H4Gs14Y=;
 b=W0ujpIP4wYHhSHVNRtrs4M7lcknZxGo91zyaCyv9YmVjxuxPc0fUCJO4OzdHJbHhAk
 K4B3lBoAJ68GzpHdCD79XMpx0CSNrw3AZotrvs5qrgKcqc5c9VgPWKxjMJwvTlivgRKV
 qTwI/qepK7sYTJvz5Lce+4EYDcsBaNWyFn1UW04pG3Y265w9pI6PO4So+1fz2TvFLF6G
 iJEDZ77dRM2Ix+wAfHJnZiMWf9UCJXp9pjdqQiye9uyuzpjVE0ZjejS4DbKsJ7AkYZSp
 l5ySHdSKIYybBsG2Pjwer/H36KcPyjyOoCPD6RmtR3tbyyNoSNFmQtc0n97YDsm92xTa
 +Q0w==
X-Gm-Message-State: AOAM5300JwNBdx93iqxeWG21QR1pFAAVrn7dKt3lTurvEm8dGqt4d3uu
 /Na8fB/TF+c454U17KwEU2lL2eGHL+tOHeUdeaL59mhHvIkkDfwc2cJwMU3+6nCbncOtWcxst6o
 AHNN/QBAl858d2UllFUa1db0MMYg=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr11738650ljk.309.1595906470593; 
 Mon, 27 Jul 2020 20:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybNEx+umSCtyfWv4meD8AcY/0Vtl5UQgWnHz9y5hMxfFP0xVNj+y4k7mEHPXeMXsBMI6MwQC4aXGsqJ2Hd3bU=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr11738643ljk.309.1595906470357; 
 Mon, 27 Jul 2020 20:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200703030811.11521-1-pravinraghul@zilogic.com>
In-Reply-To: <20200703030811.11521-1-pravinraghul@zilogic.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 28 Jul 2020 11:20:58 +0800
Message-ID: <CAEemH2febKOruSdyVDMa8sOTFNnSEdEwZkY1OP_34=Ac2GDxSA@mail.gmail.com>
To: pravin <pravinraghul@zilogic.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: LTP List <ltp@lists.linux.it>, vijaykumar@zilogic.com
Content-Type: multipart/mixed; boundary="===============0416284639=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0416284639==
Content-Type: multipart/alternative; boundary="00000000000042cf4505ab77ee99"

--00000000000042cf4505ab77ee99
Content-Type: text/plain; charset="UTF-8"

Hi,


On Fri, Jul 3, 2020 at 11:09 AM pravin <pravinraghul@zilogic.com> wrote:

> ...
> +/*
> + * Test mmap() MAP_GROWSDOWN flag
> + *
> + * We assign the memory region allocated using MAP_GROWSDOWN to a thread,
> + * as a stack, to test the effect of MAP_GROWSDOWN. This is because the
> + * kernel only grows the memory region when the stack pointer, is within
> + * guard page, when the guard page is touched.
> + *
> + * 1. Map an anyonymous memory region of size X, and unmap it.
> + * 2. Split the unmapped memory region into two.
> + * 3. The lower memory region is left unmapped.
> + * 4. The higher memory region is mapped for use as stack, using
> + *    MAP_FIXED | MAP_GROWSDOWN.
> + * 5. The higher memory region is provided as stack to a thread, where
> + *    a recursive function is invoked.
> + * 6. The stack grows beyond the allocated region, into the lower memory
> area.
> + * 7. If this results in the memory region being extended, into the
> + *    unmapped region, the test is considered to have passed.
> + */
> +
> +#include <unistd.h>
> +#include <pthread.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
> +#include <sys/types.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_pthread.h"
> +
> +#define UNITS(x) ((x) * PTHREAD_STACK_MIN)
> +
> +static void *stack;
> +
> +static bool check_stackgrow_up(int *local_var_1)
> +{
> +       int local_var_2;
> +
> +       return !(local_var_1 < &local_var_2);
>

Shouldn't local_var_1 less than local_var_2 on a stack grow up arch? why we
return the reverse value here?

And the worth to say that the optimization of GCC will break this rule in
the compilation.

 -O2  (ltp default gcc flag)
mmap18.c:46: INFO: local_var_1 = 0x3ffd177dea0, loval_var_2 = 0x3ffd177dea4
-O0
mmap18.c:46: INFO: local_var_1 = 0x3ffc86fe614, loval_var_2 = 0x3ffc86fe56c

--------

Apart from that, mmap18 also gets FAIL with s390x platform like:

# ./mmap18
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
mmap18.c:46: INFO: local_var_1 = 0x3fff537e5d4, loval_var_2 = 0x3fff537e52c
mmap18.c:126: INFO: mem = 0x3ff8dd3a000, stack = 0x3ff8dd5a000
mmap18.c:136: FAIL: Child killed by SIGSEGV

Summary:
passed   0
failed   1
skipped  0
warnings 0

-- 
Regards,
Li Wang

--00000000000042cf4505ab77ee99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Jul 3, 2020 at 11:09 AM pravin &lt;<a href=3D"mailto:p=
ravinraghul@zilogic.com" target=3D"_blank">pravinraghul@zilogic.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail_default" style=3D"font-size:small">...</span><br>
+/*<br>
+ * Test mmap() MAP_GROWSDOWN flag<br>
+ *<br>
+ * We assign the memory region allocated using MAP_GROWSDOWN to a thread,<=
br>
+ * as a stack, to test the effect of MAP_GROWSDOWN. This is because the<br=
>
+ * kernel only grows the memory region when the stack pointer, is within<b=
r>
+ * guard page, when the guard page is touched.<br>
+ *<br>
+ * 1. Map an anyonymous memory region of size X, and unmap it.<br>
+ * 2. Split the unmapped memory region into two.<br>
+ * 3. The lower memory region is left unmapped.<br>
+ * 4. The higher memory region is mapped for use as stack, using<br>
+ *=C2=A0 =C2=A0 MAP_FIXED | MAP_GROWSDOWN.<br>
+ * 5. The higher memory region is provided as stack to a thread, where<br>
+ *=C2=A0 =C2=A0 a recursive function is invoked.<br>
+ * 6. The stack grows beyond the allocated region, into the lower memory a=
rea.<br>
+ * 7. If this results in the memory region being extended, into the<br>
+ *=C2=A0 =C2=A0 unmapped region, the test is considered to have passed.<br=
>
+ */<br>
+<br>
+#include &lt;unistd.h&gt;<br>
+#include &lt;pthread.h&gt;<br>
+#include &lt;sys/mman.h&gt;<br>
+#include &lt;sys/wait.h&gt;<br>
+#include &lt;sys/types.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;stdbool.h&gt;<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_safe_pthread.h&quot;<br>
+<br>
+#define UNITS(x) ((x) * PTHREAD_STACK_MIN)<br>
+<br>
+static void *stack;<br>
+<br>
+static bool check_stackgrow_up(int *local_var_1)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int local_var_2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !(local_var_1 &lt; &amp;local_var_2);<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Shouldn&#39;t local_var_1 less than local_var_2 on a stack gr=
ow up arch? why we return the reverse value here?</div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">And=C2=A0the worth to say=
 that the optimization of GCC will break this rule in the compilation.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">=C2=A0-O2=C2=A0 (ltp =
default gcc flag)</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">mmap18.c:46: INFO: local_var_1 =3D 0x3ffd177dea0, loval_var_2 =3D 0x3ffd=
177dea4<br></div><div class=3D"gmail_default" style=3D"font-size:small"> -O=
0</div><div class=3D"gmail_default" style=3D"font-size:small">mmap18.c:46: =
INFO: local_var_1 =3D 0x3ffc86fe614, loval_var_2 =3D 0x3ffc86fe56c</div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">--------=
</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>Apart from that, mmap18 also gets FAIL with s390x platform like:</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div># ./mmap1<span=
 class=3D"gmail_default" style=3D"font-size:small">8</span><br>tst_test.c:1=
247: INFO: Timeout per run is 0h 05m 00s<br>mmap18.c:46: INFO: local_var_1 =
=3D 0x3fff537e5d4, loval_var_2 =3D 0x3fff537e52c<br>mmap18.c:126: INFO: mem=
 =3D 0x3ff8dd3a000, stack =3D 0x3ff8dd5a000<br>mmap18.c:136: FAIL: Child ki=
lled by SIGSEGV<br><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div>Summary:<br>passed =C2=A0 0<br>failed =C2=A0 1<br>skipped =C2=A00<=
br>warnings 0<br><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div>
</div>

--00000000000042cf4505ab77ee99--


--===============0416284639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0416284639==--

