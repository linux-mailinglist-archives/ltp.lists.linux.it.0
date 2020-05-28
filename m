Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFCB1E5DD6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BFBE3C31CC
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DB7613C31AE
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3AF9B232A26
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8191AB5C
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:05:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 13:05:52 +0200
Message-Id: <20200528110554.10179-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 URI_NOVOWEL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/2] LVM: Drop legacy scripts and runtest files
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

I guess there is no doubt, that new implementation is better thus no
need for legacy version. I hope that dropping legacy fs is ok (if not we
should support them in new API).

Kind regards,
Petr

Petr Vorel (2):
  LVM: Don't require root for generate_lvm_runfile.sh
  LVM: Drop legacy scripts and runtest files

 doc/ltp-run-files.txt                      |   4 +-
 runtest/lvm.part1                          | 217 ---------------------
 runtest/lvm.part2                          |  72 -------
 testcases/misc/lvm/generate_lvm_runfile.sh |   1 -
 testscripts/ltpfslvm.sh                    | 200 -------------------
 testscripts/ltpfsnolvm.sh                  | 150 --------------
 6 files changed, 1 insertion(+), 643 deletions(-)
 delete mode 100644 runtest/lvm.part1
 delete mode 100644 runtest/lvm.part2
 delete mode 100755 testscripts/ltpfslvm.sh
 delete mode 100755 testscripts/ltpfsnolvm.sh

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
