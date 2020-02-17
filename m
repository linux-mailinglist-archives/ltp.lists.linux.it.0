Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8471616FD
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 17:08:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6066E3C25CC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 17:08:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7A64D3C136E
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 17:08:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C1A891A00EF3
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 17:08:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09BDAADD9;
 Mon, 17 Feb 2020 16:08:32 +0000 (UTC)
Date: Mon, 17 Feb 2020 17:08:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217160830.GA6482@dell5510>
References: <20200208092014.24824-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208092014.24824-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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

Hi Li,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Code looks good.
Minor issue: doc has broken formatting.

> +2.2.34 Reserving hugepages
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Many of the ltp tests need to use hugepage in their testing, this allows the
> +test can reserve hugepages from system only via .request_hugepages = xx.
> +
> +If set non-zero number of request_hugepages, test will try to reserve the
> +expected number of hugepage for testing in setup phase. If system does not
> +have enough hpage for using, it will try the best to reserve 80% available
> +number of hpages. With success test stores the reserved hugepage number in
> +'tst_hugepages. For the system without hugetlb supporting, variable
Missing ' here   ^

> +'tst_hugepages' will be set to 0.

I propose these changes (+ strip this formatting from comments in C source - include/tst_test.h).

Kind regards,
Petr

diff --git doc/test-writing-guidelines.txt doc/test-writing-guidelines.txt
index b9f8d5ab0..ae9a8b040 100644
--- doc/test-writing-guidelines.txt
+++ doc/test-writing-guidelines.txt
@@ -1945,14 +1945,14 @@ For full documentation see the comments in 'include/tst_fuzzy_sync.h'.
 2.2.34 Reserving hugepages
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Many of the ltp tests need to use hugepage in their testing, this allows the
-test can reserve hugepages from system only via .request_hugepages = xx.
+Many of the LTP tests need to use hugepage in their testing, this allows the
+test can reserve hugepages from system only via '.request_hugepages = xx'.
 
-If set non-zero number of request_hugepages, test will try to reserve the
+If set non-zero number of 'request_hugepages', test will try to reserve the
 expected number of hugepage for testing in setup phase. If system does not
 have enough hpage for using, it will try the best to reserve 80% available
 number of hpages. With success test stores the reserved hugepage number in
-'tst_hugepages. For the system without hugetlb supporting, variable
+'tst_hugepages'. For the system without hugetlb supporting, variable
 'tst_hugepages' will be set to 0.
 
 Also, we do cleanup and restore work for the hpages resetting automatically.
@@ -1977,9 +1977,12 @@ struct tst_test test = {
 	.request_hugepages = 2,
 	...
 };
+[source,c]
+-------------------------------------------------------------------------------
 
 or,
 
+-------------------------------------------------------------------------------
 #include "tst_test.h"
 
 static void run(void)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
