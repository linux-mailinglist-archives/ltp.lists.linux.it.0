Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78D3482E8
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 21:31:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 081963C7A3E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 21:31:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 84C1F3C6013
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 21:31:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 28A531A0090E
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 21:31:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50FB6AB9B;
 Wed, 24 Mar 2021 20:31:11 +0000 (UTC)
Date: Wed, 24 Mar 2021 21:31:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YFuhjavZQ6bZGGKc@pevik>
References: <20210323135730.24806-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323135730.24806-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setns: Replace libc function with
 safe_macros
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi,

thanks for your patchset. While it looks correct, some of changes break both tests:

./setns01 -i 5
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
setns01.c:153: TCONF: no ns types/proc entries

./setns02 -i 5
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
setns02.c:160: TCONF: your kernel has CONFIG_IPC_NS, CONFIG_UTS_NS or CONFIG_PROC disabled
setns02.c:175: TWARN: shmctl(0, 0, (nil)) failed: EINVAL (22)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
