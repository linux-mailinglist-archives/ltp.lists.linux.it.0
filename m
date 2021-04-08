Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56245357F1C
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 11:28:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 254D03C1DC7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 11:28:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E516B3C1DAA
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 11:28:04 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 007A11A000F2
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 11:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pt5yerFF/TJsoZrhFrJmdoxdowJ+CjMl2T/xtGQ9d8k=;
 b=EonL7yTqN5p+ngQGShAZetmLlAyy7XDDEWoFAxdXVqv6zksfrUo/bii7sCVahs6li4aVda
 jlt5LWIhuEhPYUK2SoHvsMjxyuqpvyS9YTvpePDMhuy5vpkzfKmAhAPtX9RJkdMXuBUSu+
 fTylk/gDtOdq/EkmsPL3gMW1FsOfzbo=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-yv-nhAm9NNG6SvnI6u_SXQ-1; Thu, 08 Apr 2021 05:28:00 -0400
X-MC-Unique: yv-nhAm9NNG6SvnI6u_SXQ-1
Received: by mail-yb1-f197.google.com with SMTP id v186so1579619ybe.5
 for <ltp@lists.linux.it>; Thu, 08 Apr 2021 02:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pt5yerFF/TJsoZrhFrJmdoxdowJ+CjMl2T/xtGQ9d8k=;
 b=azk0HhFWo2LGETCTGNBi7bVwKoTGLBvfRL+h/zm24ST539gNGZfYlh9fzkFOeFfvqo
 PYJjf9fXj2SCJLxHvipNRPibP35TcoPOb8FrGjg8bm/VwNkE/9ben3e7oI8KGw0MWw8t
 uyUCYphm+V6RVj4usGilZEzZwJrwerq1kORkhNvr5sgMkmine+yGFOEMCLtWY1F+OsqX
 IsiCYyIzb3StqrPOa3tDtDVDZytPAceoB1Bq6k7FhNB1mjb8rQqh+ck2i/RJZv5O5SIO
 I1uOfbz394BVh3QIL6GVx4kHU4Ru1vfT+AgGkkJ9GlFiizwfovCbrDLFoy7BO9MX/YJt
 ghYw==
X-Gm-Message-State: AOAM531Tc33E6tb6AXfirNTMLh47RRBPaxASpJbua8uQqAFZRbwMzD/M
 kULTX7fBA60D/1hFes3VW9E1jqoRGgPcISgMDe/n0iA5RoQEAtwHrMZbjGrkY7ARHEfROryhdq8
 lwToTSkGlVNA2tweZgffI8sPkdR0=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10720814ybt.286.1617874079835; 
 Thu, 08 Apr 2021 02:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/Qp7EpEgX7VIgalX20DtDUKpMpYhSpWkQ7V2KBsRdzW4n4/p/Em7WjkbrIKc344oW6CHH06MLnDMTsX+KPiU=
X-Received: by 2002:a05:6902:70e:: with SMTP id
 k14mr10720806ybt.286.1617874079665; 
 Thu, 08 Apr 2021 02:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210317105318.32017-1-chrubis@suse.cz>
 <20210317105318.32017-2-chrubis@suse.cz>
 <CAEemH2frh1iyW9SrVJkwXT9nrHt1C+WUmQUcNb=mCota9_xKAA@mail.gmail.com>
 <YG7DUS1lObVjsrBo@yuki>
In-Reply-To: <YG7DUS1lObVjsrBo@yuki>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Apr 2021 17:27:47 +0800
Message-ID: <CAEemH2cv-zWyKTiq4qRxH4b5Yneyv+mixyzXZik42wMbX+ANTw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH v3 1/4] lib: Add proper filesystem skiplist
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
Content-Type: multipart/mixed; boundary="===============1504412198=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1504412198==
Content-Type: multipart/alternative; boundary="000000000000cf656e05bf72a9db"

--000000000000cf656e05bf72a9db
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 4:52 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Do you think it necessary to rename 'enum tst_fs_type' to distinguish
> with
> > 'fs_type'?
> >
> > As it is quite similar to the 'fs_type*' series function and structure,
> > that might mess up
> > the code (we even have the same name function: tst_fs_type). So, I'd like
> > to suggest
> > use 'enum tst_fs_status' or 'enum tst_fs_item', or anything else.
>
> What about enum 'tst_fs_impl' as for filesystem implementation?
>

Fine.

-- 
Regards,
Li Wang

--000000000000cf656e05bf72a9db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Apr 8, 2021 at 4:52 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Do you think it necessary to rename &#39;enum tst_fs_type&#39; to dist=
inguish with<br>
&gt; &#39;fs_type&#39;?<br>
&gt; <br>
&gt; As it is quite similar to the &#39;fs_type*&#39; series function and s=
tructure,<br>
&gt; that might mess up<br>
&gt; the code (we even have the same name function: tst_fs_type). So, I&#39=
;d like<br>
&gt; to suggest<br>
&gt; use &#39;enum tst_fs_status&#39; or &#39;enum tst_fs_item&#39;, or any=
thing else.<br>
<br>
What about enum &#39;tst_fs_impl&#39; as for filesystem implementation?<br>=
</blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Fine.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--000000000000cf656e05bf72a9db--


--===============1504412198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1504412198==--

