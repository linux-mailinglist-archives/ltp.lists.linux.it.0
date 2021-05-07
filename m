Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBE3766D2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:08:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 288D03C5651
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:08:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA5E53C562A
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:08:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0F5D260210A
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620396510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UzddvlY6pXqdC9VCrHFvsmvB6HlsdlIYvVDWVRY9R/I=;
 b=SbBidTjsRUJ9NDGvCP/KXqgrN5yLGPDQFcLF6BgnGkVR0isJMmhfnoMY/e3MRiq3qM6IUE
 9OBb6cx5thkb9E7viQgkcYlCUXqlw0of1E1txsG0PFBuK2Kr4lrEXF6yImI1lx+LMXlqGO
 1dcND15ALjWPzrC7NfxnoYSFdRDK+kI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-6mBIoBm6MTGk-Y1p8EtnsA-1; Fri, 07 May 2021 10:08:27 -0400
X-MC-Unique: 6mBIoBm6MTGk-Y1p8EtnsA-1
Received: by mail-yb1-f198.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so10177192ybp.17
 for <ltp@lists.linux.it>; Fri, 07 May 2021 07:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UzddvlY6pXqdC9VCrHFvsmvB6HlsdlIYvVDWVRY9R/I=;
 b=Yoqmzo0U8/T27JmmvzsRiseCUh/Z339EtylLcvBTkWhkhRAzdwaXnvRWMO0KPB6tq/
 QaRseOqgPW2M8RPWrGunHh3vQGEMKeLfpEPE/TjIsMuJQsKFMW2oaCI/IqwPtpzIJu8Z
 ECNZ7CdzElYPwlvu4GlZr3OvB+3KIveaDt6UM1GA9eSsWMFkSDGaM8k+T1HHv2q2wdxB
 /Zg7A71vIVL6U6h0iyDNAV6vxlWoKIbil0NLr/Rs4m2UYOBRldIgos1vtQ+Muhozgrhk
 PucrqfzbSkk8TgxRqWwy6yJ1hJM082jGkCmq1o/VYMG4/rY+YCqYnhvxRcQ9u1Eq0XBD
 uKeA==
X-Gm-Message-State: AOAM533g9yePnf/IpQUzCeFTMLnqeTj6ZCu7CqmfYxSwusUetQCVqLfZ
 awHDpLQBH7xN+XbY70wDOLgAU4BYvalA5GF/fDNQhTRml/VMJWYKnf+ozOweLOw13RL0oHVpX4h
 kL0CvLKmC08giT5OgZstiwBos/xk=
X-Received: by 2002:a25:d8d6:: with SMTP id
 p205mr13648032ybg.252.1620396506493; 
 Fri, 07 May 2021 07:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ4WyE1chjzn+TQAVrhaAJtZB4v1fDnG+gPPqO0Vrd7fGkl589OJerBe7Iokvmo+ARqFn40gYQBDwP2nhvIz4=
X-Received: by 2002:a25:d8d6:: with SMTP id
 p205mr13648004ybg.252.1620396506277; 
 Fri, 07 May 2021 07:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210507103258.232174-1-lkml@jv-coder.de>
 <20210507103258.232174-3-lkml@jv-coder.de>
In-Reply-To: <20210507103258.232174-3-lkml@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 May 2021 22:08:14 +0800
Message-ID: <CAEemH2fucJPyeTL-HZJD92ves7GLMaMHcaPzi8kS_qWL+x=Hcg@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] shell: Prevent orphan timeout sleep
 processes
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

Reviewed-by: Li Wang <liwang@redhat.com>

The patchset looks good except for few minor issues, we can help fix
them when merging.

--- a/lib/newlib_tests/shell/timeout03.sh
+++ b/lib/newlib_tests/shell/timeout03.sh
@@ -32,7 +32,7 @@ do_test()
 {
        tst_res TINFO "testing killing test after TST_TIMEOUT"

-       tst_sleep 2
+       sleep 2
        tst_res TFAIL "test: running after TST_TIMEOUT"
 }

@@ -40,7 +40,7 @@ cleanup()
 {
        tst_res TPASS "test run cleanup after timeout"

-       tst_sleep 15 # must be higher than wait time in _tst_kill_test
+       sleep 15 # must be higher than wait time in _tst_kill_test
        tst_res TFAIL "cleanup: running after TST_TIMEOUT"
 }

diff --git a/lib/newlib_tests/shell/timeout04.sh
b/lib/newlib_tests/shell/timeout04.sh
index 0a6ba053c..c702905f3 100755
--- a/lib/newlib_tests/shell/timeout04.sh
+++ b/lib/newlib_tests/shell/timeout04.sh
@@ -9,7 +9,7 @@ TST_TIMEOUT=1

 do_test()
 {
-       tst_res TINFO "Start"
+    tst_res TINFO "Start"
     sleep 5
     tst_res TFAIL "End"
 }
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 7ceddff04..ed2699175 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -469,7 +469,7 @@ _tst_timeout_process()

        sleep $sec &
        sleep_pid=$!
-       #trap "kill $sleep_pid; exit" TERM
+       trap "kill $sleep_pid; exit" TERM
        wait $sleep_pid
        _tst_kill_test
 }


================
(This below is not related to your patches)

But there is another issue I found that the timeout03 can NOT
be killed after timed out in calling cleanup(), the reason is
tst_brk stop the _tst_kill_test running in the background so that
it does not output as what we expected:

# timeout03 1 TINFO: timeout per run is 0h 0m 1s
# timeout03 1 TINFO: testing killing test after TST_TIMEOUT
# timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
# timeout03 1 TBROK: test interrupted or timed out
# timeout03 1 TPASS: test run cleanup after timeout
# timeout03 1 TINFO: Test is still running, waiting 10s
# timeout03 1 TINFO: Test is still running, waiting 9s
# timeout03 1 TINFO: Test is still running, waiting 8s
# timeout03 1 TINFO: Test is still running, waiting 7s
# timeout03 1 TINFO: Test is still running, waiting 6s
# timeout03 1 TINFO: Test is still running, waiting 5s
# timeout03 1 TINFO: Test is still running, waiting 4s
# timeout03 1 TINFO: Test is still running, waiting 3s
# timeout03 1 TINFO: Test is still running, waiting 2s
# timeout03 1 TINFO: Test is still running, waiting 1s
# timeout03 1 TBROK: Test still running, sending SIGKILL
# Killed


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
