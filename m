Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 884991BBA61
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:52:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 475E13C28AC
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 283383C284A
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:52:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 691881000D01
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:52:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5975ACD5;
 Tue, 28 Apr 2020 09:52:12 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:52:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200428095222.GC6221@yuki.lan>
References: <20200428094745.io5fni2txzl6n37q@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428094745.io5fni2txzl6n37q@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] What is wrong with this program ?
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
Cc: vincent.guittot@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> #include "tst_test.h"
> 
> static void run(void)
> {
> 	int fd;
> 
> 	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
> 	SAFE_CLOSE(fd);
> 	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
> }
> 
> static struct tst_test test = {
> 	.test_all = run,
> 	.needs_tmpdir = 1,
> };
> 
> 
> It fails with:
> 
> safe_macros.c:230: BROK: foo.c:9: open(file,66,01) failed: EACCES (13)
> 
> if run as a normal user and passes with sudo.

I guess that you forget to pass the mode argument to the first
SAFE_OPEN() and hence the second one fails because the garbage passed to
mode prevents normal users from opening the file.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
