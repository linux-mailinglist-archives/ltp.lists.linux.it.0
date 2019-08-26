Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E2F9CC7A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 11:21:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B3383C1CF6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 11:21:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BDE873C1C71
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:21:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 519CA601015
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:21:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E875AD5D;
 Mon, 26 Aug 2019 09:21:16 +0000 (UTC)
Date: Mon, 26 Aug 2019 11:21:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190826092115.GC9788@dell5510>
References: <1566547679-2771-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566547679-2771-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/copy_file_range02: use .needs_tmpdir
 and MAX_LEN
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

Hi all,

> Since commit bc514b22, we have removed EXDEV test. all_filesystem
> ,mount_device and mntpoint make no sense. Remove it and use tmpdir.

> As man-page said, when we plan to write at a position past the maximum
> allowed offset, it will return EFBIG. We should USE tst_max_lfs_filesize 
> as dst instead of (tst_max_lfs_fileszie - MIN_OFF). Also, it doesn't affect 
> EOVERFLOW.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Murphy Zhou <jencce.kernel@gmail.com>
Thanks for the fix. I tempted to split these 2 changes into 2 commits,
but in the end kept it in single commit.

Merged (with adjusted commit message and
Reported-by for Murphy Zhou and Signed-off-by for Li as he did a review for
previous version).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
