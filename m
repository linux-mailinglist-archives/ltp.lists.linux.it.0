Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848A204F9F
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 12:53:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC27B3C5DDE
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 12:53:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DE5CF3C2246
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 00:49:25 +0200 (CEST)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A6C3D1400431
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 00:49:24 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id h22so611283pjf.1
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 15:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NRLLTFiwZxDKq/UwBSbDFy971kDvxfQAmSgAS+YPpaA=;
 b=Aue6gCby0uuUxOvnXilXLIDf1W2qF4bVB15bc9nvqiwC50l9B/DpXG8ai8pgmZf/Qh
 KHD2jgwXyzayOS9+ya3aPvzWaQxxVquTG/961goPCUgMyp+fDnAwoamXv9FyCdYRm1LB
 xK6IhsqZ9NjcssxSmC2L2IjD0WtT3C6Yxy+o7xkGBqXT0X72czBuUPXIANTTBKOdgUY6
 +i+naqFOtYasHRxrw4wbz2z+vGDDuzuuK3pPj5wU57XfLoDxqDGv9F1CGnKHS8J9cFVV
 VP0PN7BlBnGKpZuEeEGt5cV4nRkC7RvQsabkqhy8RnIsz1WG3llZJ5sITrVQjzaw7QM2
 a2ZQ==
X-Gm-Message-State: AOAM532Hz7A4CE5v/mdPDxjD/AEVh3b1a541NvpS5Nk/4hMKbgnHPzga
 F70YYLb5l3Fvn12tiNwQqZ0=
X-Google-Smtp-Source: ABdhPJx/+PEc3BXj+aia8dA4DGanmyAqnY+W338FP/SRY+vlhb8mNBBvvVGc8cPShawEulLOlDWGKw==
X-Received: by 2002:a17:902:fe02:: with SMTP id
 g2mr20581503plj.204.1592866163068; 
 Mon, 22 Jun 2020 15:49:23 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id l83sm15073102pfd.150.2020.06.22.15.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 15:49:21 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id B728940430; Mon, 22 Jun 2020 22:49:20 +0000 (UTC)
Date: Mon, 22 Jun 2020 22:49:20 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200622224920.GA4332@42.do-not-panic.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE, SPF_PASS,
 TRACKER_ID autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 23 Jun 2020 12:53:45 +0200
Subject: Re: [LTP] LTP: crypto: af_alg02 regression on linux-next 20200621
 tag
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-crypto@vger.kernel.org,
 LTP List <ltp@lists.linux.it>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 23, 2020 at 12:04:06AM +0530, Naresh Kamboju wrote:
> LTP crypto regressions noticed on linux next 20200621.
> 
> The common case for all tests is timeout after 15 minutes which
> means tests got hung and LTP timers killed those test runs after
> timeout.
> The root cause of the failure is under investigation.
> 
>   ltp-crypto-tests:
>     * af_alg02 - failed
>     * af_alg05 - failed
>   ltp-syscalls-tests:
>     * keyctl07 - failed
>     * request_key03 - failed
> 
> Output log:
> --------------
> af_alg02:
> af_alg02.c:52: BROK: Timed out while reading from request socket.
> 
> Test code at line number 52 is
> 
> pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);
> 
> TST_CHECKPOINT_WAIT(0);
> 
> while (pthread_kill(thr, 0) != ESRCH) {
>     if (tst_timeout_remaining() <= 10) {
>         pthread_cancel(thr);
>         tst_brk(TBROK,
>                    "Timed out while reading from request socket.");
> 
> 
> af_alg05:
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> [  362.599868] kworker/dying (137) used greatest stack depth: 11600 bytes left
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> request_key03:
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> request_key03.c:65: CONF: kernel doesn't support key type 'encrypted'
> request_key03.c:65: CONF: kernel doesn't support key type 'trusted'
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> keyctl07
> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> Test timeouted, sending SIGKILL!
> tst_test.c:1286: INFO: If you are running on slow machine, try
> exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1287: BROK: Test killed! (timeout?)
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 5a94f5bc041ea9e4d17c93b11ea6f6a2e5ad361b
>   git describe: next-20200621
>   kernel-config:
> https://builds.tuxbuild.com/PB-45Luvlx0yYJ8MZgpijA/kernel.config
> 
> ref:
> https://lkft.validation.linaro.org/scheduler/job/1511938#L2211
> https://lkft.validation.linaro.org/scheduler/job/1511935#L9225

Can you try reverting:

d13ef8e10756873b0a8b7cc8f230a2d1026710ea

The patch is titled "umh: fix processed error when UMH_WAIT_PROC is used"

If this fixes the  issue we have to ask ourselves then why, given that
anything other than 0 is a return code and prior to this patch we were
not accepting negative return codes, but we were never getting them
as the invalid return code was being returned when UMH_WAIT_PROC was
used and an error code was returned. So now, *any* non-zero value is
a return code.  The onlything I can think of is that we may want to
special-case the -ENOMEM error code, or maybe some other one to not
skip it as in the below patch.

If reverting the commit does not fix the issue, this is not the droid
we are looking for.

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index ff462f3d46ca..94ed23a8991f 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -193,7 +193,7 @@ static int call_sbin_request_key(struct key *authkey, void *aux)
 	ret = call_usermodehelper_keys(request_key, argv, envp, keyring,
 				       UMH_WAIT_PROC);
 	kdebug("usermode -> 0x%x", ret);
-	if (ret != 0) {
+	if (ret != -ENOMEM && ret != 0) {
 		/* ret is the exit/wait code */
 		if (test_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags) ||
 		    key_validate(key) < 0)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
