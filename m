Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8517B01EA
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Sep 2023 12:29:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D5B03CDC70
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Sep 2023 12:29:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D9EDD3CDC2A
 for <ltp@lists.linux.it>; Wed, 27 Sep 2023 12:29:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0654210005DA
 for <ltp@lists.linux.it>; Wed, 27 Sep 2023 12:29:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3A351F8BF;
 Wed, 27 Sep 2023 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695810572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rP7S0ANGoMb7Uz5mjWZ/A4o8VAuP1EC/g6JTEYjPOt4=;
 b=quIdHtqa2DXfk0tQV34H9Q6e3vypWHU0PlMiwAxsy3pWaE08Fjmb0PXabLQ2AJZZDuui0R
 fmjHlbmZdlBbZAgvG4b1C7sNLswT7BZstO0zhayXFfRkluPxUwzm8XM1iTGMlohg5X3e6x
 o1AI0ZZRGJBb95khkYktalpPpgQ5Wbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695810572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rP7S0ANGoMb7Uz5mjWZ/A4o8VAuP1EC/g6JTEYjPOt4=;
 b=8e5VrNfUxbpzsKj9DcHYXMO70/tqhn7AfS98RrYlMfkpZY5gdyYLWVCu2St4PjnQZ+VPrm
 e82eU5egmSIoiHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9CA213479;
 Wed, 27 Sep 2023 10:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4DSONAsEFGWkMwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 27 Sep 2023 10:29:31 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Date: Wed, 27 Sep 2023 12:30:10 +0200
Message-ID: <20230927103012.9587-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Fix sched-rt sysctl files & update docs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

- First patch fixes sched-rt sysctl files to disallow writing invalid
  values

- Second patch is new in v2 and clarifies and fixes the documentation
  for these files and is actually independent of the first patch

Cyril Hrubis (2):
  sched/rt: Disallow writing invalid values to sched_rt_period_us
  docs: scheduler-rt: Clarify & fix sched_rt_* sysctl docs

 Documentation/scheduler/sched-rt-group.rst | 14 ++++++++------
 kernel/sched/rt.c                          |  9 +++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
