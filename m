Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA07307BCE
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 18:11:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA23A3C7937
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 18:10:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C84883C5E71
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 18:10:55 +0100 (CET)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E8506600049
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 18:10:54 +0100 (CET)
Received: from localhost.localdomain (92.208.113.78.rev.sfr.net
 [78.113.208.92]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E456A24000C;
 Thu, 28 Jan 2021 17:10:53 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Thu, 28 Jan 2021 18:10:52 +0100
Message-Id: <20210128171052.6025-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] quota_remount_test01: update to new API
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VXBkYXRlIHRvIG5ldyBBUEkKQWRkIHRlc3Qgb24gcXVvdGFfdjIgZHJpdmVyIHRvIGF2b2lkIHRo
ZSBhYm92ZSBlcnJvcjoKICBxdW90YW9uOiBRdW90YSBmb3JtYXQgbm90IHN1cHBvcnRlZCBpbiBr
ZXJuZWwuCgpTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3Rs
aW4uY29tPgotLS0KIC4uLi9mcy9xdW90YV9yZW1vdW50L3F1b3RhX3JlbW91bnRfdGVzdDAxLnNo
ICB8IDE4NCArKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25z
KCspLCAxMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9mcy9x
dW90YV9yZW1vdW50L3F1b3RhX3JlbW91bnRfdGVzdDAxLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9m
cy9xdW90YV9yZW1vdW50L3F1b3RhX3JlbW91bnRfdGVzdDAxLnNoCmluZGV4IDA0YjdhZjkyMi4u
YWRjYmJlODQ2IDEwMDc1NQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3F1b3RhX3JlbW91bnQv
cXVvdGFfcmVtb3VudF90ZXN0MDEuc2gKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9mcy9xdW90YV9y
ZW1vdW50L3F1b3RhX3JlbW91bnRfdGVzdDAxLnNoCkBAIC0xLDEyNiArMSw4MCBAQAogIyEvYmlu
L3NoCi0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotIyMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMKLSMj
IENvcHlyaWdodCAoYykgSmFuIEthcmEgPGphY2tAc3VzZS5jej4sIDIwMDggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICMjCi0jIyBDb3B5cmlnaHQgKGMpIEludGVybmF0aW9uYWwgQnVz
aW5lc3MgTWFjaGluZXMgIENvcnAuLCAyMDA5ICAgICAgICAgICAgICAgICAjIwotIyMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIyMKLSMjIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyAgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kI29yIG1vZGlmeSAgICAgICMjCi0jIyBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSAg
ICAgICAjIwotIyMgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24g
MiBvZiB0aGUgTGljZW5zZSwgb3IgICAgICAgICAgIyMKLSMjIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMj
Ci0jIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAjIwotIyMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVk
IGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCAgICAgICAgIyMKLSMjIFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2Yg
TUVSQ0hBTlRBQklMSVRZICMjCi0jIyBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgICAjIwotIyMgZm9yIG1vcmUg
ZGV0YWlscy4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIyMKLSMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjCi0jIyBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAgICAgICAg
ICAjIwotIyMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBG
cmVlIFNvZnR3YXJlICAgICAgICAgICAgICAgIyMKLSMjIEZvdW5kYXRpb24sIEluYy4sIDUxIEZy
YW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EgICAg
IyMKLSMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICMjCi0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotIyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIyMKLSMgRmlsZSA6ICAgICAgICBxdW90YV9yZW1vdW50X3Rlc3Qw
MS5zaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjCi0jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAjIwotIyBEZXNjcmlwdGlvbjogIFRlc3Qgd2hldGhlciBrZXJuZWwgcHJvcGVy
bHkgc3VwcG9ydHMgcmVtb3VudGluZyByZWFkLW9ubHkgICAgIyMKLSMgICAgICAgICAgICAgICB3
aXRoIHF1b3RhLiBUaGlzIGZlYXR1cmUgd2FzIGFkZGVkIGluIGtlcm5lbCAyLjYuMjYuIFBsZWFz
ZSAgICMjCi0jICAgICAgICAgICAgICAgc2VlOiBodHRwOi8va2VybmVsbmV3Ymllcy5vcmcvTGlu
dXhfMl82XzI2LCBhbmQgICAgICAgICAgICAgICAjIwotIyAgICAgICAgICAgICAgIGh0dHA6Ly9n
aXQua2VybmVsLm9yZy9naXQvP3A9bGludXgva2VybmVsL2dpdC90b3J2YWxkcy8gICAgICAgIyMK
LSMgICAgICAgICAgICAgICBsaW51eC0yLjYuZ2l0O2E9Y29tbWl0OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICMjCi0jICAgICAgICAgICAgICAgaD0wZmY1YWY4MzQwYWE2
YmU0NDIyMGQ3MjM3ZWY0YTY1NDMxNGNmNzk1ICAgICAgICAgICAgICAgICAgICAjIwotIyAgICAg
ICAgICAgICAgIGZvciBtb3JlIGluZm8uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIyMKLSMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjCi0jIEF1dGhvcjogICAg
ICAgSmFuIEthcmEgPGphY2tAc3VzZS5jej4sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAjIwotIyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMKLSMgSGlzdG9yeTogICAgICBTZXAg
MTggMjAwOCAtIENyZWF0ZWQgLSBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pi4gICAgICAgICAgICAg
ICMjCi0jICAgICAgICAgICAgICAgRmViIDE3IDIwMDkgLSBQb3J0ZWQgdG8gTFRQLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjIwotIyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU3VicmF0YSBNb2RhayA8c3VicmF0YUBsaW51eC52bmV0LmlibS5jb20+ICAgICAgIyMKLSMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyCisjIENvcHlyaWdodCAoYykgSmFuIEthcmEgPGphY2tAc3VzZS5jej4sIDIwMDgK
KyMgQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwg
MjAwOQorIyBDb3B5cmlnaHQgKGMpIEvDtnJ5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3Rs
aW4uY29tPiAyMDIwCiAKLWV4cG9ydCBUQ0lEPXF1b3RhX3JlbW91bnRfdGVzdDAxCi1leHBvcnQg
VFNUX1RPVEFMPTEKLWV4cG9ydCBUU1RfQ09VTlQ9MAorVFNUX05FRURTX0NNRFM9InF1b3RhY2hl
Y2sgcXVvdGFvbiBta2ZzLmV4dDMiCitUU1RfTkVFRFNfRFJJVkVSUz0icXVvdGFfdjIiCitUU1Rf
TkVFRFNfVE1QRElSPTEKK1RTVF9TRVRVUD1kb19zZXR1cAorVFNUX0NMRUFOVVA9ZG9fY2xlYW4K
K1RTVF9URVNURlVOQz1kb190ZXN0CiAKLWlmIFsgLXogJFRNUERJUiBdCi10aGVuCi0JVE1QRElS
PS90bXAKLWZpCi1NTlRESVI9JFRNUERJUi9tbnQKKy4gdHN0X3Rlc3Quc2gKIAotaWYgdHN0X2t2
Y21wIC1sdCAiMi42LjI1IjsgdGhlbgotICAgICAgICB0c3RfcmVzbSBUQ09ORiAiUmVtb3VudGlu
ZyB3aXRoIHF1b3RhcyBlbmFibGVkIGlzIG5vdCBzdXBwb3J0ZWQhIgotICAgICAgICB0c3RfcmVz
bSBUQ09ORiAiWW91IHNob3VsZCBoYXZlIGtlcm5lbCAyLjYuMjYgYW5kIGFib3ZlIHJ1bm5pbmcu
Li4uLiIKLSAgICAgICAgZXhpdCAzMgotZmkKLQotaWYgWyAhIC1kIC9wcm9jL3N5cy9mcy9xdW90
YSBdOyB0aGVuCi0gICAgICAgIHRzdF9yZXNtIFRDT05GICJRdW90YSBub3Qgc3VwcG9ydGVkIGlu
IGtlcm5lbCEiCi0gICAgICAgIGV4aXQgMAotZmkKLQotaWYgISBjb21tYW5kIC12IHF1b3RhY2hl
Y2sgPiAvZGV2L251bGwgMj4mMTsgdGhlbgotCXRzdF9yZXNtIFRDT05GICIncXVvdGFjaGVjaycg
bm90IGZvdW5kIgotCWV4aXQgMAotZmkKLQotaWYgISBjb21tYW5kIC12IHF1b3Rhb24gPiAvZGV2
L251bGwgMj4mMTsgdGhlbgotCXRzdF9yZXNtIFRDT05GICIncXVvdGFvbicgbm90IGZvdW5kIgot
CWV4aXQgMAotZmkKK2RvX3NldHVwKCkKK3sKKwlpZiB0c3Rfa3ZjbXAgLWx0ICIyLjYuMjUiOyB0
aGVuCisJICAgICAgICB0c3RfcmVzIFRDT05GICJSZW1vdW50aW5nIHdpdGggcXVvdGFzIGVuYWJs
ZWQgaXMgbm90IHN1cHBvcnRlZCEiCisJICAgICAgICB0c3RfYnJrIFRDT05GICJZb3Ugc2hvdWxk
IGhhdmUga2VybmVsIDIuNi4yNiBhbmQgYWJvdmUgcnVubmluZy4uLi4uIgorCWZpCisKKwlpZiBb
ICEgLWQgL3Byb2Mvc3lzL2ZzL3F1b3RhIF07IHRoZW4KKwkgICAgICAgIHRzdF9icmsgVENPTkYg
IlF1b3RhIG5vdCBzdXBwb3J0ZWQgaW4ga2VybmVsISIKKwkgICAgICAgIGV4aXQgMAorCWZpCisJ
TU5URElSPSRUTVBESVIvbW50CisJSU1BR0U9bHRwLSQkLWZzLWltYWdlCisJZGQgaWY9L2Rldi96
ZXJvIG9mPSRJTUFHRSBicz00MDk2IGNvdW50PTgwMDAgMj4vZGV2L251bGwKKwlta2ZzLmV4dDMg
LXEgLUYgLWIgNDA5NiAkSU1BR0UKKwlta2RpciAkTU5URElSCit9CiAKLWRpZSgpCitkb19jbGVh
bigpCiB7Ci0JZWNobyA+JjIgJDIKIAl1bW91bnQgMj4vZGV2L251bGwgJE1OVERJUgogCXJtIDI+
L2Rldi9udWxsICRJTUFHRQotCXJtZGlyIDI+L2Rldi9udWxsICRNTlRESVIKLSAgICAgICAgdHN0
X3Jlc20gVEZBSUwgIlF1b3RhIG9uIFJlbW91bnQgRmFpbGVkIgotCWV4aXQgJDEKIH0KIAotY2Qg
JFRNUERJUiB8fCBkaWUgMiAiQ2Fubm90IGNkIHRvICRUTVBESVIiCi1JTUFHRT1sdHAtJCQtZnMt
aW1hZ2UKLWRkIGlmPS9kZXYvemVybyBvZj0kSU1BR0UgYnM9NDA5NiBjb3VudD04MDAwIDI+L2Rl
di9udWxsIHx8IGRpZSAyICJDYW5ub3QgY3JlYXRlIGZpbGVzeXN0ZW0gaW1hZ2UiCi1ta2ZzLmV4
dDMgLXEgLUYgLWIgNDA5NiAkSU1BR0UgfHwgZGllIDIgIkNvdWxkIG5vdCBjcmVhdGUgdGhlIGZp
bGVzeXN0ZW0iCi1ta2RpciAkTU5URElSIHx8IGRpZSAyICJDb3VsZCBub3QgY3JlYXRlIHRoZSBt
b3VudHBvaW50IgotbW91bnQgLXQgZXh0MyAtbyBsb29wLHVzcnF1b3RhLGdycHF1b3RhICRJTUFH
RSAkTU5URElSIHx8IGRpZSAyICJDb3VsZCBub3QgbW91bnQgdGhlIGZpbGVzeXN0ZW0iCi10c3Rf
cmVzbSBUSU5GTyAiU3VjY2Vzc2Z1bGx5IG1vdW50ZWQgdGhlIEZpbGUgU3lzdGVtIgotCi0jIHNv
bWUgZGlzdHJvcyAoQ2VudE9TIDYueCwgZm9yIGV4YW1wbGUpIGRvZXNuJ3QgcGVybWl0IGNyZWF0
aW5nCi0jIG9mIHF1b3RhIGZpbGVzIGluIGEgZGlyZWN0b3J5IHdpdGggU0VMaW51eCBmaWxlX3Qg
dHlwZQotaWYgWyAteCAvdXNyL3NiaW4vc2VsaW51eGVuYWJsZWQgXSAmJiAvdXNyL3NiaW4vc2Vs
aW51eGVuYWJsZWQ7IHRoZW4KLQljaGNvbiAtdCB0bXBfdCAkTU5URElSIHx8IGRpZSAyICJDb3Vs
ZCBub3QgY2hhbmdlIFNFTGludXggZmlsZSB0eXBlIgotCXRzdF9yZXNtIFRJTkZPICJTdWNjZXNz
ZnVsbHkgY2hhbmdlZCBTRUxpbnV4IGZpbGUgdHlwZSIKLWZpCi0KLXF1b3RhY2hlY2sgLWN1ZyAk
TU5URElSIHx8IGRpZSAyICJDb3VsZCBub3QgY3JlYXRlIHF1b3RhIGZpbGVzIgotdHN0X3Jlc20g
VElORk8gIlN1Y2Nlc3NmdWxseSBDcmVhdGVkIFF1b3RhIEZpbGVzIgotCi1xdW90YW9uIC11ZyAk
TU5URElSIHx8IGRpZSAyICJDb3VsZCBub3QgdHVybiBxdW90YSBvbiIKLXRzdF9yZXNtIFRJTkZP
ICJTdWNjZXNzZnVsbHkgVHVybmVkIG9uIFF1b3RhIgotCi1lY2hvICJibGFoIiA+JE1OVERJUi9m
aWxlIHx8IGRpZSAyICJDb3VsZCBub3Qgd3JpdGUgdG8gdGhlIGZpbGVzeXN0ZW0iCi10c3RfcmVz
bSBUSU5GTyAiU3VjY2Vzc2Z1bGx5IHdyb3RlIHRvIHRoZSBmaWxlc3lzdGVtIgotCi0jIEdldCBj
dXJyZW50IHF1b3RhIHVzYWdlCi1CTE9DS1M9YHF1b3RhICAtZiAkTU5URElSIC12IC13IHwgdGFp
bCAtbiAxIHwgc2VkIC1lICdzLyAqW14gXSogKlwoWzAtOV0qXCkgLiovXDEvJ2AKLW1vdW50IC1v
IHJlbW91bnQscm8gJE1OVERJUiB8fCBkaWUgMSAiQ291bGQgbm90IHJlbW91bnQgcmVhZC1vbmx5
IgotdHN0X3Jlc20gVElORk8gIlN1Y2Nlc3NmdWxseSBSZW1vdW50ZWQgUmVhZC1Pbmx5IEZTIgot
Ci1tb3VudCAtbyByZW1vdW50LHJ3ICRNTlRESVIgfHwgZGllIDIgIkNvdWxkIG5vdCByZW1vdW50
IHJlYWQtd3JpdGUiCi10c3RfcmVzbSBUSU5GTyAiU3VjY2Vzc2Z1bGx5IFJlbW91bnRlZCBSZWFk
LVdyaXRlIEZTIgotCi1ybSAkTU5URElSL2ZpbGUKLSMgR2V0IHF1b3RhIHVzYWdlIGFmdGVyIHJl
bW92aW5nIHRoZSBmaWxlCi1ORVdCTE9DS1M9YHF1b3RhICAtZiAkTU5URElSIC12IC13IHwgdGFp
bCAtbiAxIHwgc2VkIC1lICdzLyAqW14gXSogKlwoWzAtOV0qXCkgLiovXDEvJ2AKLSMgSGFzIHF1
b3RhIHVzYWdlIGNoYW5nZWQgcHJvcGVybHk/Ci1pZiBbICRCTE9DS1MgLWVxICRORVdCTE9DS1Mg
XTsgdGhlbgotICBkaWUgMSAiVXNhZ2UgZGlkIG5vdCBjaGFuZ2UgYWZ0ZXIgcmVtb3VudCIKLWZp
Ci10c3RfcmVzbSBUSU5GTyAiVXNhZ2Ugc3VjY2Vzc2Z1bGx5IENoYW5nZWQgYWZ0ZXIgUmVtb3Vu
dCIKLXRzdF9yZXNtIFRQQVNTICJRdW90YSBvbiBSZW1vdW50IFN1Y2Nlc3NmdWxsIgorZG9fdGVz
dCgpCit7CisJRVhQRUNUX1BBU1MgbW91bnQgLXQgZXh0MyAtbyBsb29wLHVzcnF1b3RhLGdycHF1
b3RhICRJTUFHRSAkTU5URElSCisJdHN0X3JlcyBUSU5GTyAiU3VjY2Vzc2Z1bGx5IG1vdW50ZWQg
dGhlIEZpbGUgU3lzdGVtIgorCisJIyBzb21lIGRpc3Ryb3MgKENlbnRPUyA2LngsIGZvciBleGFt
cGxlKSBkb2Vzbid0IHBlcm1pdCBjcmVhdGluZworCSMgb2YgcXVvdGEgZmlsZXMgaW4gYSBkaXJl
Y3Rvcnkgd2l0aCBTRUxpbnV4IGZpbGVfdCB0eXBlCisJaWYgWyAteCAvdXNyL3NiaW4vc2VsaW51
eGVuYWJsZWQgXSAmJiAvdXNyL3NiaW4vc2VsaW51eGVuYWJsZWQ7IHRoZW4KKwkJY2hjb24gLXQg
dG1wX3QgJE1OVERJUiB8fCB0c3RfYnJrIFRGQUlMICJDb3VsZCBub3QgY2hhbmdlIFNFTGludXgg
ZmlsZSB0eXBlIgorCQl0c3RfcmVzIFRJTkZPICJTdWNjZXNzZnVsbHkgY2hhbmdlZCBTRUxpbnV4
IGZpbGUgdHlwZSIKKwlmaQorCisJRVhQRUNUX1BBU1MgcXVvdGFjaGVjayAtY3VnICRNTlRESVIK
Kwl0c3RfcmVzIFRJTkZPICJTdWNjZXNzZnVsbHkgQ3JlYXRlZCBRdW90YSBGaWxlcyIKKworCUVY
UEVDVF9QQVNTIHF1b3Rhb24gLXVnICRNTlRESVIKKwl0c3RfcmVzIFRJTkZPICJTdWNjZXNzZnVs
bHkgVHVybmVkIG9uIFF1b3RhIgorCisJRVhQRUNUX1BBU1MgZWNobyAiYmxhaCIgLz4kTU5URElS
L2ZpbGUKKwl0c3RfcmVzIFRJTkZPICJTdWNjZXNzZnVsbHkgd3JvdGUgdG8gdGhlIGZpbGVzeXN0
ZW0iCisKKwkjIEdldCBjdXJyZW50IHF1b3RhIHVzYWdlCisJQkxPQ0tTPWBxdW90YSAgLWYgJE1O
VERJUiAtdiAtdyB8IHRhaWwgLW4gMSB8IHNlZCAtZSAncy8gKlteIF0qICpcKFswLTldKlwpIC4q
L1wxLydgCisJRVhQRUNUX1BBU1MgbW91bnQgLW8gcmVtb3VudCxybyAkTU5URElSCisJdHN0X3Jl
cyBUSU5GTyAiU3VjY2Vzc2Z1bGx5IFJlbW91bnRlZCBSZWFkLU9ubHkgRlMiCisKKwlFWFBFQ1Rf
UEFTUyBtb3VudCAtbyByZW1vdW50LHJ3ICRNTlRESVIKKwl0c3RfcmVzIFRJTkZPICJTdWNjZXNz
ZnVsbHkgUmVtb3VudGVkIFJlYWQtV3JpdGUgRlMiCisKKwlybSAkTU5URElSL2ZpbGUKKwkjIEdl
dCBxdW90YSB1c2FnZSBhZnRlciByZW1vdmluZyB0aGUgZmlsZQorCU5FV0JMT0NLUz1gcXVvdGEg
IC1mICRNTlRESVIgLXYgLXcgfCB0YWlsIC1uIDEgfCBzZWQgLWUgJ3MvICpbXiBdKiAqXChbMC05
XSpcKSAuKi9cMS8nYAorCSMgSGFzIHF1b3RhIHVzYWdlIGNoYW5nZWQgcHJvcGVybHk/CisJaWYg
WyAkQkxPQ0tTIC1lcSAkTkVXQkxPQ0tTIF07IHRoZW4KKwkgICB0c3RfYnJrIFRXQVJOICJVc2Fn
ZSBkaWQgbm90IGNoYW5nZSBhZnRlciByZW1vdW50IgorCWZpCisJdHN0X3JlcyBUSU5GTyAiVXNh
Z2Ugc3VjY2Vzc2Z1bGx5IENoYW5nZWQgYWZ0ZXIgUmVtb3VudCIKKwl0c3RfcmVzIFRQQVNTICJR
dW90YSBvbiBSZW1vdW50IFN1Y2Nlc3NmdWxsIgorfQogCi11bW91bnQgJE1OVERJUiB8fCBkaWUg
MiAiQ291bGQgbm90IHVtb3VudCAkTU5URElSIgotcm1kaXIgJE1OVERJUiB8fCAgZGllIDIgIkNv
dWxkIG5vdCByZW1vdmUgJE1OVERJUiIKLXJtICRJTUFHRQotZXhpdCAwCit0c3RfcnVuCi0tIAoy
LjE3LjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
