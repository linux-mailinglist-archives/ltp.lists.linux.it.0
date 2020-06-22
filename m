Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096E203F33
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 20:34:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6A0B3C28AA
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 20:34:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DDA3E3C1D76
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 20:34:20 +0200 (CEST)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CD8E01000A22
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 20:34:19 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id g2so10242542lfb.0
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sBexF5ssPbh5LGo0nOeoAmYTVHXNPIpTHLnki7UR7GA=;
 b=dLVhwzoIaHVDtXlEa1yvKtmI/A8BJFihnPmuFHEt+CIA+Blq4FXWfgRDj5VbpYeAvs
 LExEGz+hg9FoBlNsk/KDwNo6DL+1H0Oln1cW6CTVsYdLj81cGymdJ+LHP340gPCojzAn
 WzoZSRf0551K9N59cmTYzZBiMUrU1INtRsyrH5hUFAx4zevjJoB8bUY98vkN5e0Y1w3v
 oweWmToFE3c0cUPu4Nc2eOF9DffAZo7jcaDQWC3Mhg7iqjVdCc3wUq8fp/bN4yC6PVjs
 aVCjsY+vU5prFJAmP1JwVT+P5UBgdgG+Y6dIk4QkSei7A2y/3Jkdq8CMMhhEhD7DXrQL
 Mh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sBexF5ssPbh5LGo0nOeoAmYTVHXNPIpTHLnki7UR7GA=;
 b=Wl7S6ba0qeNknYNbNd1+NOE3svfJzNJqmmQUohLuw7DeqHgfQNx3Gf0CtyglfP5HYv
 ncm4e3XTAsE5dlnJ2IPyzXNgxO5vzu3cMsdsRvwtitiogYHqjmAibz+koY5uo3MBabKt
 4MfOEEQFQOd9jn9RqVToZMA/u2APOywWaHOFHdiX+WBYkB+vdFW/kj+36CO5Hj5iCS3A
 mgo6GjaYFUQ3fCE6bMep4QbTNgmeejr9VjuD4403gjEIxiLnrtHcWt8ZW6QJze5o6ESw
 VFBXxh+OZRoe3EWoSo/z4hbR6Tlk/B/iTyZpLl9pr2hUfYPMbL/yIFiWpOjv5yMXBRfD
 78cA==
X-Gm-Message-State: AOAM531XttkZwK8UidI3PXGuLEsyRKffP1I8+aBuS4tNiNq3701pFlwo
 cBh+ln5YvIE2OiRRLnLeUkGa+FlKSUIchOZsa8tuJSAykGGmSQ==
X-Google-Smtp-Source: ABdhPJyPOJcIhXBV0KqXpX75z6mrdlBxWTdsbbkx8Ha1UrGxW5K2yYQvin6nrIjvzB6DkFmVg0qpX8oS1eea80qkSR0=
X-Received: by 2002:ac2:4db2:: with SMTP id h18mr10513503lfe.167.1592850858186; 
 Mon, 22 Jun 2020 11:34:18 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Jun 2020 00:04:06 +0530
Message-ID: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
 lkft-triage@lists.linaro.org, linux-crypto@vger.kernel.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] LTP: crypto: af_alg02 regression on linux-next 20200621 tag
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
 Eric Biggers <ebiggers@google.com>, James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>,
 Luis Chamberlain <mcgrof@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP crypto regressions noticed on linux next 20200621.

The common case for all tests is timeout after 15 minutes which
means tests got hung and LTP timers killed those test runs after
timeout.
The root cause of the failure is under investigation.

  ltp-crypto-tests:
    * af_alg02 - failed
    * af_alg05 - failed
  ltp-syscalls-tests:
    * keyctl07 - failed
    * request_key03 - failed

Output log:
--------------
af_alg02:
af_alg02.c:52: BROK: Timed out while reading from request socket.

Test code at line number 52 is

pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);

TST_CHECKPOINT_WAIT(0);

while (pthread_kill(thr, 0) != ESRCH) {
    if (tst_timeout_remaining() <= 10) {
        pthread_cancel(thr);
        tst_brk(TBROK,
                   "Timed out while reading from request socket.");


af_alg05:
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
[  362.599868] kworker/dying (137) used greatest stack depth: 11600 bytes left
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)

request_key03:
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
request_key03.c:65: CONF: kernel doesn't support key type 'encrypted'
request_key03.c:65: CONF: kernel doesn't support key type 'trusted'
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)

keyctl07
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
Test timeouted, sending SIGKILL!
tst_test.c:1286: INFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1287: BROK: Test killed! (timeout?)

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 5a94f5bc041ea9e4d17c93b11ea6f6a2e5ad361b
  git describe: next-20200621
  kernel-config:
https://builds.tuxbuild.com/PB-45Luvlx0yYJ8MZgpijA/kernel.config

ref:
https://lkft.validation.linaro.org/scheduler/job/1511938#L2211
https://lkft.validation.linaro.org/scheduler/job/1511935#L9225

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
