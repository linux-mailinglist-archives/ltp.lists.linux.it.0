Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFF19A756
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 10:32:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06F573C3038
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 10:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E178D3C0300
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 10:32:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 690AA1401858
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 10:32:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACFD5BAB7;
 Wed,  1 Apr 2020 08:32:29 +0000 (UTC)
Date: Wed, 1 Apr 2020 10:32:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200401083228.GA18685@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] LTP compilation broken with -fno-common
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
Cc: Martin Doucha <martin.doucha@suse.com>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

LTP compilation breaks with -fno-common (we don't use as the default).
This is the default for GCC 10, is there a way to fix it or do we need to disable it?

Compilation on gcc-10 (or gcc-9 with CFLAGS="-fno-common":

gcc-9 -Werror=implicit-function-declaration -fno-common -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -W  -I../../include -I../../include -I../../include/old/   -L../../lib  tst_checkpoint_wait_timeout.c   -lltp -o tst_checkpoint_wait_timeout
/usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: ../../lib/libltp.a(tst_test.o):ltp.git/lib/../include/tst_test.h:325: multiple definition of `TCID'; /tmp/cc49yYO6.o:ltp.git/lib/tests/tst_strsig.c:27: first defined here
/usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: ../../lib/libltp.a(tst_sys_conf.o):ltp.git/lib/../include/tst_test.h:325: multiple definition of `TCID'; /tmp/cc49yYO6.o:ltp.git/lib/tests/tst_strsig.c:27: first defined here

It's somehow related to the "hack" in include/tst_test.h:

/*
 * This is a hack to make the testcases link without defining TCID
 */
extern const char *TCID;

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
