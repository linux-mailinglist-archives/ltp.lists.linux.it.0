Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8DB376FDB
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:51:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F38B13C5532
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 07:51:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8DA9C3C1C51
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:18 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 529AE1001454
 for <ltp@lists.linux.it>; Sat,  8 May 2021 07:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620453075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MCRngqgosQvNVlRFXPbl25dB1SRnROxjp469xxLe0po=;
 b=bFDxFXckbloNf+OAj8Ov0QAuQK+Q9KYxZsCzlr5eLEwJSpUe0I24a3aNNL5pivZhrEG96B
 iDRJjphKzOmjGRsaFUvdQ4enlLfWk4x8WavIB3S7tf9GQ+jfPEigGJ0vJuagFdVzGU1Wua
 dmGhpy1Cf4WachcV3HMAzzjxuasVLKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-z_YFcnd9OIeo5_rBbYGcew-1; Sat, 08 May 2021 01:51:13 -0400
X-MC-Unique: z_YFcnd9OIeo5_rBbYGcew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE9E18397A4
 for <ltp@lists.linux.it>; Sat,  8 May 2021 05:51:12 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC7A1897F
 for <ltp@lists.linux.it>; Sat,  8 May 2021 05:51:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 May 2021 13:51:05 +0800
Message-Id: <20210508055109.16914-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/4] shell: Fix orphan timeout sleep processes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I fix up tiny issues of Joerg's patch and resend with combine my
two follow-up new fixes together to be review.

V2 --> v3
 use sleep command in timeout tests
 fix code indent issue
 fix a bug in _tst_kill_test for kill looping
 limit the "kill $sleep_pid; eixt" action

Joerg Vehlow (2):
  shell: Extend timeout tests
  shell: Prevent orphan timeout sleep processes

Li Wang (2):
  lib: ignore SIGINT in _tst_kill_test
  lib: reset SIGTERM to original disposition if timeout occured

 lib/newlib_tests/shell/test_timeout.sh | 178 ++++++++++++++++++++++---
 lib/newlib_tests/shell/timeout03.sh    |   4 +-
 lib/newlib_tests/shell/timeout04.sh    |  22 +++
 testcases/lib/tst_test.sh              |  32 +++--
 4 files changed, 204 insertions(+), 32 deletions(-)
 create mode 100755 lib/newlib_tests/shell/timeout04.sh

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
