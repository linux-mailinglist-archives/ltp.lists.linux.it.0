Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF2DCCF
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 09:28:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88370298933
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Apr 2019 09:28:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3BD743EA137
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 09:28:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CFF5B1A003D3
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 09:28:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D17C0AE28;
 Mon, 29 Apr 2019 07:28:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Apr 2019 09:27:59 +0200
Message-Id: <20190429072800.23067-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] net/traceroute: Rewrite into new API
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

QWRkIGluZm8gYWJvdXQgdHJhY2Vyb3V0ZSBmcm9tIGlwdXRpbHMgbm90IGJlaW5nIHN1cHBvcnRl
ZAoKU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQogdGVzdGNh
c2VzL25ldHdvcmsvdHJhY2Vyb3V0ZS90cmFjZXJvdXRlMDEuc2ggfCA2MyArKysrKysrKy0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9uZXR3b3JrL3RyYWNlcm91dGUvdHJhY2Vyb3V0ZTAx
LnNoIGIvdGVzdGNhc2VzL25ldHdvcmsvdHJhY2Vyb3V0ZS90cmFjZXJvdXRlMDEuc2gKaW5kZXgg
MWM4YjY2ZjU1Li44ZTlmNDZmNDUgMTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9uZXR3b3JrL3RyYWNl
cm91dGUvdHJhY2Vyb3V0ZTAxLnNoCisrKyBiL3Rlc3RjYXNlcy9uZXR3b3JrL3RyYWNlcm91dGUv
dHJhY2Vyb3V0ZTAxLnNoCkBAIC0xLDM5ICsxLDIwIEBACiAjIS9iaW4vc2gKKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKyMgQ29weXJpZ2h0IChjKSAyMDE5IFBl
dHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgogIyBDb3B5cmlnaHQgKGMpIDIwMTcgT3JhY2xlIGFu
ZC9vciBpdHMgYWZmaWxpYXRlcy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICMgQ29weXJpZ2h0IChj
KSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwMQotIwotIyBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
Ci0jIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzCi0jIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyIG9mCi0jIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFu
eSBsYXRlciB2ZXJzaW9uLgotIwotIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3b3VsZCBiZSB1c2VmdWwsCi0jIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCi0jIE1FUkNIQU5UQUJJTElU
WSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKLSMgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSMKLSMgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKLSMg
YWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KIAotVFNUX1RPVEFMPTYKLVRDSUQ9InRyYWNlcm91dGUwMSIKLVRTVF9DTEVB
TlVQPSJjbGVhbnVwIgotCi1UU1RfVVNFX0xFR0FDWV9BUEk9MQorVFNUX0NOVD0yCitUU1RfTkVF
RFNfQ01EUz0idHJhY2Vyb3V0ZSIKK1RTVF9TRVRVUD0ic2V0dXAiCitUU1RfVEVTVEZVTkM9InRl
c3QiCiAuIHRzdF9uZXQuc2gKIAotY2xlYW51cCgpCi17Ci0JdHN0X3JtZGlyCi19Ci0KIHNldHVw
KCkKIHsKLQl0c3RfcmVzbSBUSU5GTyAidHJhY2Vyb3V0ZSB2ZXJzaW9uOiIKLQl0c3RfcmVzbSBU
SU5GTyAkKHRyYWNlcm91dGUgLS12ZXJzaW9uIDI+JjEpCi0KLQl0c3RfdGVzdF9jbWRzIHRyYWNl
cm91dGUKLQl0c3RfdG1wZGlyCisJdHN0X3JlcyBUSU5GTyAidHJhY2Vyb3V0ZSB2ZXJzaW9uOiIK
Kwl0c3RfcmVzIFRJTkZPICQodHJhY2Vyb3V0ZSAtLXZlcnNpb24gMj4mMSkKKwlbICIkVFNUX0lQ
VjYiIF0gJiYgdHN0X3JlcyBUSU5GTyAiTk9URTogdHJhY2VwYXRoNiBmcm9tIGlwdXRpbHMgaXMg
bm90IHN1cHBvcnRlZCIKIH0KIAogcnVuX3RyYWNlKCkKQEAgLTUxLDI0ICszMiwzMCBAQCBydW5f
dHJhY2UoKQogCWdyZXAgLXEgIiRieXRlcyBieXRlIiBvdXQubG9nCiAJaWYgWyAkPyAtbmUgMCBd
OyB0aGVuCiAJCWNhdCBvdXQubG9nCi0JCXRzdF9yZXNtIFRGQUlMICInJGJ5dGVzIGJ5dGUnIG5v
dCBmb3VuZCIKKwkJdHN0X3JlcyBURkFJTCAiJyRieXRlcyBieXRlJyBub3QgZm91bmQiCiAJZWxz
ZQotCQl0c3RfcmVzbSBUUEFTUyAidHJhY2Vyb3V0ZSB1c2UgJGJ5dGVzIGJ5dGVzIgorCQl0c3Rf
cmVzIFRQQVNTICJ0cmFjZXJvdXRlIHVzZSAkYnl0ZXMgYnl0ZXMiCiAJZmkKIAogCXRhaWwgLTEg
b3V0LmxvZyB8IGdyZXAgLXFFICIkcGF0dGVybiIKIAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KIAkJ
Y2F0IG91dC5sb2cKLQkJdHN0X3Jlc20gVEZBSUwgInBhdHRlcm4gJyRwYXR0ZXJuJyBub3QgZm91
bmQgaW4gbG9nIgorCQl0c3RfcmVzIFRGQUlMICJwYXR0ZXJuICckcGF0dGVybicgbm90IGZvdW5k
IGluIGxvZyIKIAllbHNlCi0JCXRzdF9yZXNtIFRQQVNTICJ0cmFjZXJvdXRlIHRlc3QgY29tcGxl
dGVkIHdpdGggMSBob3AiCisJCXRzdF9yZXMgVFBBU1MgInRyYWNlcm91dGUgdGVzdCBjb21wbGV0
ZWQgd2l0aCAxIGhvcCIKIAlmaQogfQogCi1zZXR1cAotdHN0X3Jlc20gVElORk8gInJ1biB0cmFj
ZXJvdXRlIHdpdGggSUNNUCBFQ0hPIgotcnVuX3RyYWNlIC1JCi10c3RfcmVzbSBUSU5GTyAicnVu
IHRyYWNlcm91dGUgd2l0aCBUQ1AgU1lOIgotcnVuX3RyYWNlIC1UCit0ZXN0MSgpCit7CisJdHN0
X3JlcyBUSU5GTyAicnVuIHRyYWNlcm91dGUgd2l0aCBJQ01QIEVDSE8iCisJcnVuX3RyYWNlIC1J
Cit9CisKK3Rlc3QyKCkKK3sKKwl0c3RfcmVzIFRJTkZPICJydW4gdHJhY2Vyb3V0ZSB3aXRoIFRD
UCBTWU4iCisJcnVuX3RyYWNlIC1UCit9CiAKLXRzdF9leGl0Cit0c3RfcnVuCi0tIAoyLjIwLjEK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
