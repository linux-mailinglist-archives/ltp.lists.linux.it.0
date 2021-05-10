Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2B379495
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 18:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 796F53C8C49
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 18:52:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF6343C4F41
 for <ltp@lists.linux.it>; Mon, 10 May 2021 18:52:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0397A1A00A4D
 for <ltp@lists.linux.it>; Mon, 10 May 2021 18:52:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66C77AEBD;
 Mon, 10 May 2021 16:52:43 +0000 (UTC)
Date: Mon, 10 May 2021 18:52:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: dongshijiang <dongshijiang@inspur.com>
Message-ID: <YJlk2UtqenFH+bYk@pevik>
References: <20210510095609.20128-1-dongshijiang@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510095609.20128-1-dongshijiang@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=PDS_TONAME_EQ_TOLOCAL_SHORT,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for block_dev_kernel/ltp_block_dev.c
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

> Add genhd.h and blkdev.h to ltp_block_dev.c.

> Failed at compile time on kernel 5.12 due to change of register_blkdev function definition from linux/fs.h to linux/genhd.h and failure of test case tc05,The reason is that the BLKDEV_MAJOR_MAX definition was changed from fs.h to blkdev.h

Good catch, merged with slightly changed commit message.
Thanks!

Maybe we should not ignore build error for kernel module to catch these API
changes earlier.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
