Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD637A834
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:54:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7980D3C8BFA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:54:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ACFE3C6499
 for <ltp@lists.linux.it>; Tue, 11 May 2021 15:54:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 825A16009EE
 for <ltp@lists.linux.it>; Tue, 11 May 2021 15:54:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C352AAF23;
 Tue, 11 May 2021 13:54:23 +0000 (UTC)
Date: Tue, 11 May 2021 15:54:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJqMjdXEbbuD0t5e@pevik>
References: <20210219144704.20433-1-pvorel@suse.cz>
 <20210219144704.20433-2-pvorel@suse.cz> <YJo+ZFMqcOZ0KXvD@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJo+ZFMqcOZ0KXvD@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] libclone: Move test.h include to C file
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
Cc: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> This looks obviously OK.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

FYI libclone.h is no longer needed for netns_netlink.c, thus no need to merge it
now. I suppose libclone will not be migrated to new API (mqns_helper.h will use
SAFE_CLONE() or something else else if needed to be kept), thus not merging.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
