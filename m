Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66B3F7392
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:43:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F8D83C93B8
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 12:43:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F9F93C2183
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:43:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DBFB71400B65
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 12:43:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2ADA92213C
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629888181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3P6uwswxjwshpS0UQASxy5qDTGQQ9fVLDDrqL3UwyT8=;
 b=LuDImNTw0R6ldbdYxt8axKWaE2oWfIV+QFBt06PfO1me9g6NIbtuO2mb+/BC0LGLT8Zng/
 zz0JVS/xk6FqbkHVB2DA6GFVfnVd+HZf97DZ9FRApAn4aR19uipOyP3IFpQVGGJfk9VeFI
 1ghBgp1QHVzH9Or1PCE4NECBOJz2KJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629888181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3P6uwswxjwshpS0UQASxy5qDTGQQ9fVLDDrqL3UwyT8=;
 b=Ne1kyYCQhGQp5j1RO7fVEdyyadUjk0OT1nITMg0FtgcfoGJXQa065qduYEe5kXKXEq+aV6
 yGX28ZUSWXmaOrBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16DE313C16
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HhagBLUeJmGELwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:43:01 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 12:42:58 +0200
Message-Id: <20210825104300.15255-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] Add NETDEV_ADD_DEVICE() helper function
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

U2lnbmVkLW9mZi1ieTogTWFydGluIERvdWNoYSA8bWRvdWNoYUBzdXNlLmN6PgotLS0KIGRvYy9u
ZXR3b3JrLWMtYXBpLnR4dCAgIHwgIDQgKysrKwogaW5jbHVkZS90c3RfbmV0ZGV2aWNlLmggfCAg
NSArKysrKwogbGliL3RzdF9uZXRkZXZpY2UuYyAgICAgfCA0NCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZG9jL25ldHdvcmstYy1hcGkudHh0IGIvZG9jL25ldHdvcmstYy1hcGku
dHh0CmluZGV4IDE0NTgzNmE4MS4uZjI0NjE0ZmQ4IDEwMDY0NAotLS0gYS9kb2MvbmV0d29yay1j
LWFwaS50eHQKKysrIGIvZG9jL25ldHdvcmstYy1hcGkudHh0CkBAIC0xNjIsNiArMTYyLDEwIEBA
IHN0YWdlLgogICBvbiBzdWNjZXNzLCAwIG9uIGVycm9yLiBBZGQgKyJDT05GSUdfVkVUSCIrIHRv
ICt0ZXN0Lm5lZWRzX2tjb25maWdzKyBpZiB5b3VyCiAgIHRlc3QgY2FsbHMgdGhpcyBmdW5jdGlv
bi4KIAorLSAraW50IE5FVERFVl9BRERfREVWSUNFKGNvbnN0IGNoYXIgKmlmbmFtZSwgY29uc3Qg
Y2hhciAqZGV2dHlwZSkrIC0gQ3JlYXRlcworICBhIG5ldyBuZXR3b3JrIGRldmljZSBuYW1lZCAr
aWZuYW1lKyBvZiBzcGVjaWZpZWQgZGV2aWNlIHR5cGUuIFJldHVybnMgMSBvbgorICBzdWNjZXNz
LCAwIG9uIGVycm9yLgorCiAtICtpbnQgUkVNT1ZFX05FVERFVihjb25zdCBjaGFyICppZm5hbWUp
KyDigJMgUmVtb3ZlcyBuZXR3b3JrIGRldmljZSAraWZuYW1lKy4KICAgUmV0dXJucyAxIG9uIHN1
Y2Nlc3MsIDAgb24gZXJyb3IuCiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X25ldGRldmljZS5o
IGIvaW5jbHVkZS90c3RfbmV0ZGV2aWNlLmgKaW5kZXggM2E2Njk4NzMxLi4wYmQzMzc2NWIgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvdHN0X25ldGRldmljZS5oCisrKyBiL2luY2x1ZGUvdHN0X25ldGRl
dmljZS5oCkBAIC0yMyw2ICsyMywxMSBAQCBpbnQgdHN0X2NyZWF0ZV92ZXRoX3BhaXIoY29uc3Qg
Y2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKICNkZWZpbmUgQ1JFQVRFX1ZFVEhfUEFJUihp
Zm5hbWUxLCBpZm5hbWUyKSBcCiAJdHN0X2NyZWF0ZV92ZXRoX3BhaXIoX19GSUxFX18sIF9fTElO
RV9fLCAoaWZuYW1lMSksIChpZm5hbWUyKSkKIAoraW50IHRzdF9uZXRkZXZfYWRkX2RldmljZShj
b25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAorCWNvbnN0IGNoYXIgKmlmbmFtZSwg
Y29uc3QgY2hhciAqZGV2dHlwZSk7CisjZGVmaW5lIE5FVERFVl9BRERfREVWSUNFKGlmbmFtZSwg
ZGV2dHlwZSkgXAorCXRzdF9uZXRkZXZfYWRkX2RldmljZShfX0ZJTEVfXywgX19MSU5FX18sIChp
Zm5hbWUpLCAoZGV2dHlwZSkpCisKIGludCB0c3RfcmVtb3ZlX25ldGRldihjb25zdCBjaGFyICpm
aWxlLCBjb25zdCBpbnQgbGluZW5vLCBjb25zdCBjaGFyICppZm5hbWUpOwogI2RlZmluZSBSRU1P
VkVfTkVUREVWKGlmbmFtZSkgdHN0X3JlbW92ZV9uZXRkZXYoX19GSUxFX18sIF9fTElORV9fLCAo
aWZuYW1lKSkKIApkaWZmIC0tZ2l0IGEvbGliL3RzdF9uZXRkZXZpY2UuYyBiL2xpYi90c3RfbmV0
ZGV2aWNlLmMKaW5kZXggYTRiYzIyNjM1Li45YThjNjIyZTIgMTAwNjQ0Ci0tLSBhL2xpYi90c3Rf
bmV0ZGV2aWNlLmMKKysrIGIvbGliL3RzdF9uZXRkZXZpY2UuYwpAQCAtMTU3LDYgKzE1Nyw1MCBA
QCBpbnQgdHN0X2NyZWF0ZV92ZXRoX3BhaXIoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxp
bmVubywKIAlyZXR1cm4gcmV0OwogfQogCitpbnQgdHN0X25ldGRldl9hZGRfZGV2aWNlKGNvbnN0
IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sCisJY29uc3QgY2hhciAqaWZuYW1lLCBjb25z
dCBjaGFyICpkZXZ0eXBlKQoreworCWludCByZXQ7CisJc3RydWN0IGlmaW5mb21zZyBpbmZvID0g
eyAuaWZpX2ZhbWlseSA9IEFGX1VOU1BFQyB9OworCXN0cnVjdCB0c3RfcnRubF9jb250ZXh0ICpj
dHg7CisJc3RydWN0IHRzdF9ydG5sX2F0dHJfbGlzdCBhdHRyc1tdID0geworCQl7SUZMQV9JRk5B
TUUsIGlmbmFtZSwgc3RybGVuKGlmbmFtZSkgKyAxLCBOVUxMfSwKKwkJe0lGTEFfTElOS0lORk8s
IE5VTEwsIDAsIChjb25zdCBzdHJ1Y3QgdHN0X3J0bmxfYXR0cl9saXN0W10peworCQkJe0lGTEFf
SU5GT19LSU5ELCBkZXZ0eXBlLCBzdHJsZW4oZGV2dHlwZSksIE5VTEx9LAorCQkJezAsIE5VTEws
IC0xLCBOVUxMfQorCQl9fSwKKwkJezAsIE5VTEwsIC0xLCBOVUxMfQorCX07CisKKwlpZiAoc3Ry
bGVuKGlmbmFtZSkgPj0gSUZOQU1TSVopIHsKKwkJdHN0X2Jya18oZmlsZSwgbGluZW5vLCBUQlJP
SywKKwkJCSJOZXR3b3JrIGRldmljZSBuYW1lIFwiJXNcIiB0b28gbG9uZyIsIGlmbmFtZSk7CisJ
CXJldHVybiAwOworCX0KKworCWN0eCA9IGNyZWF0ZV9yZXF1ZXN0KGZpbGUsIGxpbmVubywgUlRN
X05FV0xJTkssCisJCU5MTV9GX0NSRUFURSB8IE5MTV9GX0VYQ0wsICZpbmZvLCBzaXplb2YoaW5m
bykpOworCisJaWYgKCFjdHgpCisJCXJldHVybiAwOworCisJaWYgKHRzdF9ydG5sX2FkZF9hdHRy
X2xpc3QoZmlsZSwgbGluZW5vLCBjdHgsIGF0dHJzKSAhPSAyKSB7CisJCXRzdF9ydG5sX2Rlc3Ry
b3lfY29udGV4dChmaWxlLCBsaW5lbm8sIGN0eCk7CisJCXJldHVybiAwOworCX0KKworCXJldCA9
IHRzdF9ydG5sX3NlbmRfdmFsaWRhdGUoZmlsZSwgbGluZW5vLCBjdHgpOworCXRzdF9ydG5sX2Rl
c3Ryb3lfY29udGV4dChmaWxlLCBsaW5lbm8sIGN0eCk7CisKKwlpZiAoIXJldCkgeworCQl0c3Rf
YnJrXyhmaWxlLCBsaW5lbm8sIFRCUk9LLAorCQkJIkZhaWxlZCB0byBjcmVhdGUgJXMgZGV2aWNl
ICVzOiAlcyIsIGRldnR5cGUsIGlmbmFtZSwKKwkJCXRzdF9zdHJlcnJubyh0c3RfcnRubF9lcnJu
bykpOworCX0KKworCXJldHVybiByZXQ7Cit9CisKIGludCB0c3RfcmVtb3ZlX25ldGRldihjb25z
dCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLCBjb25zdCBjaGFyICppZm5hbWUpCiB7CiAJ
c3RydWN0IGlmaW5mb21zZyBpbmZvID0geyAuaWZpX2ZhbWlseSA9IEFGX1VOU1BFQyB9OwotLSAK
Mi4zMi4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
