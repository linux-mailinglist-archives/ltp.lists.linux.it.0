Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B436CB87
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 21:15:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D68653C660C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 21:15:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBAC93C096D
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 21:15:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 63A366007B0
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 21:15:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 160ECAE1F;
 Tue, 27 Apr 2021 19:15:01 +0000 (UTC)
Date: Tue, 27 Apr 2021 21:14:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YIhis6EzwnuBEKO5@pevik>
References: <20210425030440.12762-1-zhanglianjie@uniontech.com>
 <YIcTuE34yq8KISC5@pevik>
 <726f49eb-a185-6637-44e3-232d5e9b6fab@uniontech.com>
 <YIgRWZFymSmCKFyS@pevik>
 <53b80b9e-42f6-90f7-1199-3592b4e5fcaa@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53b80b9e-42f6-90f7-1199-3592b4e5fcaa@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Ignore ntfs file system
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

> > > > Shouldn't "ntfs" *replace* "fuse"?
> > > Can't replace fuse.
> > Not sure if we understand each other: I mean add "ntfs" and *remove* "fuse",
> > as "fuse" is now redundant when we whitelist ntfs (see
> > tst_get_supported_fs_types()), unless there is problem with other fuse
> > filesystems. I tested with CONFIG_FUSE_FS=m CONFIG_EXFAT_FS=m.

> > But maybe removing "fuse" should be a separate step.

> I can understand what you mean, but I can't remove the fuse. If the fuse is
> removed and the kernel is not configured with CONFIG_EXFAT_FS=m, it will
> cause the test exfat to fail.

You're right, I didn't notice I tested it without mount.exfat. Sorry for being
slow. Interesting that while NTFS kernel module does not work on the test, exfat
from Samsung does.

Anyway merged. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
