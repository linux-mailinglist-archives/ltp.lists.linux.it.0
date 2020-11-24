Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE312C26EF
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:16:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A45E43C4E50
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 14:16:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A93AC3C243A
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:16:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C4A0360071C
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 14:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606223799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tUhiIYxGf/xMfbY+d8UXFD21hmgfCED8H1WDO/5yKyA=;
 b=E/h36XN+3vRPUptPbLEnk7jovms5VvsqYed/GPjLhrkNmmrXrZmdcXqH6NWeMDtpMnneTw
 Fudgqe1cv3JjuNEAR8jNmaMTAK6/QFq4qB/a8ID06iFvtP0hErbarqpktWtad4iG99Uug6
 NEzKXRW+AkfzpbvK254hohj24R6Hquo=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-rZ0ebutcPoyCRElIL9YRFA-1; Tue, 24 Nov 2020 08:16:36 -0500
X-MC-Unique: rZ0ebutcPoyCRElIL9YRFA-1
Received: by mail-yb1-f198.google.com with SMTP id k196so27591956ybf.9
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 05:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUhiIYxGf/xMfbY+d8UXFD21hmgfCED8H1WDO/5yKyA=;
 b=XRmrM60tpjkRzD+ZQTu06354B/8dccNorNTb5t6OdNcM2EZG496C+coH14tDRHjpqI
 QzpBh9pnjCBWye14FXAhjDorqjrRXsFVZv7uLSFVwYwwEPpnyJvUqrQ8elZu1gwyNq2/
 X2R52Z2gPuRoptOa/O6gRa3x0X9UBCMHtL/xI5UrfkTJ9ARaruHAHdgnWnsnQ0A6D/jT
 sN4AkQ+Au5MDseI4i5K5p8wkI6pTlchk6zbDmHbtVEZ+RzYJqxYY13NcMge7W3gVml2V
 NQrlpPoOhqgBYsDaoB9XB42wp4BoPA/aoyNRdyppb/LgsTYslmkAzc8f30VtW2tSc0gy
 GBxg==
X-Gm-Message-State: AOAM5327Vt4FWYXAsjQ+3UsohsiKoKkCLRLovUw2vU7lMu2rr3Uuyoum
 i+80QVMUiOeLYJypudCCPPokUcMPnF5wa5M+JJj2byXLiWTFWYT7KgyjpQi+9wnnehZs+iuZ7zi
 qduR3B7ayqTJHN8yTsjfp6Gt7HHI=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr5713387ybs.252.1606223796300; 
 Tue, 24 Nov 2020 05:16:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHop0i+aQz+qysZr7M9hvMCwgVV5DVbzKS+PtmGoJ17ScNLIUBwBOfIoKWTNiyDDg3C+5TaJfk30lE5q03rbU=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr5713370ybs.252.1606223796115; 
 Tue, 24 Nov 2020 05:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20201124120154.27017-1-chrubis@suse.cz>
In-Reply-To: <20201124120154.27017-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Nov 2020 21:16:24 +0800
Message-ID: <CAEemH2eKQq_s+RbtVoadRF7Hg_1ddqLUv0HSAG28bKGT54e9Kg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH] syscalls/select03: Fix segfaults on aarch64
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
Content-Type: multipart/mixed; boundary="===============1083898475=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1083898475==
Content-Type: multipart/alternative; boundary="000000000000cc310305b4da1edb"

--000000000000cc310305b4da1edb
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 8:00 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> The select() syscall is implemented via pselect6() in aarch64 glibc, which
> means that glibc has to convert the timeout from timeval to timespec hence
> it
> will segfault rather than return EFAULT.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Viresh Kumar <viresh.kumar@linaro.org>
>

Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000cc310305b4da1edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 8:00 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The select() syscall is imp=
lemented via pselect6() in aarch64 glibc, which<br>
means that glibc has to convert the timeout from timeval to timespec hence =
it<br>
will segfault rather than return EFAULT.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
CC: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"_=
blank">viresh.kumar@linaro.org</a>&gt;<br></blockquote><div>=C2=A0</div><di=
v><span class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang=
 &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=
=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000cc310305b4da1edb--


--===============1083898475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1083898475==--

