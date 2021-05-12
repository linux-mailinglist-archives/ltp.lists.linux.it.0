Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 745F237BFB6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:17:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 308D93C8A9A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:17:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 074D33C1C23
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:17:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 65A821A00346
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:17:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABCE5AEE6;
 Wed, 12 May 2021 14:17:11 +0000 (UTC)
To: LTP List <ltp@lists.linux.it>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <9d5d4dc9-ab51-7218-23f3-2ec835210fcf@suse.cz>
Date: Wed, 12 May 2021 16:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] syscalls/mallinfo01 test is broken
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,
the mallinfo01 test is failing on some of our test machines because it
makes wrong assumptions about how malloc() and free() will change the
number of free chunks (ordblks). I recommend we remove the test from
runfiles before the upcoming release and fix it later because part of
the test scenario needs major redesign.

> tst_test.c:1313: TINFO: Timeout per run is 0h 18m 00s
> mallinfo_common.h:16: TINFO: Start...
> mallinfo_common.h:18: TINFO: arena: 135168
> mallinfo_common.h:19: TINFO: ordblks: 1
> mallinfo_common.h:20: TINFO: smblks: 1
> mallinfo_common.h:21: TINFO: hblks: 0
> mallinfo_common.h:22: TINFO: hblkhd: 0
> mallinfo_common.h:23: TINFO: usmblks: 0
> mallinfo_common.h:24: TINFO: fsmblks: 64
> mallinfo_common.h:25: TINFO: uordblks: 128
> mallinfo_common.h:26: TINFO: fordblks: 135040
> mallinfo_common.h:27: TINFO: keepcost: 134976
> mallinfo_common.h:16: TINFO: Test uordblks...
> mallinfo_common.h:18: TINFO: arena: 135168
> mallinfo_common.h:19: TINFO: ordblks: 2
> mallinfo_common.h:20: TINFO: smblks: 0
> mallinfo_common.h:21: TINFO: hblks: 0
> mallinfo_common.h:22: TINFO: hblkhd: 0
> mallinfo_common.h:23: TINFO: usmblks: 0
> mallinfo_common.h:24: TINFO: fsmblks: 0
> mallinfo_common.h:25: TINFO: uordblks: 34048
> mallinfo_common.h:26: TINFO: fordblks: 101120
> mallinfo_common.h:27: TINFO: keepcost: 101056
> mallinfo01.c:46: TPASS: mallinfo() uordblks passed
> mallinfo_common.h:16: TINFO: Test ordblks...
> mallinfo_common.h:18: TINFO: arena: 135168
> mallinfo_common.h:19: TINFO: ordblks: 3
> mallinfo_common.h:20: TINFO: smblks: 0
> mallinfo_common.h:21: TINFO: hblks: 0
> mallinfo_common.h:22: TINFO: hblkhd: 0
> mallinfo_common.h:23: TINFO: usmblks: 0
> mallinfo_common.h:24: TINFO: fsmblks: 0
> mallinfo_common.h:25: TINFO: uordblks: 32432
> mallinfo_common.h:26: TINFO: fordblks: 102736
> mallinfo_common.h:27: TINFO: keepcost: 101056
> mallinfo01.c:58: TFAIL: mallinfo() ordblks failed
> 
> Summary:
> passed   1
> failed   1
> broken   0
> skipped  0
> warnings 0

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
