Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BE85DF5
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 11:13:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 300223C1D23
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 11:13:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 02FFE3C1CDE
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 11:13:57 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 30073200142
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 11:13:56 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id j8so36116422uan.6
 for <ltp@lists.linux.it>; Thu, 08 Aug 2019 02:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSKh5CDNJ2fTUnhucpUUaq44cl4FtTgTCp1gwtXB6EY=;
 b=M4IvaZ8keyYISqmDiYuSRH3nlLC6SN1VJ/8NZcR6OsayUN4VOLqpYx+U4uQGK7t++m
 boXWwy/dWpm1uSWv59ecM1h5ts36tA5DnqMDRIgnEgBQlZ3lIe3jJC5kBimpysxQJGkr
 wWIvpDftWjXED0FP63w7WxAGu6MIynVePhtxZmQx+3HoV1SJOzsYaBi1zRLjLNxadsub
 upscxJU5BRf1FK+9gHqprIfFlW4AfVtSBCMrYsoZ0iiCnTL/F3k4F63U8lVo5/SKQFv/
 Gm4mzAP651m2NzQqvVfMWohyQ587HP0/csDu09yVP/deVdjlGb/8vxlOw9YcUPZeKW2b
 SAsQ==
X-Gm-Message-State: APjAAAU5T1+jwidAn6xPT/6wcwcYmFTanQhWrWuEUsNnh0soi7TRGcaL
 ns2vjCOR8TwE+EyuG6DV7yW5zHetaj8L9kvEQATWHw==
X-Google-Smtp-Source: APXvYqwXdvWffm0RVd2rwxtdWqkSnAnHzvMxp0W/2XYZVz/l9dysvuf00vgNgJ+vh3+aez3Db9SUdGZWmv8YHvUrmVA=
X-Received: by 2002:a9f:2e0e:: with SMTP id t14mr8360589uaj.119.1565255634968; 
 Thu, 08 Aug 2019 02:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
 <871rxyd5tc.fsf@rpws.prws.suse.cz> <20190808090635.GA11500@rei.lan>
In-Reply-To: <20190808090635.GA11500@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Aug 2019 17:13:44 +0800
Message-ID: <CAEemH2fWSxuXegxGiKRWzpHLHQdgxTe_nHW+-0ezusJKNp4T7A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > This seems like debug info to me. Not really useful most of the time.
>
> Yes, this is a leftover.
>
> I do wonder if we should print a message first time the tst_alloc() is
> called so that it's clear that the test is using guarded buffers.

Sounds necessary. Or should we need a way for silent using?

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
