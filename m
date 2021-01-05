Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B82EA9E9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 12:31:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF86D3C31F1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 12:31:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5AA073C088E
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 12:31:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1A74D1000A61
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 12:30:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68978AA7C;
 Tue,  5 Jan 2021 11:30:59 +0000 (UTC)
Date: Tue, 5 Jan 2021 12:31:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Gao Meitao?????????? <meitaogao@asrmicro.com>
Message-ID: <X/ROKQGrQ4OKAbu0@yuki.lan>
References: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP testcase(sysctl02) failed
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
> I am currently condulting Ltp test for our own yocto project, now I encouter below error.
> 
> sysctl02_sh                                        FAIL       1
> sysctl02 1 TFAIL: /proc/sys/fs/file-max overflows and is set to 0
> sysctl02 2 TINFO: trying to set fs.file-max=18446744073709551615
> sysctl02 2 TPASS: /proc/sys/fs/file-max keeps old value (33398)
> sysctl02 3 TINFO: trying to set fs.file-max=9223372036854775808
> sysctl02 3 TFAIL: /proc/sys/fs/file-max overflows and is set to 0
> sysctl02 4 TCONF: kernel doesn't support KASAN
> 
> after investigated it, this testcase is for bufffer overflow, I checked source code (kernel 4.19),
> all of required patched had been applied, I dig into it and found new patch applied as flow , that might make testcase failed
> 
> commit b227f15712691096027163a4600a7af1c4864320
> Author: Christian Brauner <christian@brauner.io>
> Date:   Thu Mar 7 16:29:43 2019 -0800
> 
>     sysctl: handle overflow for file-max

...

> so is this testcase out of date or something wrong wih my kernel ?
> who can help me figure this out? Thanks in advance.

If you look into the testcase source there is a comment that the test is
a regression test for this commit as well.

Also if I remember correctly if you manage to overflow and set the
file-max to 0 the system will crash sooner or later. So if the test
manages to set it to 0 your kernel is either missing this patch or the
bug has been reintroduced.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
