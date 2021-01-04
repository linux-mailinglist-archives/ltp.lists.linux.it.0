Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163D2E9303
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:04:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 436B83C3201
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:04:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5B7453C0722
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:04:00 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C89AF600783
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609754638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2A5iV31lGvu4r1uZkoHJDwPLnBTA1Ni7wuudH5trASU=;
 b=fjCOcLXk3NmQEUyFKMniPBwdirxTaQmP/tU1ak1cIp2Iji+seOqFdJkBezdy8w3xDzZY+K
 85cJOMY0Pdgwnhf5vazTGEhXAIV8+dlppKnZzYXFev2rY/Y+Koy8YZhDboxMlpTBZMgW3v
 KltUsqQKX6k3SLqtWT1RMDgnoLf9sxE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-N7PhGsXdNoyHFuZ8deYT2A-1; Mon, 04 Jan 2021 05:03:55 -0500
X-MC-Unique: N7PhGsXdNoyHFuZ8deYT2A-1
Received: by mail-yb1-f200.google.com with SMTP id q11so51081300ybm.21
 for <ltp@lists.linux.it>; Mon, 04 Jan 2021 02:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2A5iV31lGvu4r1uZkoHJDwPLnBTA1Ni7wuudH5trASU=;
 b=qZb57A/gVxEt+UHxIwaZcIaEnQ31nvF//lbjnGM91stPuFJ9kFKVxwmKpq75dIOloA
 IVJhPPDeiw2LhuItm7a64pLkX31bT/rBWcYvE8kq+YPqb/Ip1/Tl7DnWOqwdzu0lyuzO
 lb1cqvvi7YZXqOhn9xdl6lds8afWI0ZNOVjOpeZ07J4SDKLmX2R758D3M7dTjA8ZNbsK
 Ju0TXyRJXhK3Zh0knVM9X9d5/TRo1pPvSeNJ7Cz2GeQ2DGKprlcjet4IbTMe9jwfe876
 zpXkDiOIhjTPk0T0AsSkpvS60EASir5XgJ7h/dSy5mjj3jMbjE77gZyelo8sgzRLvcEv
 zQ9A==
X-Gm-Message-State: AOAM530Nm3LsFUkFXNvY0DNlHP7AvS5/FH+gc0IPOIuyKHLTEMv5IiWd
 F+IgtIc78WpVJB02KGCBu1WbkkiWdPfUVZU+Slggwtr+iBI+dEGF8Sc4Ka/WrySBU0oSCn+/xAr
 l6aKWdj9P+ZuJAtAE9YnXsDpM7vc=
X-Received: by 2002:a25:2c58:: with SMTP id
 s85mr105591940ybs.366.1609754634653; 
 Mon, 04 Jan 2021 02:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzKSIzmqruaMvqQBB4UsvVM5/awY/1vGVWnq/v7I7Ff3SLkgUUSqv2E+wZZ65uIpGfXxmYpzxd7EO5eXM0Zuw=
X-Received: by 2002:a25:2c58:: with SMTP id
 s85mr105591924ybs.366.1609754634461; 
 Mon, 04 Jan 2021 02:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-3-rpalethorpe@suse.com>
 <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
 <87eej1dpgm.fsf@suse.de>
In-Reply-To: <87eej1dpgm.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 4 Jan 2021 18:03:43 +0800
Message-ID: <CAEemH2diKwkvjZ=20+MGpNJsWzM3OskDbcyuY7MH3tEsGV4U=Q@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [RFC PATCH 2/5] CGroup API rewrite
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
Content-Type: multipart/mixed; boundary="===============0490701712=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0490701712==
Content-Type: multipart/alternative; boundary="00000000000029b3e805b8103595"

--00000000000029b3e805b8103595
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 5:24 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello Li,
>
> Li Wang <liwang@redhat.com> writes:
>
> >>
> >
> > As I was mentioned in 0/5 that maybe we should create test_cgroup_dir
> > for different progress so that the test could use the same controller
> with
> > various configurations in parallel.
> >
> > e.g. child_1 set SIZE to memory.limit_in_bytes
> >        child_2 set SIZE/2 to memory.limit_in_bytes
> >
> > Any possibility to move this to tst_cgroup_move_current?
>
> Yes I suppose we can try this. Is there a test which already requires it?
>

So far we don't have such a test, I remember that in the previous Lib is
also to keep expandability.

-- 
Regards,
Li Wang

--00000000000029b3e805b8103595
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jan 4, 2021 at 5:24 PM Richard Palethorpe &=
lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Li,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt;&gt;<br>
&gt;<br>
&gt; As I was mentioned in 0/5 that maybe we should create test_cgroup_dir<=
br>
&gt; for different progress so that the test could use the same controller =
with<br>
&gt; various configurations in parallel.<br>
&gt;<br>
&gt; e.g. child_1 set SIZE to memory.limit_in_bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 child_2 set SIZE/2 to memory.limit_in_bytes=
<br>
&gt;<br>
&gt; Any possibility to move this to tst_cgroup_move_current?<br>
<br>
Yes I suppose we can try this. Is there a test which already requires it?<b=
r></blockquote><div><br></div></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">So far we don&#39;t have such a test, I remember that =
in the previous Lib is also to keep expandability.</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000029b3e805b8103595--


--===============0490701712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0490701712==--

