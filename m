Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBF189CB0
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 14:16:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 107C33C5539
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 14:16:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 38D983C0137
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 14:16:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8961360109A
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 14:16:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2EB8B138;
 Wed, 18 Mar 2020 13:16:16 +0000 (UTC)
Date: Wed, 18 Mar 2020 14:16:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200318131614.GA12354@dell5510>
References: <20200224153112.GB2210@rei>
 <1582879661-1951-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200317123203.GA21921@dell5510>
 <aae4670a-74eb-36e7-6115-b41eff951405@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aae4670a-74eb-36e7-6115-b41eff951405@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/add_key05: add maxbytes/maxkeys test
 under unprivileged user
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

Hi Xu,

> > Hm, I get this failure, I guess both are because missing your fix
> > 2e356101e72ab1361821b3af024d64877d9a798d, right?
> Yes, if your kernel is only with commit ("KEYS: allow reaching the keys
> quotas exact"), add_key(test_max) will fail because we don't remove this
> limit when initializing the key.

Great, thanks for a confirmation, that was my main concern.

> > add_key05.c:106: PASS: add_key(test_inv) failed as expected: EDQUOT (122)
> > add_key05.c:125: FAIL: add_key(test_max) failed unexpectedly: EDQUOT (122)
> > no crontab for ltp_add_key05
> > userdel: ltp_add_key05 home directory (/home/ltp_add_key05) not found

> > The rest looks ok to me.
> Thanks for your reivew. I will send v3 (also add save_store for keys/btyes )
OK, I'll wait for v3 (but I could also merge just this one and fix that tiny
formatting issues, up to you).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
