Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 100283AEABD
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 16:05:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C31E3C7044
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 16:05:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 629A13C2307
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 16:05:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5E6A6200990
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 16:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624284298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s5bdn+UVQjcUMGCZierOAyj18l8OzR5jmPyki586Jj0=;
 b=TZYYoGinIAnIIKmViMtmgO+VC6vFhnM/yPOVIh9o+CVAXKHIKmIMfKM98qbLxjm0BMN5ej
 2Jo4SSycLBx+ESK788gYdYfpjRdZ5vSXyU8Wx72HL4p9qsXYc/B/lrcQ6a6Y/B8bnAYU50
 eewo4CLm6Q07xT6GPIt3RrQJLUJp2Lo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-8-lbfFf1NBiYEZRvdGy-sg-1; Mon, 21 Jun 2021 10:04:57 -0400
X-MC-Unique: 8-lbfFf1NBiYEZRvdGy-sg-1
Received: by mail-qk1-f199.google.com with SMTP id
 v1-20020a372f010000b02903aa9be319adso14133451qkh.11
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=s5bdn+UVQjcUMGCZierOAyj18l8OzR5jmPyki586Jj0=;
 b=TFoFjFkRoeJK9poCEOEm9t1gkDIA0pkx4AaObsJK/yVLAWm3KOyEy9SEp/xKK6zuF6
 EiMSD4+3XzEQGyejgYhpq2UaAAPgDgnC02NbM/zUOkMcKzZRW12bIfLdB4oTMn0+CzlO
 T6iM79krA4BjYOJw696tuVfyYqIxcs+lyBIZYQ9vIook+a7A0HeKe5cCSdgyt0Q4Za5P
 V68imlNzy86RfChAPsLkaw0RnznM2q+d7axTvrbdO33606tejEzq8z8Hov5ItlTsiBuQ
 PTRSTWkmfilvA7cEJyarhYKb/E+Da5HFThH/0WYECVXxcXJpEBTumCX66jVnnryijxdl
 XlmQ==
X-Gm-Message-State: AOAM533X7o1z5wBYgkTewoVxTJLrx8XCHYmAvIlvKdnJHxgIF6B7Ydiy
 KV0onuynUTCxnRYNbvKVnLuhyHOVMz8aaAlSWVK9rCrkLvCYffgHiZXbiV+E99VDCLN8tpxpRkl
 RVDjQOlXSCWUk6kb531nuJd0wxFA=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr31304543yba.110.1624284296476; 
 Mon, 21 Jun 2021 07:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5hZ2NoiABmzmMCfPEPMS4MC7d8LkzCMzrAiYcJhhcxIjfr4iMN/BK4fDFXLE4XKdg0DB5+nXgRykDwcFanvU=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr31304497yba.110.1624284296021; 
 Mon, 21 Jun 2021 07:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111509.358656-1-liwang@redhat.com>
In-Reply-To: <20210621111509.358656-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 21 Jun 2021 22:04:44 +0800
Message-ID: <CAEemH2f+eC9kJdy4NcWPfOq8gGTGWfQ=6vaOyYX9-UWQ4+LJuQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: Re: [LTP] [PATCH 1/2] mem: child memory alloc should larger than
 memory.max+memory.swap.max if lite==1
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
Content-Type: multipart/mixed; boundary="===============1757124776=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1757124776==
Content-Type: multipart/alternative; boundary="0000000000007aa1d705c54728f3"

--0000000000007aa1d705c54728f3
Content-Type: text/plain; charset="UTF-8"

Forget to mention, this is debugging/analysis under Cgroup V2. Since
Cgroup V1 has a unified memory+swap counter that tracks a data page
regardless whether it's in-core or swapped out.  But Cgroup V2 tracks
memory and swap in separate, so it splits memory and swap counter.

That's the main reason why oom03 got PASS in Cgroup v1 but FAIL in V2.

So, int ret = alloc_mem(TESTMEM + TESTMEM + MB, testcase);
is tend to make Cgroup V2 happy, but also works for v1, because
it allocates more memory larger than previous.

Or, we could test separately for V1 and V2, and that should not be very
hard.

-- 
Regards,
Li Wang

--0000000000007aa1d705c54728f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Forget to mention, this is debugging/analysis under Cgroup V2. Since</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Cgroup V1 has a u=
nified memory+swap counter that tracks a data page</div><div class=3D"gmail=
_default" style=3D"font-size:small">regardless whether it&#39;s in-core or =
swapped out.=C2=A0 But Cgroup V2 tracks</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">memory and swap in separate, so it splits memory a=
nd swap counter.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">That&#39=
;s the main reason why oom03 got PASS in Cgroup v1 but FAIL in V2.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">So, int ret =3D alloc_mem(TESTMEM=
 + TESTMEM + MB, testcase);</div><div class=3D"gmail_default" style=3D"font=
-size:small">is tend to make Cgroup V2 happy, but also works for v1, becaus=
e</div><div class=3D"gmail_default" style=3D"font-size:small">it allocates =
more memory larger than previous.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Or, we could test separately=C2=A0for V1 and V2, and that should=
 not be very hard.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000007aa1d705c54728f3--


--===============1757124776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1757124776==--

