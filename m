Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 171205CD93
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 12:30:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3B4A3C1D6C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 12:30:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9033F3C1D0B
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 12:30:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id F0B1A60095F
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 12:30:14 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hiG37-0003Mf-QV
 for ltp@lists.linux.it; Tue, 02 Jul 2019 10:30:09 +0000
Received: by mail-wr1-f69.google.com with SMTP id v7so6755532wrt.6
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 03:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knQPJbN3R0W4wT6PPJ3pp+uHtimqsPO7JttD8ZR2b3M=;
 b=SCtpZkccpZLbZI6iVC+rueKoZCtnAem621FOFmd4ypUObIoLWk7TSNcLBDCcYBK3xn
 yAZVsQK6gop312rM6QinJyjYqLXS2vKps9iAWN4Z6/mi4Ul7ADREr64piwQaB/APtz2u
 J2BQQ/icEVE757ZobCP8QgSLYOACpezMDU7wINFMyCLRySnE1cmN9wHtb1CZLeCKVLjT
 GrDy1mQ0vIPgRIpU4LSDkpdwGdaZsVg8dHE3kZJgNpCgXYHAEkKLpH0Hm+4ddW+DY10M
 nAz1oCLlkH+VG9ltoSiNKVxOFzxFvGu86vEs38e+llp422uScTshg16EbfThiHx6C72t
 CWQw==
X-Gm-Message-State: APjAAAVIPn9YJS37wQJKxJihuyrtxh8rlLH171gkOwpn+tvMbhf+XFyJ
 kHmmN8q7WQIcG5edRFTC+IZCRFJ0KsUMuBnqoeaD057yLhJzS6doWFIvG8vbNNt8328Qb98EIOs
 5v2Ktogqh3/fmgqg3/gq6jqXb8pCkCcs7T57AOPX8bsA=
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr2752225wmd.87.1562063409516; 
 Tue, 02 Jul 2019 03:30:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFvT9y0ZBetGKdLY06KiI12AqpQceqvRPvOb68hn/xxRou4LF+YdoOQRNopjbMED0nQMOpioMQ+l4UYDnwpo4=
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr2752204wmd.87.1562063409299; 
 Tue, 02 Jul 2019 03:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190701113705.2758-1-po-hsu.lin@canonical.com>
 <20190702101412.GB32529@rei>
In-Reply-To: <20190702101412.GB32529@rei>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 2 Jul 2019 18:29:58 +0800
Message-ID: <CAMy_GT_9oD4P2kZVgdp0MNaJnE6eaJixeTzP0+Kn+=GFiec-Ew@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] zram/zram_lib.sh: fix local variable assignment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Thanks for your feedback, I will send V2 for this.

And indeed, I just found out that the "4" devices and their properties
was hard-coded in zram01.sh
That will need some fix.

On Tue, Jul 2, 2019 at 6:14 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > The compression algorithm was stored into a local variable "algs",
> > however the variable name "zram_algs" was used in the for loop later.
> >
> > Unify them with "zram_algs", and use sed to get rid of the square
> > brackets that indicates the compression algorithm currently in use.
> >     $ cat /sys/block/zram0/comp_algorithm
> >     [lzo] lz4 lz4hc 842 zstd
>
> The test that calls the zram_compress_alg() function defines the
> zram_algs variable and the length must match the number of created
> devices in zram_load otherwise the test would fail to write to
> non-existing sys_path in case that there is more than 4 algorithms.
>
> I guess that deeper changes to the test would be needed in order to be
> able to support testing all available compression algorithms.
>
> > Also, the /bin/sh was symbolically link to dash in Ubuntu.
> > This is making the one-liner local variable assignment not working [1]:
> >     /opt/ltp/testcases/bin/zram01.sh: 102: local: 842: bad variable name
> >
> > Break it into two lines to solve this issue.
> >
> > [1] https://wiki.ubuntu.com/DashAsBinSh#local
>
> This change is obviously correct, can you please send a patch only with
> this change so that it can be commited? Then we can figure something
> out about the compression algorithms.
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
