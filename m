Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24468349FE8
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 03:46:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8723E3C8E52
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 03:46:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 313393C6030
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 03:46:28 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C25C8200FD1
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 03:46:26 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:63298.1854796540
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-747fce3cd4d141fd85329325cae6729d
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 4599A2800E3;
 Fri, 26 Mar 2021 10:46:27 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 747fce3cd4d141fd85329325cae6729d for
 ltp@lists.linux.it; Fri Mar 26 10:46:28 2021
X-Transaction-ID: 747fce3cd4d141fd85329325cae6729d
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 10:46:12 +0800
Message-Id: <1616726772-29562-1-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/mallopt:fix compiling error
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
Cc: Xinpeng Liu <liuxp11@chinatelecom.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

bWFsbG9wdDAxLmM6MzM6Mzogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYcHJpbnRfbWFsbGluZm/igJkKWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
CiAgIHByaW50X21hbGxpbmZvKCJUZXN0IHVvcmRibGtzIiwgJmluZm8pOwogICAgICBeCi90bXAv
Y2NPVTBzN2UubzogSW4gZnVuY3Rpb24gYHRlc3RfbWFsbG9wdCc6Ci9yb290L215d29yay9sdHBf
Z2l0aHViL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWFsbG9wdC9tYWxsb3B0MDEuYzozNzoK
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcHJpbnRfbWFsbGluZm8nCi9yb290L215d29yay9sdHBf
Z2l0aHViL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWFsbG9wdC9tYWxsb3B0MDEuYzozMzoK
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcHJpbnRfbWFsbGluZm8nCgpTaWduZWQtb2ZmLWJ5OiBY
aW5wZW5nIExpdSA8bGl1eHAxMUBjaGluYXRlbGVjb20uY24+Ci0tLQogdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9tYWxsb3B0L21hbGxvcHQwMS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hbGxv
cHQvbWFsbG9wdDAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hbGxvcHQvbWFsbG9w
dDAxLmMKaW5kZXggOGZmNDY0OS4uYmI3MjM0ZiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9tYWxsb3B0L21hbGxvcHQwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvbWFsbG9wdC9tYWxsb3B0MDEuYwpAQCAtMTMsNiArMTMsNyBAQAogICovCiAKIAorI2Rl
ZmluZSBIQVZFX01BTExJTkZPCiAjaW5jbHVkZSAiLi4vbWFsbGluZm8vbWFsbGluZm9fY29tbW9u
LmgiCiAjaW5jbHVkZSAidHN0X3NhZmVfbWFjcm9zLmgiCiAKLS0gCjEuOC4zLjEKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
