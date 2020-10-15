Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 692FF28F92A
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 21:06:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163533C57E0
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 21:06:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 621013C2411
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 21:06:23 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 57F852000D5
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 21:06:23 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id e23so43851wme.2
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=zMkzq8dBBdIeUk4GkF8fk6jM/gOffsF4VPT6AeFBTbc=;
 b=myWThgz9ZNNmfvOz1fLGqlNknas0xuZx3vgs/MdEysvApuh67hvu9TszS8zKwIyn1g
 yy82Q4hiUpW5wOKxLoMVjwD5cW2LyFUJtCc3jLelT4W+qnVjcPdPFuWYpscjshlR/2kc
 JHANnakOZnHTQuOAFxXKzF27CP6H1oys4LmwuEkq19Oa05FVofkzMrVMqa0Prw8XKtwv
 1x/RGdmUZsVZ62liNSpU9h2ZrlKq0kOqk/qHcwu9YYcJj0Jz6yqPSC01RpFj09zlJZj8
 3uPd9y8w5WAm7xjXoGpFZtStuil436b7Ez05QG9PkgWtfrPfN0wvDG50IFUJqkLZMoSA
 u4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=zMkzq8dBBdIeUk4GkF8fk6jM/gOffsF4VPT6AeFBTbc=;
 b=OywO/ZRNVFhAnjiOE2Fm1k70wO560itf4eU7Ah8lej6oDlDSa6aMC6XUZoy5NG5TYT
 7MfcnkmpO5CHXRiiHnQrUJsPq4dWFmBUb1TQvbbea3OzQYzpnGR3enXjugk+ZEtullg3
 gxlmGDEYRfcgNr+v/+0S7wL/Tb2P4WRqsYQe7fm/yai55j+F8J4yDtiiQI0e7XOCUTnS
 2REhi91zaN1Lq50Nl/acszYPgi8ra+a1SCXLkZFHNPhSiBOZRqg4zZNwQ6/E4KR6Mm1d
 GZa9r9gzqLtrUZvK/Ka0Cb242ftphOVPYRJszT7hmkGEfynrLAgnPWyB3Vbl44hn1z/R
 dLJA==
X-Gm-Message-State: AOAM530CtdzKg6HMPVBE2nUF4t9V3PVkpbuFuwtRnUjJbLm94W4ywp8R
 Z+AqvYEsyP0qgzmApN7vEE0=
X-Google-Smtp-Source: ABdhPJy9B+Cz01Xx+VEVauIL0uecZpKN7bhzWHjPBuliv/ORbyNISC7+e6YpXVvfDzh0x9qcwsSUgA==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr105992wml.23.1602788782839; 
 Thu, 15 Oct 2020 12:06:22 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id y5sm275257wrw.52.2020.10.15.12.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:06:22 -0700 (PDT)
Date: Thu, 15 Oct 2020 21:06:20 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201015190620.GA9408@dell5510>
References: <20201001231256.6930-1-petr.vorel@gmail.com>
 <20201014143317.GC13224@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014143317.GC13224@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] lapi: Add sysinfo.h to fix build with
 MUSL libc
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

thanks for your review!

...
> > +++ b/include/lapi/sysinfo.h
> > @@ -0,0 +1,22 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
> > + */
> > +
> > +#ifndef SYSINFO_H__
> > +
> > +/*
> > + * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
> > + * Use <linux/sysinfo.h> instead.
> > + *
> > + * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
> > + * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h>
> > + *
> > + * This indirect include causes on MUSL redefinition of struct sysinfo when
> > + * included both <sys/sysinfo.h> and some of UAPI headers:
> > + */
> > +#include <linux/sysinfo.h>
> > +
> > +#define SYSINFO_H__
> > +
> > +#endif /* SYSINFO_H__ */

> Well the #define SYSINFO_H__ usually goes right after the #ifndef on the
> top.
+1. It'd be in v2 if needed.
I've added this patch already to buildroot, but if kernel patch get accepted,
it'd be kept only temporarily (I think they don't have patches for musl based
toolchains, otherwise they'd take Alpine's patch by now. But they instead drop
support for these toolchains in packages which don't upstream the solution.

> Apart from that it looks like the kernel patch has been ignored. I guess
> that you should try to push it a bit more before we give up and apply
> workarounds...
Tried next version, let's see.
https://lore.kernel.org/linux-api/20201015190013.8901-1-petr.vorel@gmail.com/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
