Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55768173513
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:14:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5BB33C6AC8
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:14:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B9BC83C6AD2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:14:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 97D99601F08
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:14:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE256B364
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:14:29 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 Feb 2020 11:14:22 +0100
Message-Id: <20200228101422.31011-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200228101422.31011-1-pvorel@suse.cz>
References: <20200228101422.31011-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] doc: Add note about LAPI headers
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

into the Test Writing Guidelines.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

Maybe some of this text belongs to library-api-writing-guidelines.txt,
not sure.

Kind regards,
Petr

 doc/test-writing-guidelines.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 9ff70b1bc..45bac223f 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -327,6 +327,15 @@ time may vary arbitrarily, for these timeout can be disabled by setting it to
 Test can find out how much time (in seconds) is remaining to timeout,
 by calling 'tst_timeout_remaining()'.
 
+LAPI headers
+++++++++++++
+
+Use our LAPI headers ('include "lapi/foo.h"') to keep compatibility with old distributions.
+LAPI header should always include original header. Older linux headers were problematic,
+therefore we preferred to use libc headers. There are still some bugs when
+combining certain glibc headers with linux headers, see
+https://sourceware.org/glibc/wiki/Synchronizing_Headers.
+
 A word about the cleanup() callback
 +++++++++++++++++++++++++++++++++++
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
