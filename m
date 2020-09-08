Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DC2609D6
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 07:11:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9887E3C53C2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 07:11:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9E52E3C2214
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 07:11:09 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D3DBF10007EF
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 07:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599541867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPrgamHOWvJLqmjzPX/dEj8okMTLeOYuxCc8UyzEW5U=;
 b=iQCUmmWqWvj69mWodG/niCUH9JH4JFd7IXfbtyj4JRMcbgdWVYtqIIKvoowkuIboTOW/ox
 gKM46XVtjCqcplNHyZunWHWszbVDFIKyBWU7xRGn5i8EOdyxcsTgxMXB00tosDjENuHqJ+
 fRL9au1jvYAokCg5fkAe+ZEiaOKXH3I=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-ZdCcfBa9Nzq59RIMG086Rw-1; Tue, 08 Sep 2020 01:11:01 -0400
X-MC-Unique: ZdCcfBa9Nzq59RIMG086Rw-1
Received: by mail-yb1-f197.google.com with SMTP id 129so14575331ybn.15
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 22:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oPrgamHOWvJLqmjzPX/dEj8okMTLeOYuxCc8UyzEW5U=;
 b=eJdwWv14LW4fM1OW6OTqhFLkMDuWZb6FyPhsyaZ0uNs1CHc3zeH5iKcOYn4TNS/yNI
 Nxq/oB3ZeApYEe6OHCtJE2RKtjSopff+CZyzhASojEXCUcNH3R8CUiIsV06Q/zd7FIru
 E1a5h+BQe5KU0+X6KwILM7tskWRX2yfD45AMl4jokjDbso9y6xQ0qha8TEwXzLwYmIB2
 CaZPxN8W+D4SLhATk3UDFsUfdBXd1hlLxmqVRDqnTmsoNjOmr83E1Ev5HpHXH1MqCkv9
 SabjvfjNNb1KBFO8MHkPKnlVwodpL6YEOtwH2zYwazhmNJ+qIwh24SsNLud49ore4e/i
 eVFg==
X-Gm-Message-State: AOAM532gWOjI82RVtk6mI1ZB9eIQ4JKyyAcPZeACLHx4b3ZYX3mnJxck
 9vHXexN0C0pR9HUDIpR8NsytTsYu0fs8xYLZKIr9mFq7KYSyTwOxdbiF/y+lToYEmzfkrH7gj9E
 BuiqYo1CMST6QJSmEFqcFip0dDU4=
X-Received: by 2002:a25:c049:: with SMTP id c70mr11838892ybf.403.1599541860651; 
 Mon, 07 Sep 2020 22:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyca5dYXBCGtIqiTbZsQvhiPPN4rbnTd9mGPP1hX6t7nH/XbBUxk8ynKg1g8glnJeW7qa1KoAmSfoFwTP60fsk=
X-Received: by 2002:a25:c049:: with SMTP id c70mr11838853ybf.403.1599541860219; 
 Mon, 07 Sep 2020 22:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
In-Reply-To: <fa29d6d05e385170a74a06fbe752fbaac3965358.1599469171.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Tue, 8 Sep 2020 13:10:48 +0800
Message-ID: <CAEemH2cfwkYPR-BKRnDBwKMFcz9DzEvZCzMkcE9uuGfcKUhyww@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/3] syscalls: select: Merge few tests and
 migrate to new format
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0618029871=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0618029871==
Content-Type: multipart/alternative; boundary="00000000000061d5ed05aec65cf6"

--00000000000061d5ed05aec65cf6
Content-Type: text/plain; charset="UTF-8"

Viresh Kumar <viresh.kumar@linaro.org> wrote:


> + * 1.) select(2) to fd of regular file with no I/O and small timeout
> + * 2.) select(2) to fd of system pipe with no I/O and small timeout
> + * 2.) select(2) of fd of a named-pipe (FIFO) with no I/O and small
> timeout value
>

"3.) select(2) to..."  ^  someone who merges this can help fix the typo.

For the series:
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000061d5ed05aec65cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.=
org">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+ * 1.) select(2) to fd of regular file with no I/O and small timeout<br>
+ * 2.) select(2) to fd of system pipe with no I/O and small timeout<br>
+ * 2.) select(2) of fd of a named-pipe (FIFO) with no I/O and small timeou=
t value<br></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">&quot;3.) select(2) to...&quot;=C2=A0 ^=C2=A0 someo=
ne who merges this can help fix the typo.</div></div><div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">For the series:</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=3D"mailto:liwang=
@redhat.com">liwang@redhat.com</a>&gt;</div></div></div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000061d5ed05aec65cf6--


--===============0618029871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0618029871==--

