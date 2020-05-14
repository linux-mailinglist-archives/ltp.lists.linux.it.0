Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F01261D3958
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 919743C5446
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 801A93C23BF
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A8A56200AD4
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A69EAEAC
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:49:15 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 20:49:03 +0200
Message-Id: <20200514184904.4537-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514184904.4537-1-pvorel@suse.cz>
References: <20200514184904.4537-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] INSTALL: Remove uClinux docs
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

uClinux is not active project any more.

And we have started to remove the code anyway.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/INSTALL b/INSTALL
index f73bec54c..1eda570b5 100644
--- a/INSTALL
+++ b/INSTALL
@@ -241,11 +241,6 @@ PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./c
 * Arch Linux
 PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
 
-uClinux Users
---------------
-Specify UCLINUX=1 when calling make; -DUCLINUX=1 use is deprecated and highly
-discouraged.
-
 Android Users
 -------------
 Specify ANDROID=1 when calling make. Many tests which would otherwise work are
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
