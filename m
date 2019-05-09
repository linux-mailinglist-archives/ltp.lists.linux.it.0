Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8D18E4B
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 18:41:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C44F53EABD5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 18:41:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E11883EABD6
 for <ltp@lists.linux.it>; Thu,  9 May 2019 18:41:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 27AF910009F1
 for <ltp@lists.linux.it>; Thu,  9 May 2019 18:41:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A44EAD85;
 Thu,  9 May 2019 16:41:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 May 2019 18:41:25 +0200
Message-Id: <20190509164125.619-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509164125.619-1-pvorel@suse.cz>
References: <20190509164125.619-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_net_vars.c: Enlarge buffer to fix format
	overflow warnings
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

dHN0X25ldF92YXJzLmM6MjMwOjE4OiB3YXJuaW5nOiDigJguMC4w4oCZIGRpcmVjdGl2ZSB3cml0
aW5nIDQgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgMTI4IFstV2Zv
cm1hdC1vdmVyZmxvdz1dCiAgc3ByaW50ZihidWYsICIlcy4wLjAiLCBuZXRfdW51c2VkKTsKICAg
ICAgICAgICAgICAgICAgXn5+fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9pbmNsdWRlL3N0
ZGlvLmg6ODY3LAogICAgICAgICAgICAgICAgIGZyb20gdHN0X25ldF92YXJzLmM6MjY6Ci91c3Iv
aW5jbHVkZS9iaXRzL3N0ZGlvMi5oOjM2OjEwOiBub3RlOiDigJhfX2J1aWx0aW5fX19zcHJpbnRm
X2Noa+KAmSBvdXRwdXQgYmV0d2VlbiA1IGFuZCAxMzIgYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9u
IG9mIHNpemUgMTI4Cgp0c3RfbmV0X3ZhcnMuYzoyOTQ6MTg6IHdhcm5pbmc6IOKAmDo64oCZIGRp
cmVjdGl2ZSB3cml0aW5nIDIgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBh
bmQgMTI4IFstV2Zvcm1hdC1vdmVyZmxvdz1dCiAgc3ByaW50ZihidWYsICIlczo6IiwgbmV0X3Vu
dXNlZCk7CiAgICAgICAgICAgICAgICAgIF5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2lu
Y2x1ZGUvc3RkaW8uaDo4NjcsCiAgICAgICAgICAgICAgICAgZnJvbSB0c3RfbmV0X3ZhcnMuYzoy
NjoKL3Vzci9pbmNsdWRlL2JpdHMvc3RkaW8yLmg6MzY6MTA6IG5vdGU6IOKAmF9fYnVpbHRpbl9f
X3NwcmludGZfY2hr4oCZIG91dHB1dCBiZXR3ZWVuIDMgYW5kIDEzMCBieXRlcyBpbnRvIGEgZGVz
dGluYXRpb24gb2Ygc2l6ZSAxMjgKCkZpeGVzOiBkMThlMTM1ZDAgKCJuZXR3b3JrOiBBZGQgdG9v
bHMgZm9yIHNldHVwIElQIHJlbGF0ZWQgZW52aXJvbm1lbnQKdmFyaWFibGVzIikKClNpZ25lZC1v
ZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KIHRlc3RjYXNlcy9saWIvdHN0
X25ldF92YXJzLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfbmV0X3ZhcnMuYyBi
L3Rlc3RjYXNlcy9saWIvdHN0X25ldF92YXJzLmMKaW5kZXggZGE5YTRlNjRjLi40M2NkOTJiY2Yg
MTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9saWIvdHN0X25ldF92YXJzLmMKKysrIGIvdGVzdGNhc2Vz
L2xpYi90c3RfbmV0X3ZhcnMuYwpAQCAtMjIwLDcgKzIyMCw3IEBAIHN0YXRpYyBjaGFyICpnZXRf
aXB2NF9uZXQxNl91bnVzZWQoY29uc3Qgc3RydWN0IGluX2FkZHIgKmlwLAogCXVuc2lnbmVkIGlu
dCBwcmVmaXgpCiB7CiAJc3RydWN0IGluX2FkZHIgbWFzaywgbmV0d29yazsKLQljaGFyIGJ1Zlsx
MjhdLCBuZXRfdW51c2VkWzEyOF07CisJY2hhciBidWZbMTMyXSwgbmV0X3VudXNlZFsxMjhdOwog
CiAJbWFzayA9IHByZWZpeDJtYXNrKHByZWZpeCk7CiAJbmV0d29yayA9IGNhbGNfbmV0d29yayhp
cCwgJm1hc2spOwpAQCAtMjc0LDcgKzI3NCw3IEBAIHN0YXRpYyBjaGFyICpnZXRfaXB2Nl9uZXQz
Ml91bnVzZWQoY29uc3Qgc3RydWN0IGluNl9hZGRyICppcDYsCiB7CiAJaW50IGksIGo7CiAJc3Ry
dWN0IGluNl9hZGRyIG1hc2ssIG5ldHdvcms7Ci0JY2hhciBidWZbMTI4XSwgbmV0X3VudXNlZFsx
MjhdOworCWNoYXIgYnVmWzEzMF0sIG5ldF91bnVzZWRbMTI4XTsKIAogCW1lbXNldCgmbWFzaywg
MHgwLCBzaXplb2YobWFzaykpOwogCi0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
