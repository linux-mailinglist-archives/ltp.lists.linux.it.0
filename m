Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E71519786F
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC0DC3C3155
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AFBF23C3133
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7B3AC600647
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1FA9AD23
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:12:22 +0000 (UTC)
From: Jozef Pupava <jpupava@suse.com>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 12:12:20 +0200
Message-Id: <20200330101222.25371-1-jpupava@suse.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Update syscalls/fsync02 to new API
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

v2:
Extended description of patch 2, decreased BLOCKSIZE value to keep
short test run and fixed f_bavail calculation on file systems which
support tail packing.


Jozef Pupava (2):
  Update syscalls/fsync02 to new API
  Fix calculations and defined constants

 testcases/kernel/syscalls/fsync/fsync02.c | 238 +++++++---------------
 1 file changed, 78 insertions(+), 160 deletions(-)

-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
