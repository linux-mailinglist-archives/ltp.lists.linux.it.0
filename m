Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42235EDA4
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 08:58:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07B753C2702
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 08:58:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 677C03C19CC
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 08:58:07 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 04196200AE4
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 08:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618383484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fEkPcYVOYtJJepJpqdYW07eT5IrAZ/JC7rEqMNdsyiI=;
 b=FCmiZ5m5PuyTzwFvY3o2YqXfYIYRcRmNMlwXVzivgkVqElKfY84VtfetmDSd1B+oBT9BaZ
 Vy/fL8S8LMaMxPYCb/ivaglgULSxUEqQgJ4ph7Uq1kqlz4M2N4eFIHuIW4OHc6WvuKBTjo
 ar+c8r98WdMVScxF6Rc1Aj3VA03E4Bg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-tLOFFf-5MmOf_JZNzDhylw-1; Wed, 14 Apr 2021 02:58:01 -0400
X-MC-Unique: tLOFFf-5MmOf_JZNzDhylw-1
Received: by mail-yb1-f197.google.com with SMTP id g7so18941841ybm.13
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 23:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEkPcYVOYtJJepJpqdYW07eT5IrAZ/JC7rEqMNdsyiI=;
 b=fORevc9LV/N2ZEi1dz3RJuWn4ks29tPsdsEeB5Oe0WsrEqsR9e/ZmcMEJjluWRSUsd
 N00WWhR5d2P7+bufzT8RwoAqervpkHovorpaWvY3Xz9Gl1ddphN7J1Pt3D3FOReYI2MM
 E0jjJRcRVzwBmn2y74jrRGOyegPtKGpnbXni2tH1Ja5C35ysNTdnt+jyIFfC0EvMoatf
 Gj6fyN3Fv6RsHn3esR8B/bqgyckjYe7COf8oIlCJ4pgxgNeXkpPRLggV+t5T2oFEnKLX
 HYIwA0T30WCpXLTd0eUKQx3D4PSiuRiRrXB2d0OYcL7rvxPNO9H41KiEbowJcQirqTMn
 S+uA==
X-Gm-Message-State: AOAM531o3Vwo/Za/LrzoXGhmq3sBrieke2YJdJO+kV0n8ACkR7UTRc/Y
 sDXPyebtgC35R8Gt2JzuIZ02Ev9KVPqD9dqoSTmUyo9LmxFQgd67RkK2Ith8zn4PqzU6yai00mE
 tD7wjhkmcxmSOklMFA7ICNZMobw4=
X-Received: by 2002:a25:af05:: with SMTP id a5mr51656464ybh.86.1618383481379; 
 Tue, 13 Apr 2021 23:58:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3UWq0zv9pf3t6T4G1V5amQTUuIspkJGG/uFoBgok09/g0NOKJdLl9wx1XsrxvxUIOidzrB98ZFXOXNGKc25Y=
X-Received: by 2002:a25:af05:: with SMTP id a5mr51656446ybh.86.1618383481159; 
 Tue, 13 Apr 2021 23:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <1617765607-78263-1-git-send-email-wangxin410@huawei.com>
In-Reply-To: <1617765607-78263-1-git-send-email-wangxin410@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Apr 2021 14:57:50 +0800
Message-ID: <CAEemH2ctSMR5OF=0TQX1eNmTE7PcdEdMbjoYXc3RxiBsyfzcuw@mail.gmail.com>
To: Wang Xin <wangxin410@huawei.com>
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
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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
Content-Type: multipart/mixed; boundary="===============0285145117=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0285145117==
Content-Type: multipart/alternative; boundary="0000000000008157b505bfe9447d"

--0000000000008157b505bfe9447d
Content-Type: text/plain; charset="UTF-8"

Hi Xin,

Sorry for the late reply.

On Wed, Apr 7, 2021 at 11:03 AM Wang Xin <wangxin410@huawei.com> wrote:

> Types in the name of the temporary files: For example, in aio_cancel/8-1.c
> file,
> pts_aio_cancel_1_1 -> pts_aio_cancel_8_1.
> Others like this have been modified.
>

Good catch!

Since there are many changes before this patch, could you
rebase this patch on the latest main branch and resend?
(in order to get rid of the patch conflict :)

-- 
Regards,
Li Wang

--0000000000008157b505bfe9447d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xin,</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Sor=
ry=C2=A0for the late reply.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 7, 2021 at 11:03 AM Wang Xin &=
lt;<a href=3D"mailto:wangxin410@huawei.com">wangxin410@huawei.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Types in t=
he name of the temporary files: For example, in aio_cancel/8-1.c file,<br>
pts_aio_cancel_1_1 -&gt; pts_aio_cancel_8_1.<br>
Others like this have been modified.<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Good catch!</div></div=
><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Sinc=
e there are many changes before this patch, could you</div><div class=3D"gm=
ail_default">rebase this patch on the latest main branch and resend?</div><=
div class=3D"gmail_default" style=3D"font-size:small">(in order to get rid =
of the patch conflict=C2=A0:)</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--0000000000008157b505bfe9447d--


--===============0285145117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0285145117==--

