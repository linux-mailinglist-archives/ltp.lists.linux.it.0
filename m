Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA532CE21
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 09:10:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE82D3C5664
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 09:10:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 43A023C4D05
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 09:10:29 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8CEEC601179
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 09:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614845427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BaWIi4FytFBHZQCoGl08fwoshjqV7LzXDF9akO+gGQ=;
 b=f0ap5rxkCUMO/aDFmGMI81heIP32d5iSF0OIoNfHxUOmDuiOG+kzchJ3SaMT0xc+xc+HrW
 27cAsxaoACkTYaCkWZ26Kst/6LEMTH/xknkQmTnWLP5njUzh2ys9sxXeCUucGVRicOhm8K
 ZNloO0XB+S7m7dn6Niln9x31I6AN5xQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-SS65h25sM8q7xrEPDFobgg-1; Thu, 04 Mar 2021 03:10:24 -0500
X-MC-Unique: SS65h25sM8q7xrEPDFobgg-1
Received: by mail-yb1-f199.google.com with SMTP id v62so29793918ybb.15
 for <ltp@lists.linux.it>; Thu, 04 Mar 2021 00:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BaWIi4FytFBHZQCoGl08fwoshjqV7LzXDF9akO+gGQ=;
 b=ZrzcaAJXXBwYc/WQryRg39KeQry3FJwgZK8GDbXzz1XGO7UovwDGZRojMEKVREGIgY
 Y2519bQ4L6eDzslmJgoJ7k173u0QnKMNbcNVzOKTILqAZpPeUC/23hd0bMs2Jx7CBUdy
 GOyJv43lKahGPkcxuL2UQ9Y3kOQuV6wE8hhVDp4Dx/AwPv3bw+LDohgq3fTAfupKQMk4
 G4kNir/oVgmbX3dpGwmdbQqUbQCpFMB0cKc/NNr8PzkdevTO0o+Pqn/FksbC43LYwpwC
 h9cJ+edXA06LIuE8hfFlwZdzOwBOBwF59ri1OUENedE4neAVkrUN9YrUjS9MFTGM64kB
 Whmw==
X-Gm-Message-State: AOAM532bawWHMCAf1kENchOdYWmBpjgZa+lJiNQ4mtxSIPZnHnfmQ3nv
 h0W/cq14tBAE8+v1DEPjMVjC3Ui2/2pyJwSAYB1qVZF0VBa822QydoTNEd3OF6Zhht3ho72HQbb
 wuhXEFBe2RvraIDF5bVMpKltPXvs=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4989414ybh.86.1614845424346;
 Thu, 04 Mar 2021 00:10:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFSkW8e3d1paV2TWru/5jRMeTatLiLOdrgGbcmj24dbNgatsncQwm0GCR8awsamILFuykRP/uaROSV7jOJR1o=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4989404ybh.86.1614845424209;
 Thu, 04 Mar 2021 00:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20210304022127.535431-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20210304022127.535431-1-yangx.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Mar 2021 16:10:12 +0800
Message-ID: <CAEemH2e7G_gtAZTHUagTTPgAg8ToqnOpp8R4vrr+Bsu8rT9cWQ@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] syscalls/getpid01.c: Remove unneeded TTERRNO and
 status
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
Content-Type: multipart/mixed; boundary="===============0137464206=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0137464206==
Content-Type: multipart/alternative; boundary="000000000000e0a39a05bcb17ffd"

--000000000000e0a39a05bcb17ffd
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 4, 2021 at 10:54 AM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
>

Pushed, thanks!

-- 
Regards,
Li Wang

--000000000000e0a39a05bcb17ffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 4, 2021 at 10:54 AM Xiao Yang &lt;<a hr=
ef=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:=
 Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" target=3D"_blank"=
>yangx.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Pushed, thanks!</div></div><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e0a39a05bcb17ffd--


--===============0137464206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0137464206==--

