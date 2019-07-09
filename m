Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD163CDE
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 22:52:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ADBC3C1CFE
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 22:52:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9185F3C1770
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 22:52:02 +0200 (CEST)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 303971A00F3D
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 22:52:02 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id f9so186401wre.12
 for <ltp@lists.linux.it>; Tue, 09 Jul 2019 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ua5XhaMreV5Yp03Xq9pzDNcub1agdXLtMzpstWl3qoo=;
 b=BcdQT23Rr364lDsFTcktz4WaZbU0kQYeOFtcahZEN54UOniAGslTgsmIiH0f9pqqSu
 6e2s1DsFLKC5QPcZZH1CfNOsK9YqKNGlwYC7BgGfuv4t0t2S1cpQB1PLv+D301q5jUmM
 wGGGTC2AkdESII5DCHOgJnlrkJTh8Ph8ja163vsqPQ0SMTUixEYMtmdASU7t1vqXBXY3
 t5e2z1UZg7Fp4odZthf/0+5KERO/8tH6kCptxFVK6QGNSY8fam3ii1W790F4r0E7HTjQ
 EfY5yAYEhvUueKkTzN8PawvIkv4PuccFn7DddvMkTL84sOQGMa/KTBvgQ20GM//bmFf1
 zrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ua5XhaMreV5Yp03Xq9pzDNcub1agdXLtMzpstWl3qoo=;
 b=cuSJCN4cGYyPbTOXOO9rkC8toqRETub5RFiH6lPI8gMeiTrKEdY00Tu2daR3ILjLUN
 LpYG3r603WSWzwjngZRmGMa9YqhXMxLKk0pjo8mF7u0yJn11AsPorC6tyJjkfTzOluqC
 CPZz06IzOg7W7xfpXWObZeCgQv/svwAzw6pgYT/uRcsgtAhasxRXENIIWFt249PGORmi
 oI8qmeQGZNgmUy4SN809z/MBq4ckgHzDFAUIok6nhaqInLHOtsc+DL2mgegf+Gwyn1h0
 U65MA7qIzEAPms5S/Sip5Bcuhh0nj/6YBOLDIip1WM5LfyCTZGpIt5oTFPAdeGEyehOQ
 rv9w==
X-Gm-Message-State: APjAAAUw9mPi8fyrBoWu2+AQOWWaZuKCRnciAyEJpFM2UYcMSH9sPzJy
 aXWR/0Ewzo2qNIcwtNUaPwwKgU1R
X-Google-Smtp-Source: APXvYqwNLn3WqoBvXn+Hx/Fp26/kPLgII0pl3I1OreYlvqQFrFfT/3K/1GXZI0aLxhICeCb8s2crxQ==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr2673784wro.306.1562705521760; 
 Tue, 09 Jul 2019 13:52:01 -0700 (PDT)
Received: from x230 (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id n1sm17473252wrx.39.2019.07.09.13.52.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:52:00 -0700 (PDT)
Date: Tue, 9 Jul 2019 22:51:58 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190709205157.GA1854@x230>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
 <20190707190016.27296-2-petr.vorel@gmail.com>
 <20190709105541.GB4914@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709105541.GB4914@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] lib: include <errno.h> in tst_test.h
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > tst_test.h is using errno variable, thus it should include <errno.h>.

> Acked, this should have been done quite some time ago...
Thanks, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
