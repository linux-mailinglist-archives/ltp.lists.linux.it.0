Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4791B58C3BD
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 09:14:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 866773C94C7
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 09:14:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9DAEE3C1364
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 09:14:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AF5221A003F1
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 09:14:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC29120BC2;
 Mon,  8 Aug 2022 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659942884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z4scW2dokAyap/qDVQH0f1cwXCaL7e5OQbBIBxz6lNs=;
 b=p3laOU1bl/mpFA0gX6wZgHSk1nA/uKpWoykP4MmyUsVoMfDRok32U/ZVAXrUfKz6qWoWRm
 ar/jx22EDxQ0QEKr8VQsbkOagWj8YfmOfcmr8lT1WQw4IifybQFP8J32bBbClqmDB51sBj
 XbPMxbiSjJFbx0VcNczxxE1ZHAuRGsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659942884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z4scW2dokAyap/qDVQH0f1cwXCaL7e5OQbBIBxz6lNs=;
 b=AjdS+41wM9r3Bh4MuVur0TsO8hw9UxZ6EEohl4EJHbcSZrjcYV6jYInMkPgpetcnnHco69
 zMvWJvvelwDb5PCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 912A413A7C;
 Mon,  8 Aug 2022 07:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZRPnIOS38GLMLgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 08 Aug 2022 07:14:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  8 Aug 2022 09:14:37 +0200
Message-Id: <20220808071439.741-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] github pull request template
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

Petr Vorel (2):
  github: pull_request_template.md
  doc/c-test-tutorial-simple.txt: Use links, README.md

 .github/pull_request_template.md |  6 ++++++
 doc/c-test-tutorial-simple.txt   | 21 +++++++++++----------
 2 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 .github/pull_request_template.md

-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
