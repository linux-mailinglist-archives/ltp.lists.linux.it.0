Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96417305536
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:05:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DD6D3C79E4
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:05:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C8B533C4FA6
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:05:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 45AB32002DF
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611734749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cfp/aUiTx9JvQJtUqOQK3+2x9zTfsCJKJYZLfE5JfAU=;
 b=gQt/mQbFnuoP5Vw7n4PPBGS+V56OUWqOe3TQ558RBAZPwsOHsujhH8K+4E1LVh6Sghos8y
 waARYWJsu8/YN/x1uiL9DuLZFYMK670fuaDvUXzCU4CGnHV4GN75ncq24HTRt8Z82ymS5f
 jTGGLXRC/hg+7/XrwE7FL+S035wpZVg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-oDSBMtCcMrqBO1KoMq4Nqw-1; Wed, 27 Jan 2021 03:05:47 -0500
X-MC-Unique: oDSBMtCcMrqBO1KoMq4Nqw-1
Received: by mail-yb1-f198.google.com with SMTP id s64so1548554yba.20
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 00:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfp/aUiTx9JvQJtUqOQK3+2x9zTfsCJKJYZLfE5JfAU=;
 b=E6EeP+TCc9IAcjRRYaOneWJLNZioKwetdpjFkBabh9kncW8QX7y5qy8B25f2CtUYXG
 gS2dDlTHuqDCduu7ChLU24SQprJNDU7CwZDfqTtOLxyqGGPRCkhw/qP2UM1UeCp6JKip
 +UxrX7Ays2hgEEnB/3wC1cjelzEGxuw9aCUNt/TwtKzDN+GPKgMkNLe77QSKN3qMuRtd
 N42qY/cGQApmF403jFeoDDHfkuZu6U+91tbYAWiliU2uOkiXd1jc2toRSln6NKPiB7mj
 FgTit4DexVNyPY98BpashV7dHf3UCNlFgGgTAwqpNZp+Hk89TSkKq+R0edpICbNDX5Ow
 AwFg==
X-Gm-Message-State: AOAM531EkcemNhWNgKq/zaLPJzmKsEDke2selkbr09cCbyyNcrUs/jdr
 EQ27C/E9cdLkolZXaGhlKarYdM7sPT4b8rWbc48nW8eQlM/VKJEuYTchxb65b5NomLB+blHFLbI
 ji+uJGzquyh4wklSCUuAopU6Y5BA=
X-Received: by 2002:a25:8203:: with SMTP id q3mr14651856ybk.86.1611734746831; 
 Wed, 27 Jan 2021 00:05:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdUs6V5rd+9N9LSDDfgO4K5Gq/YklmCKTFLkwRv5mMGAiE1stFijW3A4LExnYHegJL4NmaaPH29ItDW14BN3U=
X-Received: by 2002:a25:8203:: with SMTP id q3mr14651845ybk.86.1611734746653; 
 Wed, 27 Jan 2021 00:05:46 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
 <2021012714540739834212@chinatelecom.cn>
 <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
In-Reply-To: <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 Jan 2021 16:05:34 +0800
Message-ID: <CAEemH2cwEzLr0dXvskn-hprn0-iOCr=rrLPgDUE1YdbnHu=5AQ@mail.gmail.com>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
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
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0350884889=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0350884889==
Content-Type: multipart/alternative; boundary="0000000000000bff3405b9dd3d5f"

--0000000000000bff3405b9dd3d5f
Content-Type: text/plain; charset="UTF-8"

Li Wang <liwang@redhat.com> wrote:

Hi Xinpeng,
>
> I sent to you the case swapping01 solving this(via FILE_LINES_SCANF)
> already, feel free to take an reference:
>
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85
>

Or, maybe we can extract this process into a function and put it in
tst_memutils.h, to convinently reuse by other testcases too?

void tst_get_MemAvailable(void);

-- 
Regards,
Li Wang

--0000000000000bff3405b9dd3d5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang=
@redhat.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div style=3D"font-size:small">Hi Xinpeng,</div><div style=3D"font-size:sm=
all"><br></div><div>I sent to you the case swapping01 solving this(via FILE=
_LINES_SCANF) already, feel free to take an reference:</div><div><a href=3D=
"https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem=
/swapping/swapping01.c#L85" style=3D"font-size:small" target=3D"_blank">htt=
ps://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swa=
pping/swapping01.c#L85</a></div></div></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">Or, maybe we can extract=
 this process into a function and put it in tst_memutils.h, to convinently =
reuse by other testcases=C2=A0too?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">void tst_get_MemAvailable(void);</div></div></div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000000bff3405b9dd3d5f--


--===============0350884889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0350884889==--

