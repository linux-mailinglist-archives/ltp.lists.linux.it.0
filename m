Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071C359BBC
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:16:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B99253C7F3C
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:16:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C90153C1D78
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:16:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4DA806018C5
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:16:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC428AEFF;
 Fri,  9 Apr 2021 10:16:25 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:11:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YHAoQooWArsl2rgD@yuki>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
 <606E7268.8000603@fujitsu.com> <YG7b9c8b9DBpz3QS@yuki>
 <6070177F.8060404@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6070177F.8060404@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> To ensure ftok succeed, we must require root. Or, modify GETIPCKEY api,
> >> we can use tmp directory. Anyhow, I will send a v2 to remove useless
> >> funtion declartion firstly.
> >
> > Unless we are sharing the semaphore with a process that wasn't worked
> > from the test process we can also pass IPC_PRIVATE instead of the key.
> 
> My ltp working directory is /root/ltp, then run "su xuyang" to run 
> semctl01 case under /root/ltp/testcases/kernel/syscalls/ipc/semctl, then 
> I got ftok failure as below:
> 
> [xuyang@localhost semctl]$ ./semctl01
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> libnewipc.c:44: TBROK: ftok() failed at semctl01.c:308: EACCES (13)
> 
> I guess this situation maybe meaningless(Usually, user has access 
> privilege for their ltp directory or install directory ). So needs_root 
> is useless.
> 
> I guess maintainers can remove this directly instead of sending a v3.

The point I was trying to make is that you can pass IPC_PRIVATE instead
of the key to semget() and you don't have to use ftok() at all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
