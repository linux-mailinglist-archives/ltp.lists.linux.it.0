Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1276A5E855
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 18:01:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB0DD3C1DA9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 18:01:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E5BF93C1A4E
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 18:01:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8BCC5201263
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 18:01:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6C8BAFB8
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 16:01:50 +0000 (UTC)
Date: Wed, 3 Jul 2019 18:01:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190703160153.GA24202@dell5510>
References: <20190322133228.18901-1-camann@suse.com>
 <20190325101404.GA20297@dell5510>
 <CAOQ4uxhT_BwUA=3sFdhdKfYhMeBqMPwe1sHvXR5jLaDu8u+2zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhT_BwUA=3sFdhdKfYhMeBqMPwe1sHvXR5jLaDu8u+2zQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl08: add file deduplication
 testcases
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> FYI, This test fails on kernel without btrfs support.

> WARNING: failed to open /dev/btrfs-control, skipping device
> registration: No such file or directory
> safe_macros.c:757: BROK: tst_test.c:752: mount(/dev/loop0, mnt_point,
> btrfs, 0, (nil)) failed: ENODEV

FYI: patch sent
https://patchwork.ozlabs.org/patch/1126923/

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
