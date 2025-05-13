Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003FAB4C57
	for <lists+linux-ltp@lfdr.de>; Tue, 13 May 2025 08:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1747119329; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=MJvzIaJpG/Z3AXclJyFDpsSbBWgIFjJ/f9/rLLzoIFE=;
 b=D1komRbfR1KBzSn8z1v9j2zJWXsDLn0+pcSqVYlrv8zKcZjRrdb3iLZGbQGF8copD3CVJ
 YtwkagLOCUOh/8LRaqUNPKhRybgXww+i2blmky5fsP+Q7gwbWJBe7U2ryrk1dmCHplqBwJf
 QXyWzSABf2IuA3tXH3/Xv5LoofMMrq0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C3E3CC302
	for <lists+linux-ltp@lfdr.de>; Tue, 13 May 2025 08:55:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C47733CC029
 for <ltp@lists.linux.it>; Tue, 13 May 2025 08:55:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7EA611000A03
 for <ltp@lists.linux.it>; Tue, 13 May 2025 08:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747119324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Io4BizBwFN84GIgCb7H5xAl9vEXavoKTS17lbAzYIIc=;
 b=GjKU/CcDDzUtjWX/26a4J+NnspeD/bUkqBMGI3K+U99ms/6ShKHar4ArXqkl67V25w2fsO
 vje/Yp0fsfFunmmTKI94rmfwY33AJUbRYi3rcxr8W9VYk1AP+xpNN6EqBCO79X9O8Naosl
 qBx8ae0/NEkQ18ndEyWM6FW89eKlT8M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-EYFXW4PnOz-AIQclqOcj0w-1; Tue,
 13 May 2025 02:55:22 -0400
X-MC-Unique: EYFXW4PnOz-AIQclqOcj0w-1
X-Mimecast-MFC-AGG-ID: EYFXW4PnOz-AIQclqOcj0w_1747119322
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F005B1800264
 for <ltp@lists.linux.it>; Tue, 13 May 2025 06:55:21 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CD6221800879
 for <ltp@lists.linux.it>; Tue, 13 May 2025 06:55:20 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 13 May 2025 14:55:13 +0800
Message-ID: <20250513065515.49865-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zKRKS7qScIZfGg5CQIsKbrZ9-OEznssfnbreAevu6I0_1747119322
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH RFC 0/2] Refactor test state handling and clarify
 naming in LTP
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

This patch series introduces two improvements to the test infrastructure:

1: Introduce shared struct context for runtime test state

   This refactor consolidates scattered global runtime state variables
   into a single struct context, which is stored in a new struct ipc_region.
   This change is aimed at improving test robustness and maintainability
   by enabling structured state sharing between parent and child processes,
   particularly for tests requiring checkpointing or fork/exec workflows.


2: Rename tid to tcid

   This is a simple but meaningful rename to avoid confusion between thread
   ID (tid) and test case ID (tcid). This improves code clarity and avoids
   misinterpretation during code review.

CI Job: https://github.com/wangli5665/ltp/actions/runs/14989986133

Also manually tested by myself on RHEL-10.

Note: this series based on the patches:
https://lists.linux.it/pipermail/ltp/2025-May/043493.html
https://lists.linux.it/pipermail/ltp/2025-May/043494.html

Li Wang (2):
  lib: rename tid to tcid
  lib: moves test infrastructure states into a shared context structure

 lib/tst_test.c | 249 ++++++++++++++++++++++++++++---------------------
 1 file changed, 142 insertions(+), 107 deletions(-)

-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
