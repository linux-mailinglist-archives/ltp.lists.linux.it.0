Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E563780A0
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 11:56:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC3293C5759
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 11:56:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F26E63C21FE
 for <ltp@lists.linux.it>; Mon, 10 May 2021 11:56:24 +0200 (CEST)
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2C3D160081E
 for <ltp@lists.linux.it>; Mon, 10 May 2021 11:56:20 +0200 (CEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((LNX1044)) with ASMTP (SSL) id EGP00011
 for <ltp@lists.linux.it>; Mon, 10 May 2021 17:56:11 +0800
Received: from localhost.localdomain (10.48.66.98) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server id
 15.1.2176.2; Mon, 10 May 2021 17:56:12 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Mon, 10 May 2021 05:56:09 -0400
Message-ID: <20210510095609.20128-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.48.66.98]
tUid: 20215101756112b12dba1115e38c9bc946b45356cba1b
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] bugfix for block_dev_kernel/ltp_block_dev.c
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
Cc: dongshijiang <dongshijiang@inspur.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QWRkIGdlbmhkLmggYW5kIGJsa2Rldi5oIHRvIGx0cF9ibG9ja19kZXYuYy4KCkZhaWxlZCBhdCBj
b21waWxlIHRpbWUgb24ga2VybmVsIDUuMTIgZHVlIHRvIGNoYW5nZSBvZiByZWdpc3Rlcl9ibGtk
ZXYgZnVuY3Rpb24gZGVmaW5pdGlvbiBmcm9tIGxpbnV4L2ZzLmggdG8gbGludXgvZ2VuaGQuaCBh
bmQgZmFpbHVyZSBvZiB0ZXN0IGNhc2UgdGMwNSxUaGUgcmVhc29uIGlzIHRoYXQgdGhlIEJMS0RF
Vl9NQUpPUl9NQVggZGVmaW5pdGlvbiB3YXMgY2hhbmdlZCBmcm9tIGZzLmggdG8gYmxrZGV2LmgK
ClNpZ25lZC1vZmYtYnk6IGRvbmdzaGlqaWFuZyA8ZG9uZ3NoaWppYW5nQGluc3B1ci5jb20+Ci0t
LQogLi4uL2RldmljZS1kcml2ZXJzL2Jsb2NrL2Jsb2NrX2Rldl9rZXJuZWwvbHRwX2Jsb2NrX2Rl
di5jICAgICAgIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYmxvY2svYmxvY2tfZGV2X2tl
cm5lbC9sdHBfYmxvY2tfZGV2LmMgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2Js
b2NrL2Jsb2NrX2Rldl9rZXJuZWwvbHRwX2Jsb2NrX2Rldi5jCmluZGV4IGM3Yzg2ODNhMi4uMTcw
NDdjMGQ1IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2Jsb2Nr
L2Jsb2NrX2Rldl9rZXJuZWwvbHRwX2Jsb2NrX2Rldi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
ZGV2aWNlLWRyaXZlcnMvYmxvY2svYmxvY2tfZGV2X2tlcm5lbC9sdHBfYmxvY2tfZGV2LmMKQEAg
LTEyLDYgKzEyLDggQEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51
eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9mcy5oPgorI2luY2x1ZGUgPGxpbnV4L2dlbmhk
Lmg+CisjaW5jbHVkZSA8bGludXgvYmxrZGV2Lmg+CgogTU9EVUxFX0FVVEhPUigiTcOhcnRvbiBO
w6ltZXRoIDxubTEyN0BmcmVlbWFpbC5odT4iKTsKIE1PRFVMRV9BVVRIT1IoIkNvcHlyaWdodCAo
YykgMjAxMyBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzIik7Ci0tCjIuMTguMgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
