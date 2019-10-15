Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C0D7966
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 17:08:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0B1F3C2210
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 17:08:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 130F13C147F
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 17:08:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 39DEF1A01210
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 17:08:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A774F3066FD9;
 Tue, 15 Oct 2019 15:08:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 777F65D6A9;
 Tue, 15 Oct 2019 15:08:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 238561808878;
 Tue, 15 Oct 2019 15:08:36 +0000 (UTC)
Date: Tue, 15 Oct 2019 11:08:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2097000229.6302768.1571152116580.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191011053134.18416-1-lkml@jv-coder.de>
References: <20191011053134.18416-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.27]
Thread-Topic: open_posix/timer_getoverrun/2-3: Fix test for systems with low
 timer precision
Thread-Index: 4APJ5PwFpOLL4MQWN8DP9kXKXoOk4Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 15 Oct 2019 15:08:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 

Hi,

> On systems with low timer precision the test always fails, because the
> allowed
> maximum number of overruns is calculated from the expected overruns + 10%.

Did you mean 1% here?
  fudge = expectedoverruns / 100;

> If the expected overruns is less than 200, there is no tollerance.
> This happens, if the precision of the timer is less than or equal to 4ms.
> E.g. qemu-arm64 without high resolution timer the accuracy is only 4ms.

Would tweaking tolerance work too? E.g. use float, round up.

> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../conformance/interfaces/timer_getoverrun/2-3.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git
> a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> index 96b7d01e6..3df3a9f01 100644
> ---
> a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> +++
> b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> @@ -55,6 +55,7 @@ int main(void)
>  	int overruns;
>  	int valuensec, intervalnsec, expectedoverruns;
>  	int fudge;
> +	int duration;
>  
>  	if (sigemptyset(&set) != 0) {
>  		perror("sigemptyset() did not return success\n");
> @@ -94,11 +95,15 @@ int main(void)
>  
>  	valuensec = tsres.tv_nsec;
>  	intervalnsec = 2 * valuensec;
> -	//expectedoverruns = (1000000000 - valuensec) / intervalnsec;
> -	expectedoverruns = 1000000000 / intervalnsec - 1;
> +	expectedoverruns = 0;
> +	duration = 0;
> +	while (expectedoverruns < 1000) {
> +		duration++;
> +		expectedoverruns = duration * (1000000000 / intervalnsec - 1);

I was assuming -1 in original code is to cope with final timer expiration of tssleep.tv_sec,
which might not be counted as "overrun". What does the -1 do in your formula?
Why is it inside brackets?

When I try to force different interval values, it fails for me (on x86):
3ms
# ./timer_getoverrun_2-3.run-test 
duration = 7 sec, interval = 6000000 nsec, expected overruns = 1155
1166 overruns occurred
FAIL:  1166 overruns sent; expected 1155

5ms
# ./timer_getoverrun_2-3.run-test 
duration = 11 sec, interval = 10000000 nsec, expected overruns = 1089
1100 overruns occurred
FAIL:  1100 overruns sent; expected 1089

Regards,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
