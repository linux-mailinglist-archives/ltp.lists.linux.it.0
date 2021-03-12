Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC3338A9F
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:55:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44C903C682B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 11:55:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BB0EA3C30B2
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:55:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8CABA100127A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 11:55:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5677B02C;
 Fri, 12 Mar 2021 10:55:02 +0000 (UTC)
Date: Fri, 12 Mar 2021 11:56:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YEtI8Xbl5BYv5Emo@yuki.lan>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB403891318@dggeml511-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB403891318@dggeml511-mbs.china.huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > In addition, when "loopdevno = ioctl(fd, LOOP_CTL_GET_FREE)" get free
> > loop device i, and the loop device file /dev/loop%i has been removed??
> > set_dev_path will return 1 and set " /dev/block/loop%i "
> > in path. It might happened in many Embedded Systems because the test
> > process's id is root always. So we could also Add exception handling?
> 
> Or maybe we can try to create it when node doesn't exist?
> 	mknod("/dev/loop%i", S_IFBLK|0644, makedev(7, i))

I do not really get what happens on your system. It looks like dev fs is
not properly populated, which would be bug in your system rather than in
the test library.

What is the state of /dev/loop* and /dev/block/loop* before you attempt
to run the test?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
