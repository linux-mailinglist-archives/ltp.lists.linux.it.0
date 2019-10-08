Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909BCFC38
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 16:20:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BDCC3C22D5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 16:20:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1EF313C04F9
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 16:20:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7FFE51001262
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 16:18:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35B00AECB;
 Tue,  8 Oct 2019 14:19:59 +0000 (UTC)
Date: Tue, 8 Oct 2019 16:19:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yu Xu <xuyu@linux.alibaba.com>
Message-ID: <20191008141956.GA17636@rei.lan>
References: <9b3247beedd55b5a2c2ef638b26416d175775c77.1550815364.git.xuyu@linux.alibaba.com>
 <20190404091051.GA20565@rei.lan>
 <d9f667f7-f836-8918-2a3a-180e37c9e2a0@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9f667f7-f836-8918-2a3a-180e37c9e2a0@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cgroup_regression_test.sh: mitigate
 potential mount error
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
> > There is always better solution than sprinking the code with sleeps,
> > here we can retry the mount instead, which would be faster and more
> 
> thanks for your kind reply!
> 
> retry mount cannot help here(at least for the current kernel), because 
> `umount cgroup/` **immediately** after `rmdir cgroup/0` corrupts the 
> cgroup_root refcnt, and it will always cause the subsequent remount 
> failure(s) whenever remounting overlapping controllers later.
> 
> so I simply put a sleep between between `umount cgroup/` and `rmdir 
> cgroup/0` to synchronize them.  <- any good idea to this point?
> 
> and attach the related kernel issue again:
> https://marc.info/?t=155021167400005&r=1&w=2

We are not working around kernel bugs in tests.

Too bad that it seems that nobody is interested in fixing the v1 cgroup
API. I guess this is a signal that we should stop using it as fast as
possible and migrate to v2.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
