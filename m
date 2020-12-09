Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF682D3B68
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 07:26:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B3573C2B8C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 07:26:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DCB353C25D3
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 07:25:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C373A200BA9
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 07:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607495156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zCvwjS34joJTT23Z6fql/krpbUHe5nbN7Qf4qUTprUg=;
 b=UylOH4hMclG82r2glXJ4Bro4xkD3sdbx2wX4Eo5gG0FdbxwZqRqSXHuala0lqz6KyLA9gN
 oRIpSc8sQ97Os9eKRM35AvZVHbpwRwJhHYMjI7hvXZ9Twzm+ESzs+Q6NbkXfet4qckxd9E
 PEwELdygnuqWGKt1DbYeWTkCrcy+bsc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-EmTSQyJ9NdKFq9jEerY2Cg-1; Wed, 09 Dec 2020 01:25:52 -0500
X-MC-Unique: EmTSQyJ9NdKFq9jEerY2Cg-1
Received: by mail-yb1-f197.google.com with SMTP id z3so608909ybc.0
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 22:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zCvwjS34joJTT23Z6fql/krpbUHe5nbN7Qf4qUTprUg=;
 b=kiY377aqpcDfKpQubsyPdWMkv0iLyVhb5IU1A48S69Vo5Liso33Kin1QAvt8DUfbHQ
 UxXltwEeS/0aWGYhE3h3cZi9tsgAHdk8uGmgwWnjjJPQPn/n7woN4KfBXOBF0TduFy0H
 q5SbOabf9eKKSsQOujjOdOlq4ODV5VubN2z5GphFdSLwQBT7OegXY8y8jt/C1ZLk744E
 teXvu3CT23D9mGAvvTXgorph7uqV6PrlaCv6e4i5oH22ORkdUyG4Z6vg2XUd3kOFlklu
 is3ME6qSkJOd81bA2MkgeGgjpEveCpJ86njcs0+OpibOko7Q6idS243NEbdvoQfmQowR
 cf9A==
X-Gm-Message-State: AOAM531vIjIFNsYKEvROqsyTEVShl3t7vPPjpR3kX8A0A3xUtPujCnVp
 z08qDY14KfNiubstOAUKeTyVxtrNbfDLWb5TpPxuEvLzQz2JK60+BoqoPcYCNYKuFL1aUJBrfjJ
 ET9SRhT5asLUBl4CBcj/3L78KnOA=
X-Received: by 2002:a25:6902:: with SMTP id e2mr1500272ybc.97.1607495151817;
 Tue, 08 Dec 2020 22:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNWZfEzZgoJCesgI2oc6Of7YpNWEGhqgdO2U5rkV5EVvZYx+0DFlVYEh7u/+/tjWRrkKsJASu9z8CSfBEbmSE=
X-Received: by 2002:a25:6902:: with SMTP id e2mr1500264ybc.97.1607495151675;
 Tue, 08 Dec 2020 22:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20201207145639.8424-1-pvorel@suse.cz>
 <CAEemH2eWAvsyveMm6kaJ=UwMcuPSWZif8yDXr4zBpc-V5MpOGg@mail.gmail.com>
 <X88g6ptzTJowapTO@pevik>
In-Reply-To: <X88g6ptzTJowapTO@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Dec 2020 14:24:32 +0800
Message-ID: <CAEemH2fHW+F8s_FBwv8LmE1eWEzVd5OgvGeCP9TCSECwF+8K0w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] doc: Document .min_cpus
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
Content-Type: multipart/mixed; boundary="===============1279019262=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1279019262==
Content-Type: multipart/alternative; boundary="0000000000007e811205b60221b0"

--0000000000007e811205b60221b0
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 2:45 PM Petr Vorel <pvorel@suse.cz> wrote:

> [...]
>
> > single --> specific number of
>
> +1
>

I help to modified and pushed, thanks Petr.

-- 
Regards,
Li Wang

--0000000000007e811205b60221b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 8, 2020 at 2:45 PM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" st=
yle=3D"font-size:small">[...]</span><br>
<br>
&gt; single --&gt; specific number of<br>
<br>
+1<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">I help to modified and pushed, thanks Petr.</div></div=
><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></=
div>

--0000000000007e811205b60221b0--


--===============1279019262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1279019262==--

