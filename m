Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A5DE80C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 11:28:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D5933C2656
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 11:28:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AA4A13C229F
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 11:28:51 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DB97D10009CB
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 11:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571650128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YGz+URwFjl8sCLibWppD6VGctYaBEPCgDMW9XqTm3wE=;
 b=GPIwNDRKe9C87M3a9Idtm18Ycd1J5bhAsf7DOIpBUzY4rh+ehwE92jGkfIJw4SPLRE9XJj
 txE0CfXy+hLFZaVl5xb9tjCY/5CoOjQUBphvHhdeF31RSgnssYVYklRbC3rNzz6u9gZuNF
 nXSZCXogFU09d2nND2rOfTowWHL6Q/4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-J1k_C12_MQqiC_IJaqEKig-1; Mon, 21 Oct 2019 05:28:44 -0400
Received: by mail-ot1-f72.google.com with SMTP id x20so6392668otk.12
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 02:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wK2umzb2P51lzHFCXdEwQ3SStYcAGlGY8lnV8cT2yXo=;
 b=BT247JDwUIGAVSR0wvshA0w9t4wIvSM4mF+tb6fenDreUWlW7+Cxdx6RKL5gWQuxP/
 Ckilhu45WXqQjPmlUmahZI6i1/qupWe+AA2cxAZ91oNJIk+CEHV5oMVwUGzuSuudGT8Q
 gEkjd1qIlWygs7/9U0A+3wMBwUmg5FAJNK4NMmB6dka366HQZIMu/yZ1/aGu9g9iVSSH
 4LAtp7n167/D2N/bvIA2O9eHBFKxW0Hg80uIGkbL04RMgiiVxUwQg9zCziKr3fLwb/5x
 3lQaQ6XWHbVwZdiyJmnRl5l+bMKIg0njIyJaeXrFo0BQtti5CVL7WcXXMn8n3+Cx8b0Q
 sgWQ==
X-Gm-Message-State: APjAAAUXRcoLtLfMWxsTcsOfzdfP5GfjpRjuBct8VCEj4Wm49OxBoHsg
 SVlZ7NLEFeq3dvzuyiC2TVUF1+EW1Ztczyo5X+p1jUIf1Zc1/GEzQSdkIl++FcuQFCqWS6eDfvH
 xB+DY+2nrSd1NgI0lTJc1CPHUb+E=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr7092019otk.26.1571650123772; 
 Mon, 21 Oct 2019 02:28:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuswMeqU0DfJ5ROUePL0WgAkY5TShu6h9fucFQxLGlWPoNEUq8yoZKtUSIxcabJt3tAuarzKKkRGuP+FQ2zLo=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr7092007otk.26.1571650123537; 
 Mon, 21 Oct 2019 02:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-5-cfamullaconrad@suse.de>
In-Reply-To: <20191018124502.25599-5-cfamullaconrad@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 21 Oct 2019 17:28:31 +0800
Message-ID: <CAEemH2c_JVy0jPs96uMfZ0nJjnoGsyhDvLjHy9UJ0tXyc5KNzQ@mail.gmail.com>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
X-MC-Unique: J1k_C12_MQqiC_IJaqEKig-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] Add newlib shell test for
 tst_multiply_timeout()
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
Content-Type: multipart/mixed; boundary="===============1579088004=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1579088004==
Content-Type: multipart/alternative; boundary="000000000000533e2a0595684f62"

--000000000000533e2a0595684f62
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 8:45 PM Clemens Famulla-Conrad <
cfamullaconrad@suse.de> wrote:

> Simple test for different kinds of calls from tst_multiply_timeout()
>

Patch 4/5 and 5/5 needs "Signed-off-by: ..." tag, otherwise LGTM.
    Reviewed-by: Li Wang <liwang@redhat.com>

