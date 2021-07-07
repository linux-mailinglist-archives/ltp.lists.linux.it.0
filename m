Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4553BE0D3
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:21:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 222AD3C9559
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:21:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E69B3C2A8B
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 04:21:18 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6F50B600E37
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 04:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625624476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBg8m0ZKmXdQvPoGCOLi+r3/987s5Fbo2ivEO0MFNz8=;
 b=B+55EXR9JsGasnhZyltXc8aI/gBdkS4cXgxC82C4vopDJ9bkSmYz+vbXi98jaZ1Tesf+Jm
 JQfIwLp297INIeAAPAuXgNjHPjXSjz5bP1E5HJkau5ziJNirTFWlzLmN4jbYCnMTBQzT2u
 vtTje6Wno7hX4NTsnRZnMC3bTohawUQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-hOMW3vNGOWuPIv4FStfkgA-1; Tue, 06 Jul 2021 22:21:14 -0400
X-MC-Unique: hOMW3vNGOWuPIv4FStfkgA-1
Received: by mail-yb1-f200.google.com with SMTP id
 o11-20020a056902110bb029055b266be219so634423ybu.13
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 19:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBg8m0ZKmXdQvPoGCOLi+r3/987s5Fbo2ivEO0MFNz8=;
 b=aSnqrNmrMZ8guvSOZeiszAgYNFM5CCoRThmc15BDrtUAFRTt7cAth2CW3OQtoQhoKS
 cOMsbMKzok+R5lqTcr2TNmSWWmJUOErf7D52MFKMBbQH+JnGp/Y5xonlRNIUjgyFM9AH
 9jaxSkeRLu6dWVjB4aO6XIfjnI+E0kxfSWLRREwF5p6BapbNGafOoKcLSmo5XnuhrNng
 si646OGhCxTGuhNWti1MH4mxlMqXrE1Rwl1dK+vat05S3zCeFNEmGQ1fkrQ4RNj760om
 J/qT7qGfb5o/Ns9ZbE3snBAJTs15e9fxUMI7ZcT3WXn7fQAe7Zqw1hHVlSqXtXpMCynz
 qi3Q==
X-Gm-Message-State: AOAM531fpkSU0hw8a5U/HRrcfMyfhXqjhq0L4GX4Ydz7BLEDWlPD3w/j
 3/ZeBXqG0SiJQfkzAqvRKBrVlbjSz6WGFlwbYOm6JFYa4Utq93tU9WFMDmZUOX4oYqoKzeTfSXY
 G9vw1bLg71FC476wziHJmjaKWfNs=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr27548156ybp.86.1625624473995; 
 Tue, 06 Jul 2021 19:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsYMprsVBPgnlpO9DnpBqahNGnzngDKpCOZU2fA4B/NEdKc6WWJ4nXOJOrNEK1/6yiR4C17VIwGmBJMC21OLg=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr27548140ybp.86.1625624473785; 
 Tue, 06 Jul 2021 19:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <60E50890.9040903@fujitsu.com>
In-Reply-To: <60E50890.9040903@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 7 Jul 2021 10:21:02 +0800
Message-ID: <CAEemH2fKXJmgKAr4JXW5y+dcgEwL1taobXLY7OdTWBzLXGVOYg@mail.gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: multipart/mixed; boundary="===============0027798761=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0027798761==
Content-Type: multipart/alternative; boundary="0000000000004c6ac105c67f3170"

--0000000000004c6ac105c67f3170
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

xuyang2018.jy@fujitsu.com <xuyang2018.jy@fujitsu.com> wrote:


> If we use this old format, then we can not ensure whether we trigger the
> ENOSPC errer correctly when reaching the expected nums.
>
> So to avoid the existed memory segments error, I think we should alter
> get_used_queus api to count the existed  memory segments by adding a
> file argument.
>

Just as Alex pointed, if there are some resources be freed after invoking
get_used_queus, then the value of existed_cnt will be imprecise, how do
you think that affects the test result?


-- 
Regards,
Li Wang

--0000000000004c6ac105c67f3170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr"><a href=3D"mailto:xuyang2018.jy@fujitsu.com">xuya=
ng2018.jy@fujitsu.com</a> &lt;<a href=3D"mailto:xuyang2018.jy@fujitsu.com">=
xuyang2018.jy@fujitsu.com</a>&gt; wrote:<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
If we use this old format, then we can not ensure whether we trigger the <b=
r>
ENOSPC errer correctly when reaching the expected nums.<br>
<br>
So to avoid the existed memory segments error, I think we should alter <br>
get_used_queus api to count the existed=C2=A0 memory segments by adding a <=
br>
file argument.<br></blockquote><div><br></div>Just as Alex pointed, if ther=
e are some resources be freed<span class=3D"gmail_default" style=3D"font-si=
ze:small"> after invoking</span></div><div class=3D"gmail_quote"><span clas=
s=3D"gmail_default" style=3D"font-size:small">get_used_queus, then the valu=
e of=C2=A0</span>existed_cnt<span class=3D"gmail_default" style=3D"font-siz=
e:small"> will be imprecise</span>, how do=C2=A0</div><div class=3D"gmail_q=
uote">you think that affects the test result?</div><div class=3D"gmail_quot=
e"><span class=3D"gmail_default" style=3D"font-size:small"><br></span></div=
><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004c6ac105c67f3170--


--===============0027798761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0027798761==--

