Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 502603F74AB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 14:00:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D62D23C9DA1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 14:00:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D7FE3C2FD0
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 13:59:57 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0CCA81A00A22
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 13:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629892794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4Qcu0oWf9lWki7SAFwSIurrs8fSM8w7HrZgGCGxo2U=;
 b=OPs+0wfJ9x0Z/Q0I9I2NI1dmXj/Rt8MYOpOcrbtASl8tBmet54boETe2PpuZGr3pvp7Jsm
 gHhAOD6Gq6azdHGepQhdrrRumU3CVpSbsQmf2xpYvSAVZfP3nto5B1SDhtYpoImK0C2NYr
 4k+x/ZQ1XaXl2yOOfFXK+9Ln7ENBw9w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-JFpGPc5gNX-PxJA5AqPJrQ-1; Wed, 25 Aug 2021 07:59:52 -0400
X-MC-Unique: JFpGPc5gNX-PxJA5AqPJrQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 q9-20020a252a09000000b0059b9b61f6ceso3601154ybq.19
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 04:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4Qcu0oWf9lWki7SAFwSIurrs8fSM8w7HrZgGCGxo2U=;
 b=VVqFZg8eb0XwzJdiiJa+fLiHIbWt1u/jLh8aNISUELXNqBOK1zNupAL9+LyXwuxbwl
 NlsdxsEgPEfGmHmJT3DDQQPKQ2KQ/DulhDOGOI09B2CoJgHcUUkLWqTPhg5bc6EFHxGu
 AoZudoKsBH5zlAu5BdiYGCtCUkohW02THU2vxz1EW/uJdl/H6x6XUuy7xK2VV/RtDn0f
 tYhtn1+yM7grYpViuuYtbf/CVTjvl5WLxIWNGJQBy21nRCrNNtXTHJYW2Jz7DD3I8Llr
 TwWoGsL3kp4ONm7eXBLneIT9EcY+KdW2jVSS1KbOtCYbJ4uyL6oSvhDHQ+BaRu90nLhf
 gWqw==
X-Gm-Message-State: AOAM532K/aP4hLZb8px8DHkYX7zOrZv4lMr3hZbnz5QBLX3hfeUvkYZh
 zp5Z+8NWgQaREWUpr6BwaXtnSSUSX6rM47kJjWO+0mvjXMRmQ0QBcH2y1deAuOgudaGhOja55Ju
 U3iuUBqeY7Gxh4m8+0jlV6Z4vkc0=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr58184292ybc.252.1629892792123; 
 Wed, 25 Aug 2021 04:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJZW6sF9Tjd6I8Pit368oQw/sZavPB0pSAszxEFaskSvZ7cb1m4aujqNT0qMNq4wRQiO7CEjSPZkWY5s4goQU=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr58184273ybc.252.1629892791899; 
 Wed, 25 Aug 2021 04:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210824181338.19034-1-pvorel@suse.cz>
In-Reply-To: <20210824181338.19034-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Aug 2021 19:59:40 +0800
Message-ID: <CAEemH2fwN+aZagcAKN8tfd99qxefB6P6nSb5EhHx9cBpvc_iuQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] openposix: Support VERBOSE mode
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
Content-Type: multipart/mixed; boundary="===============1439163457=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1439163457==
Content-Type: multipart/alternative; boundary="000000000000e22f9a05ca60fcc6"

--000000000000e22f9a05ca60fcc6
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 2:14 AM Petr Vorel <pvorel@suse.cz> wrote:

> i.e. VERBOSE=1 or V=1 to print gcc output.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000e22f9a05ca60fcc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 2:14 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">i.e. VERBOSE=3D1 or V=3D1 to pr=
int gcc output.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:=
liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div></div><div><br></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e22f9a05ca60fcc6--


--===============1439163457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1439163457==--

