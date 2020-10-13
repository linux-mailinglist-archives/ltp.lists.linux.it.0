Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8728CFC4
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 16:02:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88B733C26C6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 16:02:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A0AC53C26A4
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 16:02:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB930200C64
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 16:02:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F919AC82;
 Tue, 13 Oct 2020 14:02:50 +0000 (UTC)
Date: Tue, 13 Oct 2020 16:03:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <20201013140315.GD29925@yuki.lan>
References: <20201006085309.32227-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006085309.32227-1-cascardo@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/timer_settime01: adjust for rounding
 from nsec to usec
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
Cc: Kelsey Skunberg <kelsey.skunberg@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
What about this change instead?

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 67143e8f8..599ef2891 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -132,11 +132,13 @@ static void run(unsigned int n)
 					get_clock_str(clock));
 				continue;
 			}
-			val += tst_ts_to_us(timenow);
+			tst_ts_add_us(timenow, val);
+			tst_its_set_value_from_ts(&new_set, timenow);
+		} else {
+			tst_its_set_value_from_us(&new_set, val);
 		}
 
 		tst_its_set_interval_from_us(&new_set, tc->it_interval_tv_usec);
-		tst_its_set_value_from_us(&new_set, val);
 
 		TEST(tv->timer_settime(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 


By adding the us to the timenow first and then setting the its.value
from it we can avoid the rounding completely.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
