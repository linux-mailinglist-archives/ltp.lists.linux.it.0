Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA03DB756
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:45:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FD363C8ECE
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:45:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC6FA3C56BF
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:44:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 34353201035
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627641895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qjLySNWQEn2ftRvT66B/ZHg2nv24o9viwQY15PIZAs=;
 b=HFcdyvayeZRfOp6dII5gFe5na9/g8rt6bXtaqXOzDDrGn9d3VEs6TjvlppNNH99KE3wDPj
 6afqbAE40Lbe84IChmPOFZYQPoOnoEEy61fJ68gjGtF4w/B1BQDr+YvgLbdYYeM9CSk4ng
 f/bPy91mZq5aiulaM4gYaQZMDDuNtVQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-Fh7chQb-NWO3ZI9_bKIg2g-1; Fri, 30 Jul 2021 06:44:54 -0400
X-MC-Unique: Fh7chQb-NWO3ZI9_bKIg2g-1
Received: by mail-yb1-f197.google.com with SMTP id
 j9-20020a2581490000b02905897d81c63fso4370650ybm.8
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 03:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qjLySNWQEn2ftRvT66B/ZHg2nv24o9viwQY15PIZAs=;
 b=JqDxOSmlQt5DwZQv4B33/A5K3NlhHx/4o1RgmqN4bhGdtG0ZAlp0pA1baVVwzOiBak
 R+3hpzJ5b2Pgfu4RX70YcN+iDUqsBHZLH4oLS9yR7SB0p6B9FLJTrOvQkzqCEk5WwZZR
 8rW/TvhHG9fRiYsMWiLls1SPlYUfVWPB91H8Wnuv8KxV2lC+9p9ILoQcQWeTRloKP9mQ
 NFp6kAciWIfLr0cWO7ZNEU2/Gf9SWZ9H1d+Gn9vENeEoTLI/r5Jsyf+e/6uWi67QD/ca
 cqFoBWGtfQvuF8ptgttV5NO95JfWOkIbAPYVLtLhr2swRk5OuCHAZFyjrPgQg1mP3hTj
 r9Zg==
X-Gm-Message-State: AOAM532VCjDiSNFa8yinVmxYiOSVA9LEJb9wqwX73EWJa8nF9VNitAK7
 tS5IUuCl7034tQSKSRFUFPiblMvLGaSsMcW3s18EadAqE9IrRKbmsM0AkZvW7rbPAyqWotD+fWI
 8EffDU6FUM3f1DafBJik44n+TSno=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr2281802ybc.97.1627641893531; 
 Fri, 30 Jul 2021 03:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0A1xE611HRzOrf+EsodEEYwgmSecvWuUAq4F/Q1zMfc79TL6kUkMh/NBBmbGscxm0+hV3Xp3lhnxM/Grrrvw=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr2281780ybc.97.1627641893355; 
 Fri, 30 Jul 2021 03:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
 <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
 <CAASaF6x2pTo1kMXy+nPJT+B9nEZ4Z+ovNzjtfW5f2WEq1fxc0g@mail.gmail.com>
In-Reply-To: <CAASaF6x2pTo1kMXy+nPJT+B9nEZ4Z+ovNzjtfW5f2WEq1fxc0g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 30 Jul 2021 18:44:41 +0800
Message-ID: <CAEemH2e04E_dhqBzJVWXX_ux6rx-Pev+gp1Piv9VJ8FC-cSutQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: feng.tang@intel.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0749131847=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0749131847==
Content-Type: multipart/alternative; boundary="000000000000e0186a05c854e8d7"

