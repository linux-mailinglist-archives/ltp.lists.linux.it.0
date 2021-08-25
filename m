Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A263F7390
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:43:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 998413C8DCC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:43:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC7D53C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:43:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DD7081A006F3
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:43:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F42722142
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629888181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t71sEq429YoNRm3jjZF0TLl5vZi9miLSg75LirNWVN4=;
 b=TIVndrv2URJhk0ifNQiQDDVbcKze+dtyQhrZE904jc/yid+jT1BwvTU0eFPFs2+dTuhs9i
 OtZBwXj1V4n9JDXqkbwd/sf7RaplCw9ZIShOvsgs04ttVMYZYw11u3Q6cBb09tBBkdjExW
 nxkNW+1fyHc6aA2ukGCgzjjrFes7x1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629888181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t71sEq429YoNRm3jjZF0TLl5vZi9miLSg75LirNWVN4=;
 b=cSYclov/YO19UY+qUfLn0UslZ1USnhIUGeeGrKK5SOibda09uZJ2l7GG8rZUi3+EeQOV7n
 g9OSFyiE/UwVFyCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EA2513C1A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EE55CrUeJmGELwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 12:42:59 +0200
Message-Id: <20210825104300.15255-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825104300.15255-1-mdoucha@suse.cz>
References: <20210825104300.15255-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Rename REMOVE_NETDEV() to NETDEV_REMOVE_DEVICE()
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

