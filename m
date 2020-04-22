Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 824571B3A15
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:29:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 138193C622D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 10:29:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1D2193C295C
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:29:45 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7F2BF200B27
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 10:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587544183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=veAHbCs0WFl9jA/57yiJ+iXm3Aq6dS08N1MEGfhRJP8=;
 b=Dp72dTs6JPMfL8ef9CLigjXOa0ka5hAizWOIEXl0UehObGKpziU7yqKX6dEMyGZHM5/d6z
 LbDxb3S6pZjHiOT7tgm45lTVhwD801fyXISCqsUv5aNg910/HlRtpaOgGoY2v9YoA13ul2
 8yI749nvB7kfp1Rbn4q9bE5PEPBLEZY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-eJIDBCrLNgyHT7hzYUdoGw-1; Wed, 22 Apr 2020 04:29:31 -0400
X-MC-Unique: eJIDBCrLNgyHT7hzYUdoGw-1
Received: by mail-lj1-f199.google.com with SMTP id r18so212194ljp.13
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 01:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMikziZu61mfCVTgsEVbmv+hyG9W/Ek2gLA9U0lSdxo=;
 b=Ov+HpuVF3jkLxTl9CMUChshAvfuYPReMcnjtP2HixxEAIADk0f1pQVk2+mYtDUvgsT
 ae20WpWkIuA7jt+xZIC1Cpn8HNgOTnYAkAk6KFkCXdkgxsUko+649dQXFuI4xfdCDXXt
 AiS3lA02kkLNkpOuuuVy5oyZSVb0sNxtDVPnB6hoU7oT1U2y3WN/7kc4niICya2HivyV
 fNWwNRlmjCLNj0zhSibj45/hb7JIrDyBscYHHkjrOCy7kdsM86mjZXVKKhqtSsHJ/NVr
 gPgShVXaEPEf040gC63KebHpmD9PMk2vMfxK+lTCoA+Z2qgi/CBNvNLI/uXPOvY0xnXe
 5b7w==
X-Gm-Message-State: AGi0PuYv7zdMa8Iye/Kxb1i5kOGCtOmvbv6209HHiicXLQqHBEgMPhD9
 t4qyY9A4JdJHsdM0m3VwV+BqyOLadDbPLvJl52NwbTENvCoL/uTqPF1e8b9rbxCwukR3qpyrsbq
 TTMB+uYT62xmiUKo+4nkYNEteT9E=
X-Received: by 2002:a2e:8549:: with SMTP id u9mr10606034ljj.24.1587544169432; 
 Wed, 22 Apr 2020 01:29:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypImRujPh5Q3l6ds/mHQn/Obm74aTWzQ+VAmqP4Adcn9qZ+yOXTItl5pxRMj2gXaS3rfmbxVljOAhJnFC89sdos=
X-Received: by 2002:a2e:8549:: with SMTP id u9mr10606031ljj.24.1587544169220; 
 Wed, 22 Apr 2020 01:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
In-Reply-To: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 16:29:17 +0800
Message-ID: <CAEemH2fWhXzLRV+g=hN9yJRcmqsj2iGMxxy14GGGKDpBAEX5HQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_hugepage: TCONF when huge pages are not
 supported
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
Content-Type: multipart/mixed; boundary="===============1728506638=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1728506638==
Content-Type: multipart/alternative; boundary="00000000000045a89205a3dcee71"

--00000000000045a89205a3dcee71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Wed, Apr 22, 2020 at 3:13 PM Jan Stancek <jstancek@redhat.com> wrote:

> /sys/kernel/mm/hugepages is not present when there are no
> supported hugepage sizes. This is common for ppc64le KVM guests,
> when hypervisor does not enable hugepages. Guest will boot with:
>   hugetlbfs: disabling because there are no supported hugepage sizes
>
>   # cat /proc/filesystems  | grep huge; echo $?
>   1
>
> End the test with TCONF to avoid TBROK on mmap, set_sys_tune, etc.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  lib/tst_hugepage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
> index 52667a14e8ff..eb66c4fbbc91 100644
> --- a/lib/tst_hugepage.c
> +++ b/lib/tst_hugepage.c
> @@ -18,7 +18,7 @@ unsigned long tst_request_hugepages(unsigned long hpage=
s)
>
>         if (access(PATH_HUGEPAGES, F_OK)) {
>                 tst_hugepages =3D 0;
> -               goto out;
> +               tst_brk(TCONF, "Huge pages not supported.");
>

We don't do that because hugetlb is not the hard requirement for some tests
(i.e pkey01.c). If we exit with TCONF at an early phase on a non-hugetlb
system the remaining test will be missed too. In a word, the goto out here
is on purpose.


>         }
>
>         if (nr_opt)
> --
> 2.18.1
>
>

--=20
Regards,
Li Wang

--00000000000045a89205a3dcee71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Apr 22, 2020 at 3:13 PM Jan Stancek &lt;=
<a href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">/sys/kernel/mm/hu=
gepages is not present when there are no<br>
supported hugepage sizes. This is common for ppc64le KVM guests,<br>
when hypervisor does not enable hugepages. Guest will boot with:<br>
=C2=A0 hugetlbfs: disabling because there are no supported hugepage sizes<b=
r>
<br>
=C2=A0 # cat /proc/filesystems=C2=A0 | grep huge; echo $?<br>
=C2=A0 1<br>
<br>
End the test with TCONF to avoid TBROK on mmap, set_sys_tune, etc.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_hugepage.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c<br>
index 52667a14e8ff..eb66c4fbbc91 100644<br>
--- a/lib/tst_hugepage.c<br>
+++ b/lib/tst_hugepage.c<br>
@@ -18,7 +18,7 @@ unsigned long tst_request_hugepages(unsigned long hpages)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(PATH_HUGEPAGES, F_OK)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_hugepages =3D 0=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Huge pages not supported.&quot;);<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">We don&#39;t do that be=
cause hugetlb is not the hard requirement for some tests (i.e pkey01.c). If=
 we exit with TCONF at an early=C2=A0phase on a non-hugetlb system the rema=
ining=C2=A0test will be missed too. In a word, the goto out here is on purp=
ose.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_opt)<br>
-- <br>
2.18.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000045a89205a3dcee71--


--===============1728506638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1728506638==--

