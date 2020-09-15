Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E426A3C3
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 13:00:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4794F3C4EDE
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 13:00:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 28B683C13DB
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 12:59:59 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 84885140165F
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 12:59:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600167597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EURfZo1Q+1fkG9vuZ0t3P/81MbGdArhq69zQwIe5eb4=;
 b=dtxZ6fF8YzKxkUl5QpVXDd2h5Lic5dyDJo/xprNqAZ0aVooqwRGTeJVdz0IAzNQGP2Ej3/
 L21p/h6HdebYlfd8ShceatpFYQmRVCSE9afgKdVkS25BCj2oPHEug3aZyOk5jbqPp7WRQ8
 3YwPrS2P84DrKjmPUwQEPJcYdolfUFw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-r9hrVEjPNWWr5mwGJuSeig-1; Tue, 15 Sep 2020 06:59:54 -0400
X-MC-Unique: r9hrVEjPNWWr5mwGJuSeig-1
Received: by mail-yb1-f200.google.com with SMTP id q2so3039973ybo.5
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 03:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EURfZo1Q+1fkG9vuZ0t3P/81MbGdArhq69zQwIe5eb4=;
 b=tORbOH+Kg7vlIuZmyoKvgeTmNfp56SFNflspLqEuLnPVW87JzMjpGZdYjtN28FL2aE
 LHdyBwmH8gzVV0KLVLIpRTybMs2qlTsm59Qs5hjBVQRkyLBuZOYM4lGLe/avm4kOh4g2
 srAnV5TGEHw9FaOqzmudbA3HkN+LwpSMkK2XK9DC8KYTLCH6exhvN8zJJ0fHKNfFhF0/
 Q14IBJRkqCW6fS9ms9GcYaVkKgsy+Ve5sNVNq3/lX5ZoOJFBtxuJx1hrqHKRbmEUIomL
 CwjjQ5KRlKuMHY7gvoEvHdxzOT1ZvR8pmktmd393DJUqJLFMBJTya11surx5xTkd0fko
 9vYQ==
X-Gm-Message-State: AOAM533OveFLNBX52gbYhrbzNLGyRI02q3ZqQ9cBobD08KSblV81otkI
 bsXQl0syLMFNE3KUffcZypgQ826KeiQRlM2N0VZB8lMb4lPRvSD4D6q/KtniIlQrpk8kWGqIMYe
 qGZak5ONWILaSXXjtawAAPV6jv6E=
X-Received: by 2002:a25:254f:: with SMTP id l76mr18951854ybl.366.1600167594137; 
 Tue, 15 Sep 2020 03:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIDqE0UEcxHLhfGOAOZxTczwI9XRh0zJ7/fEjYkcb0k1fi8ownTylw4I7ci+lQaZAZuU4tVpGdEwsES895CPQ=
X-Received: by 2002:a25:254f:: with SMTP id l76mr18951845ybl.366.1600167593942; 
 Tue, 15 Sep 2020 03:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200915084406.8633-1-liwang@redhat.com>
 <20200915091217.GA6261@yuki.lan>
In-Reply-To: <20200915091217.GA6261@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 15 Sep 2020 18:59:42 +0800
Message-ID: <CAEemH2f6Z7o0S98-L401TQxGg0mF73iMRB2v5k0OL7TdY2pq5g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] clock_gettime04: multiply the timediff if test
 in VM
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1475055433=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1475055433==
Content-Type: multipart/alternative; boundary="00000000000004b77605af580d3d"

--00000000000004b77605af580d3d
Content-Type: text/plain; charset="UTF-8"

> One minor nit, variables are supposed to be lowercase.
>
> Other than that, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>

Thanks for the review, pushed with lowercase tweaked.

-- 
Regards,
Li Wang

--00000000000004b77605af580d3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
One minor nit, variables are supposed to be lowercase.<br>
<br>
Other than that, Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@su=
se.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Thanks for=
 the review, pushed with lowercase=C2=A0tweaked.</div></div><div><br></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000004b77605af580d3d--


--===============1475055433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1475055433==--

