Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538FEFAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 06:40:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BAD33EACBF
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 06:40:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4996B3EA0B8
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 06:40:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C92D61000AE1
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 06:40:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83A3130842B0;
 Tue, 30 Apr 2019 04:40:14 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9938E75270;
 Tue, 30 Apr 2019 04:40:13 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 12:39:57 +0800
Message-Id: <20190430043957.479-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 30 Apr 2019 04:40:14 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] OVL_MNT: put overlayfs lower, upper, work,
	mnt dir in separated mountpoint
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
eSBwdXQgb3ZlcmxheWZzIGRpcnMgaW4gYSBzZXBhcmFlZCBtb3VudHBvaW50LCBsaWtlCnJlYWRh
aGVhZDAyIGJ5IEFtaXIuCgpTaWduZWQtb2ZmLWJ5OiBYaW9uZyBaaG91IDx4emhvdUByZWRoYXQu
Y29tPgotLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvZXhlY3ZlYXQvZXhlY3ZlYXQwMy5jICAgICB8
IDIxICsrKysrKysrKystLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lu
b3RpZnkwNy5jIHwgMjQgKysrKysrKysrKystLS0tLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvaW5vdGlmeS9pbm90aWZ5MDguYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9leGVjdmVhdC9leGVjdmVhdDAzLmMgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2V4ZWN2ZWF0L2V4ZWN2ZWF0MDMuYwppbmRleCBkZWYzMzkyM2Iu
LjhiYTZhNjU2ZiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9leGVjdmVh
dC9leGVjdmVhdDAzLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9leGVjdmVhdC9l
eGVjdmVhdDAzLmMKQEAgLTU1LDEwICs1NSwxNyBAQAogI2luY2x1ZGUgImxhcGkvZmNudGwuaCIK
ICNpbmNsdWRlICJleGVjdmVhdC5oIgogCi0jZGVmaW5lIE9WTF9NTlQgIm92bCIKKyNkZWZpbmUg
TU5UUE9JTlQJIm1udHBvaW50IgorI2RlZmluZSBPVkxfTE9XRVIJTU5UUE9JTlQiL2xvd2VyIgor
I2RlZmluZSBPVkxfVVBQRVIJTU5UUE9JTlQiL3VwcGVyIgorI2RlZmluZSBPVkxfV09SSwlNTlRQ
T0lOVCIvd29yayIKKyNkZWZpbmUgT1ZMX01OVAkJTU5UUE9JTlQiL292bCIKKwogI2RlZmluZSBU
RVNUX0FQUCAiZXhlY3ZlYXRfY2hpbGQiCiAjZGVmaW5lIFRFU1RfRklMRV9QQVRIIE9WTF9NTlQi
LyJURVNUX0FQUAogCitzdGF0aWMgY29uc3QgY2hhciBtbnRwb2ludFtdID0gTU5UUE9JTlQ7CisK
IHN0YXRpYyBpbnQgb3ZsX21vdW50ZWQ7CiAKIHN0YXRpYyB2b2lkIGRvX2NoaWxkKHZvaWQpCkBA
IC05MSwxMiArOTgsMTIgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAljaGVja19leGVjdmVh
dCgpOwogCiAJLyogU2V0dXAgYW4gb3ZlcmxheSBtb3VudCB3aXRoIGxvd2VyIGZpbGUgKi8KLQlT
QUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwotCVNBRkVfTUtESVIoInVwcGVyIiwgMDc1NSk7Ci0J
U0FGRV9NS0RJUigid29yayIsIDA3NTUpOworCVNBRkVfTUtESVIoT1ZMX0xPV0VSLCAwNzU1KTsK
KwlTQUZFX01LRElSKE9WTF9VUFBFUiwgMDc1NSk7CisJU0FGRV9NS0RJUihPVkxfV09SSywgMDc1
NSk7CiAJU0FGRV9NS0RJUihPVkxfTU5ULCAwNzU1KTsKLQlyZXQgPSBtb3VudCgib3ZlcmxheSIs
IE9WTF9NTlQsICJvdmVybGF5IiwgMCwKLQkJICAgICJsb3dlcmRpcj1sb3dlcix1cHBlcmRpcj11
cHBlcix3b3JrZGlyPXdvcmsiKTsKKwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJv
dmVybGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKKwkJICAgICIsdXBwZXJkaXI9Ik9WTF9V
UFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwogCWlmIChyZXQgPCAwKSB7CiAJCWlmIChlcnJubyA9
PSBFTk9ERVYpIHsKIAkJCXRzdF9icmsoVENPTkYsCkBAIC0xMjEsNiArMTI4LDggQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKmNvbnN0IHJlc291cmNlX2ZpbGVzW10gPSB7CiBzdGF0aWMgc3RydWN0IHRz
dF90ZXN0IHRlc3QgPSB7CiAJLm5lZWRzX3Jvb3QgPSAxLAogCS5uZWVkc190bXBkaXIgPSAxLAor
CS5tb3VudF9kZXZpY2UgPSAxLAorCS5tbnRwb2ludCA9IG1udHBvaW50LAogCS5mb3Jrc19jaGls
ZCA9IDEsCiAJLmNoaWxkX25lZWRzX3JlaW5pdCA9IDEsCiAJLnNldHVwID0gc2V0dXAsCmRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA3LmMgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA3LmMKaW5kZXggOTYzNzBi
NWNmLi4zZTJkMDY0ODUgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW5v
dGlmeS9pbm90aWZ5MDcuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkv
aW5vdGlmeTA3LmMKQEAgLTczLDEzICs3MywxOSBAQCBzdHJ1Y3QgZXZlbnRfdCB7CiAJdW5zaWdu
ZWQgaW50IG1hc2s7CiB9OwogCi0jZGVmaW5lIE9WTF9NTlQgIm92bCIKKyNkZWZpbmUgTU5UUE9J
TlQJIm1udHBvaW50IgorI2RlZmluZSBPVkxfTE9XRVIJTU5UUE9JTlQiL2xvd2VyIgorI2RlZmlu
ZSBPVkxfVVBQRVIJTU5UUE9JTlQiL3VwcGVyIgorI2RlZmluZSBPVkxfV09SSwlNTlRQT0lOVCIv
d29yayIKKyNkZWZpbmUgT1ZMX01OVAkJTU5UUE9JTlQiL292bCIKKwogI2RlZmluZSBESVJfTkFN
RSAidGVzdF9kaXIiCiAjZGVmaW5lIERJUl9QQVRIIE9WTF9NTlQiLyJESVJfTkFNRQogI2RlZmlu
ZSBGSUxFX05BTUUgInRlc3RfZmlsZSIKICNkZWZpbmUgRklMRV9QQVRIIE9WTF9NTlQiLyJESVJf
TkFNRSIvIkZJTEVfTkFNRQogCiBzdGF0aWMgaW50IG92bF9tb3VudGVkOworc3RhdGljIGNvbnN0
IGNoYXIgbW50cG9pbnRbXSA9IE1OVFBPSU5UOwogCiBzdGF0aWMgc3RydWN0IGV2ZW50X3QgZXZl
bnRfc2V0W0VWRU5UX01BWF07CiAKQEAgLTE2NCwxNCArMTcwLDE0IEBAIHN0YXRpYyB2b2lkIHNl
dHVwKHZvaWQpCiAJaW50IHJldDsKIAogCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQgd2l0aCBs
b3dlciBkaXIgYW5kIGZpbGUgKi8KLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwotCVNBRkVf
TUtESVIoImxvd2VyLyJESVJfTkFNRSwgMDc1NSk7Ci0JU0FGRV9UT1VDSCgibG93ZXIvIkRJUl9O
QU1FIi8iRklMRV9OQU1FLCAwNjQ0LCBOVUxMKTsKLQlTQUZFX01LRElSKCJ1cHBlciIsIDA3NTUp
OwotCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKKwlTQUZFX01LRElSKE9WTF9MT1dFUiwgMDc1
NSk7CisJU0FGRV9NS0RJUihPVkxfTE9XRVIiLyJESVJfTkFNRSwgMDc1NSk7CisJU0FGRV9UT1VD
SChPVkxfTE9XRVIiLyJESVJfTkFNRSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7CisJU0FGRV9N
S0RJUihPVkxfVVBQRVIsIDA3NTUpOworCVNBRkVfTUtESVIoT1ZMX1dPUkssIDA3NTUpOwogCVNB
RkVfTUtESVIoT1ZMX01OVCwgMDc1NSk7Ci0JcmV0ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5U
LCAib3ZlcmxheSIsIDAsCi0JCSAgICAibG93ZXJkaXI9bG93ZXIsdXBwZXJkaXI9dXBwZXIsd29y
a2Rpcj13b3JrIik7CisJcmV0ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIs
IDAsICJsb3dlcmRpcj0iT1ZMX0xPV0VSCisJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIiLHdv
cmtkaXI9Ik9WTF9XT1JLKTsKIAlpZiAocmV0IDwgMCkgewogCQlpZiAoZXJybm8gPT0gRU5PREVW
KSB7CiAJCQl0c3RfYnJrKFRDT05GLApAQCAtMjM0LDYgKzI0MCw4IEBAIHN0YXRpYyB2b2lkIGNs
ZWFudXAodm9pZCkKIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKIAkubmVlZHNfcm9v
dCA9IDEsCiAJLm5lZWRzX3RtcGRpciA9IDEsCisJLm1vdW50X2RldmljZSA9IDEsCisJLm1udHBv
aW50ID0gbW50cG9pbnQsCiAJLnNldHVwID0gc2V0dXAsCiAJLmNsZWFudXAgPSBjbGVhbnVwLAog
CS50ZXN0X2FsbCA9IHZlcmlmeV9pbm90aWZ5LApkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwOC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9pbm90aWZ5L2lub3RpZnkwOC5jCmluZGV4IGFjZGI5NTM0NS4uYTUxMmRmZTIyIDEwMDY0NAot
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA4LmMKKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwOC5jCkBAIC03NCwxMSAr
NzQsMTcgQEAgc3RydWN0IGV2ZW50X3QgewogCXVuc2lnbmVkIGludCBtYXNrOwogfTsKIAotI2Rl
ZmluZSBPVkxfTU5UICJvdmwiCisjZGVmaW5lIE1OVFBPSU5UCSJtbnRwb2ludCIKKyNkZWZpbmUg
T1ZMX0xPV0VSCU1OVFBPSU5UIi9sb3dlciIKKyNkZWZpbmUgT1ZMX1VQUEVSCU1OVFBPSU5UIi91
cHBlciIKKyNkZWZpbmUgT1ZMX1dPUksJTU5UUE9JTlQiL3dvcmsiCisjZGVmaW5lIE9WTF9NTlQJ
CU1OVFBPSU5UIi9vdmwiCisKICNkZWZpbmUgRklMRV9OQU1FICJ0ZXN0X2ZpbGUiCiAjZGVmaW5l
IEZJTEVfUEFUSCBPVkxfTU5UIi8iRklMRV9OQU1FCiAKIHN0YXRpYyBpbnQgb3ZsX21vdW50ZWQ7
CitzdGF0aWMgY29uc3QgY2hhciBtbnRwb2ludFtdID0gTU5UUE9JTlQ7CiAKIHN0YXRpYyBzdHJ1
Y3QgZXZlbnRfdCBldmVudF9zZXRbRVZFTlRfTUFYXTsKIApAQCAtMTA0LDggKzExMCw4IEBAIHZv
aWQgdmVyaWZ5X2lub3RpZnkodm9pZCkKIAl0ZXN0X2NudCsrOwogCiAJLyogTWFrZSBzdXJlIGV2
ZW50cyBvbiB1cHBlci9sb3dlciBkbyBub3Qgc2hvdyBpbiBvdmVybGF5IHdhdGNoICovCi0JU0FG
RV9UT1VDSCgibG93ZXIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Ci0JU0FGRV9UT1VDSCgidXBw
ZXIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7CisJU0FGRV9UT1VDSChPVkxfTE9XRVIiLyJGSUxF
X05BTUUsIDA2NDQsIE5VTEwpOworCVNBRkVfVE9VQ0goT1ZMX0xPV0VSIi8iRklMRV9OQU1FLCAw
NjQ0LCBOVUxMKTsKIAogCWludCBsZW4gPSByZWFkKGZkX25vdGlmeSwgZXZlbnRfYnVmLCBFVkVO
VF9CVUZfTEVOKTsKIAlpZiAobGVuID09IC0xICYmIGVycm5vICE9IEVBR0FJTikgewpAQCAtMTU3
LDEzICsxNjMsMTMgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAlpbnQgcmV0OwogCiAJLyog
U2V0dXAgYW4gb3ZlcmxheSBtb3VudCB3aXRoIGxvd2VyIGZpbGUgKi8KLQlTQUZFX01LRElSKCJs
b3dlciIsIDA3NTUpOwotCVNBRkVfVE9VQ0goImxvd2VyLyJGSUxFX05BTUUsIDA2NDQsIE5VTEwp
OwotCVNBRkVfTUtESVIoInVwcGVyIiwgMDc1NSk7Ci0JU0FGRV9NS0RJUigid29yayIsIDA3NTUp
OworCVNBRkVfTUtESVIoT1ZMX0xPV0VSLCAwNzU1KTsKKwlTQUZFX1RPVUNIKE9WTF9MT1dFUiIv
IkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7CisJU0FGRV9NS0RJUihPVkxfVVBQRVIsIDA3NTUpOwor
CVNBRkVfTUtESVIoT1ZMX1dPUkssIDA3NTUpOwogCVNBRkVfTUtESVIoT1ZMX01OVCwgMDc1NSk7
Ci0JcmV0ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsCi0JCSAgICAi
bG93ZXJkaXI9bG93ZXIsdXBwZXJkaXI9dXBwZXIsd29ya2Rpcj13b3JrIik7CisJcmV0ID0gbW91
bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsICJsb3dlcmRpcj0iT1ZMX0xPV0VS
CisJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIiLHdvcmtkaXI9Ik9WTF9XT1JLKTsKIAlpZiAo
cmV0IDwgMCkgewogCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7CiAJCQl0c3RfYnJrKFRDT05GLApA
QCAtMjMwLDYgKzIzNiw4IEBAIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKIHN0YXRpYyBzdHJ1
Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKIAkubmVlZHNfcm9vdCA9IDEsCiAJLm5lZWRzX3RtcGRpciA9
IDEsCisJLm1vdW50X2RldmljZSA9IDEsCisJLm1udHBvaW50ID0gbW50cG9pbnQsCiAJLnNldHVw
ID0gc2V0dXAsCiAJLmNsZWFudXAgPSBjbGVhbnVwLAogCS50ZXN0X2FsbCA9IHZlcmlmeV9pbm90
aWZ5LAotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
