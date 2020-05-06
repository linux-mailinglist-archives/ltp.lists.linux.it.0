Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B571C7396
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:06:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3362B3C57A6
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 17:06:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0E17C3C2031
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:06:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 231EA1400C4B
 for <ltp@lists.linux.it>; Wed,  6 May 2020 17:06:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08B44AEDA;
 Wed,  6 May 2020 15:06:34 +0000 (UTC)
Date: Wed, 6 May 2020 17:06:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200506150629.GA678@dell5510>
References: <20200429192340.14252-1-pvorel@suse.cz>
 <20200429192340.14252-4-pvorel@suse.cz>
 <c408ffc1-9ba6-ac01-0de9-1726ee72d4a4@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c408ffc1-9ba6-ac01-0de9-1726ee72d4a4@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] route: Increase default loop values
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

Hi Alexey,

> The changes are fine.
Thanks for your ack.

> Perhaps for further improvements, ROUTE_CHANGE_NETLINK is limited by
> "NUM_LOOPS_MAX 65535", it looks unnecessary.
Sure, I'll remove this. It fails if -c is bigger than INT_MAX, thus suggest:

+++ testcases/network/stress/route/route-change-netlink.c
@@ -20,8 +20,6 @@
 #include "tst_safe_net.h"
 #include "tst_safe_stdio.h"
 
-#define NUM_LOOPS_MAX 65535
-
 #define IP_ADDR_DELIM ','
 #define STR(x) #x
 #define CHR2STR(x) STR(x)
@@ -117,8 +115,8 @@ static void setup(void)
 	if (tst_parse_int(p_opt, &port, 1, 65535))
 		tst_brk(TBROK, "invalid rhost port '%s'", p_opt);
 
-	if (tst_parse_int(c_opt, &num_loops, 1, NUM_LOOPS_MAX)) {
-		num_loops = NUM_LOOPS_MAX;
+	if (tst_parse_int(c_opt, &num_loops, 1, INT_MAX)) {
+		num_loops = INT_MAX;
 		tst_res(TWARN, "invalid number of loops (-c %s), using: %d",
 			c_opt, num_loops);
 	}
---

Or I can use long and LONG_MAX, but IMHO int is OK :)

> Can we limit the setup only and iterate (adding and deleting) from
> the beginning or use -i option with -c?
I'm sorry, I don't understand you. Isn't it INT_MAX enough?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
