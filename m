Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEFF145439
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 13:12:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E6CF3C2368
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 13:12:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 052503C1D4A
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 13:12:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B20991000BDB
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 13:12:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,349,1574092800"; d="scan'208";a="82467890"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 20:12:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5B87149DAEFC
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 17:37:49 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 17:47:02 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Jan 2020 17:47:07 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 22 Jan 2020 17:47:22 +0800
Message-ID: <1579686442-24689-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579686442-24689-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1579686442-24689-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 5B87149DAEFC.A261E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/fcntl37: add error test for fcntl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LS0tLS0tLS0tLS0tLQp2MS0+djLvvJoKY29kZSBzdHlsZSBhbmQgY29tbWVudCBmaXgKLS0tLS0t
LS0tLS0KClNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5j
b20+Ci0tLQogcnVudGVzdC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICsKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvLmdpdGlnbm9yZSB8ICAgMiArCiB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzcuYyAgfCAxMDEgKysrKysrKysr
KysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDM3LmMKCmRp
ZmYgLS1naXQgYS9ydW50ZXN0L3N5c2NhbGxzIGIvcnVudGVzdC9zeXNjYWxscwppbmRleCBmNThm
ZWZlMTcuLmNhNTNlNTc0NSAxMDA2NDQKLS0tIGEvcnVudGVzdC9zeXNjYWxscworKysgYi9ydW50
ZXN0L3N5c2NhbGxzCkBAIC0zMDEsNiArMzAxLDggQEAgZmNudGwzNSBmY250bDM1CiBmY250bDM1
XzY0IGZjbnRsMzVfNjQKIGZjbnRsMzYgZmNudGwzNgogZmNudGwzNl82NCBmY250bDM2XzY0Citm
Y250bDM3IGZjbnRsMzcKK2ZjbnRsMzdfNjQgZmNudGwzN182NAogCiBmZGF0YXN5bmMwMSBmZGF0
YXN5bmMwMQogZmRhdGFzeW5jMDIgZmRhdGFzeW5jMDIKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZmNudGwvLmdpdGlnbm9yZSBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZmNudGwvLmdpdGlnbm9yZQppbmRleCA4ZDU3MzhmOTcuLmJlOGQ5NzM5ZSAxMDA2NDQKLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC8uZ2l0aWdub3JlCisrKyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvLmdpdGlnbm9yZQpAQCAtNzAsMyArNzAsNSBAQAog
L2ZjbnRsMzVfNjQKIC9mY250bDM2CiAvZmNudGwzNl82NAorL2ZjbnRsMzcKKy9mY250bDM3XzY0
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzcuYyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzNy5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNzU3ZDY3MGEwCi0tLSAvZGV2L251bGwKKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDM3LmMKQEAgLTAsMCArMSwxMDEgQEAK
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICogQ29w
eXJpZ2h0IChjKSAyMDIwIEZVSklUU1UgTElNSVRFRC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyAq
IEF1dGhvcjogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5qdWppdHN1LmNvbT4KKyAqCisgKiBU
ZXN0IGJhc2ljIGVycm9yIGhhbmRsaW5nIGZvciBmY250bCgyKSB1c2luZyBGX1NFVFBJUEVfU1os
IEZfR0VUUElQRV9TWgorICogYXJndW1lbnQuCisgKiAxKWZjbnRsIGZhaWxzIHdpdGggRUlOVkFM
IHdoZW4gY21kIGlzIEZfU0VUUElQRV9TWiBhbmQgdGhlIGFyZyBpcworICogYmV5b25kIDE8PDMx
LgorICogMilmY250bCBmYWlscyB3aXRoIEVCVVNZIHdoZW4gY21kIGlzIEZfU0VUUElQRV9TWiBh
bmQgdGhlIGFyZyBpcyBzbWFsbGVyCisgKiB0aGFuIHRoZSBhbW91bnQgb2YgdGhlIGN1cnJlbnQg
dXNlZCBidWZmZXIgc3BhY2UuCisgKiAzKWZjbnRsIGZhaWxzIHdpdGggRVBFUk0gd2hlbiBjbWQg
aXMgRl9TRVRQSVBFX1NaIGFuZCB0aGUgYXJnIGlzIG92ZXIKKyAqIC9wcm9jL3N5cy9mcy9waXBl
LW1heC1zaXplIGxpbWl0IHVuZGVyIHVucHJpdmlsZWdlZCB1c2Vycy4KKyAqLworCisjaW5jbHVk
ZSA8dW5pc3RkLmg+CisjaW5jbHVkZSA8ZmNudGwuaD4KKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4K
KyNpbmNsdWRlIDxsaW1pdHMuaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlICJ0c3Rf
dGVzdC5oIgorI2luY2x1ZGUgImxhcGkvZmNudGwuaCIKKyNpbmNsdWRlICJsYXBpL2NhcGFiaWxp
dHkuaCIKKworc3RhdGljIGludCBmZHNbMl07CitzdGF0aWMgdW5zaWduZWQgaW50IG9yaWdfdmFs
dWUsIGludmFsaWRfdmFsdWUsIGhhbGZfdmFsdWUsIHN5c192YWx1ZTsKK3N0YXRpYyBjaGFyICp3
cmJ1ZjsKKworc3RhdGljIHN0cnVjdCB0Y2FzZSB7CisJdW5zaWduZWQgaW50ICpzZXR2YWx1ZTsK
KwlpbnQgZXhwX2VycjsKKwljaGFyICptZXNzYWdlOworfSB0Y2FzZXNbXSA9IHsKKwl7JmludmFs
aWRfdmFsdWUsIEVJTlZBTCwKKwkiY21kIGlzIEZfU0VUUElQRV9TWiBhbmQgdGhlIGFyZyBpcyBi
ZXlvbmQgMTw8MzEifSwKKworCXsmaGFsZl92YWx1ZSwgRUJVU1ksCisJImNtZCBpcyBGX1NFVFBJ
UEVfU1ogYW5kIHRoZSBhcmcgaXMgc21hbGxlciB0aGFuIHRoZSBhbW91bnQgb2YgdGhlIGN1cnJl
bnQgdXNlZCBidWZmZXIgc3BhY2UifSwKKworCXsmc3lzX3ZhbHVlLCBFUEVSTSwKKwkiY21kIGlz
IEZfU0VUUElQRV9TWiBhbmQgdGhlIGFyZyBpcyBvdmVyIC9wcm9jL3N5cy9mcy9waXBlLW1heC1z
aXplIGxpbWl0IHVuZGVyIHVucHJpdmlsZWdlZCB1c2VycyJ9LAorfTsKKworc3RhdGljIHZvaWQg
dmVyaWZ5X2ZjbnRsKHVuc2lnbmVkIGludCBuKQoreworCXN0cnVjdCB0Y2FzZSAqdGMgPSAmdGNh
c2VzW25dOworCisJdHN0X3JlcyhUSU5GTywgIiVzIiwgdGMtPm1lc3NhZ2UpOworCisJVEVTVChm
Y250bChmZHNbMV0sIEZfU0VUUElQRV9TWiwgKih0Yy0+c2V0dmFsdWUpKSk7CisJaWYgKFRTVF9S
RVQgIT0gLTEpCisJCXRzdF9yZXMoVEZBSUwsICJGX1NFVFBJUEVfU1ogc3VjY2VlZCIpOworCWlm
IChUU1RfRVJSID09IHRjLT5leHBfZXJyKQorCQl0c3RfcmVzKFRQQVNTIHwgVFRFUlJOTywgIkZf
U0VUUElQRV9TWiBmYWlsZWQgYXMgZXhwZWN0ZWQiKTsKKwllbHNlCisJCXRzdF9yZXMoVEZBSUwg
fCBUVEVSUk5PLCAiRl9TRVRQSVBFX1NaIGZhaWxlZCBleHBlY3RlZCAlcyBidSBnb3QiLAorCQkJ
CXRzdF9zdHJlcnJubyh0Yy0+ZXhwX2VycikpOworfQorCitzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQoreworCVNBRkVfUElQRShmZHMpOworCisJVEVTVChmY250bChmZHNbMV0sIEZfR0VUUElQRV9T
WikpOworCWlmIChUU1RfRVJSID09IEVJTlZBTCkKKwkJdHN0X2JyayhUQ09ORiwgImtlcm5lbCBk
b2Vzbid0IHN1cHBvcnQgRl9HRVQvU0VUUElQRV9TWiIpOworCisJb3JpZ192YWx1ZSA9IFRTVF9S
RVQ7CisKKwl3cmJ1ZiA9IFNBRkVfTUFMTE9DKG9yaWdfdmFsdWUpOworCW1lbXNldCh3cmJ1Ziwg
J3gnLCBvcmlnX3ZhbHVlKTsKKwlTQUZFX1dSSVRFKDEsIGZkc1sxXSwgd3JidWYsIG9yaWdfdmFs
dWUpOworCisJU0FGRV9GSUxFX1NDQU5GKCIvcHJvYy9zeXMvZnMvcGlwZS1tYXgtc2l6ZSIsICIl
ZCIsICZzeXNfdmFsdWUpOworCXN5c192YWx1ZSsrOworCisJaGFsZl92YWx1ZSA9IG9yaWdfdmFs
dWUgLyAyOworCWludmFsaWRfdmFsdWUgPSAoMVUgPDwgMzEpICsgMTsKK30KKworc3RhdGljIHZv
aWQgY2xlYW51cCh2b2lkKQoreworCVNBRkVfRkNOVEwoZmRzWzFdLCBGX1NFVFBJUEVfU1osIG9y
aWdfdmFsdWUpOworCWlmIChmZHNbMF0gPiAwKQorCQlTQUZFX0NMT1NFKGZkc1swXSk7CisJaWYg
KGZkc1sxXSA+IDApCisJCVNBRkVfQ0xPU0UoZmRzWzFdKTsKKwlpZiAod3JidWYpCisJCWZyZWUo
d3JidWYpOworfQorCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnNldHVwID0g
c2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAorCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMp
LAorCS50ZXN0ID0gdmVyaWZ5X2ZjbnRsLAorCS5jYXBzID0gKHN0cnVjdCB0c3RfY2FwIFtdKSB7
CisJCVRTVF9DQVAoVFNUX0NBUF9EUk9QLCBDQVBfU1lTX1JFU09VUkNFKSwKKwkJe30KKwl9LAor
fTsKLS0gCjIuMTguMAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
