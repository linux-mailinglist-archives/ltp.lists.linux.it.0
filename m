Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533623DB4D1
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 10:03:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 098F93C6215
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 10:03:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E163A3C1AEB
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 10:03:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4FEE91A01473
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 10:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627632223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BeSV1K6eTnSjD/mLD+1sQvLCs0lBspL1RXpdcPti9Pk=;
 b=eHYbiMk1u1qr7LYJWAlqjPlMdXHWQW9Bes6HmOjx7aoKpLBm78cektoN6qqR58c4O9QHsg
 puzgPTAIS1FSj2/7FPzWcpq81l3XEVeID3fvP1Hi7L9RCA7s5ThEwmo6oJgVU2QYUnAlwp
 s53MymED2hvubdsG3wwRvh8V0XUsxWU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-4PXqzv33Pm2xfPtaNTnPRw-1; Fri, 30 Jul 2021 04:03:41 -0400
X-MC-Unique: 4PXqzv33Pm2xfPtaNTnPRw-1
Received: by mail-yb1-f200.google.com with SMTP id
 n192-20020a25dac90000b029054c59edf217so9530703ybf.3
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 01:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeSV1K6eTnSjD/mLD+1sQvLCs0lBspL1RXpdcPti9Pk=;
 b=Zfwy1tSvlazsGga5z05aJjOIbTMVe3dkCfEyqzdQH3LJnn79tPZpjAwzvrnbX/334F
 vpGOspg/Wm12edOuI+i36IpGtCCduHOoJMe0hxh+6mnwUCfK8PweUa4SBuwMFKnJFleV
 NwIqxgpDS5+LWiloJ/NRfcC3fodEYbSUWQQHxLDtED9ryyrJhMC1IK7zEogsLmWlH4NG
 7H8iZqroeT11by94L57SIIoECfCi9d9cuTU5j/XblpLorgdgWZW8441ahzBCBG+14JiG
 YBapzK5IGa7tebXkVvWcatS1GTrYmyVJj5MtgtGVwes032/SL5ljEYbp5WH46y8Emvvb
 YY/Q==
X-Gm-Message-State: AOAM533Ql0rasv+gSTVqVV4qST8E41Yq/iVZRfRkJx61+tfwnQwDXs0W
 b+NrUojnr5S2NQX+oGXlAx9wS3vS/mjBDFp/X7MqmO3TcoU8kqqBfG4uSen3+FuQLR+/it3DHnc
 TvsXIkFzcdrtl/vlGcP291Nqg+Jc=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr1630247ybn.286.1627632220613; 
 Fri, 30 Jul 2021 01:03:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0Ytvfi4J0yNJksXMISXUzr0DDR6crQnFTutkFXb3Hif1yP/oT/DZ12Fn/em7BkD9b/sURsmMz0Vlbqbs8l4I=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr1630221ybn.286.1627632220363; 
 Fri, 30 Jul 2021 01:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
In-Reply-To: <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 30 Jul 2021 16:03:28 +0800
Message-ID: <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1320772784=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1320772784==
Content-Type: multipart/alternative; boundary="00000000000051f12405c852a882"

