Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F83DB730
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:35:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D48573C625D
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:35:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C2A93C56BF
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:35:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0928D140026F
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627641328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ibQTIQPyPFZGt5YuE19duwkDbtM7W/SM0s8ZVc7Tp78=;
 b=KWdXFeFMZe5toJokRh06PpdgDxpcg1rDerDqP6dfVslY8+nu+BZ8tQgUiyqJ5RAQEXkzUu
 +o8OPvdS1jr7wpZHWXWaE9kDV3zG29lNRerg50VGGrcZz1dhTPAvv1/DrVL7P5/W+El2vM
 pZKcmAaLVmBB+2mHvNA6d5VHCetEt+o=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-Q1bbqx7rOSebOvhH0ExXOg-1; Fri, 30 Jul 2021 06:35:26 -0400
X-MC-Unique: Q1bbqx7rOSebOvhH0ExXOg-1
Received: by mail-oo1-f71.google.com with SMTP id
 e9-20020a4ab1490000b029026e25c335b8so3668053ooo.22
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 03:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibQTIQPyPFZGt5YuE19duwkDbtM7W/SM0s8ZVc7Tp78=;
 b=caYAqE1P0hM2m8niM/tDoNj5cLxt4oQWCg1y+f57cyhhvqCH9s0JSqflhuUQHBtzX0
 Y2r4RXLsW8DYpr3GtuyfTOE+pKjPxuQE6PmKBgAJWDWFvQRUiNNDdqE+LRErSaGTo/Wt
 THy3GlHhW/kH6/r0htulUqrSKjQKzVAN00KRGr7wG089Wb3NWox5zvv7ZzpvUipZG3k2
 SvR914Yf81KYbt3mGgfluW7l2QEIR3VZEwedR+healuqYVlD3W7UGBUUvGqC45ASKbtq
 v3cWLbK9/ECW0woG23dy8NDsx4Zv37I5nsrxMRDJJV3D3HQ0VgGc9TGsIVGGa0+65jon
 R7Fg==
X-Gm-Message-State: AOAM530bA9BcZ53eNWtQQA5OfXPZpKiRqX16+SE2MqKe/dhL0WCJgUZ5
 9fqdwRewEmcEtc0Lq6WipYFzjhAkjRj1lAgaKxbXwqh4vEk6Aj8Udwjl1Gwx2TJpGUWGkarNclD
 Gs/FWdq7VH711zBv84gO/AL19jAM=
X-Received: by 2002:a9d:965:: with SMTP id 92mr866417otp.47.1627641325838;
 Fri, 30 Jul 2021 03:35:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfsqVllKYZpugoxbiYV8gtOYvs2EwubBuaRuQHdIuJ3Clu1R3qnlXxkqwpWBx0pXB/fEBs38ZhmHCwPO3PjPM=
X-Received: by 2002:a9d:965:: with SMTP id 92mr866401otp.47.1627641325573;
 Fri, 30 Jul 2021 03:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
 <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
In-Reply-To: <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 30 Jul 2021 12:35:09 +0200
Message-ID: <CAASaF6x2pTo1kMXy+nPJT+B9nEZ4Z+ovNzjtfW5f2WEq1fxc0g@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0016565334=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0016565334==
Content-Type: multipart/alternative; boundary="00000000000008704a05c854c756"

--00000000000008704a05c854c756
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 10:03 AM Li Wang <liwang@redhat.com> wrote:

>
>
> On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>>
>>
>> On Thu, Jul 29, 2021 at 3:25 PM Li Wang <liwang@redhat.com> wrote:
>>
>>> Signed-off-by: Li Wang <liwang@redhat.com>
>>> ---
>>>  testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++---
>>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/testcases/kernel/syscalls/mbind/mbind01.c
>>> b/testcases/kernel/syscalls/mbind/mbind01.c
>>> index d2cf13c8f..b5c1e948d 100644
>>> --- a/testcases/kernel/syscalls/mbind/mbind01.c
>>> +++ b/testcases/kernel/syscalls/mbind/mbind01.c
>>> @@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask,
>>> *empty_nodemask;
>>>  static void test_default(unsigned int i, char *p);
>>>  static void test_none(unsigned int i, char *p);
>>>  static void test_invalid_nodemask(unsigned int i, char *p);
>>> -static void check_policy_pref_no_target(int);
>>> +static void check_policy_pref_or_local(int);
>>>
>>>  struct test_case {
>>>         int policy;
>>> @@ -92,7 +92,7 @@ static struct test_case tcase[] = {
>>>                 .ret = 0,
>>>                 .err = 0,
>>>                 .test = test_none,
>>> -               .check_policy = check_policy_pref_no_target,
>>> +               .check_policy = check_policy_pref_or_local,
>>>         },
>>>         {
>>>                 POLICY_DESC(MPOL_PREFERRED),
>>> @@ -101,6 +101,20 @@ static struct test_case tcase[] = {
>>>                 .test = test_default,
>>>                 .exp_nodemask = &nodemask,
>>>         },
>>> +       {
>>> +               POLICY_DESC(MPOL_LOCAL),
>>> +               .ret = 0,
>>> +               .err = 0,
>>> +               .test = test_none,
>>> +               .exp_nodemask = &empty_nodemask,
>>> +               .check_policy = check_policy_pref_or_local,
>>>
>>
>> This is a bit more permissive, it allows for MPOL_LOCAL to return also
>> MPOL_PREFERRED.
>> Shouldn't that still be treated as error?
>>
>
> To strictly this should be an error.
>
> But I slightly think that it's acceptable to get 'MPOL_PREFERRED' on the
> old
> kernel (i.e. 4.18.0, v5.13) because 'MPOL_LOCAL' is not treated as a real
> policy.
> And the situation exists for quite a long time.
>

You're right, on older kernel it failed in similar way for MPOL_LOCAL
as it failed for MPOL_PREFERRED on latest one.

Acked-by: Jan Stancek <jstancek@redhat.com>

--00000000000008704a05c854c756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 10:03 AM Li Wang &lt;=
<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021=
 at 10:20 PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-family:monospace"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 3:25 PM Li W=
ang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
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
iv><div style=3D"font-family:monospace" class=3D"gmail_default">You&#39;re =
right, on older kernel it failed in similar way for MPOL_LOCAL</div><div st=
yle=3D"font-family:monospace" class=3D"gmail_default">as it failed for MPOL=
_PREFERRED on latest one.</div><div style=3D"font-family:monospace" class=
=3D"gmail_default"><br></div><div style=3D"font-family:monospace" class=3D"=
gmail_default">Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.=
com">jstancek@redhat.com</a>&gt;</div><div style=3D"font-family:monospace" =
class=3D"gmail_default"><br></div></div></div></div>

--00000000000008704a05c854c756--


--===============0016565334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0016565334==--

