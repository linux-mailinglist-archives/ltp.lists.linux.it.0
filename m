Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F52B73E5
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 02:51:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF2C53C4F43
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 02:51:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 789DF3C2645
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 02:51:25 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 262A310008F0
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 02:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605664283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zK0RDoXE/3OBRUDYw20T5BNQr4BNKYmJ9U9OvmnkbmE=;
 b=hpp7VHw64ebiGWytPNQi3SKODU9qonILd9tkLE+0bIyAavM5MPRWr9CQVkzeBhUQTHHT50
 d7BqkHuAD27oNL1Fx57ghgAy0/oMCs76G33o+oyWSAQMunVui7Y+B1obKu/r7OvQ8Ht05X
 K3VbkMvFY6o6zwZ1wnUtgFvjBTTVyp8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-PNDEfKntNJaj1JUPhOn6XA-1; Tue, 17 Nov 2020 20:51:21 -0500
X-MC-Unique: PNDEfKntNJaj1JUPhOn6XA-1
Received: by mail-yb1-f197.google.com with SMTP id w7so319887ybk.1
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 17:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zK0RDoXE/3OBRUDYw20T5BNQr4BNKYmJ9U9OvmnkbmE=;
 b=Wbli+xdKBF/uhBu5sXo1kOhHQYkyfELncGbGFXcTw8kPqwuQoz/qa+ETT3IRJthrm5
 VAQ9a7dwj28qgnQ6QkP1+cc1y4g9EE+8mGdL/Jq9LlMV3Ya+FMldEd/g5UTF3IvkiGUy
 H87xi4pvppyENy0UmXR7/xQoKk0B9Woir4VrY4bIIhf31xArPwmjcvx2nfV7Z8K4UD7a
 aDxKhZ8b424EyhovXtYJ8PpvNNRuqOjVRHsEinMg0tE7QBR2H7UaWKP4gm+UiGdL7OKk
 jG1TzsyUDq+BclIfuetE/89x92vyyimrgTG1uqR1PM+m9WdNd5KC8HYHkUsk/wETpcz3
 QbxA==
X-Gm-Message-State: AOAM532JB4jQ/kuzx9Ql9vkuaD5G8fLlKGtx/jx0PlYKkUsWUyucsjbx
 GRLucmOxxszcHQyWx0Gv4CrgCSgcgsrHmt3oMDuytkP6FgzRZvi7I3oEmG5KqOyCTqtysDyz3dr
 UijSqrkQt6LVSWpyraI+OwHHpnAo=
X-Received: by 2002:a25:dbcf:: with SMTP id g198mr3092445ybf.110.1605664280615; 
 Tue, 17 Nov 2020 17:51:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6YbYu9izP1kR+ESkPCxZ8y2cnCaLEHTmXIek/lS8AfkF54L0ht430u6DtodQ1WXd8Qfuh0EhMe+ZRvMlgbuo=
X-Received: by 2002:a25:dbcf:: with SMTP id g198mr3092429ybf.110.1605664280269; 
 Tue, 17 Nov 2020 17:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20201116105209.20395-1-rpalethorpe@suse.com>
 <20201117101717.30478-1-rpalethorpe@suse.com>
In-Reply-To: <20201117101717.30478-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Nov 2020 09:51:01 +0800
Message-ID: <CAEemH2c-4bh+Uh29GhG-2EtzpDV=T8v0M5CsWWvT-k=8G0N=3g@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] madvise06: Allow for kmem and memsw counters
 being disabled
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
Content-Type: multipart/mixed; boundary="===============1061453598=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1061453598==
Content-Type: multipart/alternative; boundary="0000000000000df28005b457d97e"

--0000000000000df28005b457d97e
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 6:17 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> These may be missing in which case we can not read them for diagnostic
> info or set the swap limit to a value which is known to be large
> enough. However if there is no swap counter then there is no swap
> limit, so we just try to set the limit if the counter exists.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Li Wang <liwang@redhat.com>
> ---
>
> V2: Check if the memsw limit exists before writing to it. This
>     replaces another patch which removed it altogether.
>

Merged, thanks.

-- 
Regards,
Li Wang

--0000000000000df28005b457d97e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 6:17 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These may b=
e missing in which case we can not read them for diagnostic<br>
info or set the swap limit to a value which is known to be large<br>
enough. However if there is no swap counter then there is no swap<br>
limit, so we just try to set the limit if the counter exists.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_bl=
ank">liwang@redhat.com</a>&gt;<br>
---<br>
<br>
V2: Check if the memsw limit exists before writing to it. This<br>
=C2=A0 =C2=A0 replaces another patch which removed it altogether.<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Merged, thanks.</div></div><div><br></div></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--0000000000000df28005b457d97e--


--===============1061453598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1061453598==--