VXNlIHRoZSBzYW1lIG5hbWluZyBzdHlsZSBhcyBpbiB0aGUgcmVzdCBvZiBuZXRkZXZpY2UgbGli
cmFyeS4KClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBEb3VjaGEgPG1kb3VjaGFAc3VzZS5jej4KLS0t
CiBkb2MvbmV0d29yay1jLWFwaS50eHQgICB8IDQgKystLQogaW5jbHVkZS90c3RfbmV0ZGV2aWNl
LmggfCA2ICsrKystLQogbGliL3RzdF9uZXRkZXZpY2UuYyAgICAgfCAzICsrLQogMyBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9j
L25ldHdvcmstYy1hcGkudHh0IGIvZG9jL25ldHdvcmstYy1hcGkudHh0CmluZGV4IGYyNDYxNGZk
OC4uZTkxMGQxNTlmIDEwMDY0NAotLS0gYS9kb2MvbmV0d29yay1jLWFwaS50eHQKKysrIGIvZG9j
L25ldHdvcmstYy1hcGkudHh0CkBAIC0xNjYsOCArMTY2LDggQEAgc3RhZ2UuCiAgIGEgbmV3IG5l
dHdvcmsgZGV2aWNlIG5hbWVkICtpZm5hbWUrIG9mIHNwZWNpZmllZCBkZXZpY2UgdHlwZS4gUmV0
dXJucyAxIG9uCiAgIHN1Y2Nlc3MsIDAgb24gZXJyb3IuCiAKLS0gK2ludCBSRU1PVkVfTkVUREVW
KGNvbnN0IGNoYXIgKmlmbmFtZSkrIOKAkyBSZW1vdmVzIG5ldHdvcmsgZGV2aWNlICtpZm5hbWUr
LgotICBSZXR1cm5zIDEgb24gc3VjY2VzcywgMCBvbiBlcnJvci4KKy0gK2ludCBORVRERVZfUkVN
T1ZFX0RFVklDRShjb25zdCBjaGFyICppZm5hbWUpKyDigJMgUmVtb3ZlcyBuZXR3b3JrIGRldmlj
ZQorICAraWZuYW1lKy4gUmV0dXJucyAxIG9uIHN1Y2Nlc3MsIDAgb24gZXJyb3IuCiAKIDIuMiBO
ZXR3b3JrIGFkZHJlc3MgbWFuYWdlbWVudAogfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9uZXRkZXZpY2UuaCBiL2luY2x1ZGUvdHN0X25ldGRl
dmljZS5oCmluZGV4IDBiZDMzNzY1Yi4uZjAyNjYxMjA4IDEwMDY0NAotLS0gYS9pbmNsdWRlL3Rz
dF9uZXRkZXZpY2UuaAorKysgYi9pbmNsdWRlL3RzdF9uZXRkZXZpY2UuaApAQCAtMjgsOCArMjgs
MTAgQEAgaW50IHRzdF9uZXRkZXZfYWRkX2RldmljZShjb25zdCBjaGFyICpmaWxlLCBjb25zdCBp
bnQgbGluZW5vLAogI2RlZmluZSBORVRERVZfQUREX0RFVklDRShpZm5hbWUsIGRldnR5cGUpIFwK
IAl0c3RfbmV0ZGV2X2FkZF9kZXZpY2UoX19GSUxFX18sIF9fTElORV9fLCAoaWZuYW1lKSwgKGRl
dnR5cGUpKQogCi1pbnQgdHN0X3JlbW92ZV9uZXRkZXYoY29uc3QgY2hhciAqZmlsZSwgY29uc3Qg
aW50IGxpbmVubywgY29uc3QgY2hhciAqaWZuYW1lKTsKLSNkZWZpbmUgUkVNT1ZFX05FVERFVihp
Zm5hbWUpIHRzdF9yZW1vdmVfbmV0ZGV2KF9fRklMRV9fLCBfX0xJTkVfXywgKGlmbmFtZSkpCitp
bnQgdHN0X25ldGRldl9yZW1vdmVfZGV2aWNlKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBs
aW5lbm8sCisJY29uc3QgY2hhciAqaWZuYW1lKTsKKyNkZWZpbmUgTkVUREVWX1JFTU9WRV9ERVZJ
Q0UoaWZuYW1lKSBcCisJdHN0X25ldGRldl9yZW1vdmVfZGV2aWNlKF9fRklMRV9fLCBfX0xJTkVf
XywgKGlmbmFtZSkpCiAKIGludCB0c3RfbmV0ZGV2X2FkZF9hZGRyZXNzKGNvbnN0IGNoYXIgKmZp
bGUsIGNvbnN0IGludCBsaW5lbm8sCiAJY29uc3QgY2hhciAqaWZuYW1lLCB1bnNpZ25lZCBpbnQg
ZmFtaWx5LCBjb25zdCB2b2lkICphZGRyZXNzLApkaWZmIC0tZ2l0IGEvbGliL3RzdF9uZXRkZXZp
Y2UuYyBiL2xpYi90c3RfbmV0ZGV2aWNlLmMKaW5kZXggOWE4YzYyMmUyLi5iYTlhNTViNzAgMTAw
NjQ0Ci0tLSBhL2xpYi90c3RfbmV0ZGV2aWNlLmMKKysrIGIvbGliL3RzdF9uZXRkZXZpY2UuYwpA
QCAtMjAxLDcgKzIwMSw4IEBAIGludCB0c3RfbmV0ZGV2X2FkZF9kZXZpY2UoY29uc3QgY2hhciAq
ZmlsZSwgY29uc3QgaW50IGxpbmVubywKIAlyZXR1cm4gcmV0OwogfQogCi1pbnQgdHN0X3JlbW92
ZV9uZXRkZXYoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywgY29uc3QgY2hhciAq
aWZuYW1lKQoraW50IHRzdF9uZXRkZXZfcmVtb3ZlX2RldmljZShjb25zdCBjaGFyICpmaWxlLCBj
b25zdCBpbnQgbGluZW5vLAorCWNvbnN0IGNoYXIgKmlmbmFtZSkKIHsKIAlzdHJ1Y3QgaWZpbmZv
bXNnIGluZm8gPSB7IC5pZmlfZmFtaWx5ID0gQUZfVU5TUEVDIH07CiAJc3RydWN0IHRzdF9ydG5s
X2NvbnRleHQgKmN0eDsKLS0gCjIuMzIuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
