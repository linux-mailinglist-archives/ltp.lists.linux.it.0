Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8D6EAD91
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Apr 2023 16:58:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76A8C3CBEED
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Apr 2023 16:58:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 046C13CBEE3
 for <ltp@lists.linux.it>; Fri, 21 Apr 2023 16:57:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2EFDF1A00A36
 for <ltp@lists.linux.it>; Fri, 21 Apr 2023 16:57:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23BF11FDDF;
 Fri, 21 Apr 2023 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682089067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnVPGz2Cg29L6ikAxQ9MPbgTQQg8yZFZnXQBIf2c3kM=;
 b=C7x7r7fzodSVArfw+YDGcFmEgGaJ8q3HI7Nvu1eHe9tbQ4JF49iYI9Fj8XtVDc5kFgB1uh
 o3Y73KQagCxDm4O+JRu4i4uVz05a2U+z1CiUbMH74EK25/j0R0/5cFuyBGFdyMuWM2pm/U
 vfPivgERrXl5bXIswD1tdBQpUZrVsoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682089067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnVPGz2Cg29L6ikAxQ9MPbgTQQg8yZFZnXQBIf2c3kM=;
 b=kbf7lNCl3VqtArBKcX0mPMUqfIEvdStcfO7xPnNaS0gahaHiU6nq2IBfJ5rxhaKiWwAea+
 b7c6Oy5TWaAMDsBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 088471390E;
 Fri, 21 Apr 2023 14:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Nko8AWukQmRfDAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 21 Apr 2023 14:57:47 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: nstange@suse.de,
	ltp@lists.linux.it
Date: Fri, 21 Apr 2023 16:57:42 +0200
Message-Id: <20230421145746.5704-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] KVM: Add helper functions for accessing GDT/LDT
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

