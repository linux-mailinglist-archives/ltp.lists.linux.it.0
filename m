Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DED13DF7B
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:02:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09B893C23A3
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 17:02:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5E3523C237A
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:02:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D9A4E1400B87
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 17:02:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44899B25FB;
 Thu, 16 Jan 2020 16:02:45 +0000 (UTC)
Date: Thu, 16 Jan 2020 17:02:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: CKI Project <cki-project@redhat.com>
Message-ID: <20200116160244.GC558@rei>
References: <cki.04B50782AB.76013V5U5A@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cki.04B50782AB.76013V5U5A@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.12-rc1-5c903e1.cki
 (stable)
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
Cc: Jianwen Ji <jiji@redhat.com>, Hangbin Liu <haliu@redhat.com>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, Jianlin Shi <jishi@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
This looks like max_map_count failure again.

...
<<<test_output>>>
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
mem.c:817: INFO: set overcommit_memory to 2
mem.c:817: INFO: set max_map_count to 1024
max_map_count.c:198: PASS: 1024 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 2048
max_map_count.c:198: PASS: 2048 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 4096
max_map_count.c:198: PASS: 4096 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 8192
max_map_count.c:198: PASS: 8192 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 16384
max_map_count.c:198: PASS: 16384 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 32768
max_map_count.c:198: PASS: 32768 map entries in total as expected.
mem.c:817: INFO: set max_map_count to 65536
max_map_count.c:201: FAIL: 65273 map entries in total, but expected 65536 entries
mem.c:817: INFO: set max_map_count to 1024
max_map_count.c:198: PASS: 1024 map entries in total as expected.
...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
