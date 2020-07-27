Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AD22EA69
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 12:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40F583C26BD
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 12:51:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 88E113C2467
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 12:51:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CBA1260096E
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 12:51:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76F5FB615;
 Mon, 27 Jul 2020 10:51:59 +0000 (UTC)
Date: Mon, 27 Jul 2020 12:52:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200727105210.GA12348@yuki.lan>
References: <20200726075511.GI1850@shao2-debian>
 <20200727093156.GA29739@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727093156.GA29739@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [blk] 6e6fcbc27e: ltp.fs_fill.fail
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
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
 kernel test robot <rong.a.chen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 lkp@lists.01.org, Baolin Wang <baolin.wang7@gmail.com>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > tst_test.c:1308: INFO: Testing on vfat
> > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> > tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> > fs_fill.c:103: INFO: Running 10 writer threads
> > Test timeouted, sending SIGKILL!
> > Test timeouted, sending SIGKILL!
> > Test timeouted, sending SIGKILL!
> > Test timeouted, sending SIGKILL!
> > Test timeouted, sending SIGKILL!
> > Test timeouted, sending SIGKILL!
> The only "error" I found is that fs_fill test timeouted on vfat. That might
> indicate some problems. Note, for slow machines, there is LTP_TIMEOUT_MUL
> https://github.com/linux-test-project/ltp/wiki/User-Guidelines#1-library-environment-variables

Actually you had removed the most important part, it not only timeouted
but the process ended up stuck in kernel and could not be killed. So
this looks like deadlock somewhere in filesystem code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
