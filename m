Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC461C4CB0
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 05:35:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB1843C28D9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 05:35:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CFB693C2682
 for <ltp@lists.linux.it>; Tue,  5 May 2020 05:35:12 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 038031400B63
 for <ltp@lists.linux.it>; Tue,  5 May 2020 05:35:12 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id z1so238408pfn.3
 for <ltp@lists.linux.it>; Mon, 04 May 2020 20:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=kXgfznOt/n4NylE54qIIm9w4vSsey2oZWiVq7kXn1aQ=;
 b=srsp2+5evEu5/Rk1kEgGc7cXhFYvifJTjAXxckIvDyb0Q+k3xqkeZb7QoiIJn3hG4e
 Q/gR702/6sJ3RiBZ8VRt3p2pTXbbqQevSV27OEvneJ2/fYcJSt5dYYMABLlHm8PVSsp1
 XR2HUkUH9A7h2yuxyjmLnwl5ENe1NIKHA7V/cm0BNEUZfifR2W1bu8bU6jWZ0EtJgtkK
 Vpvu6JZc2+5aQ9Tp4R1XGE6HTmLkXhm6tMsDCTqHU0PGm73Z96whGkr4muj5Wo6jd8jw
 aLjiNilVFtmrvlX2IqZ5nsR2DGZRk2LlNZqyFtRboEVgu+2Gmist8foExQ3Hroq9UnmW
 3xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kXgfznOt/n4NylE54qIIm9w4vSsey2oZWiVq7kXn1aQ=;
 b=fP+2MhKBzmeb3TcPmMbVr2ePBG2hkk3A7+9FommpsaPJ9ioeJYorpdn37Gvgpkl9k3
 Fv15ulIVfM0l4Ue2gdB0es8eLIeOqeT6Zf54534vLqOwH2YVcVJAMmYCOIMPiAXTw3VO
 qKBZNMALtt+ihqFGMbsc5ci3FwGU2KrN9vzsB4GOY6msyb1RHWSKtxWBviBu3NwtETxn
 Kwg7yts9oj4+uyOQwFrfuKz96Q8+yivyzSMYGQE0kN3AvqKf+VGP6SA4dRJ/PnMxo+2b
 JAqLHwd3r2aLOQ0CQUY+aui1WNp8D7UAT9/gNtpO69mwRgpZm/eaOli0cWuLcpIOwva0
 ECAQ==
X-Gm-Message-State: AGi0PubgoXN8u4B82gRdK0wOCniL4AAd/HTbedkC23a6Lrh44Ebzb29X
 +JsGtDVMLstdthWhafX6XYV24Q==
X-Google-Smtp-Source: APiQypJEqC47GO1mRZzihp431eUVegqB2K0mWINBAk8ZNDq6OmQ1CHa2LYyGcs1Nw8UT0jUCr6swbg==
X-Received: by 2002:a63:1361:: with SMTP id 33mr1214612pgt.265.1588649710194; 
 Mon, 04 May 2020 20:35:10 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id z1sm404066pjn.43.2020.05.04.20.35.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 May 2020 20:35:09 -0700 (PDT)
Date: Tue, 5 May 2020 09:05:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200505033507.oerhoby6aif3leea@vireshk-i7>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
 <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
 <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 04-05-20, 20:49, Xiao Yang wrote:
> Yes, It is unrelated change and just a small cleanup.
> =

> My commit message has mentioned it and I don't want to do the cleanup in
> seperate patch.

Removing usage of TEST() is not cleanup but just a choice of the
developer of how to write code, it wasn't my choice and I have been
asked to do it by maintainers, so removing it like that isn't correct.
If you want to do it, please send a separate patch and don't mix with
unrelated changes. There should be a separate patch normally for
different changes.

> > =

> > >   	TST_CHECKPOINT_WAKE(0);
> > > @@ -49,8 +47,14 @@ static void run(void)
> > >   		tst_res(TPASS, "pidfd_open() passed");
> > >   }
> > > +static void setup(void)
> > > +{
> > > +	// Check if pidfd_open(2) is not supported
> > > +	tst_syscall(__NR_pidfd_open, -1, 0);
> > > +}
> > > +
> > >   static struct tst_test test =3D {
> > > -	.min_kver =3D "5.3",
> > > +	.setup =3D setup,
> > >   	.test_all =3D run,
> > >   	.forks_child =3D 1,
> > >   	.needs_checkpoints =3D 1,
> > Please have a look at fsopen_supported_by_kernel() in lapi/fsmount.h
> > and make such a helper.
> =

> First, I want to explain my check point:
> =

> Passing invalid argument can check the support of pidfd_open(2) by ENOSYS
> errno and we don't need to close the pidfd.
> =

> Second, I don't like the implementation of fsopen_supported_by_kernel() a=
nd
> give some suggestions:
> =

> a) syscall()/tst_syscall() is enough to check the support of pidfd_open(2)
> and 'tst_kvercmp(5, 2, 0)) < 0' will skip the check
> =

> =A0=A0=A0 if a kernel on distribution is newer than v5.2 but drop the sup=
port of
> pidfd_open(2) on purpose.

I don't think kernel can drop support of syscalls just like that, we
can't break user space. And if that is done, we need to fix userspace
again separately for that.

We came to the implementation of fsopen_supported_by_kernel() after a
lot of reviews and decided on that and so I asked you for the sake of
keeping similar code throughout LTP (of course there will be old
usages which are different) to have a similar implementation.

Anyway, I will leave it to Cyril to decide on that :)

-- =

viresh

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
