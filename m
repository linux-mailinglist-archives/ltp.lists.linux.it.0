Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F20B08997
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jul 2025 11:45:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36C403CC155
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jul 2025 11:45:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BDF9C3CACE4
 for <ltp@lists.linux.it>; Thu, 17 Jul 2025 11:44:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 537741000150
 for <ltp@lists.linux.it>; Thu, 17 Jul 2025 11:44:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C44EA1F7DD;
 Thu, 17 Jul 2025 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752745493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JdYqGOJ6BAW/+8h/8dJfUJwACMytzbEg/OgWjOPhy4=;
 b=gV2j0iuTcNOi955S2wNerq6PvvqkTOaG/yGsDpwb1kpb26tSyZBQdytI8i2jTrx+RIVQO5
 0PBgrw//nv6DtehYmxr89/q49I9WuBmGfSJ6iBYaRfe4hyO3cwyVkyPrUeSeQxw+7R9wz7
 ZZjRstE9GwMWP69JoG1hO+2OjS4Sqn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752745493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JdYqGOJ6BAW/+8h/8dJfUJwACMytzbEg/OgWjOPhy4=;
 b=8IHqyJ5YgBky26hUu8v1zpAM+60krxY8y7w0I3GkJddzjQSXUZGdgsU1ezt708XC7RoQ++
 GdC07ACbJu9GzLDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gV2j0iuT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8IHqyJ5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752745493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JdYqGOJ6BAW/+8h/8dJfUJwACMytzbEg/OgWjOPhy4=;
 b=gV2j0iuTcNOi955S2wNerq6PvvqkTOaG/yGsDpwb1kpb26tSyZBQdytI8i2jTrx+RIVQO5
 0PBgrw//nv6DtehYmxr89/q49I9WuBmGfSJ6iBYaRfe4hyO3cwyVkyPrUeSeQxw+7R9wz7
 ZZjRstE9GwMWP69JoG1hO+2OjS4Sqn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752745493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JdYqGOJ6BAW/+8h/8dJfUJwACMytzbEg/OgWjOPhy4=;
 b=8IHqyJ5YgBky26hUu8v1zpAM+60krxY8y7w0I3GkJddzjQSXUZGdgsU1ezt708XC7RoQ++
 GdC07ACbJu9GzLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DBA413A6C;
 Thu, 17 Jul 2025 09:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ok6sJBXGeGi2XAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 17 Jul 2025 09:44:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 17 Jul 2025 11:44:51 +0200
Message-Id: <20250717-clock_nanosleep05-v4-0-78bc62df960f@suse.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABPGeGgC/23OwQ6CMAwG4FchOzuzdRTEk+9hjBmjyKIywnTRE
 N7dQWIkhvT0N+3XDsxTb8mzfTKwnoL11rUxpJuEmUa3F+K2ipmBABQZCG5uzlzPrW6dvxF1Ank
 mSmXqUiPUxOJe11NtX7N5PMXcWP9w/Xs+EeTU/Wr5ihYkj6Uwl6LQYHby4J+etsbd2YQFWABq7
 Z0AXHCJCFAhojTZH6B+QC5XP1ARyAqV1kbqOIULYBzHD2ruYkIzAQAA
X-Change-ID: 20250620-clock_nanosleep05-60b3cfba52fe
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745493; l=2042;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=KVZ1HX50i8hYsRpa6GuoTHBKwtVJJ1LLJCt4f/5c5s8=;
 b=SERT1h3xKOKjEt/jOQNA1LH+YQ+X08OU+s1a81E8L4xeTE/ngrRpsC2ATaUP6dD8idD1qjG17
 iI6YataiSFKBG9mgpUdZKqA9cQvK1gtIU7s8ilsfESoDTGipbg2ZB+L
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: C44EA1F7DD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 0/2] Rewrite openposix clock_settime bugged tests
 inside LTP
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

Both clock_settime_7-1 and clock_settime_8-1 are affected by the
same bug which is probably related to the way tests are written.

sleep() is used by the parent and is not reliable. It can oversleep
or undersleep according to system overload or signals which are
received. And we never check for its return value. Using
clock_nanosleep would make parent more reliable in this case.

At the same time, the test is taking for granted a certain
synchronization between child and parent, which is not always true
in case of system overload.

My suggestion is to rewrite the test using LTP, which has better
timing handling (see tst_timer.h).

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v4:
- change description to include REALTIME instead of MONOTONIC
- Link to v3: https://lore.kernel.org/r/20250717-clock_nanosleep05-v3-0-6934fc1a2505@suse.com

Changes in v3:
- remove checkpoints
- sleep with REALTIME only, but take time in MONOTONIC
- use only clock_settime variant
- Link to v2: https://lore.kernel.org/r/20250630-clock_nanosleep05-v2-0-15522d5551c6@suse.com

Changes in v2:
- add SAFE_CLOCK_NANOSLEEP
- move child to MONOTONIC clock
- simplify child_nanosleep by passing flags
- calculate delta by checking sleep() time between beginning and ending time
- keep variants only for child
- Link to v1: https://lore.kernel.org/r/20250627-clock_nanosleep05-v1-1-1357109a2c81@suse.com

---
Andrea Cervesato (2):
      Add SAFE_CLOCK_NANOSLEEP macro utility
      Add clock_settime04 test

 include/tst_safe_clocks.h                          |  23 ++++
 runtest/syscalls                                   |   1 +
 testcases/kernel/syscalls/clock_settime/.gitignore |   1 +
 .../syscalls/clock_settime/clock_settime04.c       | 140 +++++++++++++++++++++
 4 files changed, 165 insertions(+)
---
base-commit: 39072797fa63be2a5e85b1a79379b98a8bfa8d29
change-id: 20250620-clock_nanosleep05-60b3cfba52fe

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
