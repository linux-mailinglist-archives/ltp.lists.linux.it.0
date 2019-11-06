Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F3F166D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:57:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC92E3C2413
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:57:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 23C373C23BA
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:57:46 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B99B6605639
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:57:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72A28B3A4
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 12:57:44 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  6 Nov 2019 13:57:42 +0100
Message-Id: <20191106125743.29952-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/1] LVM (growfiles) workdir fix
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

The LVM tests are currently failing in OpenQA because the /test/growfiles
directory doesn't exist and the growfiles test program fails to create its 
working subdirectories. It's a simple fix - just create the missing parent
directories.

I've skipped porting the test program to the new API because it's 3000+ lines
long and the fix is almost trivial. Here are OpenQA verification runs
with the fix applied:
https://openqa.suse.de/tests/3563470
https://openqa.suse.de/tests/3563513

We should also move the mkpath() function to the LTP library later because
it'll be useful for other tests.

Martin Doucha (1):
  Create full path to workdir in fs/doio/growfiles.c

 testcases/kernel/fs/doio/growfiles.c | 71 +++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 18 deletions(-)

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
