Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9AFD8B2C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:38:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCEAC3C2207
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 575BA3C1C90
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:38:29 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 82E7B201096
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:38:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5207C10C093C;
 Wed, 16 Oct 2019 08:38:26 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BD5601B7;
 Wed, 16 Oct 2019 08:38:25 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:38:22 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191016083822.GA11593@dustball.usersys.redhat.com>
References: <20191011053134.18416-1-lkml@jv-coder.de>
 <2097000229.6302768.1571152116580.JavaMail.zimbra@redhat.com>
 <3c5988d6-0e37-6ca8-2567-a98d2ff84dce@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c5988d6-0e37-6ca8-2567-a98d2ff84dce@jv-coder.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 16 Oct 2019 08:38:26 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix/timer_getoverrun/2-3: Fix test for
 systems with low timer precision
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 16, 2019 at 07:39:52AM +0200, Joerg Vehlow wrote:
>Actually rounding up would not work. I tried it with a timer accuracy 
>of 4ms and I needed
>at least a fudge of two. Rounding up would only result in one. That 
>it why I decided to
>go for extending the duration
>>
>>I was assuming -1 in original code is to cope with final timer expiration of tssleep.tv_sec,
>>which might not be counted as "overrun". What does the -1 do in your formula?
>>Why is it inside brackets?
>You may be right. I am not completely sure what it is used for, but I 
>guess you are right.
>>
>>When I try to force different interval values, it fails for me (on x86):
>>3ms
>># ./timer_getoverrun_2-3.run-test
>>duration = 7 sec, interval = 6000000 nsec, expected overruns = 1155
>>1166 overruns occurred
>>FAIL:  1166 overruns sent; expected 1155
>>
>>5ms
>># ./timer_getoverrun_2-3.run-test
>>duration = 11 sec, interval = 10000000 nsec, expected overruns = 1089
>>1100 overruns occurred
>>FAIL:  1100 overruns sent; expected 1089
>How is it possible to force the timer resolution? I tested on qemu
>with aarch64 and x86_64 with and without highres=off and ir worked.

I didn't change timer resolution, I only used larger interval values
as multiple of timer resolution:
   intervalnsec = largeX * timer_resolution

I'd prefer we tweak the tolerance rather than make test run longer.
I'm thinking just allow ~50ms of extra overruns, and don't be so
strict about absolute number of overruns. (KVM guests and s390 lpars
tend to suffer from higher steal time).

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
index 96b7d01e6ffe..66f8b583a5a6 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
@@ -94,11 +94,17 @@ int main(void)
  
         valuensec = tsres.tv_nsec;
         intervalnsec = 2 * valuensec;
-       //expectedoverruns = (1000000000 - valuensec) / intervalnsec;
         expectedoverruns = 1000000000 / intervalnsec - 1;
  
+       /*
+        * waking up from sleep isn't instant, we can overshoot.
+        * Allow up to ~50ms worth of extra overruns.
+        */
+       fudge = 50000000 / intervalnsec + 1;
+
         printf("value = %d sec, interval = %d nsec, "
-              "expected overruns = %d\n", 1, intervalnsec, expectedoverruns);
+              "expected overruns = %d, fudge = %d\n", 1,
+              intervalnsec, expectedoverruns, fudge);
  
         its.it_interval.tv_sec = 0;
         its.it_interval.tv_nsec = intervalnsec;
@@ -146,7 +152,6 @@ int main(void)
          * extra expiries after the nanosleep completes so do
          * a range check.
          */
-       fudge = expectedoverruns / 100;
         if (overruns >= expectedoverruns && overruns < expectedoverruns + fudge) {
                 printf("Test PASSED\n");
                 return PTS_PASS;


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
