Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918338C4AD
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:26:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A2563C862B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 12:26:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E55C3C19BB
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 215DE201173
 for <ltp@lists.linux.it>; Fri, 21 May 2021 12:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621592742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDfv1L6CKuthNuWMKsrgN6515I1q0S0k7K8LV+de7I0=;
 b=g6+UYb7NjunPtwLJQ+nS3Il3L94hiySCkyCC4oC69L8xCMtrY3KYzoic0NXfSam3DlluuZ
 syBzaTpOg1UIMAC4dd0/fL1isCFOr/YWpUGsJDfaV68YZsfF4dz0K7D1eYXbP9NhxCs0X7
 hadh12yHtFDQ/MNwOp6JnVAAqe7qX9o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3D04AAA6;
 Fri, 21 May 2021 10:25:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 21 May 2021 11:25:27 +0100
Message-Id: <20210521102528.21102-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521102528.21102-1-rpalethorpe@suse.com>
References: <20210521102528.21102-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/6] API/cgroups: tst_require fail gracefully with
 unknown controller
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
 lib/tst_cgroup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 74746f13e..6d94ea41c 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -599,6 +599,12 @@ void tst_cgroup_require(const char *const ctrl_name,
 	struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(ctrl_name);
 	struct cgroup_root *root;
 
+	if (!ctrl) {
+		tst_brk(TBROK, "'%s' controller is unknown to LTP", ctrl_name);
+		tst_brk(TBROK, "Calling %s in cleanup?", __func__);
+		return;
+	}
+
 	if (!options)
 		options = &default_opts;
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
