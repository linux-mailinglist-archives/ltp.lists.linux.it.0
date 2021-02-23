Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBBD3228A5
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 11:13:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F21E63C59C1
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 11:13:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AC4C83C2AA4
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 11:13:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 233E710005B5
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 11:13:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92DDEAC69;
 Tue, 23 Feb 2021 10:13:07 +0000 (UTC)
Date: Tue, 23 Feb 2021 11:14:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YDTVheiu2gRPs3oQ@yuki.lan>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB403879BE2@dggeml511-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB403879BE2@dggeml511-mbs.china.huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpu_hotplug: Add executable file's path
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
> Thanks for your review!
> 
> In many embedded system, before running testcases we need type in the following lines:
> 
>     #export LTPROOT=/opt/ltp
>     #export PATH="$PATH:$LTPROOT/testcases/bin"
>     # cpuhotplug02.sh -c 1 -l 1
> 
> It is not convenient for running test after every login.

This is what you have to do if you are not using the runltp script and
that's it. We will not add workarounds into our testcases.


Also nobody stops you from writing a short wrapper script such as:

$ cat run_test.sh

#!/bin/sh

export LTPROOT=/opt/ltp
export PATH="$PATH:$LTPROOT/testcases/bin"

$@

And then using it as:

./run_test.sh cpuhotplug02.sh -c 1 -l 1

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
