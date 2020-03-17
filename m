Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 103ED188C64
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 18:44:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF9A13C5607
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 18:44:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BB4F43C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 18:44:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 97044600981
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 18:44:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9CABAAB8;
 Tue, 17 Mar 2020 17:44:28 +0000 (UTC)
Date: Tue, 17 Mar 2020 18:44:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200317174427.GA11295@dell5510>
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
 <20190710072305.25806-2-po-hsu.lin@canonical.com>
 <20200221055936.GA13261@dell5510>
 <CAMy_GT9VC5KvgCL68fVXVfKwErwKqiNab0s8SwPw9BZxMuLReg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT9VC5KvgCL68fVXVfKwErwKqiNab0s8SwPw9BZxMuLReg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Po-Hsu,

> thanks for the reply, and sorry for the late response too, need some
> time to throw myself back in time.

> To my understanding, the zram_algs="lzo lzo lzo lzo" in zram01.sh is a
> dummy mapping (placeholder?) for 4 compression algorithms with 4
> different setup, one for (zram_sizes=26214400, zram_mem_limits=25M,
> zram_filesystems=ext3), and one for (zram_sizes=26214400,
> zram_mem_limits=25M, zram_filesystems=ext4) and so on.

> With this patch the test will be more comprehensive, as it's not
> trying to set the algorithm to "lzo" 4 times (as defined in zram_algs
> from zram01.sh), but try to switch to all supported algorithm reported
> back from  /sys/block/zram0/comp_algorithm

> So yes, this zram_algs in zram01.sh will not be used at all after
> applying my patch here, maybe it can be removed but I am not sure if
> we should keep it there as a placeholder.

Also sorry for the delay. I rebased and merged these 2 commits, removed
$zram_algs (as it's was not used any more).
Although this and second commit should be probably as a single commit (to be an
atomic change), I kept them separate.

Thanks for your contributions.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
