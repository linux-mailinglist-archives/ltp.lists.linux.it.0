Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C117FCF3
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:04:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CCD63C2059
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:04:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 129933C2017
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C3F69609689
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50883AFC6;
 Fri,  2 Aug 2019 15:04:52 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2019 17:04:41 +0200
Message-Id: <20190802150445.10984-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] Move -Werror-implicit-function-declaration to
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

please see description in patches.

Travis build: https://travis-ci.org/pevik/ltp/builds/566982062

Kind regards,
Petr

Petr Vorel (4):
  make: Remove C++ related flags
  utils/ffsb: Add missing fhstat() signature + includes
  build.sh: Respect user defined CFLAGS and LDFLAGS
  make,travis: Remove -Werror-implicit-function-declaration

 .travis.yml                  |  3 ++-
 INSTALL                      |  4 +---
 build.sh                     |  5 +++--
 doc/build-system-guide.txt   | 10 ----------
 include/mk/config.mk.default |  4 ----
 include/mk/config.mk.in      |  4 ----
 include/mk/env_post.mk       |  4 ----
 utils/ffsb-6.0-rc2/fh.h      |  2 ++
 utils/ffsb-6.0-rc2/fileops.c |  1 +
 9 files changed, 9 insertions(+), 28 deletions(-)

-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
