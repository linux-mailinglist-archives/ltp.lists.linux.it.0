Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E012E658
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 14:08:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A1DF3C2472
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 14:08:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3F5573C23B0
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 14:08:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C90BC1001845
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 14:08:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EBDE7AD49;
 Thu,  2 Jan 2020 13:08:52 +0000 (UTC)
Date: Thu, 2 Jan 2020 14:08:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20200102130846.GF32710@rei.lan>
References: <20191219134725.GE2760@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219134725.GE2760@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [iomap] 3af5053534:
 WARNING:at_fs/iomap/buffered-io.c:#iomap_readpages
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
Cc: Jens Axboe <axboe@kernel.dk>, Jens Axboe <axboe@fb.com>,
 LKML <linux-kernel@vger.kernel.org>, ltp@lists.linux.it, lkp@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Looks like FALLOC_FL_ZERO_RANGE fails, at least that's where the test
reports wrong bytes in the file.

The source code of the test:

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/fallocate/fallocate04.c#L157


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
