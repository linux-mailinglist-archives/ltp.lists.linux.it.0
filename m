Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 070243DDE0E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:54:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2BD33C8AF7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:54:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 887723C57B8
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:54:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E8917600972
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627923293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04RNUcBH4ZgJ1RYmlsx3MSR1B6TewzqV3/A0mpG4xVU=;
 b=UXVuLO4HpRL8equ+LHugoxCmji+gQs2uf/vOzuNVQZZDW56GWQS4zM4V9K0gofcveQ/WmB
 Gn+L+zHeyNeIq1TaYUJPJe2FOlT5Y0llRGNk+zlrYTe8Fc0z1OPmLFLbrWrb5cZFAAymIA
 GIBxf/qHcVMj5/aMb1lIHzQ2857X2YE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-BgxsLBNjNx6LHVsI1_EEtA-1; Mon, 02 Aug 2021 12:54:49 -0400
X-MC-Unique: BgxsLBNjNx6LHVsI1_EEtA-1
Received: by mail-ot1-f69.google.com with SMTP id
 z13-20020a9d71cd0000b02904d2c9963aa2so8342706otj.19
 for <ltp@lists.linux.it>; Mon, 02 Aug 2021 09:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04RNUcBH4ZgJ1RYmlsx3MSR1B6TewzqV3/A0mpG4xVU=;
 b=icFfF/ZQRr9vUOzF0QwvRT1XZdQU4pO6BNM/y7sc1kxEN2CUhC2rdEURn6JN4bmKW+
 fLmW4feq8JYoNtvHmYJTrPbavKdWwS4Cv1/k4q95oYQZJfqwIElHyjsvV5ORh27j4pKd
 Q4ksAvf5vBBTIFAWIg2QQrDFaLV9zgPk31QP9sXHaobs/4eZ66Qy4EWWKjiXKG//GFDF
 mAx7ZHFc7VsNDq5zZex1Rkl3SXnBmX7i15WaODVAu26VvpVsBQgbJG43/BGdI28FqgCW
 Pe7lY54AfWcnQMR6jkWGoy2RXVHowHUEWDzoOA72qLvRiaRbDWsgUEvQ8BA7VSjEQzIQ
 XWvw==
X-Gm-Message-State: AOAM531ZEinugtB5Fwogb0Lk/OB1IBIWlU6AUdqdUDNMvA4FjnP2FBx6
 iudn5vHT/XD8O8Yv0iFAncx16ClRiiuoUm0msWt1F4MSZW3tOA6TCy7N7q0f+A+37R+D11IE9lW
 oACfO1aeqTL9AfJyNJd9XSabPs3Y=
X-Received: by 2002:a54:4107:: with SMTP id l7mr11213432oic.66.1627923288981; 
 Mon, 02 Aug 2021 09:54:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRuuzfYe4TWLWEWJZgf+ADHkGcSxfbtgCZ8yFYDaBP4wowW66KaN9a2ZBi+vcyKM+MolDyQRp4h4zmuuTwO+k=
X-Received: by 2002:a54:4107:: with SMTP id l7mr11213412oic.66.1627923288671; 
 Mon, 02 Aug 2021 09:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210802163007.2282-1-pvorel@suse.cz>
In-Reply-To: <20210802163007.2282-1-pvorel@suse.cz>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 2 Aug 2021 18:54:32 +0200
Message-ID: <CAASaF6y+nGtyH_OGdcJAa-UmnKW_6+HE6ZB=kDyWNpHu_c-Nug@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] openposix/pthread_cancel/3-1: Move sleep loop
 into separate function
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
Content-Type: multipart/mixed; boundary="===============2122002339=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2122002339==
Content-Type: multipart/alternative; boundary="00000000000057d85c05c8966d2b"

--00000000000057d85c05c8966d2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 2, 2021 at 6:30 PM Petr Vorel <pvorel@suse.cz> wrote:

> to fix warning:
> pthread_cancel/3-1.c:40:13: warning: variable =E2=80=98waited_for_cancel_=
ms=E2=80=99 might
> be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Wc=
lobbered]
>    40 |         int waited_for_cancel_ms =3D 0;
>
> Suggested-by: Martin Doucha <mdoucha@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>

 Acked-by: Jan Stancek <jstancek@redhat.com>

