Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24825A996
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:40:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C30B63C2DDD
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 12:40:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 972853C2D58
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:40:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 341062000D3
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:40:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A068B169;
 Wed,  2 Sep 2020 10:40:02 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:39:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200902103959.GA18662@dell5510>
References: <20200831155953.10899-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831155953.10899-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ima_keys.sh: Fix umount on tmpfs
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> write policy.txt always to $TST_TMPDIR otherwise tst_umount will fail on
> /tmp being tmpfs, for which we mount loop device and cd into it:

> umount: /tmp/LTP_ima_keys.hPVaEbz34L/mntpoint: target is busy.
> ima_keys 1 TINFO: umount(/dev/loop0) failed, try 1 ...
> ima_keys 1 TINFO: Likely gvfsd-trash is probing newly mounted  fs, kill it to speed up tests.
> umount: /tmp/LTP_ima_keys.hPVaEbz34L/mntpoint: target is busy.
> ...
> rm: cannot remove '/tmp/LTP_ima_keys.cNyaxGHAQI/mntpoint': Device or resource busy

> Fixes: a277498c0 ("IMA/ima_keys.sh: Enhance policy checks")

Fix merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
