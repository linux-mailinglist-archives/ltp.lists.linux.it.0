Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 259901FA8E5
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 08:41:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D20223C2D0F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 08:41:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 76BA63C2B94
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 08:41:47 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E372E6A5685
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 08:41:46 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id y17so7940805plb.8
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MvMVnl499Uf2u4DnGY/uMBPUdQmqNYpas+cf3MxYkN0=;
 b=yPy/eMysduJAbxnWiqxFY72gUi79KAvyImR/2GhNQPusVCcLUEATfhLGlL321fA08M
 PlKWOX3TapT/0gRKsmKj2j5oC3g93DkkwgeaaRlQE4qvwRqnRpJsCjbk26TeNN/XqqX0
 Kw6S5BdKOl+411BdDKEGFXvpuPoDXYkLGY4SvYByl1ioUVutmu198bxK8m7vVLzoGV+A
 JCXVjGpIkMAN5VQ8oaiyNoJS/qammxGrso2lhMfsghqSFJMrF4cOfUWkpBlC1EdY7NqF
 ZD5NXfrolLgp01sKRv8rGG9DpnV/ZAcgPI0x2Zphj895F+pD58of5XhNVcC9xyjswmR0
 HSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MvMVnl499Uf2u4DnGY/uMBPUdQmqNYpas+cf3MxYkN0=;
 b=ptUiPdXr7hNTGzKXo896RgCsnvKv9II4XBAtUkIJ/ChiI8Jme8cl96n6sOyTWu1XIj
 59oMXQbv+y/9txDyqwF5Rxa1HLkP2K65pXNpZ75gB9I9e511X1KVj/2K12N/AJm7o4do
 0q/MzLvkjNoA7uMG3GVY2hg1M9cJwK9put72DokQubeEoH1xtUEULQx6p4xfcNwi0Amm
 obhAMOEVM27Oo/OIua+/0QEjy6LOD+g8vzH5EBJX6JveEr+U0Vgea6N/71iML0jKG83W
 jTVvn7+arXfpZabktvCyiFAXHf6u1e5PLcvG29Wi6JfuY97p3h9BXXIGSmVVCKv98rJK
 bG1g==
X-Gm-Message-State: AOAM531IAdfjFCh3jqPgj6/oexaI0XMm0gDxVjbUHFX2ULQpWYhIUNTY
 ZhTcDhx1/m+QqiSiJbPWhwjIMlnUfgg=
X-Google-Smtp-Source: ABdhPJwplKh5DR416Z3o1eeIi5ZAKWl6QqHDHrSfHwjPz5kCR7VothK9vVHfTQRgwq7Lvr9SDdKQxA==
X-Received: by 2002:a17:902:7109:: with SMTP id a9mr892639pll.58.1592289705412; 
 Mon, 15 Jun 2020 23:41:45 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id x3sm15825490pfi.57.2020.06.15.23.41.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 23:41:44 -0700 (PDT)
Date: Tue, 16 Jun 2020 12:11:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200616064142.pagswwcjvvf32oyl@vireshk-i7>
References: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
 <dc4d34a42d4ca85d4d73b9e87974382368d02296.1590131635.git.viresh.kumar@linaro.org>
 <20200615124324.GB25279@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615124324.GB25279@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/5] include: Add declaration of struct
 ipc64_perm
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 15-06-20, 14:43, Cyril Hrubis wrote:
> Hi!
> Applied with two changes, thanks.
> 
> * The header is moved to lapi/ where it should have been
> 
> * I've removed a piece of GPL header that probably ended up in the
>   source due to copy&paste
> 
> > +#if defined(__powerpc__) || defined(__powerpc64__)
> > +#define HAVE_IPC64_PERM
> > +/*
> > + * The ipc64_perm structure for the powerpc is identical to
> > + * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the
> > + * kernel.  Note extra padding because this structure is passed back
> > + * and forth between kernel and user space.  Pad space is left for:
> > + *	- 1 32-bit value to fill up for 8-byte alignment
> > + *	- 2 miscellaneous 64-bit values
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
>             ^
> 	    This part.

I don't see this patch in master yet.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
