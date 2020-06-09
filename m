Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7591F3AB0
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:32:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5244D3C2E57
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:32:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D6A113C2E4A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:32:27 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F18C1601081
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Viu6SzKVNrUgaWvxaHno9aa6Bany6lRTJs17WjrPbHA=;
 b=O+IK9TiTodNCFFitxL8zlO9bUocWAuO7eabbVMC9ykxhJle7tI6dh1Fp+UBC0EiL9OpPY1
 79BhqP0cjNdwn5wKZ7x5FGCzvxBUYSXBbSlM6rdvbBODla9rq/jTUuexKXeFMk9dJexX1B
 nE6B5rsONeugDDDw1jElJIfxZGr9beo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-4zlqDYo3O3KtGsea_JsqFw-1; Tue, 09 Jun 2020 08:32:23 -0400
X-MC-Unique: 4zlqDYo3O3KtGsea_JsqFw-1
Received: by mail-lj1-f200.google.com with SMTP id a20so2256191lji.9
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 05:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Viu6SzKVNrUgaWvxaHno9aa6Bany6lRTJs17WjrPbHA=;
 b=WxZm0yajOCa5zPxjzU1GHgHFpkkCc+zjPrbI80nBILB+gnM4RvZq+edfczGRTEZ3d1
 DQvNfi6WknwMSBjx93XYW8dWl2laoolxfLMgzqBDAgBq/Lt+zTqtcrxBERA9D2WI/+JP
 KawAQXzHYnkjKD7o3wCdxOI5YVdliR2smzQH33TSJlIrf5gYZC0ulvUvnE48DmGduwLj
 Ex6x/GdxzxKCRNj1mht0dmMsLSqRVMlj+SmiZDqDoQq8Vi2/G+O8RG7txLFk/lQ6gPT7
 WiIXKVih36uYegECeD1CXC0zRSzYXaD1XBOGA312PtYUWAbrLfRIp/b71Lc/ZddjGtXs
 KVXA==
X-Gm-Message-State: AOAM532YL0e7RvA+FiVpPGgASpRyaL5ueAST8eFQ93MrRY5GASXF050i
 qM4e67LSIfy4kyUWd6DfQFQLQyDnCccqVlOwLQvMWLDodVfBDfXnqLFezHattz9069rnXu+0TH5
 nz9BLwGRBy9QhMcFoN8E9hNht5xg=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr13640125ljd.441.1591705941700; 
 Tue, 09 Jun 2020 05:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj3iXek5h4tz6s3ZKQtWPYMrT/TFNzKMW53N5nS+LHLuDkN9cHu/iqv7qWMnQk6y2bsQFKy+mq031ntqj9Sb8=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr13640109ljd.441.1591705941487; 
 Tue, 09 Jun 2020 05:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590144577.git.viresh.kumar@linaro.org>
 <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
In-Reply-To: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Tue, 9 Jun 2020 20:32:09 +0800
Message-ID: <CAEemH2eLNKKCdVvNFRFdU2-PDsXLZZmrh1gLH6bgMMFbrXi_Lg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0857122894=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0857122894==
Content-Type: multipart/alternative; boundary="0000000000003ace4a05a7a5ebe7"

--0000000000003ace4a05a7a5ebe7
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 6:52 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This adds support for time64 tests to the existing timer_gettime()
> syscall tests.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/tst_timer.h                           |  45 +++++++
>  .../syscalls/timer_gettime/timer_gettime01.c  | 124 ++++++++----------
>  2 files changed, 97 insertions(+), 72 deletions(-)
>
> diff --git a/include/tst_timer.h b/include/tst_timer.h
> index 256e1d71e1bc..d9afbe0ece71 100644
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -15,6 +15,7 @@
>  #include <sys/time.h>
>  #include <time.h>
>  #include "tst_test.h"
> +#include "lapi/common_timers.h"
>  #include "lapi/syscalls.h"
>
>  /*
> @@ -112,6 +113,16 @@ struct __kernel_timespec {
>         __kernel_time64_t       tv_sec;                 /* seconds */
>         long long               tv_nsec;                /* nanoseconds */
>  };
> +
> +struct __kernel_old_itimerspec {
> +       struct __kernel_old_timespec it_interval;    /* timer period */
> +       struct __kernel_old_timespec it_value;       /* timer expiration */
> +};
> +
> +struct __kernel_itimerspec {
> +       struct __kernel_timespec it_interval;    /* timer period */
> +       struct __kernel_timespec it_value;       /* timer expiration */
> +};
>  #endif
>
>  enum tst_ts_type {
> @@ -129,6 +140,14 @@ struct tst_ts {
>         } ts;
>  };
>
> +struct tst_its {
> +       enum tst_ts_type type;
> +       union {
> +               struct __kernel_itimerspec kern_old_its;
>

I guess this line should be used 'struct __kernel_old_itimerspec', right?

-- 
Regards,
Li Wang

--0000000000003ace4a05a7a5ebe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 22, 2020 at 6:52 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This adds support for time64 tests to the existing timer_gettime()<b=
r>
syscall tests.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/tst_timer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 45 +++++++<br>
=C2=A0.../syscalls/timer_gettime/timer_gettime01.c=C2=A0 | 124 ++++++++----=
------<br>
=C2=A02 files changed, 97 insertions(+), 72 deletions(-)<br>
<br>
diff --git a/include/tst_timer.h b/include/tst_timer.h<br>
index 256e1d71e1bc..d9afbe0ece71 100644<br>
--- a/include/tst_timer.h<br>
+++ b/include/tst_timer.h<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;time.h&gt;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/common_timers.h&quot;<br>
=C2=A0#include &quot;lapi/syscalls.h&quot;<br>
<br>
=C2=A0/*<br>
@@ -112,6 +113,16 @@ struct __kernel_timespec {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __kernel_time64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0tv_=
sec;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* second=
s */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 long long=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tv_nsec;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* nanoseconds */<br>
=C2=A0};<br>
+<br>
+struct __kernel_old_itimerspec {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct __kernel_old_timespec it_interval;=C2=A0=
 =C2=A0 /* timer period */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct __kernel_old_timespec it_value;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* timer expiration */<br>
+};<br>
+<br>
+struct __kernel_itimerspec {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct __kernel_timespec it_interval;=C2=A0 =C2=
=A0 /* timer period */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct __kernel_timespec it_value;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* timer expiration */<br>
+};<br>
=C2=A0#endif<br>
<br>
=C2=A0enum tst_ts_type {<br>
@@ -129,6 +140,14 @@ struct tst_ts {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } ts;<br>
=C2=A0};<br>
<br>
+struct tst_its {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum tst_ts_type type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct __kernel_iti=
merspec kern_old_its;<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">I guess this line should be used &#39=
;struct __kernel_old_itimerspec&#39;, right?</div></div><div><br></div></di=
v>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--0000000000003ace4a05a7a5ebe7--


--===============0857122894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0857122894==--

