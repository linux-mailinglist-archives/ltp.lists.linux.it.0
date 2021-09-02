Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138F3FEC3E
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14BE83C939B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F1B73C2CC4
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:58 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5EE321401200
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 897AE224BB;
 Thu,  2 Sep 2021 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630579076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YKMISOyeWLZU5TzwbqysRjFC95zaQUG3KG/YlcTTLOg=;
 b=2DdgbDwqzmLuQGeb69PErGl+kqIGMn/6O2mF3ZmwgFvomNyCm/5sVQfYRE+0eCK/QKUTIh
 f5jtH4ZcPEtB15bst74MWUFMg8O0qSI27h9PlcFP0xPEcbwUE5P3fzzqvB/C4sSbMLKRtm
 EqkfJrqyyyed+2DVzXcF9rK2KnapEK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630579076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YKMISOyeWLZU5TzwbqysRjFC95zaQUG3KG/YlcTTLOg=;
 b=v1gwq9d99Wp4oRbM1XFNL9ANQf0h4E//kp/FnGaexha+N9yEpKJc/FYaXK6K9cAmsIzS4v
 YdhIR+v7ZY+l0KBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 41EDB13424;
 Thu,  2 Sep 2021 10:37:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vW3wDYSpMGGmaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 10:37:56 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 12:37:36 +0200
Message-Id: <20210902103740.19446-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

checkbashisms.pl has problem with type. Although it's in POSIX [1] even
in old one from 2004 [2] and it's supported by all common shells (i.e.
bash, zsh, dash, busybox sh, mksh; even in ksh; maybe just csh does not
support it) checkbashisms.pl complains about it:

$ make check-tst_test.sh
CHECK testcases/lib/tst_test.sh
possible bashism in tst_test.sh line 33 (type):
		if type $TST_CLEANUP >/dev/null 2>/dev/null; then
possible bashism in tst_test.sh line 694 (type):
		if type $TST_SETUP >/dev/null 2>/dev/null; then
possible bashism in tst_test.sh line 726 (type):
		if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
make: [../../include/mk/rules.mk:58: check-tst_test.sh] Error 1 (ignored)


Should I report it to Debian (the upstream)? Or at least ask for way to
suppress the warning?

Kind regards,
Petr

[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/type.html#tag_20_136
[2] https://pubs.opengroup.org/onlinepubs/000095399/utilities/type.html

Petr Vorel (4):
  doc: Mention make check
  Vendor checkbashisms.pl version 2.20.5
  rules.mk: Add checkbashisms to 'make check' for *.sh
  doc: Update for vendored checkbashisms.pl

 doc/c-test-tutorial-simple.txt            |  21 +-
 doc/maintainer-patch-review-checklist.txt |   3 +-
 doc/test-writing-guidelines.txt           |  18 +-
 include/mk/env_post.mk                    |   2 +
 include/mk/generic_leaf_target.inc        |   2 +-
 include/mk/generic_trunk_target.inc       |   2 +-
 include/mk/rules.mk                       |   9 +
 scripts/checkbashisms.pl                  | 816 ++++++++++++++++++++++
 8 files changed, 851 insertions(+), 22 deletions(-)
 create mode 100755 scripts/checkbashisms.pl

-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
