Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75DB153B
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 22:13:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93C393C1823
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 22:13:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 361633C0428
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 22:13:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2EF6E1400DE8
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 22:13:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67361ACB4;
 Thu, 12 Sep 2019 20:13:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Sep 2019 22:13:15 +0200
Message-Id: <20190912201318.30931-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] LTP_TIMEOUT for shell API
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

patchset replaces LTP_TIMEOUT_MUL for shell and C [1]
and memcg_stress_test.sh timeout fix [2].

It's also related to Clements fix for TST_RETRY_FN() and tst_adjust_timeout().

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=120151&state=*
[2] https://patchwork.ozlabs.org/patch/1155460/
[3] https://patchwork.ozlabs.org/project/ltp/list/?submitter=74899

Petr Vorel (3):
  shell: Add tst_is_num()
  shell: Introduce LTP_TIMEOUT variable
  net/if-mtu-change.sh: set LTP_TIMEOUT

 doc/test-writing-guidelines.txt               | 89 ++++++++++++-------
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 31 ++++++-
 .../network/stress/interface/if-mtu-change.sh |  4 +-
 4 files changed, 90 insertions(+), 36 deletions(-)

-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
