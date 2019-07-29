Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B478D84
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:10:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3CB53C1D6C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:10:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C8DA33C0271
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:10:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DC0DE60083E
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:10:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2DA3BAFE1;
 Mon, 29 Jul 2019 14:10:11 +0000 (UTC)
Date: Mon, 29 Jul 2019 16:10:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190729141011.GA1965@dell5510>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729140043.GB31077@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729140043.GB31077@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] syscalls/copy_file_range01: add
 cross-device test
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

Hi,

> > Amir has relaxed cross-device constraint since commit[1], I think we can test it in
> > copy_file_range01.

> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5

> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Now sent to the correct patchset version:

> Whole patchset LGTM, but here we got quite a lot of failures after increasing
> test coverage with .all_filesystems = 1 (which use should be noted in commit
> message):

> copy_file_range02.c:120: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
> ...
> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16

Also .mount_device = 1 and .all_filesystems = 1 require
.needs_root = 1 definition or you get

tst_device.c:97: INFO: Not allowed to open /dev/loop-control. Are you root?: EACCES
tst_device.c:132: INFO: No free devices found
tst_device.c:308: BROK: Failed to acquire device

BTW I wonder whether these could be detected automatically.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
