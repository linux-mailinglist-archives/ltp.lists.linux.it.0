Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7B3DA631
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 16:20:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 923733C63FD
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 16:20:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D9F13C62F3
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 16:20:38 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 801F01001194
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 16:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627568436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nb+cX6Dc8i5Fdn7nIw03xU5zytSw7aCBgw25otDKNF8=;
 b=E3iDTSU2eGCyk1sRzMnnDq+Kz3KIwQA8Aihq5KcI6Ys10UeCqJ8YEpKRtZ8F3r3+32VMWm
 2cVx6S7otURhsMRZgtd1BNeITUBpLY/JUkw/ZgSa1MS8GIQHCUzlzCiTCzMW6mBxGiOPRt
 8Uh/9Xc2ydLAYBPYUIMsmQ2G1WiasH8=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-gcLWa3osPeGmrfT0glT14Q-1; Thu, 29 Jul 2021 10:20:34 -0400
X-MC-Unique: gcLWa3osPeGmrfT0glT14Q-1
Received: by mail-ot1-f70.google.com with SMTP id
 k12-20020a056830150cb02904ce6f14d298so2361758otp.20
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 07:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nb+cX6Dc8i5Fdn7nIw03xU5zytSw7aCBgw25otDKNF8=;
 b=oq91A/LKKLm6wV7Z42cy8JVZGdsLtp2JyKWcVm1t0BoyZp4K7ToHfL06gs7XkrbCY7
 8f4eiJZtXXif5tWT4VTmQunPIkPnyWbAoZ3gbHHndTxad0GjuJJxvwkgKB2wk+lgK8GG
 JOazZ1H2/LVIfDuXX9PfaI7mEWf2ZZEdVjVEwelKE+gfQ54dKKZ5gE1+zfR01xjJ4Zcg
 LuflbQp8oY9BMDoNM6CfP+MF2vbtSYCpNNCoa5WfvbqL8yEFMlDB1CyxYExBBj9PM0xq
 vG+XJLm+197lNVQ5H+mY5V2StKy5e2GOEHnbacddDa9nf/Y3O6sqeV1l/JdsQvmOCO3i
 wB1g==
X-Gm-Message-State: AOAM532Y8VLdSVUlFo1fdx6yMs/XcoYKRUPzGpURuPm5cMbti8zF/bpw
 WzycFp4EgVvgi/90XIg/7rNEiHVogJTq/A2UZ01Eb/4M6aLXYnOuWbxtd2qfPx65onmW3pn3/0/
 LpjJe0LPEWXG4zdCOSg+IJkvtpg4=
X-Received: by 2002:a9d:200a:: with SMTP id n10mr3667341ota.47.1627568433589; 
 Thu, 29 Jul 2021 07:20:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWXwXUNnz38bWxbx4RJNhBb4mWj3zLXRI92mlmA3szvifeu7mhYHYVn2rdonYWqCa0bh6gUPZyn4GqabeCMFY=
X-Received: by 2002:a9d:200a:: with SMTP id n10mr3667326ota.47.1627568433402; 
 Thu, 29 Jul 2021 07:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
In-Reply-To: <20210729132514.1699551-3-liwang@redhat.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 29 Jul 2021 16:20:17 +0200
Message-ID: <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] mbind01: add more tests for MPOL_LOCAL
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
Content-Type: multipart/mixed; boundary="===============0238458502=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0238458502==
Content-Type: multipart/alternative; boundary="00000000000052254d05c843ce65"

