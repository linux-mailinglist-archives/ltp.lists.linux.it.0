Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720F1BF3AE
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:03:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C00DE3C5E67
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:03:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 309083C27D8
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:03:36 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 42F861000A23
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:03:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,334,1583164800"; d="scan'208";a="90845427"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 17:03:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 2C6104BCC8A8;
 Thu, 30 Apr 2020 17:03:21 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 17:03:21 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 30 Apr 2020 17:03:23 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 30 Apr 2020 16:57:41 +0800
Message-ID: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2C6104BCC8A8.AA45E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

cGlkZmRfb3BlbigyKSB3aWxsIHNldCBjbG9zZS1vbi1leGVjIGZsYWcgb24gdGhlIGZpbGUgZGVz
Y3JpcHRvciBhcyBpdAptYW5wYWdlIHN0YXRlcywgc28gY2hlY2sgY2xvc2Utb24tZXhlYyBmbGFn
IGJ5IGZjbnRsKDIpLgoKQWxzbyBhdm9pZCBjb21waWxlciB3YXJuaW5nIGJ5IHJlcGxhY2luZyAo
bG9uZykgVFNUX1JFVCB3aXRoIChpbnQpIHBpZGZkOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBpZGZk
X29wZW4wMS5jOjk6CnBpZGZkX29wZW4wMS5jOiBJbiBmdW5jdGlvbiDigJhydW7igJk6Ci4uLy4u
Ly4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDo3Njo0MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZ
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0
eXBlIOKAmGxvbmcgaW504oCZIFstV2Zvcm1hdD1dCiAgIDc2IHwgICB0c3RfYnJrXyhfX0ZJTEVf
XywgX19MSU5FX18sICh0dHlwZSksIChhcmdfZm10KSwgIyNfX1ZBX0FSR1NfXyk7XAogICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KLi4vLi4v
Li4vLi4vaW5jbHVkZS90c3Rfc2FmZV9tYWNyb3MuaDoyMjQ6NTogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmHRzdF9icmvigJkKICAyMjQgfCAgICAgdHN0X2JyayhUQlJPSyB8IFRFUlJO
TywgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgfCAgICAgXn5+fn5+fgpwaWRmZF9v
cGVuMDEuYzoyMDo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYU0FGRV9GQ05UTOKA
mQogICAyMCB8ICBmbGFnID0gU0FGRV9GQ05UTChUU1RfUkVULCBGX0dFVEZEKTsKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpTaWduZWQtb2Zm
LWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgotLS0KIC4uLi9rZXJuZWwv
c3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEuYyAgfCAxOCArKysrKysrKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVu
MDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEu
YwppbmRleCA5M2JiODY2ODcuLjI5M2U5M2I2MyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEuYwpAQCAtNiwxNyArNiwyNyBAQAog
ICogQmFzaWMgcGlkZmRfb3BlbigpIHRlc3QsIGZldGNoZXMgdGhlIFBJRCBvZiB0aGUgY3VycmVu
dCBwcm9jZXNzIGFuZCB0cmllcyB0bwogICogZ2V0IGl0cyBmaWxlIGRlc2NyaXB0b3IuCiAgKi8K
KworI2luY2x1ZGUgPHN5cy90eXBlcy5oPgorI2luY2x1ZGUgPHVuaXN0ZC5oPgorI2luY2x1ZGUg
PGZjbnRsLmg+CiAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKICNpbmNsdWRlICJsYXBpL3BpZGZkX29w
ZW4uaCIKIAogc3RhdGljIHZvaWQgcnVuKHZvaWQpCiB7Ci0JVEVTVChwaWRmZF9vcGVuKGdldHBp
ZCgpLCAwKSk7CisJaW50IHBpZGZkID0gMCwgZmxhZyA9IDA7CisKKwlwaWRmZCA9IHBpZGZkX29w
ZW4oZ2V0cGlkKCksIDApOworCWlmIChwaWRmZCA9PSAtMSkKKwkJdHN0X2JyayhURkFJTCB8IFRF
UlJOTywgInBpZGZkX29wZW4oZ2V0cGlkKCksIDApIGZhaWxlZCIpOworCisJZmxhZyA9IFNBRkVf
RkNOVEwocGlkZmQsIEZfR0VURkQpOwogCi0JaWYgKFRTVF9SRVQgPT0gLTEpCi0JCXRzdF9icmso
VEZBSUwgfCBUVEVSUk5PLCAicGlkZmRfb3BlbihnZXRwaWQoKSwgMCkgZmFpbGVkIik7CisJU0FG
RV9DTE9TRShwaWRmZCk7CiAKLQlTQUZFX0NMT1NFKFRTVF9SRVQpOworCWlmICghKGZsYWcgJiBG
RF9DTE9FWEVDKSkKKwkJdHN0X2JyayhURkFJTCwgInBpZGZkX29wZW4oZ2V0cGlkKCksIDApIGRp
ZG4ndCBzZXQgY2xvc2Utb24tZXhlYyBmbGFnIik7CiAKIAl0c3RfcmVzKFRQQVNTLCAicGlkZmRf
b3BlbihnZXRwaWQoKSwgMCkgcGFzc2VkIik7CiB9Ci0tIAoyLjIxLjAKCgoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