VGhlIGZyYWdtZW50ZWQgc3RydWN0dXJlIG9mIEdEVCBhbmQgTERUIHJlcXVpcmVzIGhlbHBlciBm
dW5jdGlvbnMKdG8gd29yayB3aXRoIGRlc2NyaXB0b3JzLiBBZGQgdGhlIG5lY2Vzc2FyeSBzdHJ1
Y3R1cmUgZGVmaW5pdGlvbnMsCmNvbnN0YW50cyBhbmQgZnVuY3Rpb25zLiBBbHNvIGluY3JlYXNl
IEdEVCBzaXplIHRvIDMyIGRlc2NyaXB0b3JzCmZvciBsYXRlciB1c2UuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJ0aW4gRG91Y2hhIDxtZG91Y2hhQHN1c2UuY3o+Ci0tLQogZG9jL2t2bS10ZXN0LWFwaS50
eHQgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrCiB0ZXN0Y2FzZXMva2VybmVsL2t2bS9i
b290c3RyYXBfeDg2LlMgICAgfCAgMyArLQogdGVzdGNhc2VzL2tlcm5lbC9rdm0vYm9vdHN0cmFw
X3g4Nl82NC5TIHwgIDMgKy0KIHRlc3RjYXNlcy9rZXJuZWwva3ZtL2luY2x1ZGUva3ZtX3g4Ni5o
ICB8IDUzICsrKysrKysrKysrKysrCiB0ZXN0Y2FzZXMva2VybmVsL2t2bS9saWJfeDg2LmMgICAg
ICAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE2
OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvYy9rdm0tdGVz
dC1hcGkudHh0IGIvZG9jL2t2bS10ZXN0LWFwaS50eHQKaW5kZXggMjViNzIxNzJkLi5mNjI4MTk3
NjQgMTAwNjQ0Ci0tLSBhL2RvYy9rdm0tdGVzdC1hcGkudHh0CisrKyBiL2RvYy9rdm0tdGVzdC1h
cGkudHh0CkBAIC0zNDMsNiArMzQzLDI2IEBAIERldmVsb3BlcidzIE1hbnVhbCwgVm9sdW1lIDMs
IENoYXB0ZXIgNCBmb3IgZXhwbGFuYXRpb24gb2YgdGhlIGZpZWxkcy4KICAgdGhlIGtub3duIHBv
c2l0aW9uIGluIHBhZ2UgdGFibGUgaGllcmFyY2h5IGFuZCBgZW50cnktPnBhZ2VfdHlwZWAuIFJl
dHVybnMKICAgemVybyBpZiB0aGUgYGVudHJ5YCBkb2VzIG5vdCByZWZlcmVuY2UgYW55IG1lbW9y
eSBwYWdlLgogCistIGB2b2lkIGt2bV9zZXRfc2VnbWVudF9kZXNjcmlwdG9yKHN0cnVjdCBzZWdt
ZW50X2Rlc2NyaXB0b3IgKmRzdCwgdWludDY0X3QgYmFzZWFkZHIsIHVpbnQzMl90IGxpbWl0LCB1
bnNpZ25lZCBpbnQgZmxhZ3MpYCAtCisgIEZpbGwgdGhlIGBkc3RgIHNlZ21lbnQgZGVzY3JpcHRv
ciB3aXRoIGdpdmVuIHZhbHVlcy4gVGhlIG1heGltdW0gdmFsdWUKKyAgb2YgYGxpbWl0YCBpcyBg
MHhmZmZmZmAgKGluY2x1c2l2ZSkgcmVnYXJkbGVzcyBvZiBgZmxhZ3NgLgorCistIGB2b2lkIGt2
bV9wYXJzZV9zZWdtZW50X2Rlc2NyaXB0b3Ioc3RydWN0IHNlZ21lbnRfZGVzY3JpcHRvciAqc3Jj
LCB1aW50NjRfdCAqYmFzZWFkZHIsIHVpbnQzMl90ICpsaW1pdCwgdW5zaWduZWQgaW50ICpmbGFn
cylgIC0KKyAgUGFyc2UgZGF0YSBpbiB0aGUgYHNyY2Agc2VnbWVudCBkZXNjcmlwdG9yIGFuZCBj
b3B5IHRoZW0gdG8gdmFyaWFibGVzCisgIHBvaW50ZWQgdG8gYnkgdGhlIG90aGVyIGFyZ3VtZW50
cy4gQW55IHBhcmFtZXRlciBleGNlcHQgdGhlIGZpcnN0IG9uZSBjYW4KKyAgYmUgYE5VTExgLgor
CistIGBpbnQga3ZtX2ZpbmRfZnJlZV9kZXNjcmlwdG9yKGNvbnN0IHN0cnVjdCBzZWdtZW50X2Rl
c2NyaXB0b3IgKnRhYmxlLCBzaXplX3Qgc2l6ZSlgIC0KKyAgRmluZCB0aGUgZmlyc3Qgc2VnbWVu
dCBkZXNjcmlwdG9yIGluIGB0YWJsZWAgd2hpY2ggZG9lcyBub3QgaGF2ZQorICB0aGUgYFNFR0ZM
QUdfUFJFU0VOVGAgYml0IHNldC4gVGhlIGZ1bmN0aW9uIGhhbmRsZXMgZG91YmxlLXNpemUgZGVz
Y3JpcHRvcnMKKyAgY29ycmVjdGx5LiBSZXR1cm5zIGluZGV4IG9mIHRoZSBmaXJzdCBhdmFpbGFi
bGUgZGVzY3JpcHRvciBvciAtMSBpZiBhbGwKKyAgYHNpemVgIGRlc2NyaXB0b3JzIGFyZSB0YWtl
bi4KKworLSBgdW5zaWduZWQgaW50IGt2bV9jcmVhdGVfc3RhY2tfZGVzY3JpcHRvcihzdHJ1Y3Qg
c2VnbWVudF9kZXNjcmlwdG9yICp0YWJsZSwgc2l6ZV90IHRhYnNpemUsIHZvaWQgKnN0YWNrX2Jh
c2UpYCAtCisgIENvbnZlbmllbmNlIGZ1bmN0aW9uIGZvciByZWdpc3RlcmluZyBhIHN0YWNrIHNl
Z21lbnQgZGVzY3JpcHRvci4gSXQnbGwKKyAgYXV0b21hdGljYWxseSBmaW5kIGEgZnJlZSBzbG90
IGluIGB0YWJsZWAgYW5kIGZpbGwgdGhlIG5lY2Vzc2FyeSBmbGFncy4KKyAgVGhlIGBzdGFja19i
YXNlYCBwb2ludGVyIG11c3QgcG9pbnQgdG8gdGhlIGJvdHRvbSBvZiB0aGUgc3RhY2suCisKIC0g
YHZvaWQga3ZtX2dldF9jcHVpZCh1bnNpZ25lZCBpbnQgZWF4LCB1bnNpZ25lZCBpbnQgZWN4LAog
ICBzdHJ1Y3Qga3ZtX2NwdWlkICpidWYpYCDigJMgRXhlY3V0ZXMgdGhlIENQVUlEIGluc3RydWN0
aW9uIHdpdGggdGhlIGdpdmVuCiAgIGBlYXhgIGFuZCBgZWN4YCBhcmd1bWVudHMgYW5kIHN0b3Jl
cyB0aGUgcmVzdWx0cyBpbiBgYnVmYC4KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwva3Zt
L2Jvb3RzdHJhcF94ODYuUyBiL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL2Jvb3RzdHJhcF94ODYuUwpp
bmRleCAxYWFmMGE0ZDEuLjNjMTdhMmI0NyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9r
dm0vYm9vdHN0cmFwX3g4Ni5TCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL2Jvb3RzdHJhcF94
ODYuUwpAQCAtNyw2ICs3LDcgQEAKIAogLnNldCBLVk1fVEVYSVQsIDB4ZmYKIC5zZXQgUkVTVUxU
X0FERFJFU1MsIDB4ZmZmZmYwMDAKKy5zZXQgS1ZNX0dEVF9TSVpFLCAzMgogCiAvKgogICogVGhp
cyBzZWN0aW9uIHdpbGwgYmUgYWxsb2NhdGVkIGF0IGFkZHJlc3MgMHgxMDAwIGFuZApAQCAtNDQs
NyArNDUsNyBAQCBrdm1fZ2R0OgogCS44Ynl0ZSAwCiAJZ2R0MzJfZW50cnkgdHlwZT0weDFhIGw9
MCBkPTEgLyogQ29kZSBzZWdtZW50IHByb3RlY3RlZF9tb2RlLCAzMmJpdHMgKi8KIAlnZHQzMl9l
bnRyeSB0eXBlPTB4MTIgLyogRGF0YSBzZWdtZW50LCB3cml0YWJsZSAqLwotCS5za2lwIDE2IC8q
IFN0YWNrIGFuZCBUU1Mgc2VnbWVudCBkZXNjcmlwdG9ycyAqLworCS5za2lwIChLVk1fR0RUX1NJ
WkUtMykqOCAvKiBTdGFjaywgVFNTIGFuZCBvdGhlciBzZWdtZW50IGRlc2NyaXB0b3JzICovCiAK
IC5MZ2R0X2VuZDoKIC5nbG9iYWwga3ZtX2dkdF9kZXNjCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL2t2bS9ib290c3RyYXBfeDg2XzY0LlMgYi90ZXN0Y2FzZXMva2VybmVsL2t2bS9ib290
c3RyYXBfeDg2XzY0LlMKaW5kZXggMGNmZmQ1YTEyLi4zZDhjNDliMTAgMTAwNjQ0Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwva3ZtL2Jvb3RzdHJhcF94ODZfNjQuUworKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL2t2bS9ib290c3RyYXBfeDg2XzY0LlMKQEAgLTgsNiArOCw3IEBACiAuc2V0IEtWTV9UQ09O
RiwgMzIKIC5zZXQgS1ZNX1RFWElULCAweGZmCiAuc2V0IFJFU1VMVF9BRERSRVNTLCAweGZmZmZm
MDAwCisuc2V0IEtWTV9HRFRfU0laRSwgMzIKIAogLyoKICAqIFRoaXMgc2VjdGlvbiB3aWxsIGJl
IGFsbG9jYXRlZCBhdCBhZGRyZXNzIDB4MTAwMCBhbmQKQEAgLTQ3OCw3ICs0NzksNyBAQCBrdm1f
cGd0YWJsZV9sNDoKIGt2bV9nZHQ6CiAJLjhieXRlIDAKIAlnZHQzMl9lbnRyeSB0eXBlPTB4MWEg
bD0xIGxpbWl0PTAgZz0wIC8qIENvZGUgc2VnbWVudCBsb25nIG1vZGUgKi8KLQkuc2tpcCAxNiAv
KiBUU1Mgc2VnbWVudCBkZXNjcmlwdG9yICovCisJLnNraXAgKEtWTV9HRFRfU0laRS0yKSo4IC8q
IFRTUyBhbmQgb3RoZXIgc2VnbWVudCBkZXNjcmlwdG9ycyAqLwogCiAuTGdkdF9lbmQ6CiAuZ2xv
YmFsIGt2bV9nZHRfZGVzYwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9rdm0vaW5jbHVk
ZS9rdm1feDg2LmggYi90ZXN0Y2FzZXMva2VybmVsL2t2bS9pbmNsdWRlL2t2bV94ODYuaAppbmRl
eCA0ZjM2NzExMzUuLmE2NTVjOTgzNCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9rdm0v
aW5jbHVkZS9rdm1feDg2LmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9rdm0vaW5jbHVkZS9rdm1f
eDg2LmgKQEAgLTEwLDYgKzEwLDkgQEAKIAogI2luY2x1ZGUgImt2bV90ZXN0LmgiCiAKKyNkZWZp
bmUgUEFHRVNJWkUgMHgxMDAwCisjZGVmaW5lIEtWTV9HRFRfU0laRSAzMgorCiAvKiBJbnRlcnJ1
cHRzICovCiAjZGVmaW5lIFg4Nl9JTlRSX0NPVU5UIDI1NgogCkBAIC0zOCw2ICs0MSwyNiBAQAog
I2RlZmluZSBJTlRSX1NFQ1VSSVRZX0VSUk9SIDMwCiAKIAorLyogU2VnbWVudCBkZXNjcmlwdG9y
IGZsYWdzICovCisjZGVmaW5lIFNFR1RZUEVfTERUIDB4MDIKKyNkZWZpbmUgU0VHVFlQRV9UU1Mg
MHgwOQorI2RlZmluZSBTRUdUWVBFX1RTU19CVVNZIDB4MGIKKyNkZWZpbmUgU0VHVFlQRV9DQUxM
X0dBVEUgMHgwYworI2RlZmluZSBTRUdUWVBFX0lOVFJfR0FURSAweDBlCisjZGVmaW5lIFNFR1RZ
UEVfVFJBUF9HQVRFIDB4MGYKKyNkZWZpbmUgU0VHVFlQRV9ST0RBVEEgMHgxMAorI2RlZmluZSBT
RUdUWVBFX1JXREFUQSAweDEyCisjZGVmaW5lIFNFR1RZUEVfU1RBQ0sgMHgxNgorI2RlZmluZSBT
RUdUWVBFX0NPREUgMHgxYQorI2RlZmluZSBTRUdUWVBFX01BU0sgMHgxZgorCisjZGVmaW5lIFNF
R0ZMQUdfTlNZU1RFTSAweDEwCisjZGVmaW5lIFNFR0ZMQUdfUFJFU0VOVCAweDgwCisjZGVmaW5l
IFNFR0ZMQUdfQ09ERTY0IDB4MjAwCisjZGVmaW5lIFNFR0ZMQUdfMzJCSVQgMHg0MDAKKyNkZWZp
bmUgU0VHRkxBR19QQUdFX0xJTUlUIDB4ODAwCisKKwogLyogQ1BVSUQgY29uc3RhbnRzICovCiAj
ZGVmaW5lIENQVUlEX0dFVF9JTlBVVF9SQU5HRSAweDgwMDAwMDAwCiAjZGVmaW5lIENQVUlEX0dF
VF9FWFRfRkVBVFVSRVMgMHg4MDAwMDAwMQpAQCAtOTEsNiArMTE0LDI1IEBAIHN0cnVjdCBpbnRy
X2Rlc2NyaXB0b3IgewogI2VuZGlmIC8qIGRlZmluZWQoX194ODZfNjRfXykgKi8KIH0gX19hdHRy
aWJ1dGVfXygoX19wYWNrZWRfXykpOwogCitzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yIHsKKwl1
bnNpZ25lZCBpbnQgbGltaXRfbG8gOiAxNjsKKwl1bnNpZ25lZCBpbnQgYmFzZWFkZHJfbG8gOiAy
NDsKKwl1bnNpZ25lZCBpbnQgZmxhZ3NfbG8gOiA4OworCXVuc2lnbmVkIGludCBsaW1pdF9oaSA6
IDQ7CisJdW5zaWduZWQgaW50IGZsYWdzX2hpIDogNDsKKwl1bnNpZ25lZCBpbnQgYmFzZWFkZHJf
aGkgOiA4OworfSBfX2F0dHJpYnV0ZV9fKChfX3BhY2tlZF9fKSk7CisKK3N0cnVjdCBzZWdtZW50
X2Rlc2NyaXB0b3I2NCB7CisJdW5zaWduZWQgaW50IGxpbWl0X2xvIDogMTY7CisJdW5zaWduZWQg
aW50IGJhc2VhZGRyX2xvIDogMjQ7CisJdW5zaWduZWQgaW50IGZsYWdzX2xvIDogODsKKwl1bnNp
Z25lZCBpbnQgbGltaXRfaGkgOiA0OworCXVuc2lnbmVkIGludCBmbGFnc19oaSA6IDQ7CisJdWlu
dDY0X3QgYmFzZWFkZHJfaGkgOiA0MDsKKwl1aW50MzJfdCByZXNlcnZlZDsKK30gX19hdHRyaWJ1
dGVfXygoX19wYWNrZWRfXykpOworCiBzdHJ1Y3QgcGFnZV90YWJsZV9lbnRyeV9wYWUgewogCXVu
c2lnbmVkIGludCBwcmVzZW50OiAxOwogCXVuc2lnbmVkIGludCB3cml0YWJsZTogMTsKQEAgLTEx
OCwxMCArMTYwLDIxIEBAIHN0cnVjdCBrdm1fY3JlZ3MgewogCiBleHRlcm4gc3RydWN0IHBhZ2Vf
dGFibGVfZW50cnlfcGFlIGt2bV9wYWdldGFibGVbXTsKIGV4dGVybiBzdHJ1Y3QgaW50cl9kZXNj
cmlwdG9yIGt2bV9pZHRbWDg2X0lOVFJfQ09VTlRdOworZXh0ZXJuIHN0cnVjdCBzZWdtZW50X2Rl
c2NyaXB0b3Iga3ZtX2dkdFtLVk1fR0RUX1NJWkVdOwogCiAvKiBQYWdlIHRhYmxlIGhlbHBlciBm
dW5jdGlvbnMgKi8KIHVpbnRwdHJfdCBrdm1fZ2V0X3BhZ2VfYWRkcmVzc19wYWUoY29uc3Qgc3Ry
dWN0IHBhZ2VfdGFibGVfZW50cnlfcGFlICplbnRyeSk7CiAKKy8qIFNlZ21lbnQgZGVzY3JpcHRv
ciB0YWJsZSBmdW5jdGlvbnMgKi8KK3ZvaWQga3ZtX3NldF9zZWdtZW50X2Rlc2NyaXB0b3Ioc3Ry
dWN0IHNlZ21lbnRfZGVzY3JpcHRvciAqZHN0LAorCXVpbnQ2NF90IGJhc2VhZGRyLCB1aW50MzJf
dCBsaW1pdCwgdW5zaWduZWQgaW50IGZsYWdzKTsKK3ZvaWQga3ZtX3BhcnNlX3NlZ21lbnRfZGVz
Y3JpcHRvcihzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yICpzcmMsCisJdWludDY0X3QgKmJhc2Vh
ZGRyLCB1aW50MzJfdCAqbGltaXQsIHVuc2lnbmVkIGludCAqZmxhZ3MpOworaW50IGt2bV9maW5k
X2ZyZWVfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yICp0YWJsZSwK
KwlzaXplX3Qgc2l6ZSk7Cit1bnNpZ25lZCBpbnQga3ZtX2NyZWF0ZV9zdGFja19kZXNjcmlwdG9y
KHN0cnVjdCBzZWdtZW50X2Rlc2NyaXB0b3IgKnRhYmxlLAorCXNpemVfdCB0YWJzaXplLCB2b2lk
ICpzdGFja19iYXNlKTsKKwogLyogRnVuY3Rpb25zIGZvciBxdWVyeWluZyBDUFUgaW5mbyBhbmQg
c3RhdHVzICovCiB2b2lkIGt2bV9nZXRfY3B1aWQodW5zaWduZWQgaW50IGVheCwgdW5zaWduZWQg
aW50IGVjeCwgc3RydWN0IGt2bV9jcHVpZCAqYnVmKTsKIHZvaWQga3ZtX3JlYWRfY3JlZ3Moc3Ry
dWN0IGt2bV9jcmVncyAqYnVmKTsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL2xp
Yl94ODYuYyBiL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL2xpYl94ODYuYwppbmRleCBkYzIzNTRiMTAu
LmQyMDYwNzJlZSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9rdm0vbGliX3g4Ni5jCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwva3ZtL2xpYl94ODYuYwpAQCAtMTEwLDYgKzExMCw5OCBAQCB1
aW50cHRyX3Qga3ZtX2dldF9wYWdlX2FkZHJlc3NfcGFlKGNvbnN0IHN0cnVjdCBwYWdlX3RhYmxl
X2VudHJ5X3BhZSAqZW50cnkpCiAJcmV0dXJuIGVudHJ5LT5hZGRyZXNzIDw8IDEyOwogfQogCisj
aWZkZWYgX194ODZfNjRfXworc3RhdGljIHZvaWQga3ZtX3NldF9zZWdtZW50X2Rlc2NyaXB0b3I2
NChzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yNjQgKmRzdCwKKwl1aW50NjRfdCBiYXNlYWRkciwg
dWludDMyX3QgbGltaXQsIHVuc2lnbmVkIGludCBmbGFncykKK3sKKworCWRzdC0+YmFzZWFkZHJf
bG8gPSBiYXNlYWRkciAmIDB4ZmZmZmZmOworCWRzdC0+YmFzZWFkZHJfaGkgPSBiYXNlYWRkciA+
PiAyNDsKKwlkc3QtPmxpbWl0X2xvID0gbGltaXQgJiAweGZmZmY7CisJZHN0LT5saW1pdF9oaSA9
IGxpbWl0ID4+IDE2OworCWRzdC0+ZmxhZ3NfbG8gPSBmbGFncyAmIDB4ZmY7CisJZHN0LT5mbGFn
c19oaSA9IChmbGFncyA+PiA4KSAmIDB4ZjsKKwlkc3QtPnJlc2VydmVkID0gMDsKK30KKyNlbmRp
ZgorCit2b2lkIGt2bV9zZXRfc2VnbWVudF9kZXNjcmlwdG9yKHN0cnVjdCBzZWdtZW50X2Rlc2Ny
aXB0b3IgKmRzdCwKKwl1aW50NjRfdCBiYXNlYWRkciwgdWludDMyX3QgbGltaXQsIHVuc2lnbmVk
IGludCBmbGFncykKK3sKKwlpZiAobGltaXQgPj4gMjApCisJCXRzdF9icmsoVEJST0ssICJTZWdt
ZW50IGxpbWl0IG91dCBvZiByYW5nZSIpOworCisjaWZkZWYgX194ODZfNjRfXworCS8qIFN5c3Rl
bSBkZXNjcmlwdG9ycyBoYXZlIGRvdWJsZSBzaXplIGluIDY0Yml0IG1vZGUgKi8KKwlpZiAoIShm
bGFncyAmIFNFR0ZMQUdfTlNZU1RFTSkpIHsKKwkJa3ZtX3NldF9zZWdtZW50X2Rlc2NyaXB0b3I2
NCgoc3RydWN0IHNlZ21lbnRfZGVzY3JpcHRvcjY0ICopZHN0LAorCQkJYmFzZWFkZHIsIGxpbWl0
LCBmbGFncyk7CisJCXJldHVybjsKKwl9CisjZW5kaWYKKworCWlmIChiYXNlYWRkciA+PiAzMikK
KwkJdHN0X2JyayhUQlJPSywgIlNlZ21lbnQgYmFzZSBhZGRyZXNzIG91dCBvZiByYW5nZSIpOwor
CisJZHN0LT5iYXNlYWRkcl9sbyA9IGJhc2VhZGRyICYgMHhmZmZmZmY7CisJZHN0LT5iYXNlYWRk
cl9oaSA9IGJhc2VhZGRyID4+IDI0OworCWRzdC0+bGltaXRfbG8gPSBsaW1pdCAmIDB4ZmZmZjsK
Kwlkc3QtPmxpbWl0X2hpID0gbGltaXQgPj4gMTY7CisJZHN0LT5mbGFnc19sbyA9IGZsYWdzICYg
MHhmZjsKKwlkc3QtPmZsYWdzX2hpID0gKGZsYWdzID4+IDgpICYgMHhmOworfQorCit2b2lkIGt2
bV9wYXJzZV9zZWdtZW50X2Rlc2NyaXB0b3Ioc3RydWN0IHNlZ21lbnRfZGVzY3JpcHRvciAqc3Jj
LAorCXVpbnQ2NF90ICpiYXNlYWRkciwgdWludDMyX3QgKmxpbWl0LCB1bnNpZ25lZCBpbnQgKmZs
YWdzKQoreworCWlmIChiYXNlYWRkcikgeworCQkqYmFzZWFkZHIgPSAoKCh1aW50NjRfdClzcmMt
PmJhc2VhZGRyX2hpKSA8PCAyNCkgfAorCQkJc3JjLT5iYXNlYWRkcl9sbzsKKwl9CisKKwlpZiAo
bGltaXQpCisJCSpsaW1pdCA9ICgoKHVpbnQzMl90KXNyYy0+bGltaXRfaGkpIDw8IDE2KSB8IHNy
Yy0+bGltaXRfbG87CisKKwlpZiAoZmxhZ3MpCisJCSpmbGFncyA9ICgoKHVpbnQzMl90KXNyYy0+
ZmxhZ3NfaGkpIDw8IDgpIHwgc3JjLT5mbGFnc19sbzsKK30KKworaW50IGt2bV9maW5kX2ZyZWVf
ZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yICp0YWJsZSwKKwlzaXpl
X3Qgc2l6ZSkKK3sKKwljb25zdCBzdHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yICpwdHI7CisJc2l6
ZV90IGk7CisKKwlmb3IgKGkgPSAwLCBwdHIgPSB0YWJsZTsgaSA8IHNpemU7IGkrKywgcHRyKysp
IHsKKwkJaWYgKCEocHRyLT5mbGFnc19sbyAmIFNFR0ZMQUdfUFJFU0VOVCkpCisJCQlyZXR1cm4g
aTsKKworI2lmZGVmIF9feDg2XzY0X18KKwkJLyogU3lzdGVtIGRlc2NyaXB0b3JzIGhhdmUgZG91
YmxlIHNpemUgaW4gNjRiaXQgbW9kZSAqLworCQlpZiAoIShwdHItPmZsYWdzX2xvICYgU0VHRkxB
R19OU1lTVEVNKSkgeworCQkJcHRyKys7CisJCQlpKys7CisJCX0KKyNlbmRpZgorCX0KKworCXJl
dHVybiAtMTsKK30KKwordW5zaWduZWQgaW50IGt2bV9jcmVhdGVfc3RhY2tfZGVzY3JpcHRvcihz
dHJ1Y3Qgc2VnbWVudF9kZXNjcmlwdG9yICp0YWJsZSwKKwlzaXplX3QgdGFic2l6ZSwgdm9pZCAq
c3RhY2tfYmFzZSkKK3sKKwlpbnQgcmV0ID0ga3ZtX2ZpbmRfZnJlZV9kZXNjcmlwdG9yKHRhYmxl
LCB0YWJzaXplKTsKKworCWlmIChyZXQgPCAwKQorCQl0c3RfYnJrKFRCUk9LLCAiRGVzY3JpcHRv
ciB0YWJsZSBpcyBmdWxsIik7CisKKwlrdm1fc2V0X3NlZ21lbnRfZGVzY3JpcHRvcih0YWJsZSAr
IHJldCwgMCwKKwkJKCgodWludHB0cl90KXN0YWNrX2Jhc2UpIC0gMSkgPj4gMTIsIFNFR1RZUEVf
U1RBQ0sgfAorCQlTRUdGTEFHX1BSRVNFTlQgfCBTRUdGTEFHXzMyQklUIHwgU0VHRkxBR19QQUdF
X0xJTUlUKTsKKwlyZXR1cm4gcmV0OworfQorCiB2b2lkIGt2bV9nZXRfY3B1aWQodW5zaWduZWQg
aW50IGVheCwgdW5zaWduZWQgaW50IGVjeCwgc3RydWN0IGt2bV9jcHVpZCAqYnVmKQogewogCWFz
bSAoCi0tIAoyLjQwLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
