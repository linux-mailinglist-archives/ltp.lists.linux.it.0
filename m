Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D885774F4A
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 15:26:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A38483C1CF5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 15:26:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E9E5B3C104D
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 15:26:30 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5004B6006DB
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 15:26:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE695ACD1;
 Thu, 25 Jul 2019 13:26:28 +0000 (UTC)
Date: Thu, 25 Jul 2019 15:26:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20190725132617.GA23135@rei.lan>
References: <20190725110944.GA22106@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725110944.GA22106@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkp@01.org,
 Al Viro <viro@zeniv.linux.org.uk>, ltp@lists.linux.it,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> tst_test.c:1161: INFO: Testing on vfat
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> mkfs.vfat: unable to open /dev/loop0: Device or resource busy
> tst_mkfs.c:101: BROK: mkfs.vfat:1: tst_test.c failed with 741

This looks like mkfs.vfat got EBUSY after the loop device was
succesfully umounted.

We do run the test in a loop for several filesystems and the loop
generally does:

next:
	mkfs
	mount
	test
	umount
	goto next;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
