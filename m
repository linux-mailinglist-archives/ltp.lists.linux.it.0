Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B8ADAD48
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jun 2025 12:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1750069592; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=ymOSMwJwafCkWMC2vRJ3FuhMaohzqEdTi40sMxmMfuA=;
 b=lccaAYn66KgKCupDrjygRJ6BtWxzF82zQIEmeOHjoIVQpF18j6kSJMPpOAhRcr0nV1yTL
 kQjjyUSgegoxSSQjV6+vNvjG5VDQgYM75n5FR/MJauBv/M8GkPbaF8/pTvlvkOPGWV8zRwP
 nfyvmW40Mad3mzQkvbrNZ766fewgiOw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C2B83CBF5D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jun 2025 12:26:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3826F3C0296
 for <ltp@lists.linux.it>; Mon, 16 Jun 2025 12:26:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 840B7200AF3
 for <ltp@lists.linux.it>; Mon, 16 Jun 2025 12:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750069587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r9QXIf4r+pVSiaaGdf4OjsR6dm3Chp5eXCJTt8hW6A8=;
 b=Dno/293bfcxBKT7ADlrjDbWcJMabvRbi0GgKKvgyQZjSM8WQkOIDoWVLgAh4geyEUi6eqX
 va0uSc5admHisuPPHNT1n+OtFPj1pZY8Q9BafLEnPOTPGUS7dZvXhJHj90IbmEpKA2re/0
 2h+WAczyF6ApLU0f+zAGopXG6DuKk6k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-tMnHTt12PKiavvI8dQByUg-1; Mon,
 16 Jun 2025 06:26:24 -0400
X-MC-Unique: tMnHTt12PKiavvI8dQByUg-1
X-Mimecast-MFC-AGG-ID: tMnHTt12PKiavvI8dQByUg_1750069583
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 372DE1808985; Mon, 16 Jun 2025 10:26:23 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.224])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AC6EF1955F57; Mon, 16 Jun 2025 10:26:21 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 16 Jun 2025 18:26:16 +0800
Message-ID: <20250616102619.54254-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jhrsiahlQNYGmkX_ejO_D3ctZKUW-B7kVyo-ezqUGbQ_1750069583
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/3] checkpoint: Refactor and unify shell/C reinit
 support
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch series refactors the internal checkpointing mechanism to better
support mixed shell and C test cases, especially when using exec() based
processes that synchronize via shared memory.

The changes address long-standing issues with inconsistent reinitialization
of checkpoint files across exec() boundaries, and unify the logic for both
C and Shell initialized checkpoint files.

With this patch series, the following now works correctly:

Shell-C mixed:
  C: init checkpoint + fork()
  Shell: tst_run_script() + tst_checkpint wait 1000 0
  C: TST_CHECKPOINT_WAKE(0)

Shell test:
  TST_NEEDS_CHECKPOINT=1
  Process1: TST_CHECKPOINT_WAIT(0)
  process2: TST_CHECKPOINT_WAKE(0)

C test:
  .needs_checkpoint=1
  fork() + exec("child test") + TST_CHECKPOINT_WAIT(0)
  TST_CHECKPOINT_WAKE(0)

Li Wang (3):
  shell/lib: refactor checkpoint with shared path for exec() support
  kernel/pec: switch to new checkpoint wait/wake interface
  tst_checkpoint: Detect and reinit shell or C style checkpoint file

 include/tst_checkpoint_fn.h                   | 20 +++++-
 lib/tst_checkpoint.c                          | 70 +++++++++++++------
 .../kernel/connectors/pec/event_generator.c   |  3 +-
 .../kernel/connectors/pec/pec_listener.c      |  3 +-
 testcases/lib/tst_checkpoint.c                | 62 +++++++++++++---
 testcases/lib/tst_test.sh                     |  2 +
 6 files changed, 122 insertions(+), 38 deletions(-)

-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
