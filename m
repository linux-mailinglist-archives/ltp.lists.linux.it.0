Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D9D647071
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 14:06:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34CB03CC070
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 14:06:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76F603CC038
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 14:06:53 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E94446009F9
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 14:06:51 +0100 (CET)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NSZCS0w3QzmW6v
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 21:05:56 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 21:06:47 +0800
To: <ltp@lists.linux.it>
Date: Thu, 8 Dec 2022 21:03:48 +0800
Message-ID: <20221208130348.65693-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] config.mk.in: build.sh: Add
 -Wno-missing-field-initializers to CFLAGS
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QWRkIENGTEFHUyAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIHRvIHN1cHByZXNzIHRo
ZQpjb21waWxhdGlvbiB3YXJuaW5ncyBsaWtlOgoKYXV0b2dyb3VwMDEuYzo4NzoxOiB3YXJuaW5n
OiBtaXNzaW5nIGluaXRpYWxpemVyIGZvciBmaWVsZCDigJhuZWVkc19jbWRz4oCZIG9mIOKAmHN0
cnVjdCB0c3RfdGVzdOKAmSBbLVdtaXNzaW5nLWZpZWxkLWluaXRpYWxpemVyc10KIH07CiBeCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBhdXRvZ3JvdXAwMS5jOjIxOjA6Ci4uLy4uLy4uLy4uL2luY2x1
ZGUvdHN0X3Rlc3QuaDozMjQ6MjE6IG5vdGU6IOKAmG5lZWRzX2NtZHPigJkgZGVjbGFyZWQgaGVy
ZQogIGNvbnN0IGNoYXIgKmNvbnN0ICpuZWVkc19jbWRzOwogICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBaaGFvIEdvbmd5aSA8emhhb2dvbmd5aUBodWF3ZWku
Y29tPgotLS0KIGJ1aWxkLnNoICAgICAgICAgICAgICAgIHwgMiArLQogaW5jbHVkZS9tay9jb25m
aWcubWsuaW4gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9idWlsZC5zaCBiL2J1aWxkLnNoCmluZGV4IDE3NjdjYzIx
Yi4uMTc2NzAxMDI0IDEwMDc1NQotLS0gYS9idWlsZC5zaAorKysgYi9idWlsZC5zaApAQCAtNCw3
ICs0LDcgQEAKCiBzZXQgLWUKCi1DRkxBR1M9IiR7Q0ZMQUdTOi0tV2Zvcm1hdCAtV2Vycm9yPWZv
cm1hdC1zZWN1cml0eSAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIC1XZXJy
b3I9cmV0dXJuLXR5cGUgLWZuby1jb21tb259IgorQ0ZMQUdTPSIke0NGTEFHUzotLVdmb3JtYXQg
LVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbiAtV2Vycm9yPXJldHVybi10eXBlIC1mbm8tY29tbW9uIC1Xbm8tbWlzc2luZy1maWVsZC1p
bml0aWFsaXplcnN9IgogQ0M9IiR7Q0M6LWdjY30iCgogREVGQVVMVF9QUkVGSVg9IiRIT01FL2x0
cC1pbnN0YWxsIgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tay9jb25maWcubWsuaW4gYi9pbmNsdWRl
L21rL2NvbmZpZy5tay5pbgppbmRleCAyMjMwMWUxMjYuLjY3MTJiZjIxNSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9tay9jb25maWcubWsuaW4KKysrIGIvaW5jbHVkZS9tay9jb25maWcubWsuaW4KQEAg
LTc2LDcgKzc2LDcgQEAgTERGTEFHUwkJCTo9IEBMREZMQUdTQAogREVCVUdfQ0ZMQUdTCQk/PSAt
ZwoKICMgZm9yIC1mc3RyaWN0LWFsaWFzaW5nIHNlZSBkb2MvYnVpbGQtc3lzdGVtLWd1aWRlLnR4
dAotT1BUX0NGTEFHUwkJPz0gLU8yIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1waXBlCitPUFRfQ0ZM
QUdTCQk/PSAtTzIgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXBpcGUgLVduby1taXNzaW5nLWZpZWxk
LWluaXRpYWxpemVycwoKIFdDRkxBR1MJCQk/PSAtV2FsbCAtVyBAR0NDX1dBUk5fT0xEU1RZTEVA
CgotLQoyLjE3LjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
