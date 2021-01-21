Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA6E2FEAF1
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:00:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDB113C3043
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:00:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A6C8A3C303F
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:00:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9B2C21000DD3
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:00:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0D02AB7A;
 Thu, 21 Jan 2021 13:00:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 14:00:32 +0100
Message-Id: <20210121130033.20764-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] docparse: Replace \t with space
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to avoid constant failures because tabs are forbidden in JSON.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

Currently required for "Convert CAN tests to new LTP API" patchset
https://patchwork.ozlabs.org/project/ltp/patch/20210120143723.26483-5-rpalethorpe@suse.com/
https://patchwork.ozlabs.org/project/ltp/patch/20210120143723.26483-6-rpalethorpe@suse.com/

Kind regards,
Petr

 docparse/data_storage.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index ef420c08f..99c2514b7 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -54,6 +54,7 @@ static inline struct data_node *data_node_string(const char *string)
 {
 	size_t size = sizeof(struct data_node_string) + strlen(string) + 1;
 	struct data_node *node = malloc(size);
+	char *ix = node->string.val;
 
 	if (!node)
 		return NULL;
@@ -61,6 +62,9 @@ static inline struct data_node *data_node_string(const char *string)
 	node->type = DATA_STRING;
 	strcpy(node->string.val, string);
 
+	while ((ix = strchr(ix, '\t')))
+		*ix++ = ' ';
+
 	return node;
 }
 
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