--000000000000e0186a05c854e8d7
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 6:35 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 10:03 AM Li Wang <liwang@redhat.com> wrote:
>
>>
>>
>> On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek <jstancek@redhat.com> wrote:
>>
>>>
>>>
>>> On Thu, Jul 29, 2021 at 3:25 PM Li Wang <liwang@redhat.com> wrote:
>>>
>>>> Signed-off-by: Li Wang <liwang@redhat.com>
>>>> ---
>>>>  testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++---
>>>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/testcases/kernel/syscalls/mbind/mbind01.c
>>>> b/testcases/kernel/syscalls/mbind/mbind01.c
>>>> index d2cf13c8f..b5c1e948d 100644
>>>> --- a/testcases/kernel/syscalls/mbind/mbind01.c
>>>> +++ b/testcases/kernel/syscalls/mbind/mbind01.c
>>>> @@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask,
>>>> *empty_nodemask;
>>>>  static void test_default(unsigned int i, char *p);
>>>>  static void test_none(unsigned int i, char *p);
>>>>  static void test_invalid_nodemask(unsigned int i, char *p);
>>>> -static void check_policy_pref_no_target(int);
>>>> +static void check_policy_pref_or_local(int);
>>>>
>>>>  struct test_case {
>>>>         int policy;
>>>> @@ -92,7 +92,7 @@ static struct test_case tcase[] = {
>>>>                 .ret = 0,
>>>>                 .err = 0,
>>>>                 .test = test_none,
>>>> -               .check_policy = check_policy_pref_no_target,
>>>> +               .check_policy = check_policy_pref_or_local,
>>>>         },
>>>>         {
>>>>                 POLICY_DESC(MPOL_PREFERRED),
>>>> @@ -101,6 +101,20 @@ static struct test_case tcase[] = {
>>>>                 .test = test_default,
>>>>                 .exp_nodemask = &nodemask,
>>>>         },
>>>> +       {
>>>> +               POLICY_DESC(MPOL_LOCAL),
>>>> +               .ret = 0,
>>>> +               .err = 0,
>>>> +               .test = test_none,
>>>> +               .exp_nodemask = &empty_nodemask,
>>>> +               .check_policy = check_policy_pref_or_local,
>>>>
>>>
>>> This is a bit more permissive, it allows for MPOL_LOCAL to return also
>>> MPOL_PREFERRED.
>>> Shouldn't that still be treated as error?
>>>
>>
>> To strictly this should be an error.
>>
>> But I slightly think that it's acceptable to get 'MPOL_PREFERRED' on the
>> old
>> kernel (i.e. 4.18.0, v5.13) because 'MPOL_LOCAL' is not treated as a
>> real policy.
>> And the situation exists for quite a long time.
>>
>
> You're right, on older kernel it failed in similar way for MPOL_LOCAL
> as it failed for MPOL_PREFERRED on latest one.
>

Or, If we want something more precise, just cancel the
check_policy_pref_or_local on kernel >= 5.14.

Is this sound better?

-       if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
-               tst_res(TCONF, "%s is not supported",
tst_mempolicy_mode_name(tc->policy));
-               return;

+       if (tc->policy == MPOL_LOCAL) {
+               if ((tst_kvercmp(3, 8, 0)) < 0) {
+                       tst_res(TCONF, "%s is not supported",
tst_mempolicy_mode_name(tc->policy));
+                       return;
+               }
+
+               if ((tst_kvercmp(5, 14, 0)) >= 0)
+                       tc->check_policy = NULL;


>
> Acked-by: Jan Stancek <jstancek@redhat.com>
>
>

-- 
Regards,
Li Wang

--000000000000e0186a05c854e8d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 6:35 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-family:monospace"><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30=
, 2021 at 10:03 AM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek=
 &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:monospace=
"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Jul 29, 2021 at 3:25 PM Li Wang &lt;<a href=3D"mailto:l=
iwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></d=
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
=3D"font-family:monospace">This is a bit more permissive, it allows for MPO=
L_LOCAL to return also MPOL_PREFERRED.</div><div style=3D"font-family:monos=
pace">

</div><div style=3D"font-family:monospace">Shouldn&#39;t that still be trea=
ted as error?</div></div></div></div></blockquote><div><br></div><div><div =
style=3D"font-size:small">To strictly this should be an error.</div><div st=
yle=3D"font-size:small"><br></div></div><span class=3D"gmail_default" style=
=3D"font-size:small">But </span>I <span class=3D"gmail_default" style=3D"fo=
nt-size:small">slightly think</span>=C2=A0that<span class=3D"gmail_default"=
 style=3D"font-size:small"> it&#39;s</span> acceptable <span class=3D"gmail=
_default" style=3D"font-size:small">to</span>=C2=A0get &#39;MPOL_PREFERRED&=
#39;<span class=3D"gmail_default" style=3D"font-size:small"> </span>on<span=
 class=3D"gmail_default" style=3D"font-size:small"> the old</span></div><di=
v class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-size:sm=
all">kernel (i.e. 4.18</span><span class=3D"gmail_default" style=3D"font-si=
ze:small">.0, v5.13)=C2=A0</span><span class=3D"gmail_default">because</spa=
n>=C2=A0&#39;MPOL_LOCAL&#39; is not treated=C2=A0as a real policy.</div><di=
v class=3D"gmail_quote"><div style=3D"font-size:small">And the situation ex=
ists for quite a long time.</div></div></div></blockquote><div><br></div><d=
iv><div style=3D"font-family:monospace">You&#39;re right, on older kernel i=
t failed in similar way for MPOL_LOCAL</div><div style=3D"font-family:monos=
pace">as it failed for MPOL_PREFERRED on latest one.</div></div></div></div=
></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Or, If we want something more precise, just cancel the</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">check_policy_pref_or_local=
 on kernel &gt;=3D 5.14.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Is this sound better?</div><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">- =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(3, 8, 0)=
) &lt; 0 &amp;&amp; (tc-&gt;policy =3D=3D MPOL_LOCAL)) {</div>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quot;%s is not suppo=
rted&quot;, tst_mempolicy_mode_name(tc-&gt;policy));<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;</div><div><br>+ =C2=A0 =C2=A0 =C2=
=A0 if (tc-&gt;policy =3D=3D MPOL_LOCAL) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(3, 8, 0)) &lt; 0) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(=
TCONF, &quot;%s is not supported&quot;,<span class=3D"gmail_default" style=
=3D"font-size:small"> </span>tst_mempolicy_mode_name(tc-&gt;policy));<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(5, 14,=
 0)) &gt;=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tc-&gt;check_policy =3D NULL;<br><div class=3D"gma=
il_default" style=3D"font-size:small"></div></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_quote"><div><div style=3D"font-family:monospace"><br></div><div style=
=3D"font-family:monospace">Acked-by: Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt;</div><div st=
yle=3D"font-family:monospace"><br></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e0186a05c854e8d7--


--===============0749131847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0749131847==--

