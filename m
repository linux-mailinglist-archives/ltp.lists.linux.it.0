Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4D153E73
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 07:06:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B41A73C2546
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 07:06:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1162D3C12A1
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 07:06:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E2048601F58
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 07:06:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,408,1574092800"; d="scan'208";a="82946698"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Feb 2020 14:06:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E71E150A9970;
 Thu,  6 Feb 2020 13:57:14 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 6 Feb 2020 14:06:39 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 6 Feb 2020 14:06:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 6 Feb 2020 14:04:33 +0800
Message-ID: <1580969073-27367-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E71E150A9970.AD6E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] syscalls/fcntl37: add error test for fcntl
 with F_SETPIPE_SZ
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LS0tLS0tLS0tLS0tLQp2Mi0+djPvvJoKZml4IHRoaW5ncyBwb2ludGVkIGJ5IEN5cmlsCi0tLS0t
LS0tLS0tCgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3Uu
Y29tPgotLS0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICsKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvLmdpdGlnbm9yZSB8ICAyICsKIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzNy5jICB8IDk4ICsrKysrKysrKysr
KysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzcuYwoKZGlm
ZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDA3NDNj
ZjRlMy4uNTc3YTRhNTI3IDEwMDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRl
c3Qvc3lzY2FsbHMKQEAgLTMwMSw2ICszMDEsOCBAQCBmY250bDM1IGZjbnRsMzUKIGZjbnRsMzVf
NjQgZmNudGwzNV82NAogZmNudGwzNiBmY250bDM2CiBmY250bDM2XzY0IGZjbnRsMzZfNjQKK2Zj
bnRsMzcgZmNudGwzNworZmNudGwzN182NCBmY250bDM3XzY0CiAKIGZkYXRhc3luYzAxIGZkYXRh
c3luYzAxCiBmZGF0YXN5bmMwMiBmZGF0YXN5bmMwMgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9mY250bC8uZ2l0aWdub3JlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9mY250bC8uZ2l0aWdub3JlCmluZGV4IDhkNTczOGY5Ny4uYmU4ZDk3MzllIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsLy5naXRpZ25vcmUKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC8uZ2l0aWdub3JlCkBAIC03MCwzICs3MCw1IEBACiAv
ZmNudGwzNV82NAogL2ZjbnRsMzYKIC9mY250bDM2XzY0CisvZmNudGwzNworL2ZjbnRsMzdfNjQK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzNy5jIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDM3LmMKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwLi5jNTJhZjIyZGQKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzcuYwpAQCAtMCwwICsxLDk4IEBACisv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorLyoKKyAqIENvcHly
aWdodCAoYykgMjAyMCBGVUpJVFNVIExJTUlURUQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisgKiBB
dXRob3I6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uanVqaXRzdS5jb20+CisgKgorICogVGVz
dCBiYXNpYyBlcnJvciBoYW5kbGluZyBmb3IgZmNudGwoMikgdXNpbmcgRl9TRVRQSVBFX1NaLCBG
X0dFVFBJUEVfU1oKKyAqIGFyZ3VtZW50LgorICogMSlmY250bCBmYWlscyB3aXRoIEVJTlZBTCB3
aGVuIGNtZCBpcyBGX1NFVFBJUEVfU1ogYW5kIHRoZSBhcmcgaXMKKyAqIGJleW9uZCAxPDwzMS4K
KyAqIDIpZmNudGwgZmFpbHMgd2l0aCBFQlVTWSB3aGVuIGNtZCBpcyBGX1NFVFBJUEVfU1ogYW5k
IHRoZSBhcmcgaXMgc21hbGxlcgorICogdGhhbiB0aGUgYW1vdW50IG9mIHRoZSBjdXJyZW50IHVz
ZWQgYnVmZmVyIHNwYWNlLgorICogMylmY250bCBmYWlscyB3aXRoIEVQRVJNIHdoZW4gY21kIGlz
IEZfU0VUUElQRV9TWiBhbmQgdGhlIGFyZyBpcyBvdmVyCisgKiAvcHJvYy9zeXMvZnMvcGlwZS1t
YXgtc2l6ZSBsaW1pdCB1bmRlciB1bnByaXZpbGVnZWQgdXNlcnMuCisgKi8KKworI2luY2x1ZGUg
PHVuaXN0ZC5oPgorI2luY2x1ZGUgPGZjbnRsLmg+CisjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cisj
aW5jbHVkZSA8bGltaXRzLmg+CisjaW5jbHVkZSA8c3RkbGliLmg+CisjaW5jbHVkZSAidHN0X3Rl
c3QuaCIKKyNpbmNsdWRlICJsYXBpL2ZjbnRsLmgiCisjaW5jbHVkZSAibGFwaS9jYXBhYmlsaXR5
LmgiCisKK3N0YXRpYyBpbnQgZmRzWzJdOworc3RhdGljIHVuc2lnbmVkIGludCBpbnZhbGlkX3Zh
bHVlLCBoYWxmX3ZhbHVlLCBzeXNfdmFsdWU7CisKK3N0YXRpYyBzdHJ1Y3QgdGNhc2UgeworCXVu
c2lnbmVkIGludCAqc2V0dmFsdWU7CisJaW50IGV4cF9lcnI7CisJY2hhciAqbWVzc2FnZTsKK30g
dGNhc2VzW10gPSB7CisJeyZpbnZhbGlkX3ZhbHVlLCBFSU5WQUwsICJGX1NFVFBJUEVfU1ogYW5k
IHNpemUgaXMgYmV5b25kIDE8PDMxIn0sCisJeyZoYWxmX3ZhbHVlLCBFQlVTWSwgIkZfU0VUUElQ
RV9TWiBhbmQgc2l6ZSA8IGRhdGEgc3RvcmVkIGluIHBpcGUifSwKKwl7JnN5c192YWx1ZSwgRVBF
Uk0sICJGX1NFVFBJUEVfU1ogYW5kIHNpemUgaXMgb3ZlciBsaW1pdCBmb3IgdW5wcml2aWxlZGdl
ZCB1c2VyIn0sCit9OworCitzdGF0aWMgdm9pZCB2ZXJpZnlfZmNudGwodW5zaWduZWQgaW50IG4p
Cit7CisJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07CisKKwl0c3RfcmVzKFRJTkZPLCAi
JXMiLCB0Yy0+bWVzc2FnZSk7CisKKwlURVNUKGZjbnRsKGZkc1sxXSwgRl9TRVRQSVBFX1NaLCAq
KHRjLT5zZXR2YWx1ZSkpKTsKKwlpZiAoVFNUX1JFVCAhPSAtMSkgeworCQl0c3RfcmVzKFRGQUlM
LCAiRl9TRVRQSVBFX1NaIHN1Y2NlZWQgYW5kIHJldHVybiAlbGQiLCBUU1RfUkVUKTsKKwkJcmV0
dXJuOworCX0KKwlpZiAoVFNUX0VSUiA9PSB0Yy0+ZXhwX2VycikKKwkJdHN0X3JlcyhUUEFTUyB8
IFRURVJSTk8sICJGX1NFVFBJUEVfU1ogZmFpbGVkIGFzIGV4cGVjdGVkIik7CisJZWxzZQorCQl0
c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgIkZfU0VUUElQRV9TWiBmYWlsZWQgZXhwZWN0ZWQgJXMg
Z290IiwKKwkJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKK30KKworc3RhdGljIHZvaWQg
c2V0dXAodm9pZCkKK3sKKwljaGFyICp3cmJ1ZjsKKwl1bnNpZ25lZCBpbnQgb3JpZ192YWx1ZTsK
KworCVNBRkVfUElQRShmZHMpOworCisJVEVTVChmY250bChmZHNbMV0sIEZfR0VUUElQRV9TWikp
OworCWlmIChUU1RfRVJSID09IEVJTlZBTCkKKwkJdHN0X2JyayhUQ09ORiwgImtlcm5lbCBkb2Vz
bid0IHN1cHBvcnQgRl9HRVQvU0VUUElQRV9TWiIpOworCisJb3JpZ192YWx1ZSA9IFRTVF9SRVQ7
CisKKwl3cmJ1ZiA9IFNBRkVfTUFMTE9DKG9yaWdfdmFsdWUpOworCW1lbXNldCh3cmJ1ZiwgJ3gn
LCBvcmlnX3ZhbHVlKTsKKwlTQUZFX1dSSVRFKDEsIGZkc1sxXSwgd3JidWYsIG9yaWdfdmFsdWUp
OworCWZyZWUod3JidWYpOworCisJU0FGRV9GSUxFX1NDQU5GKCIvcHJvYy9zeXMvZnMvcGlwZS1t
YXgtc2l6ZSIsICIlZCIsICZzeXNfdmFsdWUpOworCXN5c192YWx1ZSsrOworCisJaGFsZl92YWx1
ZSA9IG9yaWdfdmFsdWUgLyAyOworCWludmFsaWRfdmFsdWUgPSAoMVUgPDwgMzEpICsgMTsKK30K
Kworc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQoreworCWlmIChmZHNbMF0gPiAwKQorCQlTQUZF
X0NMT1NFKGZkc1swXSk7CisJaWYgKGZkc1sxXSA+IDApCisJCVNBRkVfQ0xPU0UoZmRzWzFdKTsK
K30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS5zZXR1cCA9IHNldHVwLAor
CS5jbGVhbnVwID0gY2xlYW51cCwKKwkudGNudCA9IEFSUkFZX1NJWkUodGNhc2VzKSwKKwkudGVz
dCA9IHZlcmlmeV9mY250bCwKKwkuY2FwcyA9IChzdHJ1Y3QgdHN0X2NhcCBbXSkgeworCQlUU1Rf
Q0FQKFRTVF9DQVBfRFJPUCwgQ0FQX1NZU19SRVNPVVJDRSksCisJCXt9CisJfSwKK307Ci0tIAoy
LjE4LjAKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
