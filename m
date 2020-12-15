Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 768802DA7F6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 07:07:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE6E83C5821
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 07:07:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4A3343C2A02
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 07:07:11 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9DD3E600C6D
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 07:07:10 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id BB3D69F616;
 Tue, 15 Dec 2020 06:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1608012428; bh=4peM0hhPaf8AnJnoPDWjulPGTptq5vb/qncnNlg99v8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=muRCNUWHxnpkUL5HwbbQKL8z+bR7Gbx4EqzjigyRiwqaMc0GeoK7VPRplYKxnxCeE
 gzTUtCgvUN0+6SIG6FyeW2+iuYNo3EuZ2dQh0dMFXsURA+YbsqMiRy7jMJJxy9FJcM
 0S7lx1ON/1FDAdGsmyUfn42zEtomdjTO59mfTjUQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 15 Dec 2020 07:07:02 +0100
Message-Id: <20201215060702.507970-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC] openposix: Use TMPDIR instead of hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

RnJvbTogSm9lcmcgVmVobG93IDxqb2VyZy52ZWhsb3dAYW94LXRlY2guZGU+CgpIaSBldmVyeW9u
ZSwKClRoZXJlIGFyZSBsb3RzIG9mIGNvZGUgc25pcHBldHMgbGlrZQoKc25wcmludGYoZm5hbWUs
IHNpemVvZihmbmFtZSksICIvdG1wLzxzb21lX25hbWU+XyVkIiwgZ2V0cGlkKCkpOwp1bmxpbmso
Zm5hbWUpOwpvcGVuKGZuYW1lLCAuLi4pOwoKdGhyb3VnaG91dCB0aGUgb3BlbiBwb3NpeCB0ZXN0
cy4KSSdkIGxpa2UgdG8gZ2V0IHJpZCBvZiB0aGUgaGFyZGNvZGVkIC90bXAgcGF0aHMgYW5kIHJl
cGxhY2UgdGhlbQp3aXRoIFRNUERJUiwgaWYgaXQgaXMgc2V0LiBCZWNhdXNlIHRoZSBwYXR0ZXJu
IGlzIG1vc3RseSB0aGUgc2FtZSwKSSdkIGxpa2UgdG8gZ2VuZXJhbGl6ZSB0aGUgaW1wbGVtZW50
YXRpb24uIEN1cnJlbnRseSB0aGVyZSBpcyBubyBsaWJyYXJ5CmxpbmtlZCB0byB0aGUgb3Blbl9w
b3NpeCB0ZXN0cywgdGhhdCdzIHdoeSBJIGNob29zZSBhIHN0YXRpYyBpbmxpbmUKZnVuY3Rpb24g
aW1wbGVtZW50ZWQgaW4gcG9zaXh0ZXN0cy5oLgpUaGlzIGNvdWxkIGFsc28gYmUgZW5oYW5jZWQg
dG8gdXNlIG1rc3RlbXAgYW5kIHJldHVybiB0aGUgZmlsZWhhbmRsZQpkaXJlY3RseSwgYmVjYXVz
ZSBtb3N0IG9mIHRoZSB0aW1lIHRoZSBmaWxlIGlzIG9wZW5kIGFueXdheS4KCldoYXQgaXMgeW91
ciBvcGlvbmlvbj8gRG9lcyBhIGNoYW5nZSBsaWtlIHRoaXMgbWFrZSBzZW5zZSBvciB3b3VsZAp5
b3UgZG8gaXQgZGlmZmVyZW50bHk/CgpUaGFua3MsCkrDtnJnCgoKLS0tCiAuLi4vY29uZm9ybWFu
Y2UvaW50ZXJmYWNlcy9tbWFwLzUtMS5jICAgICAgICAgICAgICAgfCAgMyArKy0KIHRlc3RjYXNl
cy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9pbmNsdWRlL3Bvc2l4dGVzdC5oICB8IDEzICsrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9p
bnRlcmZhY2VzL21tYXAvNS0xLmMgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29u
Zm9ybWFuY2UvaW50ZXJmYWNlcy9tbWFwLzUtMS5jCmluZGV4IGQ5ZDQ3NmJkNS4uZmI5OGNiODc3
IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2Uv
aW50ZXJmYWNlcy9tbWFwLzUtMS5jCisrKyBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0
ZS9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL21tYXAvNS0xLmMKQEAgLTkzLDcgKzkzLDggQEAgaW50
IG1haW4odm9pZCkKIAlpbnQgZmQsIGZhaWwgPSAwOwogCXVuc2lnbmVkIGludCBpOwogCi0Jc25w
cmludGYodG1wZm5hbWUsIHNpemVvZih0bXBmbmFtZSksICIvdG1wL3B0c19tbWFwXzVfMV8lZCIs
IGdldHBpZCgpKTsKKwlHRVRfVE1QX0ZJTEVOQU1FKHRtcGZuYW1lLCAicHRzX21tYXBfNV8xIik7
CisKIAl1bmxpbmsodG1wZm5hbWUpOwogCWZkID0gb3Blbih0bXBmbmFtZSwgT19DUkVBVCB8IE9f
UkRXUiB8IE9fRVhDTCwgU19JUlVTUiB8IFNfSVdVU1IpOwogCWlmIChmZCA9PSAtMSkgewpkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2luY2x1ZGUvcG9zaXh0ZXN0
LmggYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvaW5jbHVkZS9wb3NpeHRlc3QuaApp
bmRleCBjZjA5NTJjYmYuLmUwZjFmMDIxNCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL29wZW5fcG9z
aXhfdGVzdHN1aXRlL2luY2x1ZGUvcG9zaXh0ZXN0LmgKKysrIGIvdGVzdGNhc2VzL29wZW5fcG9z
aXhfdGVzdHN1aXRlL2luY2x1ZGUvcG9zaXh0ZXN0LmgKQEAgLTksNiArOSw5IEBACiAvKgogICog
cmV0dXJuIGNvZGVzCiAgKi8KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzdGRpby5o
PgorI2luY2x1ZGUgPHVuaXN0ZC5oPgogCiAjZGVmaW5lIFBUU19QQVNTICAgICAgICAwCiAjZGVm
aW5lIFBUU19GQUlMICAgICAgICAxCkBAIC0yMywzICsyNiwxMyBAQAogI2RlZmluZSBMVFBfQVRU
UklCVVRFX05PUkVUVVJOCQlfX2F0dHJpYnV0ZV9fKChub3JldHVybikpCiAjZGVmaW5lIExUUF9B
VFRSSUJVVEVfVU5VU0VECQlfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKQogI2RlZmluZSBMVFBfQVRU
UklCVVRFX1VOVVNFRF9SRVNVTFQJX19hdHRyaWJ1dGVfXygod2Fybl91bnVzZWRfcmVzdWx0KSkK
KworI2RlZmluZSBHRVRfVE1QX0ZJTEVOQU1FKHRhcmdldCwgcHJlZml4KSBcCisgICAgc25wcmlu
dGYodGFyZ2V0LCBzaXplb2YodGFyZ2V0KSwgIiVzLyIgcHJlZml4ICIlZCIsICB0bXBkaXIoKSwg
Z2V0cGlkKCkpOworCitzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKnRtcGRpcih2b2lkKQorewor
ICAgIGNvbnN0IGNoYXIgKnRtcGRpcl9lbnY7CisgICAgdG1wZGlyX2VudiA9IGdldGVudigiVE1Q
RElSIik7CisgICAgcmV0dXJuIHRtcGRpcl9lbnYgPyB0bXBkaXJfZW52IDogIi90bXAiOworfQot
LSAKMi4yNS4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
