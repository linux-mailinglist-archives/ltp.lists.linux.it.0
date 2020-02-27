Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390F170FD5
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 05:54:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E6793C25C3
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 05:54:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A5E7C3C201F
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 05:54:22 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 97A64600669
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 05:54:21 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id i19so972767pfa.2
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 20:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sT/SW+6+/8y56OmW6moKf6BTPM754SDs+Jc6iASSJJI=;
 b=YKdVZsRe/6afdy6WWP6WKMP3fhKgQv+3v9touvTPgSJ1D3Yh+mwF8ll1LAdaxBfMam
 uQ/NKyU/frez7/5fuvripAAfUNXkyLcM2J3Ds3rQuf5WkA8qifZynr9GZ7nVNJcqT3qc
 vxp+RAp49ek5aoGg875AJBv2qBzN3j14sxnEqUMdNy4eweMSh/9mKwW04e/kvKC4Wmep
 9N6v9CBYZwe9YH38soyhuO1ifaJ1tyJVZ1hXKTuMxEXASvP6cS+8kvYgMcVoHNm5PvpP
 kb0N+eU8M9Ok7q3bfYTOTiEOryCGn7LCh8adoAJWWzO7kIrk9hzH8aWUnVTtRRkVg7zr
 pFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sT/SW+6+/8y56OmW6moKf6BTPM754SDs+Jc6iASSJJI=;
 b=uFxjHXvfqExIoNWUCUQpT/c/fq0jCYSTSjNJDNX0Bxi49kM0FIBGxjQyyxQOf5bsGT
 TUApCzeq6R8DSEYg2gclH/30HZbmvWSLr2NgIR2aYZRw9o0TXmTR5Cou9KzImOIqaYaE
 VZUAdgDfeNnQtVdtf9j3awRThTZ2CF7lKTkzDLTjAn+A4cf+ulqZPggoU1w5O4AdP1ik
 qFXhnq0T6kTSX6/TztMPqrQlgCwBSa3GOM21zMYTr2Vk47Sm6fcbNjFiPcQKNItpZlzp
 fqCkNOcdmUwlDQG+il/eDE8hQ+W4nb6Smv8eo/RvKVmegKQIE3VW4qpMXPx8k94w41NC
 9N2g==
X-Gm-Message-State: APjAAAX2GvVjcgt5Y8bU16SZ4CAm+zf+NSmSS1wt7iHLzH0sFKTfbDgI
 JWuh8tspThSf+zuyH+xsrlGmHHVeQQI=
X-Google-Smtp-Source: APXvYqxfbP5zV6cVhld7ETygsTH+F1fRNjRH8mHA6l0pt+ba6knGHgOP2MXIjtljz/VmcUAfpQgygg==
X-Received: by 2002:a63:7453:: with SMTP id e19mr2239936pgn.50.1582779259826; 
 Wed, 26 Feb 2020 20:54:19 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id d14sm4541095pjz.12.2020.02.26.20.54.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 20:54:19 -0800 (PST)
Date: Thu, 27 Feb 2020 10:24:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200227045417.tl2vf6boupp7s7iw@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <ccb816c7032270dd2ef51ab14290aacb2c89db38.1582612624.git.viresh.kumar@linaro.org>
 <20200225134648.GB62318@gacrux.arch.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225134648.GB62318@gacrux.arch.suse.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 05/10] syscalls/fsconfig: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 25-02-20, 14:46, Petr Vorel wrote:
> > diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> > new file mode 100644
> > index 000000000000..d51a869ac3ff
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> > + *
> > + * Basic fsconfig() failure tests.
> > + */
> > +#include "tst_test.h"
> > +#include "lapi/fsmount.h"
> > +
> > +int fd = -1, temp_fd = -1, invalid_fd = -1;
> > +int aux_0 = 0, aux_1 = 1, aux_fdcwd = AT_FDCWD, aux_minus1 = -1;
> These 2 should be static (also fd could be default 0, but who cares :)).

No, fd was intentionally set to -1 here. If we return early due to
tst_brk() from fsopen_supported_by_kernel(), then we need to handle
that case in cleanup().

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
