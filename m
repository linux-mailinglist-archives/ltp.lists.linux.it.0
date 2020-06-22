Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9BE2038F9
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71CA23C2BE1
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8C9483C2209
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D83614012AE
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 755C8C1A3;
 Mon, 22 Jun 2020 14:19:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 06:56:44 +0200
Message-Id: <20200622045649.5063-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RESENT PATCH 0/5] tst_net.sh: Remove rsh,
 update docs add debug & test
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

Hi,

It looks this patchset from Friday didn't get to the mailing list, thus
sending it again.

started as removing rsh, then also update docs and backport testing
environment I use for some time (but not sure if needed).

Kind regards,
Petr

Petr Vorel (5):
  tst_net.sh: Remove rsh support
  net: Update README.md
  tst_net.sh: Drop 'sh -c' use from ssh in tst_rhost_run
  net/test: Add basic testing for tst_rhost_run
  st_net.sh: tst_rhost_run: Add -d option (debug)

 lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++
 testcases/lib/tst_net.sh                    | 37 +++++++----
 testcases/network/README.md                 | 73 ++++++++++-----------
 3 files changed, 85 insertions(+), 50 deletions(-)
 create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
