Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B939B4E
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 07:46:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C236E3EB1B0
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 07:46:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A0CD13EAA01
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 07:46:00 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 448241A00E4D
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 07:45:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F72281F2F
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 05:45:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-30.pek2.redhat.com
 [10.72.12.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F33A5D707
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 05:45:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 Jun 2019 13:45:48 +0800
Message-Id: <20190608054550.13744-1-liwang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 08 Jun 2019 05:45:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH RFC 1/3] lib: adding tst_on_arch function in library
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGVzdGNhc2VzIGZvciBzcGVjaWZpZWQgYXJjaCBzaG91bGQgYmUgbGltaXRlZCBvbiB0aGF0IG9u
bHkgYmVpbmcgc3VwcG9ydGVkCnBsYXRmb3JtIHRvIHJ1biwgd2Ugbm93IGNyZWF0ZSBhIGZ1bmN0
aW9uIHRzdF9vbl9hcmNoIHRvIGFjaGlldmUgdGhpcyBuZXcKZmVhdHVyZSBpbiBMVFAgbGlicmFy
eS4gIEFsbCB5b3UgbmVlZCB0byBydW4gYSB0ZXN0IG9uIHRoZSBleHBlY3RlZCBhcmNoIGlzCnRv
IHNldCB0aGUgJy5hcmNoJyBzdHJpbmcgaW4gdGhlICdzdHJ1Y3QgdHN0X3Rlc3QnIHRvIGNob29z
ZSB0aGUgcmVxdWlyZWQKYXJjaCBsaXN0LiBlLmcuICcuYXJjaCA9ICJ4ODZfNjQsIGkzODYiJy4K
CkZvciBtb3JlIGNvbXBsaWNhdGVkIHVzYWdlcyBzdWNoIGFzIGN1c3RvbWl6ZSB5b3VyIHRlc3Qg
Y29kZSBmb3IgYSBzcGVjaWFsCmFyY2gsIHRoZSB0c3Rfb25fYXJjaCBmdW5jdGlvbiBjb3VsZCBi
ZSBpbnZva2VkIGluIHRoZSB0ZXN0IGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8
bGl3YW5nQHJlZGhhdC5jb20+Ci0tLQogZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCB8
IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdHN0X2FyY2guaCAgICAgICAg
ICAgICAgfCAxNiArKysrKysrKwogaW5jbHVkZS90c3RfdGVzdC5oICAgICAgICAgICAgICB8ICA3
ICsrKy0KIGxpYi90c3RfYXJjaC5jICAgICAgICAgICAgICAgICAgfCA3MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTQ3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3RzdF9hcmNoLmgKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdHN0X2FyY2guYwoKZGlmZiAtLWdpdCBhL2RvYy90ZXN0LXdy
aXRpbmctZ3VpZGVsaW5lcy50eHQgYi9kb2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0Cmlu
ZGV4IGYxOTEyZGMxMi4uMTA0NDJkNzU2IDEwMDY0NAotLS0gYS9kb2MvdGVzdC13cml0aW5nLWd1
aWRlbGluZXMudHh0CisrKyBiL2RvYy90ZXN0LXdyaXRpbmctZ3VpZGVsaW5lcy50eHQKQEAgLTE2
NjgsNiArMTY2OCw2MCBAQCBzdHVyY3QgdHN0X3Rlc3QgdGVzdCA9IHsKIH07CiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAKKzIuMi4zMCBUZXN0aW5nIG9uIHNwZWNpZmllZCBhcmNoaXRlY3R1cmUK
K15eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KKworVGVzdGNhc2VzIGZv
ciBzcGVjaWZpZWQgYXJjaCBzaG91bGQgYmUgbGltaXRlZCBvbiB0aGF0IG9ubHkgYmVpbmcgc3Vw
cG9ydGVkCitwbGF0Zm9ybSB0byBydW4sIHdlIG5vdyBjcmVhdGUgYSBmdW5jdGlvbiB0c3Rfb25f
YXJjaCB0byBhY2hpZXZlIHRoaXMgbmV3CitmZWF0dXJlIGluIExUUCBsaWJyYXJ5LiAgQWxsIHlv
dSBuZWVkIHRvIHJ1biBhIHRlc3Qgb24gdGhlIGV4cGVjdGVkIGFyY2ggaXMKK3RvIHNldCB0aGUg
Jy5hcmNoJyBzdHJpbmcgaW4gdGhlICdzdHJ1Y3QgdHN0X3Rlc3QnIHRvIGNob29zZSB0aGUgcmVx
dWlyZWQKK2FyY2ggbGlzdC4gZS5nLiAnLmFyY2ggPSAieDg2XzY0LCBpMzg2IicuCisKK1tzb3Vy
Y2UsY10KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorCitz
dGF0aWMgdm9pZCBzZXR1cCh2b2lkKQoreworCS4uLgorfQorCitzdGF0aWMgc3RydWN0IHRzdF90
ZXN0IHRlc3QgPSB7CisJLi4uCisJLnNldHVwID0gc2V0dXAsCisJLmFyY2ggPSAieDg2XzY0LCBp
Mzg2IiwKKwkuLi4KK30KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworRm9yIG1vcmUgY29tcGxp
Y2F0ZWQgdXNhZ2VzIHN1Y2ggYXMgY3VzdG9taXplIHlvdXIgdGVzdCBjb2RlIGZvciBhIHNwZWNp
YWwKK2FyY2gsIHRoZSB0c3Rfb25fYXJjaCBmdW5jdGlvbiBjb3VsZCBiZSBpbnZva2VkIGluIHRo
ZSB0ZXN0IGRpcmVjdGx5LgorCitbc291cmNlLGNdCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisj
aW5jbHVkZSAidHN0X3Rlc3QuaCIKKworc3RhdGljIHZvaWQgZG9fdGVzdCh2b2lkKQoreworCWlm
ICh0c3Rfb25fYXJjaCgieDg2XzY0LCBpMzg2IikpIHsKKwkJLyogY29kZSBmb3IgeDg2XzY0LCBp
Mzg2ICovCisJCS4uLgorCX0gZWxzZSBpZiAodHN0X29uX2FyY2goInBwYzY0IikpIHsKKwkJLyog
Y29kZSBmb3IgcHBjNjQgKi8KKwkJLi4uCisJfSBlbHNlIGlmICh0c3Rfb25fYXJjaCgiczM5MCwg
czM5MHgiKSkgeworCQkvKiBjb2RlIGZvciBzMzkweCAqLworCQkuLi4KKwl9Cit9CisKK3N0YXRp
YyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKKwkuLi4KKwkudGVzdF9hbGwgPSBkb190ZXN0LAor
CS4uLgorfQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCiAKIDIuMyBXcml0aW5nIGEgdGVzdGNh
c2UgaW4gc2hlbGwKIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdHN0X2FyY2guaCBiL2luY2x1ZGUvdHN0X2FyY2guaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAuLjdiZjA0OTNjZQotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1
ZGUvdHN0X2FyY2guaApAQCAtMCwwICsxLDE2IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vci1sYXRlcgorICogQ29weXJpZ2h0IChjKSAyMDE5IExpIFdhbmcgPGxpd2Fu
Z0ByZWRoYXQuY29tPgorICovCisKKyNpZm5kZWYgVFNUX0FSQ0hfSF9fCisjZGVmaW5lIFRTVF9B
UkNIX0hfXworCisvKgorICogQ2hlY2sgaWYgdGVzdCBwbGF0Zm9ybSBpcyBpbiB0aGUgZ2l2ZW4g
YXJjaCBsaXN0LiBJZiB5ZXMgcmV0dXJuIDEsCisgKiBvdGhlcndpc2UgcmV0dXJuIDAuCisgKgor
ICogQGFyY2gsIE5VTEwgb3IgdmxpYWQgYXJjaCBsaXN0CisgKi8KK2ludCB0c3Rfb25fYXJjaChj
b25zdCBjaGFyICphcmNoKTsKKworI2VuZGlmIC8qIFRTVF9BUkNIX0hfXyAqLwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS90c3RfdGVzdC5oIGIvaW5jbHVkZS90c3RfdGVzdC5oCmluZGV4IDhiZGYzODQ4
Mi4uY2FmY2IxYTg5IDEwMDY0NAotLS0gYS9pbmNsdWRlL3RzdF90ZXN0LmgKKysrIGIvaW5jbHVk
ZS90c3RfdGVzdC5oCkBAIC0yOCw2ICsyOCw3IEBACiAjaW5jbHVkZSAidHN0X2F0b21pYy5oIgog
I2luY2x1ZGUgInRzdF9rdmVyY21wLmgiCiAjaW5jbHVkZSAidHN0X2Nsb25lLmgiCisjaW5jbHVk
ZSAidHN0X2FyY2guaCIKICNpbmNsdWRlICJ0c3Rfa2VybmVsLmgiCiAjaW5jbHVkZSAidHN0X21p
bm1heC5oIgogI2luY2x1ZGUgInRzdF9nZXRfYmFkX2FkZHIuaCIKQEAgLTExNCw2ICsxMTUsOCBA
QCBzdHJ1Y3QgdHN0X3Rlc3QgewogCiAJY29uc3QgY2hhciAqbWluX2t2ZXI7CiAKKwljb25zdCBj
aGFyICphcmNoOworCiAJLyogSWYgc2V0IHRoZSB0ZXN0IGlzIGNvbXBpbGVkIG91dCAqLwogCWNv
bnN0IGNoYXIgKnRjb25mX21zZzsKIApAQCAtMjUzLDcgKzI1Niw2IEBAIGNvbnN0IGNoYXIgKnRz
dF9zdHJzdGF0dXMoaW50IHN0YXR1cyk7CiB1bnNpZ25lZCBpbnQgdHN0X3RpbWVvdXRfcmVtYWlu
aW5nKHZvaWQpOwogdm9pZCB0c3Rfc2V0X3RpbWVvdXQoaW50IHRpbWVvdXQpOwogCi0KIC8qCiAg
KiBSZXR1cm5zIHBhdGggdG8gdGhlIHRlc3QgdGVtcG9yYXJ5IGRpcmVjdG9yeSBpbiBhIG5ld2x5
IGFsbG9jYXRlZCBidWZmZXIuCiAgKi8KQEAgLTI2NSw2ICsyNjcsOSBAQCBzdGF0aWMgc3RydWN0
IHRzdF90ZXN0IHRlc3Q7CiAKIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiB7CisJ
aWYgKCF0c3Rfb25fYXJjaCh0ZXN0LmFyY2gpKQorCQl0c3RfYnJrKFRDT05GLCAiVGVzdCBuZWVk
cyBydW5uaW5nIG9uICVzIGFyY2ghIiwgdGVzdC5hcmNoKTsKKwogCXRzdF9ydW5fdGNhc2VzKGFy
Z2MsIGFyZ3YsICZ0ZXN0KTsKIH0KIApkaWZmIC0tZ2l0IGEvbGliL3RzdF9hcmNoLmMgYi9saWIv
dHN0X2FyY2guYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmE5ZjI3NzVi
NAotLS0gL2Rldi9udWxsCisrKyBiL2xpYi90c3RfYXJjaC5jCkBAIC0wLDAgKzEsNzEgQEAKKy8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisgKiBDb3B5cmlnaHQg
KGMpIDIwMTkgTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CisgKi8KKworI2luY2x1ZGUgPHN0
cmluZy5oPgorCisjZGVmaW5lIFRTVF9OT19ERUZBVUxUX01BSU4KKyNpbmNsdWRlICJ0c3RfYXJj
aC5oIgorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisKK3N0YXRpYyBjb25zdCBjaGFyICpjb25zdCBh
cmNoX3R5cGVfbGlzdFtdID0geworCSJpMzg2IiwKKwkieDg2IiwKKwkieDg2XzY0IiwKKwkiaWE2
NCIsCisJInBwYyIsCisJInBwYzY0IiwKKwkiczM5MCIsCisJInMzOTB4IiwKKwkiYXJtIiwKKwki
YWFyY2g2NCIsCisJInNwYXJjIiwKKwlOVUxMCit9OworCitzdGF0aWMgaW50IGlzX3ZhbGlkX2Fy
Y2goY29uc3QgY2hhciAqYXJjaCkKK3sKKwl1bnNpZ25lZCBpbnQgaTsKKworCWZvciAoaSA9IDA7
IGFyY2hfdHlwZV9saXN0W2ldOyBpKyspIHsKKwkJaWYgKHN0cnN0cihhcmNoLCBhcmNoX3R5cGVf
bGlzdFtpXSkpCisJCQlyZXR1cm4gMTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworaW50IHRzdF9v
bl9hcmNoKGNvbnN0IGNoYXIgKmFyY2gpCit7CisjaWYgZGVmaW5lZChfX2kzODZfXykKKwljaGFy
ICp0c3RfYXJjaCA9ICJpMzg2IjsKKyNlbGlmIGRlZmluZWQoX194ODZfXykKKwljaGFyICp0c3Rf
YXJjaCA9ICJ4ODYiOworI2VsaWYgZGVmaW5lZChfX3g4Nl82NF9fKQorCWNoYXIgKnRzdF9hcmNo
ID0gIng4Nl82NCI7CisjZWxpZiBkZWZpbmVkKF9faWE2NF9fKQorCWNoYXIgKnRzdF9hcmNoID0g
ImlhNjQiOworI2VsaWYgZGVmaW5lZChfX3Bvd2VycGNfXykKKwljaGFyICp0c3RfYXJjaCA9ICJw
cGMiOworI2VsaWYgZGVmaW5lZChfX3Bvd2VycGM2NF9fKQorCWNoYXIgKnRzdF9hcmNoID0gInBw
YzY0IjsKKyNlbGlmIGRlZmluZWQoX19zMzkwX18pCisJY2hhciAqdHN0X2FyY2ggPSAiczM5MCI7
CisjZWxpZiBkZWZpbmVkKF9fczM5MHhfXykKKwljaGFyICp0c3RfYXJjaCA9ICJzMzkweCI7Cisj
ZWxpZiBkZWZpbmVkKF9fYXJtX18pCisJY2hhciAqdHN0X2FyY2ggPSAiYXJtIjsKKyNlbGlmIGRl
ZmluZWQoX19hcmNoNjRfXykKKwljaGFyICp0c3RfYXJjaCA9ICJhYXJjaDY0IjsKKyNlbGlmIGRl
ZmluZWQoX19zcGFyY19fKQorCWNoYXIgKnRzdF9hcmNoID0gInNwYXJjIjsKKyNlbmRpZgorCisJ
aWYgKGFyY2ggIT0gTlVMTCAmJiAhaXNfdmFsaWRfYXJjaChhcmNoKSkKKwkJdHN0X2JyayhUQlJP
SywgInBsZWFzZSBzZXQgdmFsaWQgYXJjaGVzISIpOworCisJaWYgKGFyY2ggPT0gTlVMTCB8fCBz
dHJzdHIoYXJjaCwgdHN0X2FyY2gpKQorCQlyZXR1cm4gMTsKKworCXJldHVybiAwOworfQotLSAK
Mi4xNy4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
