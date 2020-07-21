Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E0B227A13
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:01:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A0D13C2937
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:01:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CC20F3C26CB
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:01:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 899BD1A01DFE
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595318474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w2jCY5JRfragNaKo8nTL/yPZ7QPxvk4zkat35DoEyAQ=;
 b=CYgz7ZDQKl6qnsPPjZRNnjsR571kyZ5DxBk9670T0GPmRgk5tGuZYzy5AhxRP9K03kxxXr
 x4eEe3e2b/0gxGsjyaOmPC530Ydxkd/NKzJuVZ/Y1aQjGzySgukt7uhhkIPCA8c7QF2CQX
 FvxO7ceKdEZyNdqgRX5dyELxojjzOcw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-iOuBVU3ONqqV4IUeWyZuFA-1; Tue, 21 Jul 2020 04:01:11 -0400
X-MC-Unique: iOuBVU3ONqqV4IUeWyZuFA-1
Received: by mail-lj1-f200.google.com with SMTP id n24so4921398lji.11
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 01:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2jCY5JRfragNaKo8nTL/yPZ7QPxvk4zkat35DoEyAQ=;
 b=XLs5g+hVxtborckgEHQcI8/j6rKax4chdR0mDtaGOkQNqkzysqR8LV0aEjx6Cx+nTC
 r0MbHDjOgEaync9AQSwQurpWyKVBLQbW/sT94ahv2eGBjt0dqlXxtMSu/2MrubeRcfO2
 A1WexksgV/gEQkNaexLP8TrAw9ER32OB0Dr/q4s9RcvnGRX87MFGZr3Tyq92gJoqJrw5
 ojoAW+XhJlPfGnRKH6SeHZ4HNCOh8tL9LUaPphgp3xL/5lTG6MhFY618HVe3BUKnM5/y
 l87ggrNFZxINuUsm6izpKabZ8QR4u6HZ5L7aXK29WY8qotzZ7ndA5k+nyug2GVEWMNsu
 bs7w==
X-Gm-Message-State: AOAM5307A2g56H/qw5c2sgRHK3nyFxqJB4N/Xz1rWhQ7lfgL76HV8Mgu
 +zQrcz7ySborTRnKTOkLKeOtA1fbQhyOW/vbhDLEFh89tpAoswm7OBLwHEROVgRYRg1h2cMCOJP
 cgGzz+3KdsbZETKHlK2otkxCnlkA=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr12885254ljg.100.1595318469793; 
 Tue, 21 Jul 2020 01:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvH04/7j8Y3CqgpYJNN6lX885/Wdzjmbkd3NqJ6RHWMBdFWFYb0g9Ws7vbO9+c8Wl8/ZmZhnGH0GhIbEyVCLg=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr12885233ljg.100.1595318469340; 
 Tue, 21 Jul 2020 01:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200710143607.2546-1-pvorel@suse.cz>
 <20200720142206.GC4457@yuki.lan>
In-Reply-To: <20200720142206.GC4457@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Jul 2020 16:00:57 +0800
Message-ID: <CAEemH2dy6y7CTie5QmsHY6E5CYDYVN+t3csA66Z3uHx5K-Sb9Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RESENT RFC PATCH 1/1] LVM: Drop legacy scripts and
 runtest files
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
Content-Type: multipart/mixed; boundary="===============0523582434=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0523582434==
Content-Type: multipart/alternative; boundary="000000000000ab781a05aaef0695"

--000000000000ab781a05aaef0695
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 20, 2020 at 10:21 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Looks good to me, acked.
>
> I would wait a bit more to see if anyone complains about the removal
> though.
>

No objections from me. ACK.

-- 
Regards,
Li Wang

--000000000000ab781a05aaef0695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 20, 2020 at 10:21 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Looks good to me, acked.<br>
<br>
I would wait a bit more to see if anyone complains about the removal<br>
though.<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">No objections from me. ACK.</div></div></div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ab781a05aaef0695--


--===============0523582434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0523582434==--

