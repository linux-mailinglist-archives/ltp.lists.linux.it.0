Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8B2DA3D
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:19:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68BBC3EA313
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:19:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AC37D3EA37C
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:19:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D855A1401144
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:19:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6135D307D984;
 Wed, 29 May 2019 10:19:03 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C907A1001E71;
 Wed, 29 May 2019 10:19:02 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: pvorel@suse.cz
Date: Wed, 29 May 2019 18:18:49 +0800
Message-Id: <20190529101849.17183-2-xzhou@redhat.com>
In-Reply-To: <20190529101849.17183-1-xzhou@redhat.com>
References: <20190527153632.GA20053@dell5510>
 <20190529101849.17183-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 29 May 2019 10:19:03 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v5 2/2] OVL_MNT: setup overlayfs dirs and mount in a
	separated mountpoint
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

U29tZSB0ZXN0cyBhcmUgbW91bnRpbmcgb3ZlcmxheWZzIGludGVybmFsbHkgYW5kIHJ1biB0ZXN0
cyBvbiBpdC4KVGhpcyBtb3VudCBjYW4gZmFpbCBpZiB0aGUgZmlsZXN5c3RlbSB3ZSBhcmUgcnVu
bmluZyBvbiBkb2VzIG5vdApzdXBwb3J0IG92ZXJsYXkgbW91bnQgdXBvbiBpdC4gRm9yIGV4YW1w
bGUsIHdlIGFyZSBhbHJlYWR5IHJ1bm5pbmcKdGVzdHMgb24gb3ZlcmxheWZzIG9yIE5GUywgb3Ig
Q0lGUy4gVGVzdCB3aWxsIHJlcG9ydCBicm9rZW4gYW5kCmZhaWx1cmUuCgpGaXhpbmcgdGhpcyBi
eSBwdXQgb3ZlcmxheWZzIGRpcnMgaW4gYSBzZXBhcmF0ZWQgbW91bnRwb2ludCwgbGlrZSBpbgpy
ZWFkYWhlYWQwMiBieSBBbWlyLgoKU3VnZ2VzdGVkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3Vz
ZS5jej4KU3VnZ2VzdGVkLWJ5OiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCiAuLi4va2Vy
bmVsL3N5c2NhbGxzL2V4ZWN2ZWF0L2V4ZWN2ZWF0MDMuYyAgICAgfCAzMSArKy0tLS0tLS0tLS0t
LS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA3LmMgfCAzMyAr
KysrLS0tLS0tLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3Rp
ZnkwOC5jIHwgMzcgKysrKystLS0tLS0tLS0tLS0tLQogLi4uL2tlcm5lbC9zeXNjYWxscy9yZWFk
YWhlYWQvcmVhZGFoZWFkMDIuYyAgIHwgMzMgKystLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZXhlY3ZlYXQvZXhlY3ZlYXQwMy5jIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9leGVjdmVhdC9leGVjdmVhdDAzLmMKaW5kZXggZGVmMzM5MjNiLi43
ZGYxYjBmYWEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZXhlY3ZlYXQv
ZXhlY3ZlYXQwMy5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZXhlY3ZlYXQvZXhl
Y3ZlYXQwMy5jCkBAIC01NSwxMSArNTUsMTAgQEAKICNpbmNsdWRlICJsYXBpL2ZjbnRsLmgiCiAj
aW5jbHVkZSAiZXhlY3ZlYXQuaCIKIAotI2RlZmluZSBPVkxfTU5UICJvdmwiCiAjZGVmaW5lIFRF
U1RfQVBQICJleGVjdmVhdF9jaGlsZCIKICNkZWZpbmUgVEVTVF9GSUxFX1BBVEggT1ZMX01OVCIv
IlRFU1RfQVBQCiAKLXN0YXRpYyBpbnQgb3ZsX21vdW50ZWQ7CitzdGF0aWMgY29uc3QgY2hhciBt
bnRwb2ludFtdID0gT1ZMX0JBU0VfTU5UUE9JTlQ7CiAKIHN0YXRpYyB2b2lkIGRvX2NoaWxkKHZv
aWQpCiB7CkBAIC04NiwzMSArODUsNyBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfZXhlY3ZlYXQodm9p
ZCkKIAogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKLQlpbnQgcmV0OwotCiAJY2hlY2tfZXhl
Y3ZlYXQoKTsKLQotCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQgd2l0aCBsb3dlciBmaWxlICov
Ci0JU0FGRV9NS0RJUigibG93ZXIiLCAwNzU1KTsKLQlTQUZFX01LRElSKCJ1cHBlciIsIDA3NTUp
OwotCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKLQlTQUZFX01LRElSKE9WTF9NTlQsIDA3NTUp
OwotCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLAotCQkgICAg
Imxvd2VyZGlyPWxvd2VyLHVwcGVyZGlyPXVwcGVyLHdvcmtkaXI9d29yayIpOwotCWlmIChyZXQg
PCAwKSB7Ci0JCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKLQkJCXRzdF9icmsoVENPTkYsCi0JCQkJ
Im92ZXJsYXlmcyBpcyBub3QgY29uZmlndXJlZCBpbiB0aGlzIGtlcm5lbC4iKTsKLQkJfQotCQl0
c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAib3ZlcmxheWZzIG1vdW50IGZhaWxlZCIpOwotCX0KLQlv
dmxfbW91bnRlZCA9IDE7Ci19Ci0KLXN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKLXsKLQlpZiAo
b3ZsX21vdW50ZWQpCi0JCVNBRkVfVU1PVU5UKE9WTF9NTlQpOwogfQogCiBzdGF0aWMgY29uc3Qg
Y2hhciAqY29uc3QgcmVzb3VyY2VfZmlsZXNbXSA9IHsKQEAgLTEyMSwxMCArOTYsMTIgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmNvbnN0IHJlc291cmNlX2ZpbGVzW10gPSB7CiBzdGF0aWMgc3RydWN0
IHRzdF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3Jvb3QgPSAxLAogCS5uZWVkc190bXBkaXIgPSAx
LAorCS5tb3VudF9kZXZpY2UgPSAxLAorCS5uZWVkc19vdmVybGF5ID0gMSwKKwkubW50cG9pbnQg
PSBtbnRwb2ludCwKIAkuZm9ya3NfY2hpbGQgPSAxLAogCS5jaGlsZF9uZWVkc19yZWluaXQgPSAx
LAogCS5zZXR1cCA9IHNldHVwLAotCS5jbGVhbnVwID0gY2xlYW51cCwKIAkudGVzdF9hbGwgPSB2
ZXJpZnlfZXhlY3ZlYXQsCiAJLnJlc291cmNlX2ZpbGVzID0gcmVzb3VyY2VfZmlsZXMsCiB9Owpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwNy5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwNy5jCmluZGV4IDk2
MzcwYjVjZi4uNDc4MTdjZDQyIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2lub3RpZnkvaW5vdGlmeTA3LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90
aWZ5L2lub3RpZnkwNy5jCkBAIC03MywxMyArNzMsMTIgQEAgc3RydWN0IGV2ZW50X3QgewogCXVu
c2lnbmVkIGludCBtYXNrOwogfTsKIAotI2RlZmluZSBPVkxfTU5UICJvdmwiCiAjZGVmaW5lIERJ
Ul9OQU1FICJ0ZXN0X2RpciIKICNkZWZpbmUgRElSX1BBVEggT1ZMX01OVCIvIkRJUl9OQU1FCiAj
ZGVmaW5lIEZJTEVfTkFNRSAidGVzdF9maWxlIgogI2RlZmluZSBGSUxFX1BBVEggT1ZMX01OVCIv
IkRJUl9OQU1FIi8iRklMRV9OQU1FCiAKLXN0YXRpYyBpbnQgb3ZsX21vdW50ZWQ7CitzdGF0aWMg
Y29uc3QgY2hhciBtbnRwb2ludFtdID0gT1ZMX0JBU0VfTU5UUE9JTlQ7CiAKIHN0YXRpYyBzdHJ1
Y3QgZXZlbnRfdCBldmVudF9zZXRbRVZFTlRfTUFYXTsKIApAQCAtMTYxLDI3ICsxNjAsMTIgQEAg
dm9pZCB2ZXJpZnlfaW5vdGlmeSh2b2lkKQogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKIAlz
dHJ1Y3Qgc3RhdCBidWY7Ci0JaW50IHJldDsKIAogCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQg
d2l0aCBsb3dlciBkaXIgYW5kIGZpbGUgKi8KLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwot
CVNBRkVfTUtESVIoImxvd2VyLyJESVJfTkFNRSwgMDc1NSk7Ci0JU0FGRV9UT1VDSCgibG93ZXIv
IkRJUl9OQU1FIi8iRklMRV9OQU1FLCAwNjQ0LCBOVUxMKTsKLQlTQUZFX01LRElSKCJ1cHBlciIs
IDA3NTUpOwotCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKLQlTQUZFX01LRElSKE9WTF9NTlQs
IDA3NTUpOwotCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLAot
CQkgICAgImxvd2VyZGlyPWxvd2VyLHVwcGVyZGlyPXVwcGVyLHdvcmtkaXI9d29yayIpOwotCWlm
IChyZXQgPCAwKSB7Ci0JCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKLQkJCXRzdF9icmsoVENPTkYs
Ci0JCQkJIm92ZXJsYXlmcyBpcyBub3QgY29uZmlndXJlZCBpbiB0aGlzIGtlcm5lbC4iKTsKLQkJ
fSBlbHNlIHsKLQkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sCi0JCQkJIm92ZXJsYXlmcyBtb3Vu
dCBmYWlsZWQiKTsKLQkJfQotCX0KLQlvdmxfbW91bnRlZCA9IDE7CisJU0FGRV9VTU9VTlQoT1ZM
X01OVCk7CisJU0FGRV9NS0RJUihPVkxfTE9XRVIiLyJESVJfTkFNRSwgMDc1NSk7CisJU0FGRV9U
T1VDSChPVkxfTE9XRVIiLyJESVJfTkFNRSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7CisJU0FG
RV9NT1VOVF9PVkVSTEFZKCk7CiAKIAlmZF9ub3RpZnkgPSBteWlub3RpZnlfaW5pdDEoT19OT05C
TE9DSyk7CiAJaWYgKGZkX25vdGlmeSA8IDApIHsKQEAgLTIyMSwxOSArMjA1LDE4IEBAIHN0YXRp
YyB2b2lkIGNsZWFudXAodm9pZCkKIAlpZiAocmVhcF93ZCAmJiBteWlub3RpZnlfcm1fd2F0Y2go
ZmRfbm90aWZ5LCB3ZCkgPCAwKSB7CiAJCXRzdF9yZXMoVFdBUk4sCiAJCQkiaW5vdGlmeV9ybV93
YXRjaCAoJWQsICVkKSBmYWlsZWQsIiwgZmRfbm90aWZ5LCB3ZCk7Ci0KIAl9CiAKIAlpZiAoZmRf
bm90aWZ5ID4gMCkKIAkJU0FGRV9DTE9TRShmZF9ub3RpZnkpOwotCi0JaWYgKG92bF9tb3VudGVk
KQotCQlTQUZFX1VNT1VOVChPVkxfTU5UKTsKIH0KIAogc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0
ZXN0ID0gewogCS5uZWVkc19yb290ID0gMSwKIAkubmVlZHNfdG1wZGlyID0gMSwKKwkubW91bnRf
ZGV2aWNlID0gMSwKKwkubmVlZHNfb3ZlcmxheSA9IDEsCisJLm1udHBvaW50ID0gbW50cG9pbnQs
CiAJLnNldHVwID0gc2V0dXAsCiAJLmNsZWFudXAgPSBjbGVhbnVwLAogCS50ZXN0X2FsbCA9IHZl
cmlmeV9pbm90aWZ5LApkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90
aWZ5L2lub3RpZnkwOC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3Rp
ZnkwOC5jCmluZGV4IGFjZGI5NTM0NS4uMDY3YzAxZGJiIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA4LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwOC5jCkBAIC03NCwxMSArNzQsMTAgQEAgc3RydWN0
IGV2ZW50X3QgewogCXVuc2lnbmVkIGludCBtYXNrOwogfTsKIAotI2RlZmluZSBPVkxfTU5UICJv
dmwiCiAjZGVmaW5lIEZJTEVfTkFNRSAidGVzdF9maWxlIgogI2RlZmluZSBGSUxFX1BBVEggT1ZM
X01OVCIvIkZJTEVfTkFNRQogCi1zdGF0aWMgaW50IG92bF9tb3VudGVkOworc3RhdGljIGNvbnN0
IGNoYXIgbW50cG9pbnRbXSA9IE9WTF9CQVNFX01OVFBPSU5UOwogCiBzdGF0aWMgc3RydWN0IGV2
ZW50X3QgZXZlbnRfc2V0W0VWRU5UX01BWF07CiAKQEAgLTEwNCw4ICsxMDMsOCBAQCB2b2lkIHZl
cmlmeV9pbm90aWZ5KHZvaWQpCiAJdGVzdF9jbnQrKzsKIAogCS8qIE1ha2Ugc3VyZSBldmVudHMg
b24gdXBwZXIvbG93ZXIgZG8gbm90IHNob3cgaW4gb3ZlcmxheSB3YXRjaCAqLwotCVNBRkVfVE9V
Q0goImxvd2VyLyJGSUxFX05BTUUsIDA2NDQsIE5VTEwpOwotCVNBRkVfVE9VQ0goInVwcGVyLyJG
SUxFX05BTUUsIDA2NDQsIE5VTEwpOworCVNBRkVfVE9VQ0goT1ZMX0xPV0VSIi8iRklMRV9OQU1F
LCAwNjQ0LCBOVUxMKTsKKwlTQUZFX1RPVUNIKE9WTF9VUFBFUiIvIkZJTEVfTkFNRSwgMDY0NCwg
TlVMTCk7CiAKIAlpbnQgbGVuID0gcmVhZChmZF9ub3RpZnksIGV2ZW50X2J1ZiwgRVZFTlRfQlVG
X0xFTik7CiAJaWYgKGxlbiA9PSAtMSAmJiBlcnJubyAhPSBFQUdBSU4pIHsKQEAgLTE1NCwzMiAr
MTUzLDE3IEBAIHZvaWQgdmVyaWZ5X2lub3RpZnkodm9pZCkKIHN0YXRpYyB2b2lkIHNldHVwKHZv
aWQpCiB7CiAJc3RydWN0IHN0YXQgYnVmOwotCWludCByZXQ7CiAKIAkvKiBTZXR1cCBhbiBvdmVy
bGF5IG1vdW50IHdpdGggbG93ZXIgZmlsZSAqLwotCVNBRkVfTUtESVIoImxvd2VyIiwgMDc1NSk7
Ci0JU0FGRV9UT1VDSCgibG93ZXIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Ci0JU0FGRV9NS0RJ
UigidXBwZXIiLCAwNzU1KTsKLQlTQUZFX01LRElSKCJ3b3JrIiwgMDc1NSk7Ci0JU0FGRV9NS0RJ
UihPVkxfTU5ULCAwNzU1KTsKLQlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVy
bGF5IiwgMCwKLQkJICAgICJsb3dlcmRpcj1sb3dlcix1cHBlcmRpcj11cHBlcix3b3JrZGlyPXdv
cmsiKTsKLQlpZiAocmV0IDwgMCkgewotCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7Ci0JCQl0c3Rf
YnJrKFRDT05GLAotCQkJCSJvdmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4gdGhpcyBrZXJu
ZWwuIik7Ci0JCX0gZWxzZSB7Ci0JCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLAotCQkJCSJvdmVy
bGF5ZnMgbW91bnQgZmFpbGVkIik7Ci0JCX0KLQl9Ci0Jb3ZsX21vdW50ZWQgPSAxOworCVNBRkVf
VU1PVU5UKE9WTF9NTlQpOworCVNBRkVfVE9VQ0goT1ZMX0xPV0VSIi8iRklMRV9OQU1FLCAwNjQ0
LCBOVUxMKTsKKwlTQUZFX01PVU5UX09WRVJMQVkoKTsKIAogCWZkX25vdGlmeSA9IG15aW5vdGlm
eV9pbml0MShPX05PTkJMT0NLKTsKIAlpZiAoZmRfbm90aWZ5IDwgMCkgewogCQlpZiAoZXJybm8g
PT0gRU5PU1lTKSB7CiAJCQl0c3RfYnJrKFRDT05GLAotCQkJCSJpbm90aWZ5IGlzIG5vdCBjb25m
aWd1cmVkIGluIHRoaXMga2VybmVsLiIpOworCQkJCSJpbm90aWZ5IGlzIG5vdCBjb25maWd1cmVk
IGluIHRoaXMga2VybmVsIik7CiAJCX0gZWxzZSB7CiAJCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5P
LAogCQkJCSJpbm90aWZ5X2luaXQgKCkgZmFpbGVkIik7CkBAIC0yMTcsMTkgKzIwMSwxOCBAQCBz
dGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiAJaWYgKHJlYXBfd2QgJiYgbXlpbm90aWZ5X3JtX3dh
dGNoKGZkX25vdGlmeSwgd2QpIDwgMCkgewogCQl0c3RfcmVzKFRXQVJOLAogCQkJImlub3RpZnlf
cm1fd2F0Y2ggKCVkLCAlZCkgZmFpbGVkLCIsIGZkX25vdGlmeSwgd2QpOwotCiAJfQogCiAJaWYg
KGZkX25vdGlmeSA+IDApCiAJCVNBRkVfQ0xPU0UoZmRfbm90aWZ5KTsKLQotCWlmIChvdmxfbW91
bnRlZCkKLQkJU0FGRV9VTU9VTlQoT1ZMX01OVCk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rl
c3QgdGVzdCA9IHsKIAkubmVlZHNfcm9vdCA9IDEsCiAJLm5lZWRzX3RtcGRpciA9IDEsCisJLm1v
dW50X2RldmljZSA9IDEsCisJLm5lZWRzX292ZXJsYXkgPSAxLAorCS5tbnRwb2ludCA9IG1udHBv
aW50LAogCS5zZXR1cCA9IHNldHVwLAogCS5jbGVhbnVwID0gY2xlYW51cCwKIAkudGVzdF9hbGwg
PSB2ZXJpZnlfaW5vdGlmeSwKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
cmVhZGFoZWFkL3JlYWRhaGVhZDAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3JlYWRh
aGVhZC9yZWFkYWhlYWQwMi5jCmluZGV4IDM5ZGRiZDU4My4uZjZlMDcxNzNkIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3JlYWRhaGVhZC9yZWFkYWhlYWQwMi5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVhZGFoZWFkL3JlYWRhaGVhZDAyLmMKQEAgLTQ0
LDE2ICs0NCwxMSBAQCBzdGF0aWMgaW50IHBhZ2VzaXplOwogc3RhdGljIHVuc2lnbmVkIGxvbmcg
Y2FjaGVkX21heDsKIHN0YXRpYyBpbnQgb3ZsX21vdW50ZWQ7CiAKLSNkZWZpbmUgTU5UUE9JTlQg
ICAgICAgICJtbnRwb2ludCIKLSNkZWZpbmUgT1ZMX0xPV0VSCU1OVFBPSU5UIi9sb3dlciIKLSNk
ZWZpbmUgT1ZMX1VQUEVSCU1OVFBPSU5UIi91cHBlciIKLSNkZWZpbmUgT1ZMX1dPUksJTU5UUE9J
TlQiL3dvcmsiCi0jZGVmaW5lIE9WTF9NTlQJCU1OVFBPSU5UIi9vdmwiCiBzdGF0aWMgaW50IHJl
YWRhaGVhZF9sZW5ndGggID0gNDA5NjsKIHN0YXRpYyBjaGFyIHN5c19iZGlfcmFfcGF0aFtQQVRI
X01BWF07CiBzdGF0aWMgaW50IG9yaWdfYmRpX2xpbWl0OwogCi1zdGF0aWMgY29uc3QgY2hhciBt
bnRwb2ludFtdID0gTU5UUE9JTlQ7CitzdGF0aWMgY29uc3QgY2hhciBtbnRwb2ludFtdID0gT1ZM
X0JBU0VfTU5UUE9JTlQ7CiAKIHN0YXRpYyBzdHJ1Y3QgdHN0X29wdGlvbiBvcHRpb25zW10gPSB7
CiAJeyJzOiIsICZvcHRfZnNpemVzdHIsICItcyAgICB0ZXN0ZmlsZSBzaXplIChkZWZhdWx0IDY0
TUIpIn0sCkBAIC0xMzIsNyArMTI3LDggQEAgc3RhdGljIHZvaWQgY3JlYXRlX3Rlc3RmaWxlKGlu
dCB1c2Vfb3ZlcmxheSkKIAljaGFyICp0bXA7CiAJc2l6ZV90IGk7CiAKLQlzcHJpbnRmKHRlc3Rm
aWxlLCAiJXMvdGVzdGZpbGUiLCB1c2Vfb3ZlcmxheSA/IE9WTF9NTlQgOiBNTlRQT0lOVCk7CisJ
c3ByaW50Zih0ZXN0ZmlsZSwgIiVzL3Rlc3RmaWxlIiwKKwkJdXNlX292ZXJsYXkgPyBPVkxfTU5U
IDogT1ZMX0JBU0VfTU5UUE9JTlQpOwogCXRzdF9yZXMoVElORk8sICJjcmVhdGluZyB0ZXN0IGZp
bGUgb2Ygc2l6ZTogJXp1IiwgdGVzdGZpbGVfc2l6ZSk7CiAJdG1wID0gU0FGRV9NQUxMT0MocGFn
ZXNpemUpOwogCkBAIC0zMjksMjcgKzMyNSw2IEBAIHN0YXRpYyB2b2lkIHRlc3RfcmVhZGFoZWFk
KHVuc2lnbmVkIGludCBuKQogCX0KIH0KIAotc3RhdGljIHZvaWQgc2V0dXBfb3ZlcmxheSh2b2lk
KQotewotCWludCByZXQ7Ci0KLQkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdpdGggbG93ZXIg
ZGlyIGFuZCBmaWxlICovCi0JU0FGRV9NS0RJUihPVkxfTE9XRVIsIDA3NTUpOwotCVNBRkVfTUtE
SVIoT1ZMX1VQUEVSLCAwNzU1KTsKLQlTQUZFX01LRElSKE9WTF9XT1JLLCAwNzU1KTsKLQlTQUZF
X01LRElSKE9WTF9NTlQsIDA3NTUpOwotCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwg
Im92ZXJsYXkiLCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgotCQkgICAgIix1cHBlcmRpcj0iT1ZM
X1VQUEVSIix3b3JrZGlyPSJPVkxfV09SSyk7Ci0JaWYgKHJldCA8IDApIHsKLQkJaWYgKGVycm5v
ID09IEVOT0RFVikgewotCQkJdHN0X3JlcyhUSU5GTywKLQkJCQkib3ZlcmxheWZzIGlzIG5vdCBj
b25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwotCQkJcmV0dXJuOwotCQl9Ci0JCXRzdF9icmso
VEJST0sgfCBURVJSTk8sICJvdmVybGF5ZnMgbW91bnQgZmFpbGVkIik7Ci0JfQotCW92bF9tb3Vu
dGVkID0gMTsKLX0KIAogLyoKICAqIFdlIHRyeSByYWlzaW5nIGJkaSByZWFkYWhlYWQgbGltaXQg
YXMgbXVjaCBhcyB3ZSBjYW4uIFdlIHdyaXRlCkBAIC00MTMsNyArMzg4LDcgQEAgc3RhdGljIHZv
aWQgc2V0dXAodm9pZCkKIAlzZXR1cF9yZWFkYWhlYWRfbGVuZ3RoKCk7CiAJdHN0X3JlcyhUSU5G
TywgInJlYWRhaGVhZCBsZW5ndGg6ICVkIiwgcmVhZGFoZWFkX2xlbmd0aCk7CiAKLQlzZXR1cF9v
dmVybGF5KCk7CisJb3ZsX21vdW50ZWQgPSBUU1RfTU9VTlRfT1ZFUkxBWSgpOwogfQogCiBzdGF0
aWMgdm9pZCBjbGVhbnVwKHZvaWQpCi0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
