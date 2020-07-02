Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6451211A8A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 05:12:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 204023C56AA
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 05:12:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9B6833C2A7F
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 05:12:51 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B5E0D1400E4C
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 05:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593659569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ym8hZBR726eT1ObVqdeP/AB3AAYV2kOr0WtLuiRjktg=;
 b=YxuKbqzz4ODytcs9yq+JC8Lj6bfWnVBn7itgI1g1LjpzJWyFLihCI2Zo4WEssaPhphqtan
 CHpSd1Sm90nM37ZI7m2CzEdq3BMO8yzJ3IqPofpmL9xkGJo18r3MShVcGPYREsHP2bV1e2
 K597X6goekOkJcAKe9WDWwP8lNhd/v4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-_zduN9TeMe-onadaeMGl9Q-1; Wed, 01 Jul 2020 23:12:43 -0400
X-MC-Unique: _zduN9TeMe-onadaeMGl9Q-1
Received: by mail-lj1-f200.google.com with SMTP id h14so11303168ljk.7
 for <ltp@lists.linux.it>; Wed, 01 Jul 2020 20:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ym8hZBR726eT1ObVqdeP/AB3AAYV2kOr0WtLuiRjktg=;
 b=pkmuGa4H7IcAJjIhqdU7C0V0c6aVD83wwiUTLvtFh1myvAK9wL3iury8FuoU2jwioo
 72stDaDHKUwdyXKSyPD8fCw+kEVGO6Emt2jVeMHN+GhwL6ZVoD8+AqULdyBiEo24xwer
 SPW05qw4E1lltVcmJbmpoAlPEeuNUn7dP9a4zOsMU0oPo+adIhEI617WH7mFn+ECHoeN
 UjQPeLacDoU5a06HA3SW0jjpJawqczxi0KpQljUXEm6zznCox4wfyCa/v1T0mv3caT3N
 6Z3ChFmVbMg1qlaxVMwEPbBGJ2wWTfA9GkYrgFBpq7wzWKO6SjRKyNQ7wKJ912dsJN7V
 ot8g==
X-Gm-Message-State: AOAM531e9oW+8Z3A5Rx/CJZVQ8H2OI+Q4xscpiAS/GJZZyzL8+pwSMJY
 fAd3VsyQ7+UNbFsLkiXfMd/41cutwth5l3XvuviT9VS7fm3puYDVQs9BLhca6L78Js2jvbbzQYr
 d726IMF1jlKom9+Vx68FILMKRpII=
X-Received: by 2002:a2e:6d02:: with SMTP id i2mr688167ljc.309.1593659561688;
 Wed, 01 Jul 2020 20:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxai5n/1jBNtwjNJSXUTx6LbLEahWKvGxX0wVgNd89l34uSmyRbKU0fStKUmchLTv+Su3w2mpHjiPeamNMbpGU=
X-Received: by 2002:a2e:6d02:: with SMTP id i2mr688163ljc.309.1593659561499;
 Wed, 01 Jul 2020 20:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200701233133.122801-1-petr.vorel@gmail.com>
In-Reply-To: <20200701233133.122801-1-petr.vorel@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jul 2020 11:12:29 +0800
Message-ID: <CAEemH2d7RxH+33nMGsPYTpKUUy-T+Nfw_uAO2OJFTYLUiWkE-A@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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
Content-Type: multipart/mixed; boundary="===============1420179790=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1420179790==
Content-Type: multipart/alternative; boundary="0000000000000e7aed05a96cc825"

--0000000000000e7aed05a96cc825
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 7:31 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> when numastat -p did not give a value, the resulting bc calculation was
> empty string instead of 0, thus shell -eq comparison lacked the first
> operator:
>
> Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB" |bc)
> if [ $(echo "$Mem_curr < $MB" |bc ) -eq 1 ]; then
>
> (standard_in) 1: syntax error
> (standard_in) 1: syntax error
> /root/ltp-install/testcases/bin/numa01.sh: line 93: [: -eq: unary operator
> expected
>
> Also fix style (use local and lowercase local function variables).
>
> Fixes: 702
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Li Wang <liwang@redhat.com>


> ---
> Hi,
>
> Simple fix for https://github.com/linux-test-project/ltp/issues/702,
> I guess there should be more checks. Not tested.
> BTW I thought numa01.sh was intended to be replaced with C (@Cyril: am I
> correct?), thus I didn't bother to split syntax fix into 2 commits.
>

I think yes, I remember the syscalls/set_mempolicy* is going to replace
numa.sh tests.

-- 
Regards,
Li Wang

--0000000000000e7aed05a96cc825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 2, 2020 at 7:31 AM Petr Vorel &lt;<a hr=
ef=3D"mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">when numastat -p did=
 not give a value, the resulting bc calculation was<br>
empty string instead of 0, thus shell -eq comparison lacked the first<br>
operator:<br>
<br>
Mem_curr=3D$(echo &quot;$(extract_numastat_p $pid $node) * $MB&quot; |bc)<b=
r>
if [ $(echo &quot;$Mem_curr &lt; $MB&quot; |bc ) -eq 1 ]; then<br>
<br>
(standard_in) 1: syntax error<br>
(standard_in) 1: syntax error<br>
/root/ltp-install/testcases/bin/numa01.sh: line 93: [: -eq: unary operator =
expected<br>
<br>
Also fix style (use local and lowercase local function variables).<br>
<br>
Fixes: 702<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;</blockquote><div><span class=3D"g=
mail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D=
"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span=
 class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Hi,<br>
<br>
Simple fix for <a href=3D"https://github.com/linux-test-project/ltp/issues/=
702" rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-pro=
ject/ltp/issues/702</a>,<br>
I guess there should be more checks. Not tested.<br>
BTW I thought numa01.sh was intended to be replaced with C (@Cyril: am I<br=
>
correct?), thus I didn&#39;t bother to split syntax fix into 2 commits.<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">I think yes, I remember the syscalls/set_mempolicy* is going t=
o replace numa.sh tests.</div></div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--0000000000000e7aed05a96cc825--


--===============1420179790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1420179790==--

