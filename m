Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7665750
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:51:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 724493C1C97
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:51:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C182E3C13E4
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:51:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F03DC20152E
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:51:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3FF43AEFF;
 Thu, 11 Jul 2019 12:51:09 +0000 (UTC)
Date: Thu, 11 Jul 2019 14:51:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190711125108.GB8709@rei>
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190710135710.GC5628@rei.lan> <5D26B44D.4010208@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D26B44D.4010208@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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
> > This needs more changes than this.
> >
> > The problem here is that the function modifies dev_path which is
> > returned by tst_acquire_device() so if you call this function after
> > tst_acquire_device() it will rewrite the dev_path which means that the
> > test would end up with wrong device path in tst_device->dev.
> >
> > I guess that the easiest solution would be changing the function to get
> > buffer parameter which, when non-NULL, is filled with the path.
> >
> > I.e. the function prototype would became:
> >
> > int tst_find_free_loopdev(char *path, size_t path_len);
> >
> > And we would pass the dev_path inside of the tst_device.c and NULL from
> > the copy_file_range() tests.
> Hi Cyril
> 
> This is a good comment. But I doubt why we don't use a set_devpath_flag todistinguish it.
> Or you have a future plan(in different directory ,/dev,/dev/loop/,/dev/block)?

Well you can add a flag to the function but that would be a bad design
as far as I can tell. It would still allowed for a user to modify the
library internal state by calling the tst_find_free_loopdev() with the
flag set.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
