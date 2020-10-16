Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1528FCAE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 05:21:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 271073C264E
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 05:21:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 51DC23C2403
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 05:21:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 16D2E600BD8
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 05:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602818471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oo+UHZqr40GkpqPUf9nABCNLBEM5Ie/CghwjUIjDZc8=;
 b=g6s743t6wNA6LRNhfDu0eVI8+raWCSH2FnaXmGWRQaZM9quy41uS1Rs6tKq6VlcuAkoW8L
 mRQFrcvfBDlPnhEqrvaP3onGNvgsB/cAqZHFaLBz1kKIXsfy7XUcyJLtEcYVNau1S/6FQH
 v4W1qdxYL+0jM01GFnC9yqEDDAxh8pg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-su2G_AdWN_WvciUvMsrBig-1; Thu, 15 Oct 2020 23:21:07 -0400
X-MC-Unique: su2G_AdWN_WvciUvMsrBig-1
Received: by mail-yb1-f200.google.com with SMTP id c9so1205416ybs.8
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 20:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oo+UHZqr40GkpqPUf9nABCNLBEM5Ie/CghwjUIjDZc8=;
 b=nl0lGiUQUfKl+J653EGsOncmlI9aIv8Cq14594drisal40zLBfSpDmcvkPW7LFgm+q
 A11TXTK215L2K29G5u50qsSNyZ6r7003v66tgS6KXifP4XjrtjRtr8+JDPZ/lkufCo3n
 BlWvZTP5sGaeVXrrIsBI5+FMNesbKxwxr+uMqcwCeJ4ggJI13BeeN/LG5+FT5NmXg31n
 jTVCNH37ti1a/340Ut/3YRW6Vtbn8y1+q19xn+EzRwZfEtw4TxHEM4VZ/O2RnJJv44Bp
 Omxxi20Py7mk1Dlgbq5kpY5gYIwDMsUvMuR09jgpZMbDPvheIkjwVJeCv97KGHlgqQAi
 +ngg==
X-Gm-Message-State: AOAM533yHB6KMFa55n21ZT/sTmNtGwCRbaWcNKD9Nw45xx4ilzp4u9FB
 2gD4Uec0tCZoXSkhR32VwtbDeZsuD9kbxwUoNCJoGvyQyYZ8nLkfD84Fqt2CsWhMntmWGDShkd5
 vR44gcERNR5Ebm5QOTj6Pskbk2Jo=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr2220230ybe.403.1602818467424; 
 Thu, 15 Oct 2020 20:21:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOc/h5xwym/kGmqFbPiUhzPumZNjjAfGPFlhWc86DBWDRmH77JlfcROoP5/AGW2fKjrGdOnra63bwJ2euousU=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr2220207ybe.403.1602818467079; 
 Thu, 15 Oct 2020 20:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20201014134648.GA13224@yuki.lan> <20201014180221.GC19540@dell5510>
In-Reply-To: <20201014180221.GC19540@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Oct 2020 11:20:55 +0800
Message-ID: <CAEemH2eg7RZCWu66Z81x9RLmHGX=XC06ttK4x3_zmbw2jZnG9A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/2] fanotify: Move safe_fanotify_init() + safe
 macro into fanotify.h
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
Content-Type: multipart/mixed; boundary="===============0078994172=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0078994172==
Content-Type: multipart/alternative; boundary="0000000000005ec23105b1c141a9"

--0000000000005ec23105b1c141a9
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 2:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > > Fanotify code is used only in testcases/kernel/syscalls/fanotify/,
> which
> > > justify breaking rule of having safe function and macro outside of
> > > library. This will be further cleaned in next commit.
>
> > I guess that this is OK, I doubt that we will need a fanotify_init()
> > anywhere else but the fanotify testcases.
> Amir acked whole patch some time ago, thus I guess he's not against this
> first one.
>
> The original motivation was to do further modifications for libc wrapper
> vs.
> syscall() for fanotify_init() and fanotify_mark(). But I guess even without
> second commit it makes sense to have all fanotify helpers together.
> We can always revert it if really need them as safe macros.
>
+1

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000005ec23105b1c141a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 15, 2020 at 2:02 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; &gt; Fanotify code is used only in testcases/kernel/syscalls/fanotify/=
, which<br>
&gt; &gt; justify breaking rule of having safe function and macro outside o=
f<br>
&gt; &gt; library. This will be further cleaned in next commit.<br>
<br>
&gt; I guess that this is OK, I doubt that we will need a fanotify_init()<b=
r>
&gt; anywhere else but the fanotify testcases.<br>
Amir acked whole patch some time ago, thus I guess he&#39;s not against thi=
s first one.<br>
<br>
The original motivation was to do further modifications for libc wrapper vs=
.<br>
syscall() for fanotify_init() and fanotify_mark(). But I guess even without=
<br>
second commit it makes sense to have all fanotify helpers together.<br>
We can always revert it if really need them as safe macros.<br></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small">+1</span></di=
v><div><span class=3D"gmail_default" style=3D"font-size:small"><br></span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small">Reviewed-=
by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&=
gt;</span>=C2=A0</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--0000000000005ec23105b1c141a9--


--===============0078994172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0078994172==--

