Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D015165EED
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 14:36:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC6943C25DD
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 14:36:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C8ED93C2242
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 14:36:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4BE401A01C9E
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 14:36:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BA8AAC67;
 Thu, 20 Feb 2020 13:36:23 +0000 (UTC)
Date: Thu, 20 Feb 2020 14:36:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <20200220133622.GA29116@rei>
References: <BM1PR0101MB145982BF4AAC059931EA2013EE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR0101MB145982BF4AAC059931EA2013EE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ksm03, ksm04 testcases don't work with cgroup
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
> I am running ksm03 and kms04 on my RISC  v system wth linux 5.4.3,LTP Version: 20200120-55-g537fb6535
> with custom Yocto distro,the test is getting failed with following errors.why it is failing?
> 
> root@exaleapsemi:~/pankaj_ltp/ltp/testcases/kernel/mem/ksm# ./ksm03
> tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
> safe_macros.c:167: BROK: mem.c:750: mkdir(/dev/cgroup,0777) failed: EEXIST (17)

That's more of the system problem than anything else, kernel itself does
not mount cgroups anywhere, that's usually done it the boot process and
it ends up under /sys/fs/cgroups/ on most of the recent distributions.

It looks like something has mounted cgroups over the /dev/cgroup on your
system, it's up to you to figure out why is it mounted there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
