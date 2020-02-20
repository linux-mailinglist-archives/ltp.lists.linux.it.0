Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1971656AC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:23:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78A813C24FF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:23:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6E1713C2245
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:23:23 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 718051A006ED
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582176200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/TaPaI5m2L3anGjBvOj+15of0YjfKqhVtReoux0gR80=;
 b=IkbVzPc6HibXJ5znTeiwPAt5zG/2hijZpOlF0BYE3+zxh3wNhlnZbGkc7g7w7qohodSUu5
 yFch2TgbG/eCX8/DoghPuLiE9PY5AL1WBxVirL+hlbolU1+ayQRJEcNfDWuXpz5efoeufs
 cV0OSli7U6a5QJ+gk3IYECKlNZHukEU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-OK0zlDgLNDW4Yv8E8TUh4w-1; Thu, 20 Feb 2020 00:23:16 -0500
Received: by mail-oi1-f197.google.com with SMTP id l19so3429959oil.7
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRJE+iBBCQMlAPX2fVT1dQ0+Q/2HzLE11avgPKKM7lk=;
 b=iOqNW3spK4jSJODoKJvNMQBrHzvGb1axXqp5ppUTdJbmVlzGSWjj/Xt8CwkffhvbhG
 +M933fy4/2ROkNYociLjhwiLByJNHKTRb1/SWFeThCtGFRHAI6yLHYeR/quor8Z7XAsQ
 R+ulCDRzf6IODa0WbWh6gR87wXIDSErGHt/oRE6QfdMTQJtc3m0g6wSjatEy6kGWwxo9
 LkntW4fMhpTGZB5YTFIwVztpnWSSdPehDZpXNcrYbd+0jwq2QaqEc2Nm1lbrI48mKlgX
 nic8f6f7ys+RhFVRGJuK0I9j60xNwZekvbyjuCOfPK91aCzGrBz8VpVrMCQobwLOQjpx
 XL0g==
X-Gm-Message-State: APjAAAVX9bCXSChQ96S7amcypaSGD0XXuE333VXAJeyBGSaTxgI806G/
 VtG7O0dcKwEiPT3at0Bf46NjQaQZDRFCUdIrHo7dDVOOG41ZdmTpAQ1jOVXZ3SnM9+ZbkvXkw8O
 5n4A5iA00dFPWwFaOccg058N6Hdk=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr814199oic.138.1582176195109; 
 Wed, 19 Feb 2020 21:23:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMYeLpePidKgevVKfchbTDuH6FwBZhHly02lFD+vWdk5kHr2iD2VHcYJx9JrEsQ6gWSUW8lmceOMI2JZK1YOM=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr814184oic.138.1582176194837; 
 Wed, 19 Feb 2020 21:23:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 13:23:03 +0800
Message-ID: <CAEemH2f7eezS27odRq9qvAN=BCskpvvELECr7+Nsdd+Z_7sofA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: OK0zlDgLNDW4Yv8E8TUh4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1281817537=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1281817537==
Content-Type: multipart/alternative; boundary="00000000000010d48b059efb1a1d"

--00000000000010d48b059efb1a1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> ...
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/fsopen01.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic fsopen() test which tries to configure and mount the filesystem
> as
> + * well.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +#define MNTPOINT       "mntpoint"
> +
> +static struct tcase {
> +       char *name;
> +       unsigned int flags;
> +} tcases[] =3D {
> +       {"Flag 0", 0},
> +       {"Flag FSOPEN_CLOEXEC", FSOPEN_CLOEXEC},
>

Maybe better to remove the 'Flag' keywords from here and add it to the
print sentence.


> +static void run(unsigned int n)
> +{
> ...
> +
> +       if (!tst_ismount(MNTPOINT))
> +               tst_res(TPASS, "%s: fsopen() passed", tc->name);
>

tst_res(TPASS, "Flag %s: fsopen() passed", tc->name);

--=20
Regards,
Li Wang

--00000000000010d48b059efb1a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span><b=
r>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsopen/fsopen01.c<br>
@@ -0,0 +1,85 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lina=
ro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
+ *<br>
+ * Description:<br>
+ * Basic fsopen() test which tries to configure and mount the filesystem a=
s<br>
+ * well.<br>
+ */<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/fsmount.h&quot;<br>
+<br>
+#define MNTPOINT=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mntpoint&quot;<br>
+<br>
+static struct tcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags;<br>
+} tcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0&quot;, 0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag FSOPEN_CLOEXEC&quot;, FSOPEN_CLOEXE=
C},<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Maybe better to remove the &#39;Flag&#39; keywords fro=
m here and add it to the print sentence.</div></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+static void run(unsigned int n)<br>
+{<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_ismount(MNTPOINT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;%s: fsopen() passed&quot;, tc-&gt;name);<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">tst_res(TPASS, &=
quot;Flag %s: fsopen() passed&quot;, tc-&gt;name);</div></div><div>=C2=A0</=
div><div>--=C2=A0</div></div><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000010d48b059efb1a1d--


--===============1281817537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1281817537==--

