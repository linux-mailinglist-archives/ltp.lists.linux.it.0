Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B6430A83
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:44:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 540323EA1B4
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:44:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AE9223EA0E9
 for <ltp@lists.linux.it>; Fri, 31 May 2019 10:44:21 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 932AE1401B55
 for <ltp@lists.linux.it>; Fri, 31 May 2019 10:44:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,534,1549900800"; d="scan'208";a="65364567"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 May 2019 16:44:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 71D594CD846F
 for <ltp@lists.linux.it>; Fri, 31 May 2019 16:44:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.28) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 31 May 2019 16:44:11 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 31 May 2019 16:44:03 +0800
Message-ID: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: 71D594CD846F.A18C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new and
	old kernels
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

T24gbmV3IGtlcm5lbHMsIGNvcHlfZmlsZV9yYW5nZSgpIHJldHVybmVkIEVJU0RJUiB3aGVuIGNv
cHllZCBjb250ZW50cwp0byBkaXJlY3RvcnksIGJ1dCBvbiBvbGQga2VybmVscywgaXQgcmV0dXJu
ZWQgRUJBREYsIHdlIHNob3VsZCBhY2NlcHQKRUJBREYgdG8gYmUgY29tcGF0aWJsZSB3aXRoIG5l
dyBhbmQgb2xkIGtlcm5lbHMuCgpUaGUgcGF0Y2ggYXMgZm9sbG93czoKY29tbWl0IDExY2JmYjEw
Nzc1YSAoInZmczogZGVueSBjb3B5X2ZpbGVfcmFuZ2UoKSBmb3Igbm9uIHJlZ3VsYXIgZmlsZXMi
KQoKU2lnbmVkLW9mZi1ieTogSmluaHVpIGh1YW5nIDxodWFuZ2poLmp5QGNuLmZ1aml0c3UuY29t
PgotLS0KIC4uLi9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYyAg
IHwgMzMgKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCmluZGV4IDA3
YzAyMDcuLjllNjM1NmMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29w
eV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwpAQCAtNTQsMTkgKzU0
LDMyIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9jb3B5X2ZpbGVfcmFuZ2UodW5zaWduZWQgaW50IG4p
CiAJVEVTVChzeXNfY29weV9maWxlX3JhbmdlKGZkX3NyYywgMCwgKnRjLT5jb3B5X3RvX2ZkLAog
CQkJCTAsIENPTlRTSVpFLCB0Yy0+ZmxhZ3MpKTsKIAotCWlmIChUU1RfUkVUID09IC0xKSB7Ci0J
CWlmICh0Yy0+ZXhwX2VyciA9PSBUU1RfRVJSKSB7CisJaWYgKFRTVF9SRVQgIT0gLTEpIHsKKwkJ
dHN0X3JlcyhURkFJTCwKKwkJCSJjb3B5X2ZpbGVfcmFuZ2UgcmV0dXJuZWQgd3JvbmcgdmFsdWU6
ICVsZCIsIFRTVF9SRVQpOworCQlyZXR1cm47CisJfQorCisJaWYgKHRjLT5leHBfZXJyID09IFRT
VF9FUlIpIHsKKwkJdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8sCisJCQkiY29weV9maWxlX3Jhbmdl
IGZhaWxlZCBhcyBleHBlY3RlZCIpOworCX0gZWxzZSB7CisJCS8qIGNvcHlfZmlsZV9yYW5nZSgp
IHJldHVybmVkIEVJU0RJUiB3aGVuIGNvcHllZCBjb250ZW50cyB0bworCQkgKiBkaXJlY3Rvcnkg
b24gbmV3IGtlcm5lbHMsIGJ1dCBvbiBvbGQga2VybmVscywgaXQgcmV0dXJuZWQKKwkJICogRUJB
REYuCisJCSAqCisJCSAqIHRoZSBwYXRjaCBhcyBmb2xsd3M6CisJCSAqIGNvbW1pdCAxMWNiZmIx
MDc3NWEgKCJ2ZnM6IGRlbnkgY29weV9maWxlX3JhbmdlKCkgZm9yIG5vbiByZWd1bGFyIGZpbGVz
IikKKwkJICovCisJCWlmICh0Yy0+ZXhwX2VyciA9PSBFSVNESVIgJiYgVFNUX0VSUiA9PSBFQkFE
RikgewogCQkJdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8sCi0JCQkJCSJjb3B5X2ZpbGVfcmFuZ2Ug
ZmFpbGVkIGFzIGV4cGVjdGVkIik7Ci0JCX0gZWxzZSB7Ci0JCQl0c3RfcmVzKFRGQUlMIHwgVFRF
UlJOTywKLQkJCQkiY29weV9maWxlX3JhbmdlIGZhaWxlZCB1bmV4cGVjdGVkbHk7IGV4cGVjdGVk
ICVzLCBidXQgZ290IiwKLQkJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKKwkJCQkiY29w
eV9maWxlX3JhbmdlIGZhaWxlZCBhcyBleHBlY3RlZCIpOwogCQkJcmV0dXJuOwogCQl9Ci0JfSBl
bHNlIHsKLQkJdHN0X3JlcyhURkFJTCwKLQkJCSJjb3B5X2ZpbGVfcmFuZ2UgcmV0dXJuZWQgd3Jv
bmcgdmFsdWU6ICVsZCIsIFRTVF9SRVQpOworCisJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLAor
CQkJImNvcHlfZmlsZV9yYW5nZSBmYWlsZWQgdW5leHBlY3RlZGx5OyBleHBlY3RlZCAlcywgYnV0
IGdvdCIsCisJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKIAl9CiB9CiAKLS0gCjEuOC4z
LjEKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
