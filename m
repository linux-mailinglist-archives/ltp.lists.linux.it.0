Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02C2FEAF0
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:00:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DF563C6387
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:00:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 49A053C303F
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:00:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 93BD2600446
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:00:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DBD1ABD6
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 13:00:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 14:00:33 +0100
Message-Id: <20210121130033.20764-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121130033.20764-1-pvorel@suse.cz>
References: <20210121130033.20764-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] testinfo.pl: Optimize imports
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index b636b3c0e..b5ab02bc1 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -6,8 +6,7 @@
 use strict;
 use warnings;
 
-use JSON;
-use LWP::Simple;
+use JSON qw(decode_json);
 use Cwd qw(abs_path);
 use File::Basename qw(dirname);
 
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
