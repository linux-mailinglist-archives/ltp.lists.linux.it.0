Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB802F46A7
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:41:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 811963C544C
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:41:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0D94D3C319B
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:41:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C5F992005D6
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:41:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610527309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKjZWI3RvaqG/TCtnpK1jmLEfgq0UXc6zGvHZrCCSuc=;
 b=gzaSpIPphmEKfB15dAoEOweyNiDcewLqyRjbFW1gtHHPH++AbTRKiVnFIu3MIqUtto3vYB
 cOXOsMkyhfkECbWzKIzqSzJchaGW5Z2zXTvDbdfL63qxWMFpErUANNnqkldwgFM9hs6ZLt
 L8KJJCv/gyiA45sQ/d9avRnXRvbrJqY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-YOMfEKXCPOW6tWK3kRXSTg-1; Wed, 13 Jan 2021 03:41:47 -0500
X-MC-Unique: YOMfEKXCPOW6tWK3kRXSTg-1
Received: by mail-yb1-f197.google.com with SMTP id k7so1606439ybm.13
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKjZWI3RvaqG/TCtnpK1jmLEfgq0UXc6zGvHZrCCSuc=;
 b=GHOQYcon6jPFzBm3ZbdT2PlAZvyoxFB3GeIdCALe6OdaN3K8wrZNyiDFED1q8Cm+lM
 nqS3Tos0mmrgdb1NCpu0cGztslrGpn33w1e/X/Ln0RRACmzll2jWt33GEFVLtNTcuZ+t
 WC5G2MDnisXHwPf8NvG1+eQ16XgjHfbHC45wvE9Amvj8429zxJzPpKqDc08CNlTxL/9v
 smIltO56WOpAKNIEK0bqR6V45gGfWeunsNnSiAgc0NsFgzw68fw/h/yTVx2QEawvlwPP
 JAF42j8OgaCrmOpbYjhYFsg/uf/9LHZsaetFglA/DD3hs7YSiPHFwt0LK1V99wAfYyl7
 qD+A==
X-Gm-Message-State: AOAM531Hs5hFA3o04mg/+eGwoeGPddKwPFHtXeKr0xweBXjz69rsufC3
 TQW3VT4Ri6ZC2ITUO3OQGTZQzZA/v6aTHTl5giI6/2LuzzTNPC2fNDuqYJhLWl+szdNZqib11+3
 G3ZQI5pFtUVCgDyOd0OzhllB5SCM=
X-Received: by 2002:a25:1241:: with SMTP id 62mr1828234ybs.366.1610527306397; 
 Wed, 13 Jan 2021 00:41:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtWudLVGwXW7Q5/jxg85kGO8eSM/oTbU5rR9XjFENyPoENrxgpusxtAzZ9V/I5mOH7ME15+rgucJzEAsLOs+s=
X-Received: by 2002:a25:1241:: with SMTP id 62mr1828215ybs.366.1610527306136; 
 Wed, 13 Jan 2021 00:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20210112132911.4031-1-chrubis@suse.cz>
In-Reply-To: <20210112132911.4031-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 13 Jan 2021 16:41:34 +0800
Message-ID: <CAEemH2evAAGHhyMm+qpXjWEK6uJi1zOhD0HT05VNOAzJR1VkJg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: epoll_pwait01: Work around a race
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
Content-Type: multipart/mixed; boundary="===============0466541169=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0466541169==
Content-Type: multipart/alternative; boundary="000000000000fbd43405b8c41b28"

--000000000000fbd43405b8c41b28
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 9:28 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> There was a race that would manifest on slower machines.
>
> The call to epoll_pwait() could time out before the child has chance to
> run, and that would cause the signal to be sent to the parent when it
> was already sleeping in wait().
>
> Ideally the whole test should be rewritten into new library and fixed
> properly, however as we are just before a release this is an attempt for
> a minimal fix.
>
> The logic in the test is changed so that:
>
> - epoll_wait() sleeps indefinitely
> - the child:
>   - waits for the parent to get asleep
>   - sends the signal
>   - sleeps
>   - writes to the pipe
>
> This causes the child to actually run, while the parent is blocked in
> the epoll_wait(), which greatly increases the changes of the signal
> arriving at the right time.
>
> Fixes: #765
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000fbd43405b8c41b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 9:28 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There was=
 a race that would manifest on slower machines.<br>
<br>
The call to epoll_pwait() could time out before the child has chance to<br>
run, and that would cause the signal to be sent to the parent when it<br>
was already sleeping in wait().<br>
<br>
Ideally the whole test should be rewritten into new library and fixed<br>
properly, however as we are just before a release this is an attempt for<br=
>
a minimal fix.<br>
<br>
The logic in the test is changed so that:<br>
<br>
- epoll_wait() sleeps indefinitely<br>
- the child:<br>
=C2=A0 - waits for the parent to get asleep<br>
=C2=A0 - sends the signal<br>
=C2=A0 - sleeps<br>
=C2=A0 - writes to the pipe<br>
<br>
This causes the child to actually run, while the parent is blocked in<br>
the epoll_wait(), which greatly increases the changes of the signal<br>
arriving at the right time.<br>
<br>
Fixes: #765<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div>=C2=A0</div><div><=
span class=3D"gmail_default" style=3D"font-size:small"></span>Reviewed-by: =
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt;</div><div><span class=3D"gmail_default"></span>=C2=A0</di=
v></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--000000000000fbd43405b8c41b28--


--===============0466541169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0466541169==--

