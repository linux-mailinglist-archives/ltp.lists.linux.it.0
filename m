Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE833F0FE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:18:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A0223C32E7
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:18:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 149853C2D34
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:18:30 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8AFDE600E22
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615987108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/if28R1zkd9pRbePbE9MQu5uUFExxARJE1ovoIJo5Pc=;
 b=H2YWM+o5WxGgldMAfhyns8LyRbGVlJG19aoHN8JS+VRQ5juwf0omoTO7QT8I4Y/mq5MUUk
 UrH4KJdYZoe2vM3XrEjxETXumBTqbwgRtR8kUlvELCLRmobqzQbK162ncdHD/c4K46671m
 XLgmlTwIeTkd7ykYg5nMYgqQnPRT+bI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-xkIQHHfmM5eIB1KsgOghcw-1; Wed, 17 Mar 2021 09:18:23 -0400
X-MC-Unique: xkIQHHfmM5eIB1KsgOghcw-1
Received: by mail-yb1-f199.google.com with SMTP id 131so45161754ybp.16
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/if28R1zkd9pRbePbE9MQu5uUFExxARJE1ovoIJo5Pc=;
 b=aL8vLAE+BNfxrmJODrrIMEKnLLHXo1MG8nij7B7OlHlcaF4A8KQ8vRjyCE6warhY1A
 G54M8w6NAmIU/4NywcxVyf1Xl5F5Befn31rXK1Lq6XZIhgSDbVsbqczeCUiGoOgiO0uP
 sC32d6+y8oFiEYfnq8EWBDKcW1iExb4MF3Lr0pRLbi3GzyOBqivbQH/XDU+ddQpQ4GPr
 0LCLNekVgU/S7Su+vj9quX0cemTtJSXIlwxKONFmoBNY6y0hgxU3kHRoELPSz6oeBuS/
 O9k/lPT96jW5CCpB+J/KDizD015ZWtdvqBNOuDIyc6jFPXwXaJ+GpWb1iqLBaHxqbiH9
 WnTw==
X-Gm-Message-State: AOAM532MbPakB/tfuf4eTAfWByBEjAOKvMN00sBKdQprPKQtWVmRNLBv
 5pRpJBBlrby6hPLSRGh8edIHIvizxvZcDOK7WDuMMiLKXWr96HJP5zX45a7sBi18z5ETqFGb7YZ
 tW4MMwNPY5OQe5CsU3lm6BOLLfIY=
X-Received: by 2002:a25:3417:: with SMTP id b23mr4114025yba.252.1615987102924; 
 Wed, 17 Mar 2021 06:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhajCE35ob7kJJh40SB1Mt2+7jAY1VjRRRoWpU9YauvwpO3BanPO73cMJ6wLyUetzIBdJUngavvH+9VVelxuU=
X-Received: by 2002:a25:3417:: with SMTP id b23mr4114001yba.252.1615987102709; 
 Wed, 17 Mar 2021 06:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317105146.25427-1-liwang@redhat.com> <YFHopMB4tuZrVElY@pevik>
In-Reply-To: <YFHopMB4tuZrVElY@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 21:18:11 +0800
Message-ID: <CAEemH2fyvwr1qCn=48zK_xk8rS4K39HsDd+th=7VzpcJh9EFLw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH] open_posix_testsuite: use PTS_ prefix instead of
 LTP_
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
Content-Type: multipart/mixed; boundary="===============0644865292=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0644865292==
Content-Type: multipart/alternative; boundary="00000000000038103b05bdbb51bc"

--00000000000038103b05bdbb51bc
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 7:31 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > Also add GPLv2-or-later SPDX in tempfile.h
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Patch applied, thanks for the review!

-- 
Regards,
Li Wang

--00000000000038103b05bdbb51bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 7:31 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; Also add GPLv2-or-later SPDX in tempfile.h<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Patch applied, thanks for the review=
!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--00000000000038103b05bdbb51bc--


--===============0644865292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0644865292==--

