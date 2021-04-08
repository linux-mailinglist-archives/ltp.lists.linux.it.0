Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB63580A3
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:32:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FBE73C738E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:32:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB86C3C19E4
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:32:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 37D471400DA6
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:32:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6720FB004;
 Thu,  8 Apr 2021 10:32:27 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:28:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <YG7asu6B4EEa1HUD@yuki>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <60619D5B.6090507@fujitsu.com>
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7Mbc/ZTnD85SAh@yuki>
 <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
> sorry, i forgot to attach log file.The LTP version i am using is  LTP Version:  20200515 and even i have tried with latest master sources as well

Using anything older than the latest stable release is strongly discouraged.

<<<test_start>>>
tag=msgstress03 stime=1617104557
cmdline="msgstress03"
contacts=""
analysis=exit
<<<test_output>>>
incrementing stop
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
Fork failed (may be OK if under stress)
msgstress03    1  TFAIL  :  msgstress03.c:155:  Fork failed (may be OK if under stress)
<<<execution_status>>>

Here is the real reason for the failures, the test fails to fork() a few times,
that is since the machine seems to have 8GB RAM and for the default maximal
number of message queues 32000 (as set in /proc/sys/kernel/msgmni) is too high.

In other words we do have 8GB RAM and try to fork 64000 (two processes per
message queue) that leaves us about 125kB per process (aprox: 8 * 1024 * 1024 /
64000) which is likely too low. You can try to set the /proc/sys/kernel/msgmni
to half of it's default i.e. 16000 and re-run the test.

The test should be cleaned up changed to scale better with available memory
however estimating how much memory will the test process need is not an easy
task.

The rest of the messages you see are as I've said fallout from the test doing
unclean exit, i.e. the main process exits without waiting for it's children.
Which should be fixed as well, when the test is being rewritten.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
