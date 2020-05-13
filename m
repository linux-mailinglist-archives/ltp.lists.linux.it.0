Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F11D0454
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 03:32:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1E3A3C25A2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 03:32:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 925F03C24DD
 for <ltp@lists.linux.it>; Wed, 13 May 2020 03:32:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7D40E600AA9
 for <ltp@lists.linux.it>; Wed, 13 May 2020 03:32:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,385,1583164800"; d="scan'208";a="91969228"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 09:32:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 27A0F4BCC89B;
 Wed, 13 May 2020 09:32:17 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 09:32:16 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 13 May 2020 09:32:16 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 13 May 2020 09:26:25 +0800
Message-ID: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 27A0F4BCC89B.ACAB0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
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
IGJ5IGZjbnRsKDIpLgoKQlRXOgpJIHRyaWVkIHRvIHBhc3MgKGxvbmcpIFRTVF9SRVQgdG8gZmNu
dGwoKSBidXQgdHJpZ2dlcmVkIHRoZSBmb2xsb3dpbmcKY29tcGlsZXIgd2FybmluZywgc28gcGFz
cyAoaW50KSBwaWRmZCBpbnN0ZWFkLgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBpZGZkX29wZW4wMS5j
Ojk6CnBpZGZkX29wZW4wMS5jOiBJbiBmdW5jdGlvbiDigJhydW7igJk6Ci4uLy4uLy4uLy4uL2lu
Y2x1ZGUvdHN0X3Rlc3QuaDo3Njo0MTogd2FybmluZzogZm9ybWF0IOKAmCVp4oCZIGV4cGVjdHMg
YXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBlIOKAmGxv
bmcgaW504oCZIFstV2Zvcm1hdD1dCiAgIDc2IHwgICB0c3RfYnJrXyhfX0ZJTEVfXywgX19MSU5F
X18sICh0dHlwZSksIChhcmdfZm10KSwgIyNfX1ZBX0FSR1NfXyk7XAogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KLi4vLi4vLi4vLi4vaW5j
bHVkZS90c3Rfc2FmZV9tYWNyb3MuaDoyMjQ6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmHRzdF9icmvigJkKICAyMjQgfCAgICAgdHN0X2JyayhUQlJPSyB8IFRFUlJOTywgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKICAgICAgfCAgICAgXn5+fn5+fgpwaWRmZF9vcGVuMDEuYzoy
MDo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYU0FGRV9GQ05UTOKAmQogICAyMCB8
ICBmbGFnID0gU0FGRV9GQ05UTChUU1RfUkVULCBGX0dFVEZEKTsKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpTaWduZWQtb2ZmLWJ5OiBYaWFv
IFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgpSZXZpZXdlZC1ieTogVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3BpZGZkX29wZW4vcGlkZmRfb3BlbjAxLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEuYyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcGlkZmRfb3Blbi9waWRmZF9vcGVuMDEuYwppbmRleCA5M2JiODY2ODcuLmJh
MTU4MGJjNyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9vcGVu
L3BpZGZkX29wZW4wMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfb3Bl
bi9waWRmZF9vcGVuMDEuYwpAQCAtMTEsMTMgKzExLDIwIEBACiAKIHN0YXRpYyB2b2lkIHJ1bih2
b2lkKQogewotCVRFU1QocGlkZmRfb3BlbihnZXRwaWQoKSwgMCkpOworCWludCBwaWRmZCwgZmxh
ZzsKKworCVRFU1QocGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7CiAKIAlpZiAoVFNU
X1JFVCA9PSAtMSkKIAkJdHN0X2JyayhURkFJTCB8IFRURVJSTk8sICJwaWRmZF9vcGVuKGdldHBp
ZCgpLCAwKSBmYWlsZWQiKTsKIAorCWZsYWcgPSBTQUZFX0ZDTlRMKHBpZGZkLCBGX0dFVEZEKTsK
KwogCVNBRkVfQ0xPU0UoVFNUX1JFVCk7CiAKKwlpZiAoIShmbGFnICYgRkRfQ0xPRVhFQykpCisJ
CXRzdF9icmsoVEZBSUwsICJwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSBkaWRuJ3Qgc2V0IGNsb3Nl
LW9uLWV4ZWMgZmxhZyIpOworCiAJdHN0X3JlcyhUUEFTUywgInBpZGZkX29wZW4oZ2V0cGlkKCks
IDApIHBhc3NlZCIpOwogfQogCi0tIAoyLjIxLjAKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
