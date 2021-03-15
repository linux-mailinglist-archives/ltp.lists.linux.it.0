Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB233AA1A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:46:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 048EB3C4E2A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:46:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2ADCC3C2E31
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:46:22 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8EB6F1A00A56
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615779979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EjWdhSHF4Opfo9haQQ+2Q5cq45fKJfdiBMMjwOReq2c=;
 b=DpADlt85uIwiWJ+Aep9plSE8da+Ovh8JvRN32BRAJ7dXqNyKoq4Z9DPYHRof4vWS47iUCA
 wfE5q2d32/Naj2ciOon3AnUrVNOBJzH6JM5VcGU7SZcBpBO36e1PR9DxxkOcsGhRPard3o
 p7LsdhoN7acygb2LpYzljjfToZQ3dFw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-lBfE2KdjMjGHHFHlbllDgw-1; Sun, 14 Mar 2021 23:46:17 -0400
X-MC-Unique: lBfE2KdjMjGHHFHlbllDgw-1
Received: by mail-yb1-f197.google.com with SMTP id y7so36657776ybh.20
 for <ltp@lists.linux.it>; Sun, 14 Mar 2021 20:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EjWdhSHF4Opfo9haQQ+2Q5cq45fKJfdiBMMjwOReq2c=;
 b=SRk+JYHSEOqniTM1pW3MGPYtCxIfTzKBDTYKungrukxDTyWTyy+rDOmF40gISdq8Ug
 +/e2a2bW4/qMlxxQ05oD1IrLpLm4J0ZOTywTR9/AfRtsOuC7vrrV1Mp1Tw40xkT0Zmgz
 ISl2NR25j+J/xqjl3HUMrdEiIoIrYfcy09N89VZfHzWL0NePJ13cEgdxDJZzN0gxAl2Q
 cGKnu3OjREpp3HCCt5eBe8u1yoNUFCB6bKeqc3IRfRgjuvdVMXhhrbLEiSvh0PN/v5DX
 XLv/pa55a3r4+0QE3LLnYNBOcivUwRU1GwJkAP5/QBlNYHzVhDb6xasCItVLb9J42lhc
 ltpg==
X-Gm-Message-State: AOAM533bMVOhZJE25NOSc1YKI5y8r1ah1tJKyqor4Bz2dI26D/rWa6uh
 n+8gbv7YtgpUZc6D3hzogdNtjviS0G1ONA3QhMb5O4SWkIHSBDelH81w369/yHtrOV3trC2lemG
 lqYJWVi2rJ0GuRqrVbiihyDOPtpQ=
X-Received: by 2002:a25:412:: with SMTP id 18mr34587986ybe.366.1615779976860; 
 Sun, 14 Mar 2021 20:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqgTQHyrqpLTajPTWrK1Xb3mfWUwZiC62AQaqdiZ2M1EUPTf6vYA47hCDFMQn+ULSFT6SLIkuKovAKFC0v3T0=
X-Received: by 2002:a25:412:: with SMTP id 18mr34587969ybe.366.1615779976550; 
 Sun, 14 Mar 2021 20:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210315032436.24360-1-zhaogongyi@huawei.com>
In-Reply-To: <20210315032436.24360-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Mar 2021 11:46:04 +0800
Message-ID: <CAEemH2cjYGi-RAidPJim+-n_bh9oU3V9dPwEHHcy_UUZEyc+MQ@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] log style: Remove redundancy '\n'
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
Content-Type: multipart/mixed; boundary="===============1107991641=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1107991641==
Content-Type: multipart/alternative; boundary="00000000000089b61605bd8b1786"

--00000000000089b61605bd8b1786
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 15, 2021 at 11:25 AM Zhao Gongyi <zhaogongyi@huawei.com> wrote:

> Remove redundancy '\n' to make the log style consistency since
> the functions tst_* have added a '\n' at the end of the string.
>

Thank you for the cleanup, pushed.

-- 
Regards,
Li Wang

--00000000000089b61605bd8b1786
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 11:25 AM Zhao Gongyi &lt;<a=
 href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Remove redundan=
cy &#39;\n&#39; to make the log style consistency since<br>
the functions tst_* have added a &#39;\n&#39; at the end of the string.<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Thank you for the cleanup, pushed.</div></div></div><div><br><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000089b61605bd8b1786--


--===============1107991641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1107991641==--