---
>  lib/newlib_tests/shell/test_timeout_mul.sh | 43
> ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh
>
> diff --git a/lib/newlib_tests/shell/test_timeout_mul.sh
> b/lib/newlib_tests/shell/test_timeout_mul.sh
> new file mode 100755
> index 000000000..6682e5d66
> --- /dev/null
> +++ b/lib/newlib_tests/shell/test_timeout_mul.sh
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> +
> +TST_TESTFUNC=3Ddo_test
> +. tst_test.sh
> +
> +
> +call_it()
> +{
> +       local SAVE_MUL=3D${LTP_TIMEOUT_MUL}
> +       $1
> +       eval "exp_value=3D\$$2"
> +       if [ "$exp_value" -ne "$3" ]; then
> +               tst_brk TBROK "LTP_TIMEOUT_MUL=3D$SAVE_MUL $1 ($exp_value=
 !=3D
> $3)"
> +       else
> +               tst_res TPASS "LTP_TIMEOUT_MUL=3D$SAVE_MUL $1 ($exp_value=
 =3D=3D
> $3)"
> +       fi
> +}
> +
> +do_test()
> +{
> +       LTP_TIMEOUT_MUL=3D2
> +       local sec=3D1
> +
> +       call_it 'tst_multiply_timeout sec' 'sec' 2
> +
> +       sec=3D1
> +       LTP_TIMEOUT_MUL=3D"1.5"
> +       call_it 'tst_multiply_timeout sec' 'sec' 2
> +
> +       sec=3D1
> +       LTP_TIMEOUT_MUL=3D0.5
> +       call_it 'tst_multiply_timeout sec' 'sec' 1
> +
> +       sec=3D1
> +       LTP_TIMEOUT_MUL=3D2
> +       call_it 'tst_multiply_timeout sec' 'sec' 2
> +       call_it 'tst_multiply_timeout sec' 'sec' 4
> +       call_it 'tst_multiply_timeout sec' 'sec' 8
> +}
> +
> +tst_run
> --
> 2.16.4
>
>

--=20
Regards,
Li Wang

--000000000000533e2a0595684f62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 18, 2019 at 8:45 PM Clemens Famulla-Con=
rad &lt;<a href=3D"mailto:cfamullaconrad@suse.de">cfamullaconrad@suse.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sim=
ple test for different kinds of calls from tst_multiply_timeout()<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Patch 4/5 and 5/5 needs &quot;Signed-off-by: ...&quot; tag, otherwise LGT=
M.</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@re=
dhat.com</a>&gt;</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0lib/newlib_tests/shell/test_timeout_mul.sh | 43 +++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh<br>
<br>
diff --git a/lib/newlib_tests/shell/test_timeout_mul.sh b/lib/newlib_tests/=
shell/test_timeout_mul.sh<br>
new file mode 100755<br>
index 000000000..6682e5d66<br>
--- /dev/null<br>
+++ b/lib/newlib_tests/shell/test_timeout_mul.sh<br>
@@ -0,0 +1,43 @@<br>
+#!/bin/sh<br>
+# SPDX-License-Identifier: GPL-2.0-or-later<br>
+# Copyright (c) 2019 Clemens Famulla-Conrad &lt;<a href=3D"mailto:cfamulla=
conrad@suse.de" target=3D"_blank">cfamullaconrad@suse.de</a>&gt;<br>
+<br>
+TST_TESTFUNC=3Ddo_test<br>
+. tst_test.sh<br>
+<br>
+<br>
+call_it()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local SAVE_MUL=3D${LTP_TIMEOUT_MUL}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;exp_value=3D\$$2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$exp_value&quot; -ne &quot;$3&quot; =
]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk TBROK &quot=
;LTP_TIMEOUT_MUL=3D$SAVE_MUL $1 ($exp_value !=3D $3)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TPASS &quot=
;LTP_TIMEOUT_MUL=3D$SAVE_MUL $1 ($exp_value =3D=3D $3)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+do_test()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_TIMEOUT_MUL=3D2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local sec=3D1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 2<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sec=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_TIMEOUT_MUL=3D&quot;1.5&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 2<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sec=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_TIMEOUT_MUL=3D0.5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sec=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LTP_TIMEOUT_MUL=3D2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call_it &#39;tst_multiply_timeout sec&#39; &#39=
;sec&#39; 8<br>
+}<br>
+<br>
+tst_run<br>
-- <br>
2.16.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000533e2a0595684f62--


--===============1579088004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1579088004==--

