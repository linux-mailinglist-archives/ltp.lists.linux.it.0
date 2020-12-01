Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3F2C9966
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 09:26:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA7B23C4CFC
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 09:26:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 20DEC3C2BF1
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 09:26:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AE620100044E
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 09:26:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA5C2AD2F;
 Tue,  1 Dec 2020 08:26:06 +0000 (UTC)
Date: Tue, 1 Dec 2020 09:26:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20201201082658.GA20076@yuki.lan>
References: <20201127163150.22903-1-chrubis@suse.cz>
 <20201127163150.22903-3-chrubis@suse.cz>
 <20201201074243.GA6306@janakin.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201074243.GA6306@janakin.usersys.redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib: Add test library design document
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
> Looks good to me.

Thanks.

> What do you think about adding a small ascii picture(s)?
> For example, one that shows outline of what's called in
> library vs. test process:
> 
>         lib process                                                                                    
>         +----------------------------+                                                                 
>         | main                       |                                                                 
>         |  tst_run_tcases            |                                                                 
>         |   do_setup                 |                                                                 
>         |   for_each_variant         |                                                                 
>         |    for_each_filesystem     |          test process                                           
>         |     fork_testrun ---------------------+--------------------------------------------+         
>         |      waitpid               |          | testrun                                    |         
>         |                            |          |  do_test_setup                             |         
>         |                            |          |   tst_test->setup                          |         
>         |                            |          |  run_tests                                 |         
>         |                            |          |   tst_test->test(i) or tst_test->test_all  |         
>         |                            |          |  do_test_cleanup                           |         
>         |                            |          |   tst_test->cleanup                        |         
>         |                            |          |  exit(0)                                   |         
>         |   do_exit                  |          +--------------------------------------------+         
>         |    do_cleanup              |                                                                 
>         |     exit(ret)              |                                                                 
>         +----------------------------+                                                                 

I would love that, feel free to send v2 based on my patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
