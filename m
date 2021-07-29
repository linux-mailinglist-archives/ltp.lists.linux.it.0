Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CC3D9E67
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:27:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C1D33C8F71
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:27:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49AD43C6304
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:27:42 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AAD53200DBD
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627543660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZEo+cp5T14uvq3wnSVxJbu/9Fvv3+OVFasbgvaYIHw=;
 b=V2wwQwb6K6a4wa2XGTyP4wPZmK6HyOT/NKVMyzegCzNe47b1eYJZF1jv0SSVAllLG8a9TB
 1WBA8Qh6z43zTwwuJyby46XXafJoO84KKBm4V8YV6LihelseWnlDQ/g7FYmIypomk9vRfB
 Um5TC8PbcdgJEQXy2x/mdZ4qsXsStyA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-dieJ17DaPxe0Gk74Vlb8Yg-1; Thu, 29 Jul 2021 03:27:37 -0400
X-MC-Unique: dieJ17DaPxe0Gk74Vlb8Yg-1
Received: by mail-yb1-f198.google.com with SMTP id
 s123-20020a2577810000b02904f84a5c5297so5897195ybc.16
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 00:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZEo+cp5T14uvq3wnSVxJbu/9Fvv3+OVFasbgvaYIHw=;
 b=A+sOO7TwnrDPlwOZRqFUk6ij47Pafmori6sqqXV88sylAOkYORYDdoESqN2PMFRwKO
 OCgLIvkdqiUa8o9EtEK38yhd0NCQ7HUUxU7Hv+II+Qj40u0qjWqvo9NL/p1HRg5WzkYq
 42tupBYBeau0w0Kc7UeXWVTw6zf4gnN8gLpmtAFckYLRQBh2JA+MAhB91C9GqeuVV+7o
 amSiymFFFHRObsN0uqeVO3AvwWlxlW7VwWnra5rWTGdj3tFxJDUMFh6vZO4syAk31XTK
 0DRGnqSI/q1vrFoRQFXkuuPMeDQ/buP8VUjUZc/RmLXfQYy1QUJgKP/PZq1OePmMJ9j7
 kVTQ==
X-Gm-Message-State: AOAM532JExVmTZzmN6xNY3BLNgDieYPOG9V1qa/gRIdRh3JRUlYiHISu
 kxXa5UnWluoaOQ7pAlzy1m77BC0HcAKjui/iNxffztKfChyFXuT0M8c7lMmDjmcc+biYZaqIyTK
 OK3SVY0lCU6mKADMSztpfVZKL8TM=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr4850185ybc.252.1627543656453; 
 Thu, 29 Jul 2021 00:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjm9mmeOwjlUriphRkbBAuKbwujRtrWje/UUuU/ngjQwf/2RaE28XAB8RHRV3HF7/tuZLWjmSfJo+Q4VufKDE=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr4850166ybc.252.1627543656219; 
 Thu, 29 Jul 2021 00:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
In-Reply-To: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 29 Jul 2021 15:27:24 +0800
Message-ID: <CAEemH2fR-2pF5WpvgEQrNRVHJKYekXPwe72_KmQy4Bvh+NRs6Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1699612845=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1699612845==
Content-Type: multipart/alternative; boundary="0000000000007c5dc805c83e0965"

--0000000000007c5dc805c83e0965
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek <jstancek@redhat.com> wrote:

> When empty set is passed to MPOL_PREFERRED, memory is allocated
> on the node of the CPU that triggered the allocation.
>
> After kernel commit:
>   7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
> MPOL_PREFERRED policy")
> kernel returns stored policy as MPOL_LOCAL.
>

As the MPOL_LOCAL has been setup as a real policy, I'm wondering should we
add more tests for it in the next? e.g.

--- a/testcases/kernel/syscalls/mbind/mbind01.c
+++ b/testcases/kernel/syscalls/mbind/mbind01.c
@@ -47,6 +47,19 @@ struct test_case {
 };

 static struct test_case tcase[] = {
+       {
+               POLICY_DESC(MPOL_LOCAL),
+               .ret = 0,
+               .err = 0,
+               .test = test_none,
+               .exp_nodemask = &empty_nodemask,
+       },
+       {
+               POLICY_DESC_TEXT(MPOL_LOCAL, "target exists"),
+               .ret = -1,
+               .err = EINVAL,
+               .test = test_default,
+       },
        {
                POLICY_DESC(MPOL_DEFAULT),
                .ret = 0,



>
> Per mhocko@suse.com in
> https://lists.linux.it/pipermail/ltp/2021-June/023037.html
>   Strictly speaking this is breaking user interface but I am wondering
>   whether this really matter or is completely unexpected ... I would
>   be inclined to keep this inconsistency and see whether anybody
>   actually complains and have a relevant use for this behavior.
>
> Modify the test to accept either MPOL_PREFERRED or MPOL_LOCAL.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

But anyway, this patch makes sense!

-- 
Regards,
Li Wang

--0000000000007c5dc805c83e0965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">When empty set is pa=
ssed to MPOL_PREFERRED, memory is allocated<br>
on the node of the CPU that triggered the allocation.<br>
<br>
After kernel commit:<br>
=C2=A0 7858d7bca7fb (&quot;mm/mempolicy: don&#39;t handle MPOL_LOCAL like a=
 fake MPOL_PREFERRED policy&quot;)<br>
kernel returns stored policy as MPOL_LOCAL.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">As the MPOL_LOC=
AL has been setup as a real policy, I&#39;m wondering should we</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">add more tests for it in t=
he next? e.g.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">--- a/testc=
ases/kernel/syscalls/mbind/mbind01.c<br>+++ b/testcases/kernel/syscalls/mbi=
nd/mbind01.c<br>@@ -47,6 +47,19 @@ struct test_case {<br>=C2=A0};<br>=C2=A0=
<br>=C2=A0static struct test_case tcase[] =3D {<br>+ =C2=A0 =C2=A0 =C2=A0 {=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POLICY_DESC(MPOL_LOC=
AL),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ret =3D 0,<br>+=
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
 .ret =3D 0,<br></div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
v><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wa=
ng &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div></di=
v><div class=3D"gmail_default" style=3D"font-size:small">But anyway, this p=
atch makes sense!</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--0000000000007c5dc805c83e0965--


--===============1699612845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1699612845==--

