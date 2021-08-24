Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 674263F5B1C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 11:29:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 825673C93BC
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 11:29:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B52F3C30CC
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 11:29:48 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A0D15600103
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 11:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629797385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tsoNGSAnScXkTsh4WP5oEmNTgtBvzIVBRvdYZL9fJto=;
 b=QmIgVHRZDx918xf1jwwrBA4dfNNcwPDR4ETQ/5SsVJjJdPeeArXAe0sPopuibyO9iHSl3R
 V4eIvLkluOGXXlWAjYaWGWxZXY/h4WCkAIWKZ/ejLGjwVB8zqtVAEcqGbl4poAMbFOjwup
 rLZ2kuHcrix1PT5CG7aDErUBHkmIzvE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-D4JjdBtAN_2CN9xTux5XEg-1; Tue, 24 Aug 2021 05:29:44 -0400
X-MC-Unique: D4JjdBtAN_2CN9xTux5XEg-1
Received: by mail-yb1-f197.google.com with SMTP id
 f14-20020a5b01ce000000b0059b74ec1d94so1935382ybp.16
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 02:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tsoNGSAnScXkTsh4WP5oEmNTgtBvzIVBRvdYZL9fJto=;
 b=dXcC7apN36aDg4N7IXFELcHpSs8Ohn1jNS5tjthW9nrvkHt9/NjW7RSw6tl3q3myZ2
 KZwE3nBmPD1sZVC8YMiW+heiNx3LWRP5JFL7H6SQNHgColO43flyf0JfLHONmXGLx9u9
 DpGnmQZgTk/28aBGaUDK+PxapOVQWBC6HklknPZEQIYRSoftnJ4O2pY1U6ss5XT+HUCN
 KpM+sBIZOSlnHJfYAOfWFlCaOC4znqVSnUlj7gEIyhnwc5HBd17MOpXHeTORrRF6EBED
 nmT5u4+096tLMAsi/Gw9g91Z528DIxKcMeHGltvw7eVgZIHfd3Q0UiJfofu0p4ZhfIfk
 hwYw==
X-Gm-Message-State: AOAM531LOY/C2caOrIZetOlKw159EjRHTCreuPnq1hex+23eThV3KmgG
 og18ElkMXtkcKgybN8OpyjFw/7hzXaG5imDoJGXJQYAPsV7o9bod+DRXW3L49CKF6/ekjTrsitA
 2y+ud7BnHvh0uw4kcmCv57A9f6Ws=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr14283367ybk.403.1629797383669; 
 Tue, 24 Aug 2021 02:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyABqi5Fh5mgHwy6OROdK8WX2G7U9amT8qAkfsIb+r6J1IX2NlBap3yZ2rFW20ofUcNFVtYDcx779RmHokgC00=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr14283350ybk.403.1629797383480; 
 Tue, 24 Aug 2021 02:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150520.25614-1-chrubis@suse.cz>
 <20210823150520.25614-2-chrubis@suse.cz>
 <CAEemH2dYcF=N3F=MZXPVLgBHBa3Xt=iT8ACeQ4_9THXu-kyYtA@mail.gmail.com>
 <YSSyVtSF6UmqYlu4@yuki>
In-Reply-To: <YSSyVtSF6UmqYlu4@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Aug 2021 17:29:31 +0800
Message-ID: <CAEemH2dpz577XH6q2fEw7uHYOvOORs8NLT_CroRvOnoAK2jQnw@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH 1/3] tst_test_macros: Fix TST_EXP_*() default
 message
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
Content-Type: multipart/mixed; boundary="===============1395443895=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1395443895==
Content-Type: multipart/alternative; boundary="000000000000193ad505ca4ac68c"

--000000000000193ad505ca4ac68c
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 4:48 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Patchset looks good from the code layer though it is a bit complicate
> > in 2/3 stringify handling, but that should be acceptable.
> >
> > My only hesitating is about ##__VA_ARGS__, because it says that is still
> > as GNU's extension but have not got into standard C.
>
> Note that we have been using it in the header from the start. There were
> just a few places where it was missing, mostly in the variants that have
> been added later.
>

Ah great, I was neglect that point.  Hence it should be safe enough.

-- 
Regards,
Li Wang

--000000000000193ad505ca4ac68c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 24, 2021 at 4:48 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Patchset looks good from the code layer though it is a bit complicate<=
br>
&gt; in 2/3 stringify handling, but that should be acceptable.<br>
&gt; <br>
&gt; My only hesitating is about ##__VA_ARGS__, because it says that is sti=
ll<br>
&gt; as GNU&#39;s extension but have not got into standard C.<br>
<br>
Note that we have been using it in the header from the start. There were<br=
>
just a few places where it was missing, mostly in the variants that have<br=
>
been added later.<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Ah great, I was neglect that point.=C2=A0=
 Hence it should be safe enough.</div></div></div><div><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--000000000000193ad505ca4ac68c--


--===============1395443895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1395443895==--

