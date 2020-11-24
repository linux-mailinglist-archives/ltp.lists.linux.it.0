Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC1C2C1D32
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:04:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9EDE3C5E9C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 06:04:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 87AF33C2D3E
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:03:58 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1892D1400B63
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 06:03:57 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id 62so16378127pgg.12
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 21:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lg6HO5zzU09FdRtqVftV1/LgP5WiHtAMU7ozCaFLHxU=;
 b=smVoje/1tUerKJafdojEhvkge5q3VSBX/rVE4TmIknbrs9EWXWKSNASupK/r/+U6Ob
 YPFtpqIYLuclnGqSGzYclIdAw0eXmzsB40f1ieoghcjdk4880rKGZ3UXxuziQRQ4GAwv
 0/7PHpKAKuk/W3fFc11y6FbpoTvHjTWUsTxMDeWokRRVaSuK+F5Kp8DosskHrUYI4yAo
 EBrVqlmjsITFAbSDG4mHCWwgFWmN2nkfiNou6dPcoY69BQw04siNOVgXpVOZd/3bmFK8
 UlOVvuoIM7aLbHNDipaEP09wxY1YaSCIxi7Jc3e+Bbs53FnfRrXPWPbLYIySsSGCNPuB
 cYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lg6HO5zzU09FdRtqVftV1/LgP5WiHtAMU7ozCaFLHxU=;
 b=gjItL2X0uuUhEF1p6E1ynfoYLxI7wqNhLXX1BBKHNTXn20M3aEwROvdn0R4jnPrKR9
 64dDlzhUkUWtH+yjXWZ2dJr8ALFGK5mnnHcTqHDT8819+q2g4Bp3G2SvEU2VC/6mluez
 oH0/f8ute2yn2wEzlo8Z0ykqG60UYzhFLpsNPQyaf9lGW3MIeThxrgBq/aZJPFZUAai6
 ewWqsWbcS5GJiYQRiwfnE9/kIP1LZ7kkAGrdQLueMyz6QDdR0t/7klXdjI4l+vkwEE9N
 q8NUX7/89aeKZEqXzhgopTLZR6YktpA/9jyffFTFEJI5WpvJtC4chEDVjv4EUXhj7+Jb
 41aA==
X-Gm-Message-State: AOAM5327ZoDx39F3NWAxU6Yu+g/5xa6x0Bu96102vCmSXddawMoW1s3y
 tP0VytB5KWoI2OoAe/pEsQmrqA==
X-Google-Smtp-Source: ABdhPJxU7TFJVNaOddIyJu+hkFs9uHkvOjUVgvcPL/zcx/bFKfGCChNjP+BX7OSPhPWv3TJHZY5UiQ==
X-Received: by 2002:a17:90b:e05:: with SMTP id
 ge5mr2865921pjb.212.1606194236193; 
 Mon, 23 Nov 2020 21:03:56 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id w131sm13024789pfd.14.2020.11.23.21.03.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 21:03:55 -0800 (PST)
Date: Tue, 24 Nov 2020 10:33:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201124050353.xyvyjar5vcfwmwhk@vireshk-i7>
References: <b758999c1bd02a52a68cbb6449bb3d82dd2a4e69.1606120441.git.viresh.kumar@linaro.org>
 <20201123140630.GA17077@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123140630.GA17077@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] syscalls: Add tests for name_to_handle_at()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23-11-20, 15:06, Cyril Hrubis wrote:
> Hi!
> > diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
> > new file mode 100644
> > index 000000000000..19c08545802a
> > --- /dev/null
> > +++ b/include/lapi/name_to_handle_at.h
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 Linaro Limited. All rights reserved.
> > + * Author: Viresh Kumar <viresh.kumar@linaro.org>
> > + */
> > +
> > +#ifndef NAME_TO_HANDLE_AT_H__
> > +#define NAME_TO_HANDLE_AT_H__
> > +
> > +#include <sys/syscall.h>
> > +#include "config.h"
> > +#include "tst_buffers.h"
> > +#include "tst_test.h"
> > +
> > +#ifndef HAVE_NAME_TO_HANDLE_AT
> > +struct file_handle {
> > +	unsigned int handle_bytes;
> > +	int handle_type;
> > +	/* File identifier.  */
> > +	unsigned char f_handle[0];
> > +};
> > +
> > +int name_to_handle_at(int dfd, const char *pathname, struct file_handle *handle,
> > +		      int *mount_id, int flags);
> > +int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
> 
> This still is not complete solution. As far as I can tell this will fail
> to link on machine where libc does not implement these, so we have to
> make them static inline functions that actually call the tst_syscall().

This is embarrassing. Not that I was doing this for the first time, I
just completely forgot to update this path, damn. Sorry about that.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
