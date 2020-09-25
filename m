Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD827869F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:04:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B59163C3029
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:04:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A070E3C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:04:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BF77F14012C5
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:04:51 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601035490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cy2hNStxiI1FaO/e3e3sGYuzZK0U8nVXpKKwmAUiz+M=;
 b=Sjy9NJqFfd3+KG/Rjz85caPawKm39dk9FejmCW06PkfgYaLWQfMhkLiKo1LKMSYMpNftH+
 xJmgRLdycKC7/v7KdRZHsGXB91FOu33xxaTIQ1lXwrUD7BjxcAE0TIaDlXLV1FAKdF0UMY
 rqDzNz1junnzXtbqbO3/kM2sy0yyTAY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-BJyuAVe8NoWL9cuFA4DHjA-1; Fri, 25 Sep 2020 08:04:47 -0400
X-MC-Unique: BJyuAVe8NoWL9cuFA4DHjA-1
Received: by mail-yb1-f200.google.com with SMTP id 140so2512001ybf.2
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 05:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cy2hNStxiI1FaO/e3e3sGYuzZK0U8nVXpKKwmAUiz+M=;
 b=iPNLnHNsJ65D+v6Ua76MrbFyNnnGiIRz2VcpzBwnYokCiiZh7i4JYoutUqIIdYTvp3
 fX/upPL7pwgoMuCCOfDiE2Ia+Cn1TiXKt1TVJGeIUo/6TPPUnRKW/aXii3OiQ/uLsPit
 lf3yzQ3xWbzAJ9yjhFBB750fzKNpd2ynu7X1TuWnbe/MV0qn7aE8bdn+qqanSKx4R+8R
 UrDVa3tNEDP5W81wGR/0RPH9xQDhV3BCW5qdsWle5CFV4bNfFEtb5fVTfh8CbIydN87L
 XO8NXACUNLdd/dS7ug22OPxUdoOe2RUgL+SRq3StPVcRXSmA67GrwP0vMi7kvwxeYwxy
 SHfg==
X-Gm-Message-State: AOAM530GdWshiS6LbU+JIB0TahVpwtwAk9NF6OBOUqeSdNRn6HQCj3L2
 01BmBIFvsxe/Z6tuUahJVQyVyDH/APs305RrO+qVz+lAQyE2NmZyn+4TsGSHjUVA+QzGLfdlKMU
 AsFX8qyN9XAmrZms4fdlC93ke9Ls=
X-Received: by 2002:a25:730a:: with SMTP id o10mr5039148ybc.403.1601035486663; 
 Fri, 25 Sep 2020 05:04:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1m1CfYLU0Rz+kK1hotoFbi5Iet7qijAURffW3gkVPM4Q43//5G3kAMuK26y63JWPrfdrosjEs4sUriHOXq14=
X-Received: by 2002:a25:730a:: with SMTP id o10mr5039110ybc.403.1601035486353; 
 Fri, 25 Sep 2020 05:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200924111124.5666-1-rpalethorpe@suse.com>
 <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
 <877dsjxoak.fsf@suse.de>
 <CAEemH2f_PdJABqTYF6JUH-BVAPO+1kH1AOK0b+x9gpvbELzVKA@mail.gmail.com>
 <874knmxq2y.fsf@suse.de>
In-Reply-To: <874knmxq2y.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Sep 2020 20:04:34 +0800
Message-ID: <CAEemH2e26TD5A2V8va6aBk1AaOiS65Qg9LK9YCr4gc+HPct4nA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [PATCH] tst_cgroup: Don't try to use V2 if V1 controllers
 are mounted
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1650283931=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1650283931==
Content-Type: multipart/alternative; boundary="0000000000006ff84605b0221f23"

--0000000000006ff84605b0221f23
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe <rpalethorpe@suse.de> wrote:

...
> >> I wonder if it would be better to simply try mounting/using V2 and if
> >> that fails try V1?
> >>
> >
> > That will be work but not good, because if cgroup mount fails, how do we
> > know it is a bug or not support?
>
> I think this is a valid point if you are writing a test for mounting
> cgroups. However if we are testing something else then trying to guess
> if cgroups should be available before using them, makes the test
> fragile. I suppose we could check *after* trying to use the cgroups so
> we can report some diagnostic info.
>

This sounds practicable, please feel free to work out the patch.

-- 
Regards,
Li Wang

--0000000000006ff84605b0221f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@su=
se.de" target=3D"_blank">rpalethorpe@suse.de</a>&gt; wrote:<br></div><div d=
ir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">..=
.</span><br>
&gt;&gt; I wonder if it would be better to simply try mounting/using V2 and=
 if<br>
&gt;&gt; that fails try V1?<br>
&gt;&gt;<br>
&gt;<br>
&gt; That will be work but not good, because if cgroup mount fails, how do =
we<br>
&gt; know it is a bug or not support?<br>
<br>
I think this is a valid point if you are writing a test for mounting<br>
cgroups. However if we are testing something else then trying to guess<br>
if cgroups should be available before using them, makes the test<br>
fragile. I suppose we could check *after* trying to use the cgroups so<br>
we can report some diagnostic info.<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">This sounds practicable=
, please feel free to work out the patch.</div></div><div>=C2=A0</div></div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--0000000000006ff84605b0221f23--


--===============1650283931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1650283931==--

