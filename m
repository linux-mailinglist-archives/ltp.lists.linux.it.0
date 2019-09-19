Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C10B7D5E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:59:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68BC53C215E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:59:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 16A1A3C20E3
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:59:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3257E6017EB
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:59:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E407AF3F
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 14:59:19 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Sep 2019 16:59:09 +0200
Message-Id: <20190919145911.22278-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Increase bind() converage - GH#538
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

This patchset updates syscalls/bind02 to new API and adds a test that bind()
opens sockets for incoming connections. The test is split into two programs,
one for stream-oriented sockets and the other for datagram-oriented sockets.

Martin Doucha (2):
  Update syscalls/bind02 to new API
  Add connection tests for bind()

 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bind/.gitignore |   2 +
 testcases/kernel/syscalls/bind/Makefile   |   5 +
 testcases/kernel/syscalls/bind/bind02.c   | 153 ++++-----------
 testcases/kernel/syscalls/bind/bind04.c   | 206 ++++++++++++++++++++
 testcases/kernel/syscalls/bind/bind05.c   | 219 ++++++++++++++++++++++
 testcases/kernel/syscalls/bind/libbind.c  |  47 +++++
 testcases/kernel/syscalls/bind/libbind.h  |  15 ++
 8 files changed, 537 insertions(+), 112 deletions(-)
 create mode 100644 testcases/kernel/syscalls/bind/bind04.c
 create mode 100644 testcases/kernel/syscalls/bind/bind05.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.h

-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
