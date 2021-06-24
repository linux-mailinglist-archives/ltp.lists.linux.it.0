Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A936F3B30BB
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 16:00:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 066543C8703
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 16:00:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D8173C2B48
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 16:00:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5430A200DC9
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 16:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624543249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pzxCCXehzCQHxdAf92JDucyDBbVn2yERZpc/zhhovig=;
 b=P4oNOT2ZPzvgQOH/rngoryloYwHXJ67BjHdSksZLg95tMC8FAiOzI0Bp9RpMZ77P52WBaS
 DNR4a0+VQjtSW/+W+CFaTJChS0OxXvxR77+6NnGmDOw/01L8pY9Uh9kvnX+nDsf8iqtceh
 sTb4i0nxtVAkZON21G+JS3LUVqL6BY8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-H8VdQTdmNcajcqo8RO-g9w-1; Thu, 24 Jun 2021 10:00:45 -0400
X-MC-Unique: H8VdQTdmNcajcqo8RO-g9w-1
Received: by mail-qv1-f71.google.com with SMTP id
 12-20020a05621420ecb02902766cc25115so7185488qvk.1
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 07:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzxCCXehzCQHxdAf92JDucyDBbVn2yERZpc/zhhovig=;
 b=LIIc7l6N/dW9c1VHQ/6mqKemRgUAD0I6XwF+G2P/6g3qXAms1SFQXLeE9WdM6WKM/k
 OuDn5cvq8ec4l45s0926UvbomOCB3Z02WvthiQtFNdh4bmpOnPCkQUaLHeahrFWhFmdE
 AF5FKkiFD2FgoTWz8z1d1NbiOwNqSd4IYU8BNyJLZvnUJfuJ+UJISg1z7ccv/g2cVBpC
 VTCmsNvrcxQgfBZKxtSzmlgk//N1q6U/qJ/4aP2Cqy/hmaUYL1Ez2FnCywSWV7O7tLdo
 220STa7EqfJnw+xc57ynOYWv4d19FR0ltr9CMl3nEU2XS1beIwScKqjF1ppQihtSkqJn
 pj+A==
X-Gm-Message-State: AOAM532PskagCuQSsdYmVR4H8JWDP7P1YATqo3h4tJBEbN/qwVPmTNFU
 rLCnGsELaGKRXW5xzqlvzzOtqyFtFLtsafSuRYSxPSBbrPh2piHElbMkJN0ejyVUOwkbkzlGkkW
 r6LWnz2yS0+aegjKEGAuYerk9/pE=
X-Received: by 2002:a25:1455:: with SMTP id 82mr5056561ybu.403.1624543245249; 
 Thu, 24 Jun 2021 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLYmrKGZhiuveDPHLU4+UUxzwY1rsn8u0ZN16IAhOjvFsBkuoZB07oMEqhlNrV4Wg9OxDgyhl5g/GgqKFgGE4=
X-Received: by 2002:a25:1455:: with SMTP id 82mr5056527ybu.403.1624543245002; 
 Thu, 24 Jun 2021 07:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
 <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
In-Reply-To: <018a369f-473b-524d-f81b-eb8be4df49bb@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Jun 2021 22:00:33 +0800
Message-ID: <CAEemH2eSNnhwnOOOMoUf5Xv0uup_ZTJMDncLsgkChcULY37RfQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Subject: Re: [LTP] [PATCH] lib: memutils: don't pollute entire system memory
 to avoid OoM
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
Content-Type: multipart/mixed; boundary="===============1552826492=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1552826492==
Content-Type: multipart/alternative; boundary="0000000000000a7bef05c583735d"

--0000000000000a7bef05c583735d
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 9:33 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 24. 06. 21 15:22, Krzysztof Kozlowski wrote:
> > On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test was
> > failing because of OoM killer during memory pollution:
> >
> > ...
> >
> > It seems leaving hard-coded 128 MB free memory works for small or medium
> > systems, but for such bigger machine it creates significant memory
> > pressure triggering the out of memory reaper.
> >
> > The memory pressure usually is defined by ratio between free and total
> > memory, so adjust the safety/spare memory similarly to keep always 0.5%
> > of memory free.
>
> Hi,
> I've sent a similar patch for the same issue a while ago. It covers a
> few more edge cases. See [1] for the discussion about it.


> [1]
>
> https://patchwork.ozlabs.org/project/ltp/patch/20210127115606.28985-1-mdoucha@suse.cz/


FYI, Another related analysis:
https://lists.linux.it/pipermail/ltp/2021-April/021903.html

The mmap() behavior changed in GUESS mode from commit 8c7829b04c523cd,
we can NOT receive MAP_FAILED on ENOMEM in userspace anymore, unless
the process one-time allocating memory larger than "total_ram+ total_swap"
explicitly.

Which also means the MAP_FAILED check lose effect permanently in line#51:
https://github.com/linux-test-project/ltp/blob/master/lib/tst_memutils.c#L51

-- 
Regards,
Li Wang

--0000000000000a7bef05c583735d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><div><div class=3D"gmail_default"><br></div></div></div></div=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, J=
un 24, 2021 at 9:33 PM Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz"=
 target=3D"_blank">mdoucha@suse.cz</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 24. 06. 21 15:22, Krzysztof Kozlowski =
wrote:<br>
&gt; On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test wa=
s<br>
&gt; failing because of OoM killer during memory pollution:<br>
&gt; <br>
&gt; ...<br>
&gt; <br>
&gt; It seems leaving hard-coded 128 MB free memory works for small or medi=
um<br>
&gt; systems, but for such bigger machine it creates significant memory<br>
&gt; pressure triggering the out of memory reaper.<br>
&gt; <br>
&gt; The memory pressure usually is defined by ratio between free and total=
<br>
&gt; memory, so adjust the safety/spare memory similarly to keep always 0.5=
%<br>
&gt; of memory free.<br>
<br>
Hi,<br>
I&#39;ve sent a similar patch for the same issue a while ago. It covers a<b=
r>
few more edge cases. See [1] for the discussion about it.</blockquote><div =
class=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
[1]<br>
<a href=3D"https://patchwork.ozlabs.org/project/ltp/patch/20210127115606.28=
985-1-mdoucha@suse.cz/" rel=3D"noreferrer" target=3D"_blank">https://patchw=
ork.ozlabs.org/project/ltp/patch/20210127115606.28985-1-mdoucha@suse.cz/</a=
></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">FYI, Another related analysis: <a href=3D"https://lists.linux.it/p=
ipermail/ltp/2021-April/021903.html">https://lists.linux.it/pipermail/ltp/2=
021-April/021903.html</a></div><div><div class=3D"gmail_default"><br></div>=
The mmap() behavior changed in GUESS mode from commit 8c7829b04c523cd,<br>w=
e can NOT receive MAP_FAILED on ENOMEM in userspace anymore,<span class=3D"=
gmail_default"> </span>unless<span class=3D"gmail_default">=C2=A0</span></d=
iv><div><span class=3D"gmail_default"></span>the process one-time allocatin=
g memory larger than &quot;total_ram+ total_swap&quot; explicitly.</div><di=
v><br></div><div class=3D"gmail_default">Which also means the MAP_FAILED ch=
eck lose effect=C2=A0permanently in line#51:</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><a href=3D"https://github.com/linux-test-proj=
ect/ltp/blob/master/lib/tst_memutils.c#L51">https://github.com/linux-test-p=
roject/ltp/blob/master/lib/tst_memutils.c#L51</a></div></div><div><br></div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--0000000000000a7bef05c583735d--


--===============1552826492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1552826492==--

