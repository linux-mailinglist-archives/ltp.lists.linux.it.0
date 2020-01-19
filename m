Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF69141CFD
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 09:33:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 318503C2393
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 09:33:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 673B73C12A1
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 09:33:19 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7C1621400E14
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 09:33:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579422796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+r19dTMWmrz12UbQm2c3IetAkfpodQnFSopISUdCNg=;
 b=FhdK0JSzQhNVmoJy2lR0+u5au0aA6T3g4Qf7gwWKJPUGj7IzkN5G5PLXGsaKq5wOtG7Dut
 aVLu/ovKJVwtxSbeazy+MFf+n3Qx88F6+2ww6QvRqwsV2tOEEGWjHkEHMgwrZYSTJBG3fx
 xtsGsdx6Ha8/jmQXow6H+GCCzcq0tnY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-_qnNqbgNMvOQL3c7OGoAZw-1; Sun, 19 Jan 2020 03:33:13 -0500
Received: by mail-ot1-f70.google.com with SMTP id y24so9113726oto.5
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 00:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80Rsh6FOT/j+Eico35J7/1sEEiNLd/1c0cpLgOUAUBQ=;
 b=npYEWBxMVErHxYDEedBPfC8xIqmHjBfkigvA6Qi82ldHrc858T0ldO9ViAk2K8/IIE
 tN/caYtVJ8y/PG0al9GApKm89mA2fZ5L16nhnWugrDLkvFeJjnDKfLzVPw0fg+KZnw7r
 MSM9U+3JUZ/ZBIq+lBkVjuhTqO/BasajFUCXSMlIH+ANJlJQ7UCzWOH/T3GUg+VadQ/J
 OeC44DzPY5+zRt5zgzw79d102Ay2zpEAL846HHvfArO2B2DyMjBh2f8osE5UOhfjwllZ
 t/iS/c5qach1+6svpwpgQF/oKwlH15EZftC4+xAafptBCBRPtJvCkzn/jbL5cfh/wO6C
 wcYQ==
X-Gm-Message-State: APjAAAWC/1M49kd0Zp+bEcln1MVHubnnHQ0TGMWHcH7yGUvyZ8ifCbhr
 r5MQvCN2S64J+EmXmYA7mJpQMI5A+6KSVNAptah8nTc5uH4QXg4FfzV5Z2Qe5gVpsQBOq7BJuo/
 AGzOxis5sHAdHjdgGw2D4q46D4Nk=
X-Received: by 2002:a9d:7:: with SMTP id 7mr11527818ota.26.1579422792977;
 Sun, 19 Jan 2020 00:33:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqztNGGSkkvBpifboBIwghqVvdHtDQYzIonCgfW4KuX3uZhdNpqCv0utkn37EEe5TCC1LXgO2TkG/el3RCGfY0Q=
X-Received: by 2002:a9d:7:: with SMTP id 7mr11527801ota.26.1579422792620; Sun,
 19 Jan 2020 00:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20200117063600.3451-1-pvorel@suse.cz>
In-Reply-To: <20200117063600.3451-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 19 Jan 2020 09:33:01 +0100
Message-ID: <CAEemH2fpUvUpgStMC7-+eKFd6Q4rqNPq+=5LtzBmyM9dL+OONQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: _qnNqbgNMvOQL3c7OGoAZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] memcg/stress: Lower swap memory use
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
Content-Type: multipart/mixed; boundary="===============0329640958=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0329640958==
Content-Type: multipart/alternative; boundary="000000000000813ae3059c7a0605"

--000000000000813ae3059c7a0605
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ack.

On Fri, Jan 17, 2020, 07:36 Petr Vorel <pvorel@suse.cz> wrote:

> Fix freeze on systems, where where swap size is more
> or less equal to a system RAM.
>
> Fixes: #632
>
> Reported-by: Zuo Liu <lz843723683@gmail.com>
> Tested-by: Zuo Liu <lz843723683@gmail.com>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> index ad8605e16..a48d21e6e 100755
> --- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> +++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> @@ -33,7 +33,7 @@ setup()
>         local swap_free=3D`cat /proc/meminfo | grep SwapFree | awk '{ pri=
nt
> $2 }'`
>         local pgsize=3D`tst_getconf PAGESIZE`
>
> -       MEM=3D$(( $mem_free + $swap_free / 2 ))
> +       MEM=3D$(( $mem_free + $swap_free / 1O ))
>         MEM=3D$(( $MEM / 1024 ))
>         RUN_TIME=3D$(( 15 * 60 ))
>         [ "$pgsize" =3D "4096" ] && THREAD_SPARE_MB=3D1 || THREAD_SPARE_M=
B=3D8
> --
> 2.24.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--000000000000813ae3059c7a0605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ack.<br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Jan 17, 2020, 07:36 Petr Vorel &lt;<a href=
=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Fix freeze on systems, where where swap size is more<=
br>
or less equal to a system RAM.<br>
<br>
Fixes: #632<br>
<br>
Reported-by: Zuo Liu &lt;<a href=3D"mailto:lz843723683@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">lz843723683@gmail.com</a>&gt;<br>
Tested-by: Zuo Liu &lt;<a href=3D"mailto:lz843723683@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">lz843723683@gmail.com</a>&gt;<br>
Suggested-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank" rel=3D"noreferrer">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank" rel=3D"noreferrer">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh | 2 +-=
<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh=
 b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh<br>
index ad8605e16..a48d21e6e 100755<br>
--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh<br>
+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh<br>
@@ -33,7 +33,7 @@ setup()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local swap_free=3D`cat /proc/meminfo | grep Swa=
pFree | awk &#39;{ print $2 }&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local pgsize=3D`tst_getconf PAGESIZE`<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0MEM=3D$(( $mem_free + $swap_free / 2 ))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MEM=3D$(( $mem_free + $swap_free / 1O ))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MEM=3D$(( $MEM / 1024 ))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 RUN_TIME=3D$(( 15 * 60 ))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$pgsize&quot; =3D &quot;4096&quot; ] &a=
mp;&amp; THREAD_SPARE_MB=3D1 || THREAD_SPARE_MB=3D8<br>
-- <br>
2.24.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp=
</a><br>
<br>
</blockquote></div></div></div>

--000000000000813ae3059c7a0605--


--===============0329640958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0329640958==--

