Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7C5CD63
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 12:14:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F04D23C1DA1
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 12:14:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 315303C1D5E
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 12:14:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 200D2200743
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 12:14:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22F96AC32;
 Tue,  2 Jul 2019 10:14:14 +0000 (UTC)
Date: Tue, 2 Jul 2019 12:14:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190702101412.GB32529@rei>
References: <20190701113705.2758-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701113705.2758-1-po-hsu.lin@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

Hi!
> The compression algorithm was stored into a local variable "algs",
> however the variable name "zram_algs" was used in the for loop later.
>
> Unify them with "zram_algs", and use sed to get rid of the square
> brackets that indicates the compression algorithm currently in use.
>     $ cat /sys/block/zram0/comp_algorithm
>     [lzo] lz4 lz4hc 842 zstd

The test that calls the zram_compress_alg() function defines the
zram_algs variable and the length must match the number of created
devices in zram_load otherwise the test would fail to write to
non-existing sys_path in case that there is more than 4 algorithms.

I guess that deeper changes to the test would be needed in order to be
able to support testing all available compression algorithms.

> Also, the /bin/sh was symbolically link to dash in Ubuntu.
> This is making the one-liner local variable assignment not working [1]:
>     /opt/ltp/testcases/bin/zram01.sh: 102: local: 842: bad variable name
> 
> Break it into two lines to solve this issue.
> 
> [1] https://wiki.ubuntu.com/DashAsBinSh#local

This change is obviously correct, can you please send a patch only with
this change so that it can be commited? Then we can figure something
out about the compression algorithms.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