--00000000000051f12405c852a882
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> On Thu, Jul 29, 2021 at 3:25 PM Li Wang <liwang@redhat.com> wrote:
>
>> Signed-off-by: Li Wang <liwang@redhat.com>
>> ---
>>  testcases/kernel/syscalls/mbind/mbind01.c | 25 ++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/mbind/mbind01.c
>> b/testcases/kernel/syscalls/mbind/mbind01.c
>> index d2cf13c8f..b5c1e948d 100644
>> --- a/testcases/kernel/syscalls/mbind/mbind01.c
>> +++ b/testcases/kernel/syscalls/mbind/mbind01.c
>> @@ -34,7 +34,7 @@ static struct bitmask *nodemask, *getnodemask,
>> *empty_nodemask;
>>  static void test_default(unsigned int i, char *p);
>>  static void test_none(unsigned int i, char *p);
>>  static void test_invalid_nodemask(unsigned int i, char *p);
>> -static void check_policy_pref_no_target(int);
>> +static void check_policy_pref_or_local(int);
>>
>>  struct test_case {
>>         int policy;
>> @@ -92,7 +92,7 @@ static struct test_case tcase[] = {
>>                 .ret = 0,
>>                 .err = 0,
>>                 .test = test_none,
>> -               .check_policy = check_policy_pref_no_target,
>> +               .check_policy = check_policy_pref_or_local,
>>         },
>>         {
>>                 POLICY_DESC(MPOL_PREFERRED),
>> @@ -101,6 +101,20 @@ static struct test_case tcase[] = {
>>                 .test = test_default,
>>                 .exp_nodemask = &nodemask,
>>         },
>> +       {
>> +               POLICY_DESC(MPOL_LOCAL),
>> +               .ret = 0,
>> +               .err = 0,
>> +               .test = test_none,
>> +               .exp_nodemask = &empty_nodemask,
>> +               .check_policy = check_policy_pref_or_local,
>>
>
> This is a bit more permissive, it allows for MPOL_LOCAL to return also
> MPOL_PREFERRED.
> Shouldn't that still be treated as error?
>

To strictly this should be an error.

But I slightly think that it's acceptable to get 'MPOL_PREFERRED' on the old
kernel (i.e. 4.18.0, v5.13) because 'MPOL_LOCAL' is not treated as a real
policy.
And the situation exists for quite a long time.

  7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
  MPOL_PREFERRED policy")

Without this kernel commit, looks like the MPOL_LOCAL will convert to
MPOL_PREFERRED in mpol_new.

SYSCAL_DEFINE6(mbind, ...)
 kernel_mbind
  do_mbind
   mpol_new
     ....

# cat mempolicy.c -n

   287          /*
   288           * MPOL_PREFERRED cannot be used with MPOL_F_STATIC_NODES or
   289           * MPOL_F_RELATIVE_NODES if the nodemask is empty (local
allocation).
   290           * All other modes require a valid pointer to a non-empty
nodemask.
   291           */
   292          if (mode == MPOL_PREFERRED) {
   293                  if (nodes_empty(*nodes)) {
   294                          if (((flags & MPOL_F_STATIC_NODES) ||
   295                               (flags & MPOL_F_RELATIVE_NODES)))
   296                                  return ERR_PTR(-EINVAL);
   297                  }
   298          } else if (mode == MPOL_LOCAL) {
   299                  if (!nodes_empty(*nodes) ||
   300                      (flags & MPOL_F_STATIC_NODES) ||
   301                      (flags & MPOL_F_RELATIVE_NODES))
   302                          return ERR_PTR(-EINVAL);
   303                  mode = MPOL_PREFERRED;    <--------- this line has
been removed after the commit
   304          } else if (nodes_empty(*nodes))
   305                  return ERR_PTR(-EINVAL);

But maybe I was wrong here, CC FengTang in case he has suggestions on this.


>
>> +       if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
>> +               tst_res(TCONF, "%s is not supported",
>> tst_mempolicy_mode_name(tc->policy));
>> +               return;
>> +       }
>>
>
> I was thinking of runtime check (to support also downstream kernels that
> backported it),
> but I don't have strong opinion.
>

Thanks, I assume there is little probability to backport it.

-- 
Regards,
Li Wang

--00000000000051f12405c852a882
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek &lt;<a=
 href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:monospace"><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jul 29, 2021 at 3:25 PM Li Wang &lt;<a href=3D"mailto:liwang@r=
edhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Li Wang &lt;<a=
 href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&=
gt;<br>
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
class=3D"gmail_default" style=3D"font-size:small">To strictly this should b=
e an error.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div></div><span class=3D"gmail_default" style=3D"font-size:small">But </=
span>I <span class=3D"gmail_default" style=3D"font-size:small">slightly thi=
nk</span>=C2=A0that<span class=3D"gmail_default" style=3D"font-size:small">=
 it&#39;s</span> acceptable <span class=3D"gmail_default" style=3D"font-siz=
e:small">to</span>=C2=A0get &#39;MPOL_PREFERRED&#39;<span class=3D"gmail_de=
fault" style=3D"font-size:small"> </span>on<span class=3D"gmail_default" st=
yle=3D"font-size:small"> the old</span></div><div class=3D"gmail_quote"><sp=
an class=3D"gmail_default" style=3D"font-size:small">kernel (i.e. 4.18</spa=
n><span class=3D"gmail_default" style=3D"font-size:small">.0, v5.13)=C2=A0<=
/span><span class=3D"gmail_default">because</span>=C2=A0&#39;MPOL_LOCAL&#39=
; is not treated=C2=A0as a real policy.</div><div class=3D"gmail_quote"><di=
v class=3D"gmail_default" style=3D"font-size:small">And the situation exist=
s for quite a long time.</div></div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:sm=
all">=C2=A0 7858d7bca7fb (&quot;mm/mempolicy: don&#39;t handle MPOL_LOCAL l=
ike a fake</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 MPOL_PREFERRED policy&quot;)<br class=3D"gmail-Apple-interchange-newlin=
e"></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Without this kernel c=
ommit, looks like the MPOL_LOCAL will convert to</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">MPOL_PREFERRED in mpol_new.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small"><div class=3D"gmail_default">SYSCAL_DE=
FINE6(mbind, ...)</div><div class=3D"gmail_default">=C2=A0kernel_mbind</div=
><div class=3D"gmail_default">=C2=A0 do_mbind</div><div class=3D"gmail_defa=
ult">=C2=A0 =C2=A0mpol_new</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =
=C2=A0....</div><div class=3D"gmail_default"><br></div></div></div><div cla=
ss=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:small">#=
 cat mempolicy.c -n</div><br></div><div class=3D"gmail_quote"><div class=3D=
"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0287 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/*</div>=C2=A0 =C2=A0288 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * MPOL_PREFERRED cannot be used with MPOL_F_STATIC_NODES or<br>=C2=
=A0 =C2=A0289 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * MPOL_F_RELATIVE_NODES if=
 the nodemask is empty (local allocation).<br>=C2=A0 =C2=A0290 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * All other modes require a valid pointer to a non=
-empty nodemask.<br>=C2=A0 =C2=A0291 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<=
br>=C2=A0 =C2=A0292 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode =3D=3D MPOL_=
PREFERRED) {<br>=C2=A0 =C2=A0293 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (nodes_empty(*nodes)) {<br>=C2=A0 =C2=A0294 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (((flags &amp; MPOL_F_STATIC_NODES) ||<br>=C2=A0 =C2=A0295 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (flags &amp; MPOL_F_RELATIVE_NODES)))<br>=C2=A0=
 =C2=A0296 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINV=
AL);<br>=C2=A0 =C2=A0297 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>=C2=A0 =C2=A0298 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else=
 if (mode =3D=3D MPOL_LOCAL) {<br>=C2=A0 =C2=A0299 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nodes_empty(*nodes) ||<br>=C2=A0=
 =C2=A0300 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(flags &amp; MPOL_F_STATIC_NODES) ||<br>=C2=A0 =C2=A0301 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(f=
lags &amp; MPOL_F_RELATIVE_NODES))<br>=C2=A0 =C2=A0302 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n ERR_PTR(-EINVAL);<br>=C2=A0 =C2=A0303 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D MPOL_PREFERRED;<span class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 &lt;--------- this line has b=
een removed after the commit</span><br>=C2=A0 =C2=A0304 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0} else if (nodes_empty(*nodes))<br>=C2=A0 =C2=A0305 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EIN=
VAL);<br></div><div class=3D"gmail_quote"><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">But maybe I was wrong here, CC FengTang in case he has suggesti=
ons on this.</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tst_kvercmp(3, 8, 0)) &lt; 0 &amp;&amp; (t=
c-&gt;policy =3D=3D MPOL_LOCAL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quo=
t;%s is not supported&quot;, tst_mempolicy_mode_name(tc-&gt;policy));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div><div styl=
e=3D"font-family:monospace">I was thinking of runtime check (to support als=
o downstream kernels that backported it),</div><div style=3D"font-family:mo=
nospace">but I don&#39;t have strong opinion.<br></div></div></div></div></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Thanks, I assume=C2=A0there is little probability to backport it=
.</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr">=
<div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000051f12405c852a882--


--===============1320772784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1320772784==--

