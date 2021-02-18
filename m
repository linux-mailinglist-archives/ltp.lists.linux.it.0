Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064331E791
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 09:44:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B6923C6618
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 09:44:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EE4683C54E7
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 09:43:59 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 83DEA601A06
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 09:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613637837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9vlcC5nzpTW5Mj4swShiPSmy7sSivz/hRKidKi4WUTE=;
 b=J7dyns1Puf+fJCRRyVFva4Htre/xcn0otJ4aDeT0Zu0cr9XcSiRQ8Xg1gvggu8/9+uHDg5
 3hYLdY+IsjN9z/BlT4IScDWrnLhs3+5dIWLxiWHw78hXpxHZUQAb2U/FmbGRVU08prtXG1
 lwzIUerr4Vgq5xK7WEKyj6UAfxduaBY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-qNUXQipyNXODqPyvoPtUXw-1; Thu, 18 Feb 2021 03:43:54 -0500
X-MC-Unique: qNUXQipyNXODqPyvoPtUXw-1
Received: by mail-yb1-f197.google.com with SMTP id l10so1915471ybt.6
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 00:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9vlcC5nzpTW5Mj4swShiPSmy7sSivz/hRKidKi4WUTE=;
 b=WXXkOdgA/GMvhdCAtJ2OYKBo/QLhnJYrLa6HXag4uDjCXJ+ex2WOa+97q15aidj1z6
 Yq7lWPZeKJl6fw+D7rsirUeWMEghc/oJ1qcaSUZqCw0/eoVjZlMtFX7HsQuSZyz/agt+
 CVwAMcPPu+uO+8cN7EFeR5toCw1aXSsHQeP/st6MEiQsrwvZLVK+UtY47RivmfDrYTC8
 c0o2NOH/or0G9JBRHYV61+4fxFgZB2uTt0d0I14p6zb6IQ2nsUAiFIKCP6ee951rpO0z
 rz6Vn/M8fRAFoGVBO4Ill2dXf2MrzaiCG1thpfywifpI950+YZKCXXyH7FHrUAQ5qW6n
 HbaA==
X-Gm-Message-State: AOAM532A9ycFdPBOnHb05Kt4gxWm7eBHODxDTMcwyuRy8cK5iHYjwUhw
 DpDKPSpK7mZ9TOk3lZm/ZM5wk/K2lr6mgWs131XokALUV6vW4MmP0Z4hqmkqPg/5C2A7xwA9fI8
 LoTCre9iI2V1Z0ijh1JDelrKLwA4=
X-Received: by 2002:a25:b992:: with SMTP id r18mr5345015ybg.86.1613637834468; 
 Thu, 18 Feb 2021 00:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfotcoK8+JqAA5NIPkAxSg59apy9o3aDsp28yNMkBiSQAAKePVPH02WMJLTi7GxhbwAixfLVMgIdrKRMXQEoY=
X-Received: by 2002:a25:b992:: with SMTP id r18mr5344995ybg.86.1613637834290; 
 Thu, 18 Feb 2021 00:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20210205105143.243135-1-zhaogongyi@huawei.com>
In-Reply-To: <20210205105143.243135-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Feb 2021 16:43:42 +0800
Message-ID: <CAEemH2fxbEaAbua06eUZmEoGkG5Z501bPcjA0qWrRJTZdQBCdQ@mail.gmail.com>
To: zhao gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ttype: using TTERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============0130308774=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0130308774==
Content-Type: multipart/alternative; boundary="000000000000e8d05405bb985516"

--000000000000e8d05405bb985516
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

Thanks for fixing in batches, pushed.
Btw, it'd great if cook the patch via `git commit -sm` to add Signed-off-by
info.


-- 
Regards,
Li Wang

--000000000000e8d05405bb985516
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div>Thanks for fixing in batches, pushed.</div><div dir=3D"=
ltr"><div class=3D"gmail_default" style=3D"font-size:small">Btw, it&#39;d g=
reat if cook the patch via `git commit -sm` to add=C2=A0Signed-off-by info.=
</div><br></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e8d05405bb985516--


--===============0130308774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0130308774==--

