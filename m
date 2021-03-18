Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41446340FB7
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 22:16:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3B313C6083
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 22:16:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8DC1D3C2CE6
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 22:16:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2AB13600826
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 22:16:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 438C5AD4A;
 Thu, 18 Mar 2021 21:16:54 +0000 (UTC)
Date: Thu, 18 Mar 2021 22:16:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YFPDRciWeJrwDuVf@pevik>
References: <20210318130935.28528-1-rpalethorpe@suse.com>
 <20210318130935.28528-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318130935.28528-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] fzsync: Add self tests
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

Hi Richie,

FYI this commit fails due
/usr/bin/ld: /tmp/ccBD0Mxi.o: in function `tst_fzsync_pair_cleanup':
/home/pevik/install/src/ltp.git/lib/newlib_tests/../../include/tst_fuzzy_sync.h:226: undefined reference to `pthread_cancel'
/usr/bin/ld: /home/pevik/install/src/ltp.git/lib/newlib_tests/../../include/tst_fuzzy_sync.h:226: undefined reference to `pthread_cancel'
/usr/bin/ld: ../../lib/libltp.a(safe_pthread.o): in function `safe_pthread_create':
/home/pevik/install/src/ltp.git/lib/safe_pthread.c:18: undefined reference to `pthread_create'
/usr/bin/ld: ../../lib/libltp.a(safe_pthread.o): in function `safe_pthread_join':
/home/pevik/install/src/ltp.git/lib/safe_pthread.c:34: undefined reference to `pthread_join'
collect2: error: ld returned 1 exit status
make[1]: *** [../../include/mk/rules.mk:37: tst_fuzzy_sync01] Error 1
make: *** [../include/mk/generic_trunk_target.inc:105: all] Error 2

lib/newlib_tests/Makefile needs to add:
tst_fuzzy_sync01: CFLAGS+=-pthread
tst_fuzzy_sync02: CFLAGS+=-pthread

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
