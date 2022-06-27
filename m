Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B399555B99B
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jun 2022 14:53:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5643A3C9456
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jun 2022 14:53:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F68A3C93B4
 for <ltp@lists.linux.it>; Mon, 27 Jun 2022 14:53:30 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4471F600776
 for <ltp@lists.linux.it>; Mon, 27 Jun 2022 14:53:29 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.24.96.116])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 085029FF8E;
 Mon, 27 Jun 2022 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1656334409; bh=D+CZFE7KImW1Gj5gfZhFvtvlvuHsSv+H4A8J/+jKirI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=nvegBixmOHeGlERDuZvjrtCQLMGlqeolZzOyowaPhfuHbQ00N82YN4gX+5MiiH2PG
 lrrempysz1/pnexMLuneplTDNQFLG4oQ6lqnxmV0uRuOH7ypY/PfLzzfErU4KgdZ5O
 bNR794BRVNCNzR6uZwvxw797PKOmwCeDseYH1pfg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Mon, 27 Jun 2022 14:53:18 +0200
Message-Id: <20220627125321.1560677-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [0/3] openposix: Fix installation file layout
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

as described in my RFC, here is a first implementation of a fixed
installation layout for open posix tests.

I implemented this using autoconf, to be able to specify the
installation location of the tests.

If build standalone, the open posix tests are still installed to
/opt/open_posix_testsuite/{conformance,functional,stress}, but when
installed as part of ltp, they are installed to
/opt/ltp/testcases/open_posix_testsuite/*

Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
