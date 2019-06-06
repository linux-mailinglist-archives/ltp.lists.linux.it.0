Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCD371C4
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 12:31:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFD75390334
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 12:31:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0A6BE3EA442
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 12:31:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1A1391A0172A
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 12:31:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,558,1557158400"; d="scan'208";a="66217970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 18:31:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 424D54CDD0CA
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 18:31:33 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 6 Jun 2019 18:31:31 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 6 Jun 2019 18:31:20 +0800
Message-ID: <1559817080-2991-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 424D54CDD0CA.AF3C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] sysctl/sysctl02: Add new regression test for overflow
	file-max
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gdXBzdHJlYW0ga2VybmVsLCBiZWZvcmUgY29tbWl0WzFdLCB0aGUgbWF4IHZhbHVlIGluIHBy
b2NfZ2V0X2xvbmcgYmFzZWQgb24KdGhlIG51bWJlciBvZiBjaGFycygyMSkuIEl0IHJlamVjdHMg
dmFsdWVzIHN1Y2ggYXMgMTg0NDY3NDQwNzM3MDk1NTE2MTYwICgyMSBjaGFycykKYnV0IGFjY2Vw
dHMgdmFsdWVzIHN1Y2ggYXMgMTg0NDY3NDQwNzM3MDk1NTE2MTYgKDIwIGNoYXJzKS4gQnV0IHdl
IHNob3VsZCByZWplY3QgYWxsCmJlY2F1c2UgYm90aCBhcmUgb3ZlcmZsb3dzLiBBZnRlciB0aGlz
IGNvbW1pdCx0aGUgcGVybWl0dGVkIG1heCB2YWx1ZSBpcyAyXjY0LTEuCgpCZWZvcmUgY29tbWl0
WzJdLCB3aGVuIHdyaXRpbmcgZWNobyAxODQ0Njc0NDA3MzcwOTU1MTYxNiA+IC9wcm9jL3N5cy9m
cy9maWxlLW1heAovcHJvYy9zeXMvZnMvZmlsZS1tYXggd2lsbCBvdmVyZmxvdyBhbmQgYmUgc2V0
IHRvIDAuICBJdCBtYXkgY3Jhc2ggdGhlIHN5c3RlbS4gVGhpcwpjb21taXQgc2V0cyB0aGUgbWF4
IGFuZCBtaW4gdmFsdWUgZm9yIGZpbGUtbWF4LiBBZnRlciB0aGlzIGNvbW1pdCx0aGUgcGVybWl0
dGVkIG1heAp2YWx1ZSBpcyAyXjYzLTEuCgpVbmZvcnR1bmF0ZWx5LCBjb21taXRbMl0gaW50cm9k
dWNlZCBhIG5ldyBidWcgYmVjYXVzZSB0aGUgbWluaW11bSB2YWx1ZSBwb2ludHMgYXQKdGhlIGds
b2JhbCAnemVybycgdmFyaWFibGUgd2hpY2ggaXMgYW4gaW50LiBJdCBtYXkgY3Jhc2ggc3lzdGVt
LiBUaGlzIGJ1ZyBoYXMgYmVlbiBmaXhlZApidCBjb21taXRbM10uCgpJIHdpbGwgc2V0IDJeNjQg
LDJeNjQtMSwyXjYzIGFuZCAwIHRvIGZpbGUtbWF4IGluIGNhc2UgYW5kIHRlc3QgaXQuCgpbMV1o
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD03ZjI5MjNjNGY3M2YyMWNmZDcxNGQxMmEyZDQ4ZGU4YzIxZjEx
Y2ZlClsyXWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTMyYTVhZDljMjI4NTJlNmJkOWU3NGJkZWM1OTM0
ZWY5ZDE0ODBiYzUKWzNdaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9OTAwMmIyMTQ2NWZhNGQ4MjllZGZj
OTRhNWE0NDEwMDVjZmZhYTk3MgoKU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5q
eUBjbi5mdWppdHN1LmNvbT4KLS0tCiBydW50ZXN0L2NvbW1hbmRzICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiB0ZXN0Y2FzZXMvY29tbWFuZHMvc3lzY3RsL3N5c2N0bDAxLnNoIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9ydW50ZXN0L2NvbW1hbmRzIGIvcnVudGVzdC9jb21tYW5kcwppbmRleCBhYzE1ZThiMjMu
LjE4NzBjNDIwOSAxMDA2NDQKLS0tIGEvcnVudGVzdC9jb21tYW5kcworKysgYi9ydW50ZXN0L2Nv
bW1hbmRzCkBAIC00MCwzICs0MCw0IEBAIGtleWN0bDAxX3NoIGtleWN0bDAxLnNoCiBnZGIwMV9z
aCBnZGIwMS5zaAogdW5zaGFyZTAxX3NoIHVuc2hhcmUwMS5zaAogc3lzY3RsMDFfc2ggc3lzY3Rs
MDEuc2gKK3N5c2N0bDAyX3NoIHN5c2N0bDAyLnNoCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY29t
bWFuZHMvc3lzY3RsL3N5c2N0bDAxLnNoIGIvdGVzdGNhc2VzL2NvbW1hbmRzL3N5c2N0bC9zeXNj
dGwwMS5zaAppbmRleCA3NTIyZGE1M2QuLmJmODlhNmQ4ZCAxMDA3NTUKLS0tIGEvdGVzdGNhc2Vz
L2NvbW1hbmRzL3N5c2N0bC9zeXNjdGwwMS5zaAorKysgYi90ZXN0Y2FzZXMvY29tbWFuZHMvc3lz
Y3RsL3N5c2N0bDAxLnNoCkBAIC0xLDUgKzEsNSBAQAogIyEvYmluL3NoCi0KKyMKICMgQ29weXJp
Z2h0IChjKSAyMDE4IEZVSklUU1UgTElNSVRFRC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KICMgQXV0
aG9yOiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgogIwotLSAKMi4xOC4xCgoK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
