Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4418D3D9FDB
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:52:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78E5B3C6336
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 10:52:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F39683C6300
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:52:46 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DAAEC1A00E04
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 10:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627548764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1wU4e/Js/upuxgtlfG7mIudYEsMUK/8ogrJqPuZEB0=;
 b=cFMG4vo/yCwWgkpjJvC7UOiuXJp7jMaAdI5/IsP73F+Hnf5eitbU/8C0gtnAmtFjguL2OJ
 suynBd8Yf9Idz/s6DDfF6l0WM96hk9O60bLDTOc5uZRwVy2JmS+qxxknkVzj1gH909qAe7
 4GKDmV7iygaXfUUJ3OvzrGD+c2G1SS4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-usndFzYeNYKn71F8HMmr9Q-1; Thu, 29 Jul 2021 04:52:42 -0400
X-MC-Unique: usndFzYeNYKn71F8HMmr9Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 p71-20020a25424a0000b029056092741626so6007232yba.19
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 01:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1wU4e/Js/upuxgtlfG7mIudYEsMUK/8ogrJqPuZEB0=;
 b=KxDGPTYyEAJiJ0N4/Ml2JOlXHIw85kpLBr0ClfF8ciw+e2TiLaQ3yYbkFkBMSJOZVc
 4ajwk32HjZ/oIpyRioKBH1GZ7hyWoHdX09vocGmGC8Nar7DxIbRDFUfkhCcDuDKMMxwY
 KiFrCXvSJkwiHJYe1k5JaOhysYLelNVosbT3Am7FKwNdzrdvU7Dv9mlmLuYEpHJdxkqk
 eTG0s4ySSiKKc7EgEaVroz1nQh3RyYwMuSZpL1zQQxHOVkON6+Nn4ZbQ69jprmaSR+Sn
 0FAQbfHoOoYcebZ8+k6Wz/enuxVDBL+9u7T9/ZHHloP2cYyuorMxwSe6q/5HZlXfCJLv
 bQvA==
X-Gm-Message-State: AOAM5322iM1qJcKkqTXgLe5SW/QMhHYf6JUzaaCEs86C3kP5WxiZvqd8
 VpaL7NgFLxKN60pXWHwOVXyDivtCks/qmQZ8L3KENHfvT9bMYXj2UfkYuqbJYwDBAg25MBLPz+6
 hyf1YvHgbYxVT/CmmDV3KW08OqOo=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr5236944ybc.252.1627548761193; 
 Thu, 29 Jul 2021 01:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQyRPI6CAWRIC4u6IL29kTydu3mgh+KJsBvKChVe3s9xLuXcXwlYqZpfhPxZFCH3JGSKb+nBt+NCR5whZsDeM=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr5236915ybc.252.1627548760772; 
 Thu, 29 Jul 2021 01:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <3d693985aafc13fba1cd7c4fa807bbbddd015c7b.1627303875.git.jstancek@redhat.com>
 <CAEemH2fR-2pF5WpvgEQrNRVHJKYekXPwe72_KmQy4Bvh+NRs6Q@mail.gmail.com>
 <CAASaF6yiAv=cw8OFAVoT9VHnbyrSapcphpuH85N-vDBpBMNY6Q@mail.gmail.com>
In-Reply-To: <CAASaF6yiAv=cw8OFAVoT9VHnbyrSapcphpuH85N-vDBpBMNY6Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 29 Jul 2021 16:52:29 +0800
Message-ID: <CAEemH2eqkQK+JYoawHK3s68oez26HmJtMJau1GvWm7a4-j26bw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1652982414=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1652982414==
Content-Type: multipart/alternative; boundary="000000000000bda6fd05c83f3930"

--000000000000bda6fd05c83f3930
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 4:33 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> On Thu, Jul 29, 2021 at 9:27 AM Li Wang <liwang@redhat.com> wrote:
>
>>
>>
>> On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek <jstancek@redhat.com> wrote:
>>
>>> When empty set is passed to MPOL_PREFERRED, memory is allocated
>>> on the node of the CPU that triggered the allocation.
>>>
>>> After kernel commit:
>>>   7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
>>> MPOL_PREFERRED policy")
>>> kernel returns stored policy as MPOL_LOCAL.
>>>
>>
>> As the MPOL_LOCAL has been setup as a real policy, I'm wondering should we
>> add more tests for it in the next? e.g.
>>
>
> Right, but we also need something in setup to avoid running it
> for kernels that don't support MPOL_LOCAL.
>

+1 we can achieve that in a separate patch.

I'm also planning to add one more function which named mbind_policy_name()
in the mbind.h to help make the log more readable, just like what we did in:
   static inline const char *mbind_flag_name(unsigned flag)

And yes, we can do that separately.


> You're right that parameters in tst_res message appear to be in wrong
> order.
>

Feel free to fix it while merging this patch.

-- 
Regards,
Li Wang

--000000000000bda6fd05c83f3930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 4:33 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-family:monospace"><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29=
, 2021 at 9:27 AM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 8:53 PM Jan Stancek =
&lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">When empty set is passed to MPOL_PREFERRED, memory is allocated<br>
on the node of the CPU that triggered the allocation.<br>
<br>
After kernel commit:<br>
=C2=A0 7858d7bca7fb (&quot;mm/mempolicy: don&#39;t handle MPOL_LOCAL like a=
 fake MPOL_PREFERRED policy&quot;)<br>
kernel returns stored policy as MPOL_LOCAL.<br></blockquote><div><br></div>=
<div><div style=3D"font-size:small">As the MPOL_LOCAL has been setup as a r=
eal policy, I&#39;m wondering should we</div><div style=3D"font-size:small"=
>add more tests for it in the next? e.g.</div></div></div></div></blockquot=
e><div><br></div><div><div style=3D"font-family:monospace">Right, but we al=
so need something in setup to avoid running it</div><div style=3D"font-fami=
ly:monospace">for kernels that don&#39;t support=20
MPOL_LOCAL.</div></div></div></div></blockquote><div>=C2=A0</div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">+1 we can achieve that i=
n a separate patch.</span>=C2=A0</div><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">I&#39;m also planning to add one more=
 function which named mbind_policy_name()</div><div class=3D"gmail_default"=
 style=3D"font-size:small">in the mbind.h to help make the log more readabl=
e, just like what we did in:</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0static inline const char *mbind_flag_name(unsign=
ed flag)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">And yes, we can =
do that separately.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"></div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-=
family:monospace"><br></div><div style=3D"font-family:monospace">You&#39;re=
 right that parameters in tst_res message appear to be in wrong order.<br><=
/div></div></div></div></blockquote><div><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Feel free to fix it while merging this patch=
.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000bda6fd05c83f3930--


--===============1652982414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1652982414==--

