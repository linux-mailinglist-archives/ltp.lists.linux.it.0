Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFAC3D9F9F
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:33:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D71D03C8F80
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:33:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 043503C6300
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:33:08 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DDC69600850
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627547586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L0dRSaYU2sHYZehbOm4yO8LSvrCDvsl2xIgiBJZV2Ws=;
 b=Qgq4pMIL4+nZ1aF8zuTGOZ/tnaWzh7cz1+H6BK4sz7ir1xmLfGEAW55lBPiOg0Gr04xxLR
 GJH586EK5G/76eLtShOgTEmnx5a4PIRfFIauUTuVroRNZeY6OHwiwRflNCavC19CfrX3mN
 OjOH8IMOS+lcQGbXbVeFd8hFVZNcBxw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-pu7Ke0MSPS-IIPi6lBb75w-1; Thu, 29 Jul 2021 04:33:04 -0400
X-MC-Unique: pu7Ke0MSPS-IIPi6lBb75w-1
Received: by mail-oi1-f197.google.com with SMTP id
 c18-20020a0568081392b029025ca5afbdeaso2658906oiw.23
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 01:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L0dRSaYU2sHYZehbOm4yO8LSvrCDvsl2xIgiBJZV2Ws=;
 b=kKU51XHebLIVyn2OVl8R5fEoNiHVyHKhBvpJejMu5ow6BGXk7kuzK84kUuBTQ/mThG
 cSxpb20MWk45doxlvs8p6eP9d29j64MUw6kqw4nxEZCnMKPpDsJgY8fJB3jRBfJKiLS8
 EurT5+vJCpBGFgAS6JHla2oKEIBdW134GpF7BSlwZfR5E7ofFt7Ioa+WkTn/UWqexSVm
 lqykYhGr+tsYqdg56kf4LYb3I4XUwxTTzTYUJPB2RSqQ/4x7xmiuKXphk0oZm9huLc1Z
 NTyGkgE8hwZzXpA9MxuR+cWk+7d61oGzWI0zMYAIvlCsuXBxZKR46/phIZ6KkiFi+v/f
 dC9Q==
X-Gm-Message-State: AOAM5308z/LUlbFNWtA/qpZjjKxTFo7ohw+Ku1Vlq/GrGfav/xcbk/ys
 Qz+L6Xf6Rml/1lrT6kvc6910XorYWR5LCkeiTWivoKfVB1cvznTONdfyReKR+IT7Erj24ZRSaI0
 euIT1pFdKr2VdGru4/Fv9bqZ6+L0=
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr2617451otl.265.1627547583407; 
 Thu, 29 Jul 2021 01:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCB5VvF6t7Nf4k+BC9r6RrP9WX5eJ6uFAhfGpie2m4OgkPDh2oILHT0PXTQV0kU5F8qVZHHbN818C6c1ornSU=
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr2617439otl.265.1627547583171; 
 Thu, 29 Jul 2021 01:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
 <CAEemH2fR-2pF5WpvgEQrNRVHJKYekXPwe72_KmQy4Bvh+NRs6Q@mail.gmail.com>
In-Reply-To: <CAEemH2fR-2pF5WpvgEQrNRVHJKYekXPwe72_KmQy4Bvh+NRs6Q@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 29 Jul 2021 10:32:47 +0200
Message-ID: <CAASaF6yiAv=cw8OFAVoT9VHnbyrSapcphpuH85N-vDBpBMNY6Q@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mbind01: accept MPOL_LOCAL when passing empty set
 for MPOL_PREFERRED
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
Content-Type: multipart/mixed; boundary="===============1301884480=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1301884480==
Content-Type: multipart/alternative; boundary="0000000000008ce7ee05c83ef371"

--0000000000008ce7ee05c83ef371
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 9:27 AM Li Wang <liwang@redhat.com> wrote:

>
>
> On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>> When empty set is passed to MPOL_PREFERRED, memory is allocated
>> on the node of the CPU that triggered the allocation.
>>
>> After kernel commit:
>>   7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
>> MPOL_PREFERRED policy")
>> kernel returns stored policy as MPOL_LOCAL.
>>
>
> As the MPOL_LOCAL has been setup as a real policy, I'm wondering should we
> add more tests for it in the next? e.g.
>

Right, but we also need something in setup to avoid running it
for kernels that don't support MPOL_LOCAL.

You're right that parameters in tst_res message appear to be in wrong order.



