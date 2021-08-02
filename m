Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF13DCEDD
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 05:17:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7E0F3C6738
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 05:16:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC9FA3C57B1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 05:16:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8F499600633
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 05:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627874213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+adjb+kG8AnEjUZd98IcLb0g4IsSXzVv78QCJBL+RgI=;
 b=iX400jbQcpBWd03uRB1V7BqeWb1W+wrt4fEM/O+uqmINNMFuDBw5OsuusonUtw20D2JQlt
 UTfSd1fEni3tIhRzkDV1KJ/wazKTgcpE2u1Qsa0toUsHfNSNGNZwpmRWjHxUztpWCaMUaA
 Fe0pnd1By+aZkGCDNE2Uui7wW3YHRSM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-Vk42lDRJP6SdPbTLUSPyxA-1; Sun, 01 Aug 2021 23:16:51 -0400
X-MC-Unique: Vk42lDRJP6SdPbTLUSPyxA-1
Received: by mail-yb1-f198.google.com with SMTP id
 e78-20020a2569510000b029059206351038so2627025ybc.22
 for <ltp@lists.linux.it>; Sun, 01 Aug 2021 20:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+adjb+kG8AnEjUZd98IcLb0g4IsSXzVv78QCJBL+RgI=;
 b=pSItqFvqZ1twzHC4+zA/AlmAp6QGAmxBZpmo5jbmBws4u5kmKgmQ2qDVnAD7QV1ucy
 w/pQWCtRNRVsQmB1bS8s8o2814J5voFX5rQWkQcLN2e0aGJVUx7gq/aTrxXNYNxsCIp9
 n64hWj9enqjvhW8TY3WrtwEhP2Ts4J7INfoDXP3RjBiybgJSOSCZQCvva9PCcaEQMe+P
 GV8VF041QUIEFxZEN0tH6gY9iJkCpshlT/2VXGqzxSdcJvgWNd8yuA3rlpEuBj/QaMAR
 PBRNrnfxFzdhJMdhFeWcv3rHfXm4p1lMUgv5aOVVNrzBF5Khlw3V4PMbRDMh4fCXDRMw
 xR6w==
X-Gm-Message-State: AOAM532nbOk3k2J5iKogopgunniu9KBZ1J0KFpccpZai7cT1lF1AzoAC
 iSuAreUd0zuAUsPSOrEkU5599LLOUAG5WASDuf8rZw3QbIEuTXzJxt7VT7jvgJdbc2jKq5m3AGs
 goPlLUR1Z6hF4Z9euHvdEBaZRARo=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr17480754ybc.97.1627874210763; 
 Sun, 01 Aug 2021 20:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIaGuMkETG+QYlKY+FHVeDIbegzxhTqEHh/FbflOES/UG+pBp2cc1cA6owZjmlOOFE0QEFRkqY6fJo1um9H1I=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr17480742ybc.97.1627874210555; 
 Sun, 01 Aug 2021 20:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210730133155.31284-1-chrubis@suse.cz>
In-Reply-To: <20210730133155.31284-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Aug 2021 11:16:38 +0800
Message-ID: <CAEemH2fw+=Y6DyC+rB2OsrQgzpFrxSxPDJusmrFsMAtiQgb8sw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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
Content-Type: multipart/mixed; boundary="===============0507210364=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0507210364==
Content-Type: multipart/alternative; boundary="0000000000000f423b05c88b0047"

--0000000000000f423b05c88b0047
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 9:32 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> There is actually no reason for lower limit on the device size, and we
> can safely allow the tests to request smaller device than the default
> hardcoded in the library. The backing file is preallocated without
> actually writing to it as long as the underlying filesystem supports it
> so the speedup will be minimal if measurable but we will at least spare
> some space which needs to be reserved on the filesystem which is still a
> good thing.
>
> The test may end up with a device that is bigger than the requsted size
> in a case that a real device was passed to the LTP for the testrun.  So
> tests should be able to cope with that and that's also the reason why
> the turning knob is still called dev_min_size.
>
> Also currently we use the dev_min_size only to increase the device size
> for a few tests so this change is safe and cannot break anything.
>
> CC: Joerg Vehlow <lkml@jv-coder.de>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

--0000000000000f423b05c88b0047
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 9:32 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">There is actually no reason=
 for lower limit on the device size, and we<br>
can safely allow the tests to request smaller device than the default<br>
hardcoded in the library. The backing file is preallocated without<br>
actually writing to it as long as the underlying filesystem supports it<br>
so the speedup will be minimal if measurable but we will at least spare<br>
some space which needs to be reserved on the filesystem which is still a<br=
>
good thing.<br>
<br>
The test may end up with a device that is bigger than the requsted size<br>
in a case that a real device was passed to the LTP for the testrun.=C2=A0 S=
o<br>
tests should be able to cope with that and that&#39;s also the reason why<b=
r>
the turning knob is still called dev_min_size.<br>
<br>
Also currently we use the dev_min_size only to increase the device size<br>
for a few tests so this change is safe and cannot break anything.<br>
<br>
CC: Joerg Vehlow &lt;<a href=3D"mailto:lkml@jv-coder.de" target=3D"_blank">=
lkml@jv-coder.de</a>&gt;<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div>=C2=A0</div><div><=
span class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang=
 &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=
=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div=
></div></div>

--0000000000000f423b05c88b0047--


--===============0507210364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0507210364==--

