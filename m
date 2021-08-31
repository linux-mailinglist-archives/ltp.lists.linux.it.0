Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05A3FC705
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:26:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D76763C939E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:26:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 247233C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:26:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64B706008AA
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:26:16 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E932522236;
 Tue, 31 Aug 2021 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630412775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBsHMFQoXm4K2IRCBkfKl8Y0mCFAIAkSTPkPVbxGZpE=;
 b=Hy+2HzmO4jDZKWxv4tpXddQWduEDH+n0JwWyueA602+QvWPG3YMel0Q7cWsABymHwzXyAp
 2OfDLOss2IsHvz/eJEm/1Jqyo4ZClQiX87PhJfBQ5kMAbnIA1Zq+lURqBcvnba1EPu9P/c
 ZvCVI5xEgSd4OUjMlm0CC7h9OW7nBeQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id B156EA3B9E;
 Tue, 31 Aug 2021 12:26:15 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 13:25:54 +0100
Message-Id: <20210831122554.14590-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831122554.14590-1-rpalethorpe@suse.com>
References: <20210831122554.14590-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] docs: Fix typo 'entires' -> 'entries'
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/test-writing-guidelines.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index e95373e84..12fe4922a 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -307,7 +307,7 @@ NOTE: See also
 1. Test compiles and runs fine (check with `-i 10` too)
 2. `make check` does not emit any warnings for the test you are working on
    (hint: run it in the test's directory and/or use `make check-$TCID`)
-3. The runtest entires are in place
+3. The runtest entries are in place
 4. Test binaries are added into corresponding '.gitignore' files
 5. Patches apply over the latest git
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
