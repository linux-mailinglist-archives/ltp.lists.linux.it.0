Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98E23D9A5
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 13:08:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE82B3C320B
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 13:08:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6A9573C13DC
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 13:08:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1D4AC14070B7
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 13:08:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CF1AABE9
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 11:08:24 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Aug 2020 13:08:05 +0200
Message-Id: <20200806110806.28793-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add some 32-bit instruction macros to BPF LAPI
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/lapi/bpf.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/lapi/bpf.h b/include/lapi/bpf.h
index 22b13b47b..f27a92146 100644
--- a/include/lapi/bpf.h
+++ b/include/lapi/bpf.h
@@ -449,6 +449,14 @@ enum bpf_func_id {
 		.off   = 0,					\
 		.imm   = 0 })
 
+#define BPF_ALU32_REG(OP, DST, SRC)				\
+	((struct bpf_insn) {					\
+		.code  = BPF_ALU | BPF_OP(OP) | BPF_X,		\
+		.dst_reg = DST,					\
+		.src_reg = SRC,					\
+		.off   = 0,					\
+		.imm   = 0 })
+
 #define BPF_ALU64_IMM(OP, DST, IMM)				\
 	((struct bpf_insn) {					\
 		.code  = BPF_ALU64 | BPF_OP(OP) | BPF_K,	\
@@ -457,6 +465,14 @@ enum bpf_func_id {
 		.off   = 0,					\
 		.imm   = IMM })
 
+#define BPF_ALU32_IMM(OP, DST, IMM)				\
+	((struct bpf_insn) {					\
+		.code  = BPF_ALU | BPF_OP(OP) | BPF_K,		\
+		.dst_reg = DST,					\
+		.src_reg = 0,					\
+		.off   = 0,					\
+		.imm   = IMM })
+
 #define BPF_MOV64_REG(DST, SRC)					\
 	((struct bpf_insn) {					\
 		.code  = BPF_ALU64 | BPF_MOV | BPF_X,		\
@@ -465,6 +481,14 @@ enum bpf_func_id {
 		.off   = 0,					\
 		.imm   = 0 })
 
+#define BPF_MOV32_REG(DST, SRC)					\
+	((struct bpf_insn) {					\
+		.code  = BPF_ALU | BPF_MOV | BPF_X,		\
+		.dst_reg = DST,					\
+		.src_reg = SRC,					\
+		.off   = 0,					\
+		.imm   = 0 })
+
 #define BPF_LD_IMM64(DST, IMM)					\
 	BPF_LD_IMM64_RAW(DST, 0, IMM)
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