---
>  .../conformance/interfaces/pthread_cancel/3-1.c  | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git
> a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/3-=
1.c
> b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/3-=
1.c
> index 3527d57fd..90500b371 100644
> ---
> a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/3-=
1.c
> +++
> b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/3-=
1.c
> @@ -35,19 +35,25 @@ static void cleanup_func(PTS_ATTRIBUTE_UNUSED void
> *unused)
>         } while (after_cancel =3D=3D 0 && thread_sleep_time < TIMEOUT_MS)=
;
>  }
>
> -static void *thread_func(PTS_ATTRIBUTE_UNUSED void *unused)
> +static void sleep_loop(void)
>  {
>         int waited_for_cancel_ms =3D 0;
>         struct timespec cancel_wait_ts =3D {0, SLEEP_MS*1000000};
>
> -       SAFE_PFUNC(pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS,
> NULL));
> -       pthread_cleanup_push(cleanup_func, NULL);
> -
> -       SAFE_FUNC(sem_post(&sem));
>         while (waited_for_cancel_ms < TIMEOUT_MS) {
>                 nanosleep(&cancel_wait_ts, NULL);
>                 waited_for_cancel_ms +=3D SLEEP_MS;
>         }
> +}
> +
> +static void *thread_func(PTS_ATTRIBUTE_UNUSED void *unused)
> +{
> +       SAFE_PFUNC(pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS,
> NULL));
> +       pthread_cleanup_push(cleanup_func, NULL);
> +
> +       SAFE_FUNC(sem_post(&sem));
> +
> +       sleep_loop();
>
>         /* shouldn't be reached */
>         printf("Error: cancel never arrived\n");
> --
> 2.32.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>

--00000000000057d85c05c8966d2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 6:30 PM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">to fix warning:<br>
pthread_cancel/3-1.c:40:13: warning: variable =E2=80=98waited_for_cancel_ms=
=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=
=E2=80=99 [-Wclobbered]<br>
=C2=A0 =C2=A040 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int waited_for_cancel_ms=
 =3D 0;<br>
<br>
Suggested-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div>=C2=A0Ack=
ed-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com">jstancek@redh=
at.com</a>&gt;</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0.../conformance/interfaces/pthread_cancel/3-1.c=C2=A0 | 16 ++++++++++=
+-----<br>
=C2=A01 file changed, 11 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_=
cancel/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthrea=
d_cancel/3-1.c<br>
index 3527d57fd..90500b371 100644<br>
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/=
3-1.c<br>
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel/=
3-1.c<br>
@@ -35,19 +35,25 @@ static void cleanup_func(PTS_ATTRIBUTE_UNUSED void *unu=
sed)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (after_cancel =3D=3D 0 &amp;&amp; threa=
d_sleep_time &lt; TIMEOUT_MS);<br>
=C2=A0}<br>
<br>
-static void *thread_func(PTS_ATTRIBUTE_UNUSED void *unused)<br>
+static void sleep_loop(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int waited_for_cancel_ms =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec cancel_wait_ts =3D {0, SLEEP_MS=
*1000000};<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PFUNC(pthread_setcanceltype(PTHREAD_CANCEL=
_ASYNCHRONOUS, NULL));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_cleanup_push(cleanup_func, NULL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FUNC(sem_post(&amp;sem));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (waited_for_cancel_ms &lt; TIMEOUT_MS) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nanosleep(&amp;canc=
el_wait_ts, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waited_for_cancel_m=
s +=3D SLEEP_MS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void *thread_func(PTS_ATTRIBUTE_UNUSED void *unused)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PFUNC(pthread_setcanceltype(PTHREAD_CANCEL=
_ASYNCHRONOUS, NULL));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_cleanup_push(cleanup_func, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FUNC(sem_post(&amp;sem));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_loop();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* shouldn&#39;t be reached */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Error: cancel never arrived\n&quot=
;);<br>
-- <br>
2.32.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div></div>

--00000000000057d85c05c8966d2b--


--===============2122002339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2122002339==--

