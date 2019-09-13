Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57864B1DF2
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D17A93C20CC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 578D03C1C97
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9063F103AACF
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 360B9B02C;
 Fri, 13 Sep 2019 12:58:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Sep 2019 14:58:20 +0200
Message-Id: <20190913125823.17314-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] LTP_TIMEOUT for shell API
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

changes v1->v2:
addressed issues reported by Clemens and Cristian (thanks!)
* s/LTP_TIMEOUT/TST_TIMEOUT in whole patchset (assume for test variable
is better to stick with TST_ prefix)
* fix int/float $LTP_TIMEOUT_MUL detection algorithm (added missing parameter "$LTP_TIMEOUT_MUL"

+ other fixes:
* add "TIMEOUT" to filter in tst_run() (to filter out TST_TIMEOUT)
* round $sec off to make it being int, so that for $h $m $s calculations
it's possible to use $(( )).

Questions:
* I don't know how to detect TST_TIMEOUT settings made by user. That's
the difference from C, where user cannot overwrite tst_test->test.
Am I missing something or it's not possible to detect whether variable
was set in code or by user?
Maybe that was the reason TST_TIMEOUT wasn't set, but rather fixed.

* Code allowing $LTP_TIMEOUT_MUL being also float making code a bit
complex. If you don't like it, I suggest to change $LTP_TIMEOUT_MUL
being for both C and shell integer, but I'd prefer the possibility to be float.
(it's might be handy being able to set timeout 1.33x which is far less
than 2x for int).

Kind regards,
Petr

Petr Vorel (3):
  shell: Add tst_is_num()
  shell: Introduce TST_TIMEOUT variable
  net/if-mtu-change.sh: set TST_TIMEOUT

 doc/test-writing-guidelines.txt               | 89 ++++++++++++-------
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 43 ++++++++-
 .../network/stress/interface/if-mtu-change.sh |  4 +-
 4 files changed, 101 insertions(+), 37 deletions(-)

-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
