Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56530B08BA
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 08:18:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 135303C20B6
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 08:18:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 60A0E3C061B
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 08:18:28 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4C4241000CB8
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 08:18:19 +0200 (CEST)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B6CF88305
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 06:18:25 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id c8so2000578oic.18
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 23:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBTi21b3iFWdkxgo72uXtbvFyZGo/Wj/uLmlT/yVJhk=;
 b=cLekC7/B1ByyEDIrI48mZ1NtO5SMn0lUgZlq4RhTiHB6jga8XoMsV/hPywE9zGKV7G
 oyecfQNrAHq6L1dheNT741y6oRn3jPgJSoK8XTH6HGA4ra5OVkqBngGXjlxFQ+ESQx/X
 mCKmNRbIWsHJYopwxoYADOfuTyVo84ZfgYDxLwDX9HR7QFQPPnO3HUcwRmwYfj2LbIfI
 xX09XomU4ZZgzjMUf+sfpOY314V3VydgH9ac4i1dQrGoIk6449cyrtFvU2fqNjaJ2Ns+
 cds5qdCOyMzA7PPxS2NE6aU8ggA4E4pcpAlHda/4ypWpwsy9XNTE4F14ZFZOyBZfjLhZ
 AuaA==
X-Gm-Message-State: APjAAAVrnspZtnUMQyVBOKb+dcmpxNayoXijtBYFtSiHfUm9wC2CtOXC
 oa42t5SWL4Oz/uguOj4+zXMp7BwkA0/ube/10aBIGMw3dmODA9NhUZz2G8fEb3ERCHwIjHO3APz
 fcxg/hezh0s8Rp9d65MV8iqsDt7c=
X-Received: by 2002:a05:6830:1e79:: with SMTP id
 m25mr12441606otr.67.1568269104917; 
 Wed, 11 Sep 2019 23:18:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtxT303a3lOlvwX6xtZFXMDyI8Go2WaPiMEoK6SDp4kf3o8MoTq1Xv/Z3sE4E89+atjScFBamerCCVj3W+ebw=
X-Received: by 2002:a05:6830:1e79:: with SMTP id
 m25mr12441592otr.67.1568269104709; 
 Wed, 11 Sep 2019 23:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <1568266635-17666-1-git-send-email-shuang.qiu@oracle.com>
In-Reply-To: <1568266635-17666-1-git-send-email-shuang.qiu@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 12 Sep 2019 14:18:13 +0800
Message-ID: <CAEemH2dnWfhmTBHyKPJ9iAgEKPNcCBGwuUJ+zC8+UCFCvX5eSw@mail.gmail.com>
To: Shuang Qiu <shuang.qiu@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] madvise09:Update PAGES to a larger value
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
Content-Type: multipart/mixed; boundary="===============0913982883=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0913982883==
Content-Type: multipart/alternative; boundary="000000000000e61cfd0592551a44"

--000000000000e61cfd0592551a44
Content-Type: text/plain; charset="UTF-8"

Hi Shuang,

Thanks for the quick work on this.

There are two problems that you probably ignored.

1. On ppc64 system, the page size is 64KB, and 970 * 64KB is almost 60MB
which we do allocate. So we'd better raise
the limit_in_bytes/memsw.limit_in_bytes a little in cgroup correspondingly.

2. As Cascardo points out, madvise09 gets retries in an infinite loop when
hitting OOM. That's because, in the run() function, it does not limit the
retry times. We need to take care of this as well.

-- 
Regards,
Li Wang

--000000000000e61cfd0592551a44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Shuang,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for the quick work on this.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">There are two problems that you probably ignored.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">1. On ppc64 system, the page size is 64=
KB, and 970 * 64KB is almost 60MB which we do allocate. So we&#39;d better =
raise the=C2=A0limit_in_bytes/memsw.limit_in_bytes a little in cgroup=C2=A0=
correspondingly.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">2. As Ca=
scardo points out, madvise09 gets retries in an infinite loop when hitting =
OOM. That&#39;s because, in the run() function, it does not limit the retry=
 times. We need to take care of this as well.</div></div><div><br></div>-- =
<br><div dir=3D"ltr" class=3D"m_-5144460428309547159m_8860346067871503077m_=
-579345017879392526gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--000000000000e61cfd0592551a44--

--===============0913982883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0913982883==--
