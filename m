Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C98181911AE
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:47:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 702E33C4D29
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 14:47:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D17593C0430
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:36:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5D76714011B2
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 14:36:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B018EAC6C
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:36:08 +0000 (UTC)
Date: Tue, 24 Mar 2020 14:38:33 +0100
From: Jozef Pupava <jpupava@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200324143259.6943c413@daedruan>
Organization: SUSE
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 24 Mar 2020 14:46:58 +0100
Subject: [LTP] [PATCH 0/2] Update syscalls/fsync02 to new API
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

Hello,

this patchset is part of GH issue #452, update syscalls/fsync02 to
new API and avoid zero or negative int results in calculations.

Jozef Pupava (2):
  Update syscalls/fsync02 to new API
  Avoid zero or negative int results in calculations

 testcases/kernel/syscalls/fsync/fsync02.c | 234+++++++----------------
 1 file changed, 76 insertions(+), 158 deletions(-)

-- 
2.16.4

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
