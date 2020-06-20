Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB702022D3
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 11:24:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18F8E3C5EE7
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 11:24:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C23003C2C89
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 11:24:30 +0200 (CEST)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 553DA1000B22
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 11:24:30 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id x25so9662855edr.8
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=hh2GKHcU7+qJLb7Rp2gdmkRNPrB6myL3NHuodTdSpkw=;
 b=Dgnt0bPfjh9RKazsdumnEc9ULQwiyRs/ozoEcHnYMV/LzctscGaGBxQV+op3fYy6pd
 WZDal+mBqom7BA4lIq1bmz0eFEm6dEDhe1L3HYZ6jstZp6v6cka+P1OTH16S6GLENCgw
 N8HYZUG/Dus7EYl+65IL0gk2wUYSYZPn2+xLHEFST9cRNi+AXXPCLgotg4s+AXXOFBIi
 WG1p70g5Bs6uS3hRkUU2B087+r+ay25l8jTz8+iUkQQ/19p2lsn85Fq7Fv6KDYAjUT7m
 iEFD76Fd5mpWkKOYBo2iWr5Qumr1Qqw4auX8w7r1ci3lWure28N3IXJ70Qyt9ZpLG1Mo
 lRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=hh2GKHcU7+qJLb7Rp2gdmkRNPrB6myL3NHuodTdSpkw=;
 b=sA5LxBHhN0dETRzRMG/MCs7y22BnTnhBOFo/SZ7RCooapvJpv/PmGpoDMmYTP6/BXJ
 HivqNvF6/OK6eLbKu+yKamCkB/GFBdZDLv38rc7oM/mOv/+WoxMC5D1+AOhDeL3khjZE
 i20Bz+DRTCALeqLQrPrce4Fn/B8k7SYO9iDDJxR/B43gyYxPuzR54BQUlcXVKzEf9XSC
 HmPnC8fRIdnwsg41hZqS7llH1n1b7AKE/VyEKL24c1GkVz7OhGE4MRB//bg23O+9CDSc
 HfUp9Ak2F0XmfsbBPqNYHssHa55+FGK/aIMNV8nlyoa2SV8lh4IGpbXpKD1H98cpLIUZ
 dcJw==
X-Gm-Message-State: AOAM530vw71YYpj4WlOYxQSyhsQGs8TCIWk56XCIdgvL0yJbtP43Y36R
 SUY8vyOeBhHkH2PavyOWu+Hz+9VS3v8=
X-Google-Smtp-Source: ABdhPJxhYY+gYKbjhbUrrL7SK6eIxKR48FOs9y9bByC/HQLSR4ZdnweLZd0r2upoqmTOKo8avWOmHQ==
X-Received: by 2002:aa7:c790:: with SMTP id n16mr7627436eds.54.1592645069943; 
 Sat, 20 Jun 2020 02:24:29 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id a7sm6954620edx.3.2020.06.20.02.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 02:24:29 -0700 (PDT)
Date: Sat, 20 Jun 2020 11:24:27 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Nirav Parmar <niravparmar@zilogic.com>
Message-ID: <20200620092427.GB281578@x230>
References: <20200620063713.5330-1-niravparmar@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200620063713.5330-1-niravparmar@zilogic.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add test case for CVE-2018-11508
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Nirav,

thanks for your patch!

...
> + * This proves that there are 4 bytes of info leaked. The bug was fixed in
> + * Kernel Version 4.16.9. Therefore, the below test case will only be
> + * applicable for the kernel version 4.16.9 and above.
This is IMHO wrong. The fix 3a4d44b61625 fixes 3a4d44b61625 ("ntp: Move adjtimex
related compat syscalls to native counterparts"), which was released in
v4.13-rc1.

...
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.min_kver = "4.16.9",
Thus there should be .min_kver = "4.13",

And most of the tests doesn't have .min_kver anyway, it might be removed
entirely.

> +	.test_all = verify_adjtimex,
> +	.bufs = (struct tst_buffers []) {
> +		{&buf, .size = sizeof(*buf)},
> +		{&tim_save, .size = sizeof(*tim_save)},
> +		{},
> +	},
> +	.tags = (const struct tst_tag[]) {
> +		{"CVE", "2018-11508"},
> +		{"linux-git", "3a4d44b61625"},
> +		{},
> +	}
> +};

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
