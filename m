Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 191612FD2D2
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:38:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8695F3C7C9E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:38:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 219653C24E4
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D5C2F600C73
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611153458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8bxkecA30vKpvKXV5/2+zt45Y6vrE4AWViiGp85qzs=;
 b=XthkpOnZxxtc//TIr/0+IE/0iE77xtWE/aVa3MZIHQjYwbEhjNNXGOCLaRWDqt3cnJjGFf
 AjYaR8sU1jwYvCtB+PWHrR43eG9ejq7euylHE0vQdHgP6wjowLKDNllTzeYfD2FJTlnQny
 N7jSaKnGLazS+AR/i+8sXsms/eLqOR0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 790A5ACE1;
 Wed, 20 Jan 2021 14:37:38 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 20 Jan 2021 14:37:19 +0000
Message-Id: <20210120143723.26483-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120143723.26483-1-rpalethorpe@suse.com>
References: <20210120143723.26483-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/7] can: Add COPYING with dual license text
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
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This may be referred to with

SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)

The kernel version includes the syscall note, but the contents of the
syscall note have never been included within the LTP CAN tests.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/network/can/filter-tests/COPYING | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 testcases/network/can/filter-tests/COPYING

diff --git a/testcases/network/can/filter-tests/COPYING b/testcases/network/can/filter-tests/COPYING
new file mode 100644
index 000000000..2fa5eb911
--- /dev/null
+++ b/testcases/network/can/filter-tests/COPYING
@@ -0,0 +1,35 @@
+Copyright (c) 2010-2011 Volkswagen Group Electronic Research
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+3. Neither the name of Volkswagen nor the names of its contributors
+   may be used to endorse or promote products derived from this software
+   without specific prior written permission.
+
+Alternatively, provided that this notice is retained in full, this
+software may be distributed under the terms of the GNU General
+Public License ("GPL") version 2, in which case the provisions of the
+GPL apply INSTEAD OF those given above.
+
+The provided data structures and external interfaces from this code
+are not restricted to be used by modules with a GPL compatible license.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
