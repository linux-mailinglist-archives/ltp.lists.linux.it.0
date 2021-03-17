Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11633EE5C
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:33:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85F5E3C2D51
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:33:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0A6743C2CF7
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:33:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id ECD3A1401134
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615977225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dg2WFlrZkkSNKeAAVHXYwzf+gZrEYFYoYGCqxDsj8xU=;
 b=ANPsBYmpQ+6VpqChb9uTkazHzpvUBtpx3BQbLPI5sY6B82JWjc0b7N2HxNAGG6l5HHvTd4
 TDn9dDl6a2A+CwCYR6OTYmzlLK4mEq1Om+gyDYKcM7li5AE0zZfYhkxFNByQy12dtYNwmD
 GVo6A6mrcuK4XrcCRQOhUjsNM6t7JpQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-2RLsCVeBNASx2KizxXzRhQ-1; Wed, 17 Mar 2021 06:33:44 -0400
X-MC-Unique: 2RLsCVeBNASx2KizxXzRhQ-1
Received: by mail-yb1-f198.google.com with SMTP id k189so5545931ybb.17
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 03:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dg2WFlrZkkSNKeAAVHXYwzf+gZrEYFYoYGCqxDsj8xU=;
 b=ACM8yKwQ2hPS62MYrACN2HuB/Hk8h3Y/Ycwj+lJxy6A4etjoc0fLdQJW0kSs6H3WKd
 o+I6ZJ3A9RP+6Dm7WE41OrjFR49rz8A4Vp/MHPeabIc/7s0Apsu+7F/tdJwCVUQnM8ln
 YFxuoF3w27Muo+41u4IoJo1CY1JedaxjY3b0wDuZcH7Y5L+Ov6dN5nUjCgh74Tm0HV4u
 VN+y6ze1xHcj17Sj5SoDFj5HNogLNT4L9Q9VExeMkid5o3u7DbFzkMZy7AY0jRA9vp6L
 ZMF8qdTNvf6qJj9PVc5iCS2akqbibGst4ojBjfw/T6hh3q33gyiCKqhiEhpDac1NC/j0
 njpA==
X-Gm-Message-State: AOAM533xTkpwnW4nEkilrWjHc9pAISWbo/l2RoObFZBfn6xOcclI5UbR
 TURd13c1aHiBuX+tInwTb+6FEVL3xHwgLwRU9ubV0M6ZZWDB1NdDfBsilfHI8GeNg/dFTv8DrTB
 40+G/EL4WgMhA2ID+n3gBAOrIhyE=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr3751661ybg.97.1615977223020;
 Wed, 17 Mar 2021 03:33:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2yvcC8Kpp0+tFBxaQlgbyuGu9u025IICWW1j3DiaqNj2ynJ+QUl+vN6D5VpNPwTQtPxSGLU206oeE4NYV/tA=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr3751650ybg.97.1615977222786;
 Wed, 17 Mar 2021 03:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210316130036.1838169-1-lkml@jv-coder.de>
 <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
 <4e99e625-07f1-e0c1-ab23-30f0ee8e59ef@jv-coder.de>
 <CAEemH2ej++f-e17ifn2eFqaQJmECgei62nXR7LnD-X1ypQ3czQ@mail.gmail.com>
 <dbebbb6b-b2d1-c95a-3a8d-d92aae7a83f3@jv-coder.de>
 <CAEemH2e5xZvJQSYgBXqhgEpqYyQyM=VTb6sWBJr0REzBDVnr5A@mail.gmail.com>
 <YFHR13zKL9XZtdya@yuki.lan> <6a27ab32-9402-bf37-8828-05c2d5ff9c9e@jv-coder.de>
 <YFHTLDEka/Mi4xOL@yuki.lan>
In-Reply-To: <YFHTLDEka/Mi4xOL@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 18:33:30 +0800
Message-ID: <CAEemH2c7g4xVp_OeiyG7hr6J4b0S2kw_kB7sCDP+Xuwfe9aPog@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix: Remove hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0027987510=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0027987510==
Content-Type: multipart/alternative; boundary="000000000000547ba505bdb9042f"

--000000000000547ba505bdb9042f
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 5:58 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > There are also some LTP_-macros in open posix (like
> LTP_ATTRIBUTE_UNUSED).
> > I wasn't sure if maybe full assimilation is targeted. That's why I used
> > LTP-prefix.
>
> Sigh, looks like we have things prefixed with LTP_ in posixtest.h, that
> should be fixed as well.
>

I will send a patch to fix all. Thanks!

-- 
Regards,
Li Wang

--000000000000547ba505bdb9042f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 5:58 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; There are also some LTP_-macros in open posix (like LTP_ATTRIBUTE_UNUS=
ED).<br>
&gt; I wasn&#39;t sure if maybe full assimilation is targeted. That&#39;s w=
hy I used <br>
&gt; LTP-prefix.<br>
<br>
Sigh, looks like we have things prefixed with LTP_ in posixtest.h, that<br>
should be fixed as well.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">I will send a patch to fix all. Th=
anks!</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--000000000000547ba505bdb9042f--


--===============0027987510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0027987510==--