>
> --- a/testcases/kernel/syscalls/mbind/mbind01.c
> +++ b/testcases/kernel/syscalls/mbind/mbind01.c
> @@ -47,6 +47,19 @@ struct test_case {
>  };
>
>  static struct test_case tcase[] = {
> +       {
> +               POLICY_DESC(MPOL_LOCAL),
> +               .ret = 0,
> +               .err = 0,
> +               .test = test_none,
> +               .exp_nodemask = &empty_nodemask,
> +       },
> +       {
> +               POLICY_DESC_TEXT(MPOL_LOCAL, "target exists"),
> +               .ret = -1,
> +               .err = EINVAL,
> +               .test = test_default,
> +       },
>         {
>                 POLICY_DESC(MPOL_DEFAULT),
>                 .ret = 0,
>
>
>
>>
>> Per mhocko@suse.com in
>> https://lists.linux.it/pipermail/ltp/2021-June/023037.html
>>   Strictly speaking this is breaking user interface but I am wondering
>>   whether this really matter or is completely unexpected ... I would
>>   be inclined to keep this inconsistency and see whether anybody
>>   actually complains and have a relevant use for this behavior.
>>
>> Modify the test to accept either MPOL_PREFERRED or MPOL_LOCAL.
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>
>
> Reviewed-by: Li Wang <liwang@redhat.com>
>
> But anyway, this patch makes sense!
>
> --
> Regards,
> Li Wang
>

--0000000000008ce7ee05c83ef371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 9:27 AM Li Wang &lt;<=
a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 26, 2021=
 at 8:53 PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">When empty set is passed to MPOL_PREFERRED=
, memory is allocated<br>
on the node of the CPU that triggered the allocation.<br>
<br>
After kernel commit:<br>
=C2=A0 7858d7bca7fb (&quot;mm/mempolicy: don&#39;t handle MPOL_LOCAL like a=
 fake MPOL_PREFERRED policy&quot;)<br>
kernel returns stored policy as MPOL_LOCAL.<br></blockquote><div><br></div>=
<div><div style=3D"font-size:small">As the MPOL_LOCAL has been setup as a r=
eal policy, I&#39;m wondering should we</div><div style=3D"font-size:small"=
>add more tests for it in the next? e.g.</div></div></div></div></blockquot=
e><div><br></div><div><div style=3D"font-family:monospace" class=3D"gmail_d=
efault">Right, but we also need something in setup to avoid running it</div=
><div style=3D"font-family:monospace" class=3D"gmail_default">for kernels t=
hat don&#39;t support=20
MPOL_LOCAL.</div><div style=3D"font-family:monospace" class=3D"gmail_defaul=
t"><br></div><div style=3D"font-family:monospace" class=3D"gmail_default">Y=
ou&#39;re right that parameters in tst_res message appear to be in wrong or=
der.<br></div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">--- a/testcas=
es/kernel/syscalls/mbind/mbind01.c<br>+++ b/testcases/kernel/syscalls/mbind=
/mbind01.c<br>@@ -47,6 +47,19 @@ struct test_case {<br>=C2=A0};<br>=C2=A0<b=
r>=C2=A0static struct test_case tcase[] =3D {<br>+ =C2=A0 =C2=A0 =C2=A0 {<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DESC(MPOL_LOCAL=
),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret =3D 0,<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .err =3D 0,<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =3D test_none,<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .exp_nodemask =3D &amp;empty_node=
mask,<br>+ =C2=A0 =C2=A0 =C2=A0 },<br>+ =C2=A0 =C2=A0 =C2=A0 {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DESC_TEXT(MPOL_LOCAL, &quo=
t;target exists&quot;),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .ret =3D -1,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .err=
 =3D EINVAL,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .test =
=3D test_default,<br>+ =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DES=
C(MPOL_DEFAULT),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 .ret =3D 0,<br></div><div style=3D"font-size:small"><br></div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Per <a href=3D"mailto:mhocko@suse.com" target=3D"_blank">mhocko@suse.com</a=
> in <a href=3D"https://lists.linux.it/pipermail/ltp/2021-June/023037.html"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/pipermail/ltp/=
2021-June/023037.html</a><br>
=C2=A0 Strictly speaking this is breaking user interface but I am wondering=
<br>
=C2=A0 whether this really matter or is completely unexpected ... I would<b=
r>
=C2=A0 be inclined to keep this inconsistency and see whether anybody<br>
=C2=A0 actually complains and have a relevant use for this behavior.<br>
<br>
Modify the test to accept either MPOL_PREFERRED or MPOL_LOCAL.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><di=
v><div style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto=
:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</div></div>=
<div style=3D"font-size:small"><br></div></div><div style=3D"font-size:smal=
l">But anyway, this patch makes sense!</div><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>
</blockquote></div></div>

--0000000000008ce7ee05c83ef371--


--===============1301884480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1301884480==--

