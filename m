Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565E5FC7AB
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:48:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55BFC3CAEB4
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 16:48:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7C873C9590
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:35 +0200 (CEST)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D021F6002C8
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 16:48:34 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 gz13-20020a17090b0ecd00b0020d67a4e6e5so2804761pjb.3
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/suuafqZmOvq7sDvluHOHuyvt183S5PJipJ87yfHTf8=;
 b=OQOfZ9rYmeje5QjcC8slQ6Y6v1Q8S5v3SdjlpPWS4/4vr+nnBMFUQ7gVE7537qEXKQ
 /wHNBIjy/3mJqsQroLwWZcGABOxHbUAGqPedxboNNRe5Gq4KdKPIsugOpOO9pj3St1dY
 s0TD/R6p7agS0v0pBoE+t0a++MNJ5Ku9w1jQEi4MN88jSZ9y0du049FuAbJOl8yfd4pq
 fwl4ovvl7FL5Nv+nHTlU87rv/Q36igvHL8g54iDIF1B+LomRNbx4QLfqKQFzHQgMrgTZ
 DgB0W2nY3Tv/dyCfPHQGnwuxrXON+6UK0dTvC4s5jOIu3FlX2/ePqz3LefxWTZuvkZvy
 WeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/suuafqZmOvq7sDvluHOHuyvt183S5PJipJ87yfHTf8=;
 b=sEbfLT9q31Bner6uFp0eV0xpcgDeTFjG5yFSKFDrb27HWBsrEiLej5uoMeZcHX4SFS
 cBMB+JIwzT84N7DtZR3AUlRAVYQpZRysctYB6CF6oPXsXaWcZa9fSpDKtAzg4WsgSWno
 DvcbPbsWmNrksOu0szO5XwBZqsPZXMIGrfJ6znmQO7ytaobeXNGt0lyw5ixJKe3r0RFi
 nT7Bw0sxLXte5zqk349XJVQBZn3/Z0Fj6m55aRfyBYRmZHPZO+iDNFZkfXXkOUbxpslL
 vZ3HjtKekso1x4TIlLcOvFFXoeB5lmtAvCXqM7tfcyN2KMq1kY0b4XWyM+89Wq66r8v3
 XtdA==
X-Gm-Message-State: ACrzQf3T/n7oTIuOQq6CRo7/+gJfIxdl5jS6IyEE4+bSk9yaq856PEGv
 Hgf0EyRPydXncpCRmyZxZjHo93+2B7u+9h+vvmt8Q5AIu8DXDKVcDq9Ov0ElVZXo6bWa/c/4tuk
 jhEygvvm2rriVbez+JTeDST22PUv0wWbamKHcBmwpWElpYVSqDgxRr2Gv
X-Google-Smtp-Source: AMsMyM5AUZYhkWpX0MLgS1RPrYR5O+F9OEY8XAXyUT0u5rnQpiVA4sxLtq9R3SarOS0f1Z6EECU9tk8Xpjc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e88e:b0:183:dcb7:c4fc with SMTP id
 w14-20020a170902e88e00b00183dcb7c4fcmr7786154plg.32.1665586112833; Wed, 12
 Oct 2022 07:48:32 -0700 (PDT)
Date: Wed, 12 Oct 2022 14:48:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221012144823.1595671-1-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/5] mmapstress01: refactor to ltp framework
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

v4->v5:
* reformat top level comment to docparse format
* reduce amount of verbose comments
* clean up file size bounds definitions
* make finished variable volatile for >1 retries
* remove unnecessary pidarray because offloaded to test harness
* remove unnecessary sig blocks

v3->v4:
* squash previous changes
* set defaults of nprocs=20 and max_runtime=12
* clean up comments
* return TBROK instead of TFAIL for unexpected failures

v2->v3:
* apply make check lint suggestions
* refactor cleanup
* use SAFE_FORK
* update license

v1->v2:
* clean up formatting
* remove accidental change to header comment
* use SAFE_MMAP

v0->v1:
* use tst_test framework
* use FILE_OFFSET_BITS=64 instead of LARGE_FILE
* use safe macros

Edward Liaw (5):
  mmapstress01: refactor to tst_test framework
  mmapstress01: format comments
  mmapstress01: define fsize bounds by file offset bits
  mmapstress01: remove unnecessary pidarray
  mmapstress01: move sighandler to setup and remove sig blocks

 testcases/kernel/mem/mmapstress/Makefile      |   2 +
 .../kernel/mem/mmapstress/mmapstress01.c      | 865 +++++-------------
 2 files changed, 245 insertions(+), 622 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
