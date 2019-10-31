Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D62EB3DD
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 16:26:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04D843C234F
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 16:26:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 700603C2297
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 16:26:52 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8334E14016D6
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 16:26:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4023ACFE;
 Thu, 31 Oct 2019 15:26:47 +0000 (UTC)
Date: Thu, 31 Oct 2019 16:26:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191031152646.GA7078@dell5510>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571821231-3846-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=5BPATCH_v2_2/6=5D_m4/ltp-xfs=5Fquota=2Em4=3A_Re?=
 =?utf-8?q?move_useless_ltp=E2=80=94xfs=5Fquota=2Em4?=
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
Cc: jack@suse.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> We can detect <xfs/xqm.h> in configure.ac instead of using
> ltp-xfs_quota.m4. Also we should need to check CONFIG_XFS_QUOTA
> whether enable in kernel config.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Merge these 2 commits with minor changes.

Could you please send new version, where you rebase the rest of this patchset,
fix issue including <linux/quota.h> with <sys/quota.h> causing failure on
centos6 [1] remove Q_SYNC from quotactl04.c [2] and add quotactl06 [3].

Thanks a lot!

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1181923/#2292956
[2] https://patchwork.ozlabs.org/patch/1181925/#2287412
[3] https://patchwork.ozlabs.org/patch/1185189/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