--00000000000052254d05c843ce65
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 3:25 PM Li Wang <liwang@redhat.com> wrote:

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/mbind/mbind01.c
> b/testcases/kernel/syscalls/mbind/mbind01.c
> index d2cf13c8f..b5c1e948d 100644
> --- a/testcases/kernel/syscalls/mbind/mbind01.c
> +++ b/testcases/kernel/syscalls/mbind/mbind01.c
> @@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask,
> *empty_nodemask;
>  static void test_default(unsigned int i, char *p);
>  static void test_none(unsigned int i, char *p);
>  static void test_invalid_nodemask(unsigned int i, char *p);
> -static void check_policy_pref_no_target(int);
> +static void check_policy_pref_or_local(int);
>
>  struct test_case {
>         int policy;
> @@ -92,7 +92,7 @@ static struct test_case tcase[] = {
>                 .ret = 0,
>                 .err = 0,
>                 .test = test_none,
> -               .check_policy = check_policy_pref_no_target,
> +               .check_policy = check_policy_pref_or_local,
>         },
>         {
>                 POLICY_DESC(MPOL_PREFERRED),
> @@ -101,6 +101,20 @@ static struct test_case tcase[] = {
>                 .test = test_default,
>                 .exp_nodemask = &nodemask,
>         },
> +       {
> +               POLICY_DESC(MPOL_LOCAL),
> +               .ret = 0,
> +               .err = 0,
> +               .test = test_none,
> +               .exp_nodemask = &empty_nodemask,
> +               .check_policy = check_policy_pref_or_local,
>

This is a bit more permissive, it allows for MPOL_LOCAL to return also
MPOL_PREFERRED.
Shouldn't that still be treated as error?


> +       },
> +       {
> +               POLICY_DESC_TEXT(MPOL_LOCAL, "target exists"),
> +               .ret = -1,
> +               .err = EINVAL,
> +               .test = test_default,
> +       },
>         {
>                 POLICY_DESC(UNKNOWN_POLICY),
>                 .ret = -1,
> @@ -122,7 +136,7 @@ static struct test_case tcase[] = {
>         },
>  };
>
> -static void check_policy_pref_no_target(int policy)
> +static void check_policy_pref_or_local(int policy)
>  {
>         if (policy != MPOL_PREFERRED && policy != MPOL_LOCAL) {
>                 tst_res(TFAIL, "Wrong policy: %s(%d), "
> @@ -182,6 +196,11 @@ static void do_test(unsigned int i)
>
>         tst_res(TINFO, "case %s", tc->desc);
>
> +       if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
> +               tst_res(TCONF, "%s is not supported",
> tst_mempolicy_mode_name(tc->policy));
> +               return;
> +       }
>

I was thinking of runtime check (to support also downstream kernels that
backported it),
but I don't have strong opinion.



> +
>         setup_node();
>
>         p = SAFE_MMAP(NULL, MEM_LENGTH, PROT_READ | PROT_WRITE,
> MAP_PRIVATE |
> --
> 2.31.1
>
>

--00000000000052254d05c843ce65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 3:25 PM Li Wang &lt;<=
a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Li Wang=
 &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.c=
om</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 22 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/mbind/mbind01.c b/testcases/kernel/s=
yscalls/mbind/mbind01.c<br>
index d2cf13c8f..b5c1e948d 100644<br>
--- a/testcases/kernel/syscalls/mbind/mbind01.c<br>
+++ b/testcases/kernel/syscalls/mbind/mbind01.c<br>
@@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask, *empty_nod=
emask;<br>
=C2=A0static void test_default(unsigned int i, char *p);<br>
=C2=A0static void test_none(unsigned int i, char *p);<br>
=C2=A0static void test_invalid_nodemask(unsigned int i, char *p);<br>
-static void check_policy_pref_no_target(int);<br>
+static void check_policy_pref_or_local(int);<br>
<br>
=C2=A0struct test_case {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int policy;<br>
@@ -92,7 +92,7 @@ static struct test_case tcase[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .err =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D test_none=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.check_policy =3D c=
heck_policy_pref_no_target,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.check_policy =3D c=
heck_policy_pref_or_local,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DESC(MPOL_PR=
EFERRED),<br>
@@ -101,6 +101,20 @@ static struct test_case tcase[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D test_defa=
ult,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .exp_nodemask =3D &=
amp;nodemask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0POLICY_DESC(MPOL_LO=
CAL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ret =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.err =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D test_none=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.exp_nodemask =3D &=
amp;empty_nodemask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.check_policy =3D c=
heck_policy_pref_or_local,<br></blockquote><div><br></div><div><div style=
=3D"font-family:monospace" class=3D"gmail_default">This is a bit more permi=
ssive, it allows for MPOL_LOCAL to return also MPOL_PREFERRED.</div><div st=
yle=3D"font-family:monospace" class=3D"gmail_default">

</div><div style=3D"font-family:monospace" class=3D"gmail_default">Shouldn&=
#39;t that still be treated as error?<br></div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0POLICY_DESC_TEXT(MP=
OL_LOCAL, &quot;target exists&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ret =3D -1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.err =3D EINVAL,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D test_defa=
ult,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DESC(UNKNOWN=
_POLICY),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret =3D -1,<br>
@@ -122,7 +136,7 @@ static struct test_case tcase[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
-static void check_policy_pref_no_target(int policy)<br>
+static void check_policy_pref_or_local(int policy)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (policy !=3D MPOL_PREFERRED &amp;&amp; polic=
y !=3D MPOL_LOCAL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;Wrong policy: %s(%d), &quot;<br>
@@ -182,6 +196,11 @@ static void do_test(unsigned int i)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;case %s&quot;, tc-&gt;desc=
);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tst_kvercmp(3, 8, 0)) &lt; 0 &amp;&amp; (t=
c-&gt;policy =3D=3D MPOL_LOCAL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quo=
t;%s is not supported&quot;, tst_mempolicy_mode_name(tc-&gt;policy));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div><div styl=
e=3D"font-family:monospace" class=3D"gmail_default">I was thinking of runti=
me check (to support also downstream kernels that backported it),</div><div=
 style=3D"font-family:monospace" class=3D"gmail_default">but I don&#39;t ha=
ve strong opinion.<br></div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_node();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D SAFE_MMAP(NULL, MEM_LENGTH, PROT_READ | P=
ROT_WRITE, MAP_PRIVATE |<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000052254d05c843ce65--


--===============0238458502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0238458502==--

